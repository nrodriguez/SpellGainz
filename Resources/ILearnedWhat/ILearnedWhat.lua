
----------------------------------------
-- Variables
----------------------------------------

local _addonName, _addonData = ...;

local ILWAddon = LibStub("AceAddon-3.0"):NewAddon(_addonName);
local ILWBroker = LibStub("LibDataBroker-1.1"):NewDataObject(_addonName, {
	type = "launcher",
	text = "I Learned What?",
	icon = "Interface/ICONS/Spell_Holy_SurgeOfLight",
	OnClick = function(self, button, down)
		if (ILW_UnlockContainer:IsShown()) then
			HideUIPanel(ILW_UnlockContainer);
		else
			ShowUIPanel(ILW_UnlockContainer);
		end
	end,
	OnTooltipShow = function(tt)
		tt:AddLine("I Learned What?", 1, 1, 1);
		tt:AddLine("Click to open.")
	end	
})
local _icon = LibStub("LibDBIcon-1.0")

local _defaults = {
	["global"] = {	
		showPopup = true,
		spellbook = true,
		minimap = {
			hide = false,
		},
		["trackers"] = {
			["Spells"] = true,
			["Talents"] = true,
			["Dungeons"] = true,
			["Riding"] = true,
			["Battlegrounds"] = true,
		}
	}
	,["char"] = {
		["unlockedList"] = {},
		["specLastLevel"] = {},
	}
}

local _trackers = {
		["Spells"] = true,
		["Talents"] = true,
		["Dungeons"] = true,
		["Riding"] = true,
		["Battlegrounds"] = true,
	}


local _classSkills = {};
local _ridingSkills = {};
local _specLastLevel = {};
local _InstanceLevels = {};
local _PvPLevels = {};
local _classSpecs = {};
local _playerLeveled = false;
local _openedDuringCombat = false;

_addonData.variables = {}
local _aVar = _addonData.variables;
_aVar.CLASSIC_RAID = 0;
_aVar.TBC_HEROIC = -1;
_aVar.TBC_RAID = -2;
_aVar.WOTLK_HEROIC = -3;
_aVar.WOTLK_RAID = -4;
_aVar.CATA_HEROIC = -5;
_aVar.CATA_RAID = -6;
_aVar.MOP_HEROIC = -7;
_aVar.MOP_RAID = -8;
_aVar.WOD_HEROIC = -9;
_aVar.WOD_RAID = -10;
_aVar.LEGION_HEROIC = -11;
_aVar.LEGION_RAID = -12;

_addonData.help = {}
local _help = _addonData.help;

local UNLOCKTYPE_SPELL = "spell";
local UNLOCKTYPE_TALENT = "talent";
local UNLOCKTYPE_DUNGEON = "instance";
local UNLOCKTYPE_PVP = "pvp";
local UNLOCKTYPE_RIDING = "riding";
local UNLOCKTYPE_TUTORIAL = "tutorial";
local UNLOCKS_PER_PAGE = 6;
local ICON_TALENT = "Interface/ICONS/Ability_Marksmanship";

local HELP_INFO = "As you level up you will unlock new content such as new abilities, talent points and dungeons.\n\nLeft clicking the unlocks will open related windows and remove them from the list.\n\nLeft clicking or dragging abilities allows you to move them to your action bars.\n\nRight clicking the unlocks will remove them from the list."
local ERROR_OPEN_IN_COMBAT = "|cFFFFD100ILWhat:|r |cFFFF5555Can't open that during combat. It will open once you leave combat.|r";
local TOOLTIP_TALENT = "Left click to pick your new talent.";
local TOOLTIP_RIDING = "You can now learn this\n riding skill at a trainer.";
local TOOLTIP_INSTANCE = "Left click to open the encounter\n journal for this instance.";
local TOOLTIP_PVP = "Left click to open the\n battleground window.";
local TOOLTIP_COMBAT = "|cFFFF5555Can't open during combat|r";
local TOOLTIP_SPELLBOOK_ICON = "Unlocked content";

local OPTION_MINIMAP = "Minimap button"
local OPTION_SPELLBOOK = "Spellbook button"
local OPTION_POPUP = "Enable popup"
local OPTION_TRACKERS = "Trackers"

local _helpPlate = {
	FramePos = { x = 5,	y = -25 },
	FrameSize = { width = 440, height = 495	},
	[1] = { ButtonPos = { x = 200,	y = -95}, HighLightBox = { x = 20, y = -85, width = 405, height = 420 }, ToolTipDir = "DOWN", ToolTipText = HELP_INFO }
}

local _typeIcons = {
		[UNLOCKTYPE_SPELL] = {["left"] = 0.125, ["right"] = 0.25, ["top"] = 0.375, ["bottom"] = 0.5}
		--,[UNLOCKTYPE_DUNGEON] = {["left"] = 0.125, ["right"] = 0.25, ["top"] = 0.875, ["bottom"] = 1}
		,[UNLOCKTYPE_DUNGEON] = {["left"] = 0.375, ["right"] = 0.5, ["top"] = 0.875, ["bottom"] = 1}
		,[UNLOCKTYPE_TALENT] = {["left"] = 0.375, ["right"] = 0.5, ["top"] = 0.25, ["bottom"] = 0.375}
		--,[UNLOCKTYPE_PVP] = {["left"] = 0.75, ["right"] = 0.875, ["top"] = 0.875, ["bottom"] = 1}
		,[UNLOCKTYPE_PVP] = {["left"] = 0.25, ["right"] = 0.375, ["top"] = 0.25, ["bottom"] = 0.375}
		,[UNLOCKTYPE_RIDING] = {["left"] = 0.5, ["right"] = 0.625, ["top"] = 0.25, ["bottom"] = 0.375}
	};

function ILW_ShowHelpUnlocks(show)
	local unlocklist = ILWAddon.db.char.unlockedList;
	
	-- when showing help, if there's no unlocks, show dummy unlocks
	if (show and #unlocklist == 0) then
		table.insert(unlocklist, {["type"] = UNLOCKTYPE_TUTORIAL, ["level"] = 3, ["icon"] = "Interface/ICONS/spell_fire_fireball02", ["name"] = "Example Ability", ["subText"] = "Ability"});
		table.insert(unlocklist, {["type"] = UNLOCKTYPE_TUTORIAL, ["level"] = 5, ["icon"] = "Interface/ICONS/spell_frost_frostbolt02", ["name"] = "Example Ability", ["subText"] = "Ability"});
		table.insert(unlocklist, {["type"] = UNLOCKTYPE_TUTORIAL, ["level"] = 5, ["icon"] = "Interface/LFGFRAME/LFGICON-DIREMAUL", ["name"] = "Example Dungeon", ["subText"] = "Dungeon"});
		table.insert(unlocklist, {["type"] = UNLOCKTYPE_TUTORIAL, ["level"] = 7, ["icon"] = "Interface/ICONS/spell_nature_wispsplode", ["name"] = "Example Ability", ["subText"] = "Ability"});
		table.insert(unlocklist, {["type"] = UNLOCKTYPE_TUTORIAL, ["level"] = 7, ["icon"] = "Interface/ICONS/ability_mage_wintersgrasp", ["name"] = "Example Passive", ["subText"] = "Passive"});
	end
	
	-- when hiding help, remove dummy unlocks
	if (not show and unlocklist) then
		for i=#unlocklist, 1, -1 do
			if (unlocklist[i]["type"] == UNLOCKTYPE_TUTORIAL) then
				table.remove(unlocklist, i);
			end
		end
	end
	
	ILW_ShowUnlockedContent();
end

function ILW_TutorialButton_OnClick()
	if ILW_HelpFrame:IsShown() then
		_help:HideTutorial();
		ILW_ShowHelpUnlocks(false);
	else
		_help:ShowTutorial();
		ILW_ShowHelpUnlocks(true);
	end
end

-- When the player clicks on the icon of an unlock
function ILW_Unlockbutton_OnClick(self, button)
	-- prevent 'checked' visual
	self:SetChecked(false);

	-- find the clicked unlock and remove it from the list
	local nr = string.match(self:GetName(), "(%d+)");
	nr = nr + ((ILW_UnlockContainer.CurrentPage - 1) * UNLOCKS_PER_PAGE);
	table.remove(ILWAddon.db.char.unlockedList, nr);
	
	-- Don't have to open anything if it's right mouse
	if (button == "RightButton") then
		ILW_ShowUnlockedContent();
		return;
	-- Open spellbook if spell
	elseif (self.unlockType == UNLOCKTYPE_SPELL) then
		PickupSpell(self.unlockId);
	-- Open talents
	elseif (self.unlockType == UNLOCKTYPE_TALENT) then
		if (EncounterJournal == nil) then
			LoadAddOn("Blizzard_TalentUI");
		end
		ShowUIPanel(PlayerTalentFrame);
	-- Open encounter journal if instance
	elseif (self.unlockType == UNLOCKTYPE_DUNGEON ) then
		if (EncounterJournal == nil) then
			LoadAddOn("Blizzard_EncounterJournal");
		end
		ShowUIPanel(EncounterJournal);
		if (self.unlockId ~= nil) then
			
			-- id > 0 = specific instance so open journal to that instance
			-- otherwise see _aVar and open to instance list
			if (self.unlockId > 0) then
				-- actual instance so open journal to specific instance
				EncounterJournal_DisplayInstance(self.unlockId);
			elseif (self.unlockId == _aVar.CLASSIC_RAID) then
				EncounterJournal_TierDropDown_Select(_, 1)
				EJ_ContentTab_Select(3);
			elseif (self.unlockId == _aVar.TBC_HEROIC) then
				EncounterJournal_TierDropDown_Select(_, 2)
				EJ_ContentTab_Select(2);
			elseif (self.unlockId == _aVar.TBC_RAID) then
				EncounterJournal_TierDropDown_Select(_, 2)
				EJ_ContentTab_Select(3);
			elseif (self.unlockId == _aVar.WOTLK_HEROIC) then
				EncounterJournal_TierDropDown_Select(_, 3)
				EJ_ContentTab_Select(2);
			elseif (self.unlockId == _aVar.WOTLK_RAID) then
				EncounterJournal_TierDropDown_Select(_, 3)
				EJ_ContentTab_Select(3);
			elseif (self.unlockId == _aVar.CATA_HEROIC) then
				EncounterJournal_TierDropDown_Select(_, 4)
				EJ_ContentTab_Select(2);
			elseif (self.unlockId == _aVar.CATA_RAID) then
				EncounterJournal_TierDropDown_Select(_, 4)
				EJ_ContentTab_Select(3);
			elseif (self.unlockId == _aVar.MOP_HEROIC) then
				EncounterJournal_TierDropDown_Select(_, 5)
				EJ_ContentTab_Select(2);
			elseif (self.unlockId == _aVar.MOP_RAID) then
				EncounterJournal_TierDropDown_Select(_, 5)
				EJ_ContentTab_Select(3);
			elseif (self.unlockId == _aVar.WOD_HEROIC) then
				EncounterJournal_TierDropDown_Select(_, 6)
				EJ_ContentTab_Select(2);
			elseif (self.unlockId == _aVar.WOD_RAID) then
				EncounterJournal_TierDropDown_Select(_, 6)
				EJ_ContentTab_Select(3);
			elseif (self.unlockId == _aVar.LEGION_HEROIC) then
				EncounterJournal_TierDropDown_Select(_, 7)
				EJ_ContentTab_Select(2);
			elseif (self.unlockId == _aVar.LEGION_RAID) then
				EncounterJournal_TierDropDown_Select(_, 7)
				EJ_ContentTab_Select(3);
			end
		end
	elseif (self.unlockType == UNLOCKTYPE_PVP) then
		ShowUIPanel(PVEFrame);
		PVEFrame_ShowFrame("PVPUIFrame", "HonorFrame");
		-- if (GroupFinderFrame == nil or not GroupFinderFrame:IsShown()) then
			-- PVEFrame_ToggleFrame();
		-- end
		-- 
	end
	
	ILW_ShowUnlockedContent();
end

local function ShowUnlockContainer()
	ShowUIPanel(ILW_UnlockContainer);
end

local function Popup_OnClick(self, button)
	if(button == "LeftButton") then
		ShowUnlockContainer();
	end
	self:Hide();
end

function ILW_ClearButton_OnClick()
	ILW_ClearUnlockList();
	ILW_UpdateNavigation();
end

function ILW_UnlockButton_OnEnter(self, motion)
	-- hide the "New!" tag and mark as read to prevent animation
	self.NewText:SetText("");
	self.NewTextBG:Hide();
	self.data.read = true;
	
	-- show tooltip depending on type
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
	if (self.unlockType == UNLOCKTYPE_SPELL) then
		GameTooltip:SetSpellByID(self.unlockId);
	elseif (self.unlockType == UNLOCKTYPE_RIDING) then
		GameTooltip:SetText(TOOLTIP_RIDING);
	elseif (self.unlockType == UNLOCKTYPE_TALENT) then
		GameTooltip:SetText(TOOLTIP_TALENT);
	elseif (self.unlockType == UNLOCKTYPE_DUNGEON) then
		GameTooltip:SetText(TOOLTIP_INSTANCE);
	elseif (self.unlockType == UNLOCKTYPE_PVP) then
		GameTooltip:SetText(TOOLTIP_PVP);
	end
end

function ILW_PrevPageButton_OnClick()
	if (ILW_UnlockContainer.CurrentPage == 1) then return; end
	PlaySound("igAbiliityPageTurn");
	ILW_UnlockContainer.CurrentPage = ILW_UnlockContainer.CurrentPage - 1;
	ILW_UnlockContainer.Navigation.Text:SetText("Page ".. ILW_UnlockContainer.CurrentPage);
	ILW_ShowUnlockedContent();
end

function ILW_NextPageButton_OnClick()
	if (ILW_UnlockContainer.CurrentPage >= ceil(#ILWAddon.db.char.unlockedList/UNLOCKS_PER_PAGE)) then return; end
	PlaySound("igAbiliityPageTurn");
	ILW_UnlockContainer.CurrentPage = ILW_UnlockContainer.CurrentPage + 1;
	ILW_UnlockContainer.Navigation.Text:SetText("Page ".. ILW_UnlockContainer.CurrentPage);
	ILW_ShowUnlockedContent();
end

function UnlockContainer_OnMouseWheel(self, delta)
	if delta == 1 then
		ILW_PrevPageButton_OnClick();
	else
		ILW_NextPageButton_OnClick();
	end
end

local function GetPlayerLevel()
	return UnitLevel("player");
end

local function GetPlayerSpec()
	if (GetSpecialization() ~= nil) then
		return GetSpecializationInfo(GetSpecialization());
	end
	
	return nil;
end

function ILW_UpdateNavigation()

	local totalPages = ceil(#ILWAddon.db.char.unlockedList/UNLOCKS_PER_PAGE);

	if (totalPages > 0 and ILW_UnlockContainer.CurrentPage > totalPages) then
		ILW_UnlockContainer.CurrentPage = totalPages;
	elseif (totalPages == 0) then
		ILW_UnlockContainer.CurrentPage = 1;
	end

	ILW_UnlockContainer.Navigation.Text:SetText("Page ".. ILW_UnlockContainer.CurrentPage);
	
	ILW_UnlockContainer.Navigation.Prev:Enable();
	ILW_UnlockContainer.Navigation.Next:Enable();

	-- disable prev on first page;
	if (ILW_UnlockContainer.CurrentPage == 1) then
		ILW_UnlockContainer.Navigation.Prev:Disable();
	end

	-- disable next page if on last page
	if (totalPages == 0 or ILW_UnlockContainer.CurrentPage == totalPages) then
		ILW_UnlockContainer.Navigation.Next:Disable();
	end

end

local function CreateUnlockAnimation(self)
	-- create an animation to slide and fade in
	self.animation = self:CreateAnimationGroup();
	self.animation.translate = self.animation:CreateAnimation("Translation");
	self.animation.translate:SetSmoothing("IN");
	self.animation.alpha = self.animation:CreateAnimation("Alpha");
	self.animation.alpha:SetFromAlpha(1);
	self.animation.alpha:SetToAlpha(0);
	--self.animation.alpha:SetChange(-1);
	self.animation.alpha:SetSmoothing("IN");
end

local function PlayUnlockAnination(self)
	self.animation:SetScript("OnFinished", function() self.data.new = false; end);
	self.animation.translate:SetOffset(-50, 0);
	self.animation.translate:SetDuration(0.5);
	self.animation.alpha:SetDuration(0.5);
	self.animation:Play(true);
end

function ILWAddon:InitFilter(dd, level)
	local info = UIDropDownMenu_CreateInfo();
	info.keepShownOnClick = true;	

	if level == 1 then
		info.text = OPTION_MINIMAP;
		info.func = function(_, _, _, value)
						ILWAddon.db.global.minimap.hide = not value;
						if (ILWAddon.db.global.minimap.hide) then
							_icon:Hide(_addonName);
						else
							_icon:Show(_addonName);
						end
					end 
		info.checked = not ILWAddon.db.global.minimap.hide;
		info.isNotRadio = true;
		UIDropDownMenu_AddButton(info, level)
		
		info.text = OPTION_SPELLBOOK;
		info.func = function(_, _, _, value)
						ILWAddon.db.global.spellbook = value;
						if (ILWAddon.db.global.spellbook) then
							ShowUIPanel(ILW_SpellBookTab);
						else
							HideUIPanel(ILW_SpellBookTab);
						end
					end 
		info.checked = ILWAddon.db.global.spellbook;
		info.isNotRadio = true;
		UIDropDownMenu_AddButton(info, level)

		info.text = OPTION_POPUP;
		info.func = function(_, _, _, value)
						ILWAddon.db.global.showPopup = value;
					end 
		info.checked = ILWAddon.db.global.showPopup;
		info.isNotRadio = true;
		UIDropDownMenu_AddButton(info, level)
	
		info.checked = 	nil;
		info.isNotRadio = nil;
		info.func =  nil;
		info.hasArrow = true;
		info.notCheckable = true;
		
		info.text = OPTION_TRACKERS;
		info.value = 1;
		UIDropDownMenu_AddButton(info, level)
	else --if level == 2 then
		
		info.hasArrow = false;
		info.isNotRadio = true;
		info.notCheckable = true;
			
		info.text = CHECK_ALL
		info.func = function()
						ILWAddon:SetAllSourcesTo(true);
						UIDropDownMenu_Refresh(dd, 1, 2);
					end
		UIDropDownMenu_AddButton(info, level)
		
		info.text = UNCHECK_ALL
		info.func = function()
						ILWAddon:SetAllSourcesTo(false);
						UIDropDownMenu_Refresh(dd, 1, 2);
					end
		UIDropDownMenu_AddButton(info, level)

		
		info.notCheckable = false;
		for k, v in pairs(_trackers) do
			info.text = k;
			info.func = function(_, _, _, value)
								ILWAddon.db.global.trackers[k] = value;
							end
			info.checked = function() return ILWAddon.db.global.trackers[k] end;
			UIDropDownMenu_AddButton(info, level);			
		end
	end
end

function ILWAddon:SetAllSourcesTo(enable)
	for k, v in pairs(ILWAddon.db.global.trackers) do
		ILWAddon.db.global.trackers[k] = enable;
	end
end

function ILW_CreateContainer()
	ILW_UnlockContainer:SetPoint("center", UIParent, "center", 0, 0);

	ILW_UnlockContainer:SetMovable(true);
	ILW_UnlockContainer:EnableMouse(true);
	ILW_UnlockContainer:SetClampedToScreen(true);
	ILW_UnlockContainer:SetToplevel(true)
	ILW_UnlockContainer:RegisterForDrag("LeftButton");
	ILW_UnlockContainer:SetScript("OnDragStart", ILW_UnlockContainer.StartMoving );
	ILW_UnlockContainer:SetScript("OnDragStop", ILW_UnlockContainer.StopMovingOrSizing);
	-- allows the player to close the frame using Esc like regular blizzard windows
	table.insert(UISpecialFrames, "ILW_UnlockContainer")
	
	ILW_UnlockContainer.CurrentPage = 1;
	
	for i=1, 6 do
		local button = _G["ILW_UnlockContainerUnlock"..i];
		button:RegisterForDrag("LeftButton");
		button:RegisterForClicks("LeftButtonUp", "RightButtonUp");
		button.read = false;
		CreateUnlockAnimation(button);
		button:SetScript("OnShow", function(self) 
			if (button.new) then
				PlayUnlockAnination(self);
			end
			end);
	end
	
	SetPortraitToTexture(ILW_UnlockContainerPortrait, "Interface\\ICONS\\Spell_Holy_SurgeOfLight");
	ILW_UnlockContainerTitleText:SetText("I Learned What?")
	ILW_UnlockContainerCloseButton:SetScript("OnMouseUp", function() ILW_SpellBookTab:SetChecked(false); end );
	
	ButtonFrameTemplate_HideButtonBar(ILW_UnlockContainer);
	ButtonFrameTemplate_HideAttic(ILW_UnlockContainer);
	
	ILW_UpdateNavigation()
	
	UIDropDownMenu_Initialize(ILW_UnlockContainerOptionsDropDown, function(self, level) ILWAddon:InitFilter(self, level) end, "MENU");
	
	return L_BGS_ContainerBG
end

local function ShowPopUp()
	local unlocklist = ILWAddon.db.char.unlockedList;
	if (ILW_UnlockContainer:IsShown() or #unlocklist == 0 or not ILWAddon.db.global.showPopup or InCombatLockdown()) then return; end
	ShowUIPanel(ILW_AlertPopup);
	ILW_AlertPopup:SetAlpha(1);
	ILW_AlertPopup.text:SetText(#unlocklist.." unread unlock" .. (#unlocklist == 1 and "" or "s") .."!")
end

local function CreatePopupAnimation(self)
	-- create flashing animation to highlight popup
	self.animationA = self:CreateAnimationGroup();
	self.animationA.alpha = self.animationA:CreateAnimation("Alpha");
	--self.animationA.alpha:SetChange(-1);
	self.animationA.alpha:SetFromAlpha(1);
	self.animationA.alpha:SetToAlpha(0);
	self.animationA.alpha:SetSmoothing("IN");
	self.animationB = self:CreateAnimationGroup();
	self.animationB.alpha = self.animationB:CreateAnimation("Alpha");
	self.animationB.alpha:SetFromAlpha(1);
	self.animationB.alpha:SetToAlpha(0);
	--self.animationB.alpha:SetChange(-1);
	self.animationB.alpha:SetSmoothing("OUT");
	
	self.animationA:SetScript("OnFinished", function() self.animationB:Play(); end);
	self.animationB:SetScript("OnFinished", function() self:Hide(); end);
end

local function PlayPopupAnimation(self)
	ShowUIPanel(self);
	if not self.animationA then
		CreatePopupAnimation(self)
	end
	self.animationA.alpha:SetDuration(0.3);
	self.animationB.alpha:SetDuration(0.3);
	self.animationA:Play(true);
end

local function ILW_CreatePopup()
	ILW_AlertPopup:SetPoint("center", UIParent, "center", 400, 0);
	ILW_AlertPopup:RegisterForDrag("LeftButton");
	ILW_AlertPopup:SetScript("OnDragStart", ILW_AlertPopup.StartMoving );
	ILW_AlertPopup:SetScript("OnDragStop", ILW_AlertPopup.StopMovingOrSizing);
	ILW_AlertPopup:SetScript("OnShow", function(self) PlayPopupAnimation(self.highlight) end );
	ILW_AlertPopup:SetScript("OnClick", function(self, button) Popup_OnClick(self, button);end );
	ILW_AlertPopup:RegisterForClicks("LeftButtonUp", "RightButtonUp");
end

local function ToggleUnlockedPage(show)
	if (show) then
		ShowUnlockContainer();
	else
		HideUIPanel(ILW_UnlockContainer);
	end

end

local function CreateSpellbookIcon()

	local L_ILW_SpellBookTab = CreateFrame("CheckButton", "ILW_SpellBookTab", SpellBookSideTabsFrame, "SpellBookSkillLineTabTemplate");
	L_ILW_SpellBookTab:SetPoint("bottomleft", SpellBookSideTabsFrame, "bottomright", 0, 50);
	ShowUIPanel(L_ILW_SpellBookTab);
	-- overwrite scripts from template
	L_ILW_SpellBookTab:SetScript("OnEnter", function(self) 
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT", 0, 0);
		GameTooltip:SetText(TOOLTIP_SPELLBOOK_ICON);
	end);
	L_ILW_SpellBookTab:SetScript("OnClick", function() 
			ToggleUnlockedPage(not ILW_UnlockContainer:IsShown()); 
		end);

	L_ILW_SpellBookTab.icon = L_ILW_SpellBookTab:CreateTexture("ILW_SpellBookTabIcon");
	L_ILW_SpellBookTab.icon:SetPoint("center", L_ILW_SpellBookTab);
	L_ILW_SpellBookTab.icon:SetSize(32, 32);
	L_ILW_SpellBookTab.icon:SetTexture("Interface\\ICONS\\Spell_Holy_SurgeOfLight");
	
	
end

local function ResetButtons()
	for i=1, 6 do
		local button = _G["ILW_UnlockContainerUnlock"..i];
		local name = button:GetName();
		local iconTexture = _G[name.."IconTexture"];
		iconTexture:Hide();
		iconTexture:SetTexture("");
		button:Hide();
		button.SpellName:SetText("");
		ShowUIPanel(button.SpellName);
		button.SpellName:SetHeight(button.SpellName:GetStringHeight());
		button.unlockType = nil;
		button.SpellSubName:SetText("");
		button.SpellSubName:Hide()
		button.unlockId = nil;
		button.read = false;
		button.new = true;
		button.animation:Stop();
		button.NewText:SetText("");
		button.NewTextBG:Hide();
		button.Level:Hide();
		button.DigitBg:Hide();
	end
	
	ILW_UpdateNavigation();
end

function ILW_ShowUnlockedContent()
	
	-- Only update when the main window is open
	if (not ILW_UnlockContainer:IsShown()) then return; end
	
	ResetButtons();
	
	local unlockedList = ILWAddon.db.char.unlockedList;
	local prevDisplayLevel = 0;
	local count = 1;
	local unlock = nil;
	local pageNr = ILW_UnlockContainer.CurrentPage;
	local start = (pageNr-1) * UNLOCKS_PER_PAGE;
	local nrToShow = (#unlockedList-start) > 6 and 6 or #unlockedList-start;
	for i = start + 1, (start + nrToShow) do
		unlock = unlockedList[i];

			local button = _G["ILW_UnlockContainerUnlock"..count];
			local name = button:GetName();
			local iconTexture = _G[name.."IconTexture"];
			iconTexture:Show();
			iconTexture:SetTexture(unlock.icon);
			button.data = unlock;
			-- check if unlock has been read before.
			button.read = unlock.read;
			
			button.new = (unlock.new == nil and true or unlock.new );
			ShowUIPanel(button);
			if (not button.read) then
				button.NewText:SetText(" New! ");
				button.NewTextBG:Show();
			end
			button.SpellName:SetText(unlock.name);
			button.SpellName:Show();
			button.SpellName:SetHeight(button.SpellName:GetStringHeight());
			button.unlockType = unlock.type;
			button.unlockId = unlock.id;
			
			button.TypeIcon:SetTexCoord(0, 0, 0, 0);
			local coords = _typeIcons[button.unlockType];
			if coords then
				button.TypeIcon:SetTexCoord(coords.left, coords.right, coords.top, coords.bottom);
			end
			
			local subText = "";
			
			if (unlock.subText ~= nil) then
				subText = subText .. unlock.subText;
			end
			
			if (unlock.spec ~= nil) then
				local id, specName, description, icon, background, role, class = GetSpecializationInfoByID(unlock.spec);
				subText = subText ..", ".. specName;
			end
			
			button.SpellSubName:SetText(subText);
			button.SpellSubName:Show();
			button.SpellSubName:SetHeight(button.SpellSubName:GetStringHeight());
			
			-- Only show level for the first one
			if (unlock.level ~= prevDisplayLevel) then
				button.DigitBg:Show();
				button.Level:Show();
				button.Level:SetText(unlock.level);
			end
			
			prevDisplayLevel = unlock.level;

			-- set unlock as read
			unlock.new = false;
			
		count = count +1;
	end
	
	if (#unlockedList == 0) then
		ILW_UnlockContainer.NoNew:Show();
	else
		ILW_UnlockContainer.NoNew:Hide();
	end
	
	ILW_UpdateNavigation();

end

local function AddUnlockedSkill(id, level, spec, subText, unlockType)
	local name, rank, icon, castingTime, minRange, maxRange, spellID = GetSpellInfo(id);

	if unlockType == nil then
		unlockType = UNLOCKTYPE_SPELL;
	end
	if subText == nil then
		subText = "Ability";
	end
	table.insert(ILWAddon.db.char.unlockedList, {["type"] = unlockType, ["level"] = level, ["id"] = id, ["icon"] = icon, ["name"] = name ,["spec"] = spec, ["subText"] = subText});
	ILW_ShowUnlockedContent();
end

local function AddUnlockedTalent(level)
	table.insert(ILWAddon.db.char.unlockedList, {["type"] = UNLOCKTYPE_TALENT, ["level"] = level, ["icon"] = ICON_TALENT, ["name"] = "Talent Point"});
	ILW_ShowUnlockedContent();
end

local function AddUnlockInstance(instance, instanceType)
	table.insert(ILWAddon.db.char.unlockedList, {["type"] = instanceType, ["level"] = instance.level, ["icon"] = instance.icon, ["name"] = instance.name, ["id"] = instance.id, ["subText"] = instance.subText});
	ILW_ShowUnlockedContent();
end

local function CheckLevelUnlocks(level)
	
	local trackOptions = ILWAddon.db.global.trackers
	local spec = GetPlayerSpec();
	if (spec ~= nil) then
		ILWAddon.db.char.specLastLevel[spec] = level;
	end
	
	if trackOptions.Spells then
		-- Check for skills
		for k, v in ipairs(_classSkills) do
			if v.level == level then
				-- always show if not spec specific
				if v.specs == nil then
					AddUnlockedSkill(tonumber(v.id), level, nil, v.subText, UNLOCKTYPE_SPELL);
				
				-- Otherwise, if you have a spec, check if it's the same as yours
				elseif spec ~= nil then
					for specKey, cSpec in ipairs(v.specs) do
						if cSpec == GetPlayerSpec() then
							AddUnlockedSkill(tonumber(v.id), level, spec, v.subText, UNLOCKTYPE_SPELL);
						end
					end
				end
			end
		end
	end
	
	if trackOptions.Riding then
		-- Check for riding skills
		for k, riding in ipairs(_ridingSkills) do
			if (riding.level == level) then
				AddUnlockedSkill(tonumber(riding.id), level, nil, riding.subText, UNLOCKTYPE_RIDING);
			end
		end
	end
	
	if trackOptions.Talents then
		-- Check for talents
		for k, talentLevel in ipairs(_talentLevels) do
			if (talentLevel == level) then
				AddUnlockedTalent(level);
			end
		end
	end
	
	if trackOptions.Dungeons then
		-- Check for dungeons
		for k, instance in ipairs(_InstanceLevels) do
			if (instance.level == level) then
				AddUnlockInstance(instance, UNLOCKTYPE_DUNGEON);
			end
		end
	end
	
	if trackOptions.Battlegrounds then
		-- Check for PvP
		for k, instance in ipairs(_PvPLevels) do
			if (instance.level == level) then
				AddUnlockInstance(instance, UNLOCKTYPE_PVP);
			end
		end
	end
	
	ShowPopUp();
end

local function CheckSpecMissedUnlocks(level, spec)
	-- find spec specific abilities that have been learned since last time the player used the spec
	for k, v in ipairs(_classSkills) do
		if v.level == level and v.specs ~= nil then
			for specKey, skillSpec in ipairs(v.specs) do
				if skillSpec == spec then
					AddUnlockedSkill(tonumber(v.id), level, spec, v.subText, UNLOCKTYPE_SPELL);
				end
			end
		end
	end
end

function ILW_ClearUnlockList()
	ILWAddon.db.char.unlockedList = {};
	ILW_ShowUnlockedContent();
end

local function SpecChanged()
	local spec = GetPlayerSpec();
	local level = GetPlayerLevel();
	
	if (spec == nil) then return; end
	
	-- local lastLevel = _specLastLevel[""..spec];
	local lastLevel = ILWAddon.db.char.specLastLevel[spec];
	lastLevel = (lastLevel and lastLevel or 1);
	
	-- add spec specific unlocks since last time the spec was used
	for i = (lastLevel + 1), level do
		CheckSpecMissedUnlocks(i, spec);
	end
	
	-- sort unlocks by level to get new spec abilities in the right position
	table.sort(ILWAddon.db.char.unlockedList, function(a, b) return a.level < b.level end)

	ILWAddon.db.char.specLastLevel[spec] = level;
	
	if (not ILW_UnlockContainer:IsShown()) then
		ShowPopUp();
	end
	
	ILW_ShowUnlockedContent();
	
end

function ILWAddon:OnInitialize()
	self.db = LibStub("AceDB-3.0"):New("ILWDB", _defaults, true);
	_icon:Register(_addonName, ILWBroker, self.db.global.minimap);
end

function ILWAddon:OnEnable()
	if (not ILWAddon.db.global.spellbook) then
		ILW_SpellBookTab:Hide();
	end
	
	local spec = GetPlayerSpec();
	if (spec ~= nil) then
		self.db.char.specLastLevel[spec] = GetPlayerLevel();
	end
end

local L_ILWhat_LoadFrame = CreateFrame("FRAME", "ILWhat_LoadFrame"); 
ILWhat_LoadFrame:RegisterEvent("PLAYER_LEVEL_UP");
ILWhat_LoadFrame:RegisterEvent("PLAYER_REGEN_ENABLED");
ILWhat_LoadFrame:RegisterEvent("PLAYER_REGEN_DISABLED");
ILWhat_LoadFrame:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED");
ILWhat_LoadFrame:RegisterEvent("ADDON_LOADED");
ILWhat_LoadFrame:RegisterEvent("PLAYER_LOGOUT");
ILWhat_LoadFrame:SetScript("OnEvent", function(self, event, ...) self[event](self, ...) end)

function ILWhat_LoadFrame:PLAYER_LEVEL_UP(level, hp, mp, talentPoints, strength, agility, stamina, intellect, spirit)
	if InCombatLockdown() then
		_playerLeveled = true;
	else
		CheckLevelUnlocks(level);
	end
end

function ILWhat_LoadFrame:PLAYER_REGEN_DISABLED()
	ILW_AlertPopup:Hide();
	HideUIPanel(ILW_UnlockContainer);
end

function ILWhat_LoadFrame:PLAYER_REGEN_ENABLED()
	if _playerLeveled then
		CheckLevelUnlocks(GetPlayerLevel());
		_playerLeveled = false;
	end
	
	if _openedDuringCombat then
		ShowUnlockContainer();
		_openedDuringCombat = false;
	end
end

function ILWhat_LoadFrame:PLAYER_SPECIALIZATION_CHANGED(player)
	if(player == "player") then
		SpecChanged();
	end
end

function ILWhat_LoadFrame:PLAYER_LOGOUT(loadedAddon)
	ILW_ShowHelpUnlocks(false);
end

function ILWhat_LoadFrame:ADDON_LOADED(loadedAddon)
	if (loadedAddon ~= _addonName) then return; end
	
	ILWhat_LoadFrame:UnregisterEvent("ADDON_LOADED")
	
	_classSkills = _addonData.Skills;
	_classSpecs = _addonData.Specs;
	_talentLevels = _addonData.Talents;
	_InstanceLevels = _addonData.Instances;
	_PvPLevels = _addonData.Pvp;
	_ridingSkills = _addonData.Riding;
	
	ILW_CreateContainer();
	ILW_CreatePopup()
	CreateSpellbookIcon();
	
	_help:Initialise(ILW_UnlockContainer, _helpPlate);

	ILW_ShowUnlockedContent();
end

----------------------------------------
-- Slash Commands
----------------------------------------

SLASH_ILEARNEDWHAT1 = '/ilwhat';
SLASH_ILEARNEDWHAT2 = '/ilearnedwhat';
SLASH_ILEARNEDWHAT3 = '/ilw';
local function slashcmd(msg, editbox)
	for i=1, 110 do
	CheckLevelUnlocks(i)
	end
	-- if (ILW_UnlockContainer:IsShown()) then
		-- HideUIPanel(ILW_UnlockContainer);
	-- else
		-- ShowUnlockContainer();
	-- end
end
SlashCmdList["ILEARNEDWHAT"] = slashcmd