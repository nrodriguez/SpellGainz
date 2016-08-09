
local addonName, _addonData = ...;

local _help = _addonData.help;

local HELP_BUTTON_NORMAL_SIZE = 46;

local function ShowTooltip()
	ShowUIPanel(ILW_HelpFrame.Tooltip);
	ILW_HelpFrame.Box:Hide();
	ShowUIPanel(ILW_HelpFrame.GlowFrame);
end

local function HideTooltip()
	ILW_HelpFrame.Tooltip:Hide();
	ShowUIPanel(ILW_HelpFrame.Box);
	ILW_HelpFrame.GlowFrame:Hide();
end

local function CreateButtonAnimation(self)
	self.animGroup_Show = self:CreateAnimationGroup();
	self.animGroup_Show.translate = self.animGroup_Show:CreateAnimation("Translation");
	self.animGroup_Show.translate:SetSmoothing("IN");
	self.animGroup_Show.alpha = self.animGroup_Show:CreateAnimation("Alpha");
	self.animGroup_Show.alpha:SetFromAlpha(1);
	self.animGroup_Show.alpha:SetToAlpha(0);
	self.animGroup_Show.alpha:SetSmoothing("IN");
	self.animGroup_Show.parent = self;
end

local function ShowButtonAnimation(self)
	if self.animGroup_Show == nil then
		CreateButtonAnimation(self)
	end
	local point, relative, relPoint, xOff, yOff = self:GetPoint();
	self.animGroup_Show.translate:SetOffset( (-1*xOff), (-1*yOff) );
	self.animGroup_Show.translate:SetDuration(0.5);
	self.animGroup_Show.alpha:SetDuration(0.5);
	self.animGroup_Show:Play(true);
end

function _help:Initialise(parent, data)
	ILW_HelpFrame:SetParent(parent);
	ILW_HelpFrame:ClearAllPoints();
	ILW_HelpFrame:SetPoint("TOPLEFT", parent, "TOPLEFT", data.FramePos.x, data.FramePos.y);
	ILW_HelpFrame:SetSize(data.FrameSize.width, data.FrameSize.height);
	
	ILW_HelpFrame.Box:SetScript("OnEnter", ShowTooltip);
	ILW_HelpFrame.GlowFrame:SetScript("OnLeave", HideTooltip);

	local subData = data[1];
	ILW_HelpFrame.Box:ClearAllPoints();
	ILW_HelpFrame.Box:SetPoint("TOPLEFT", parent, "TOPLEFT", subData.HighLightBox.x, subData.HighLightBox.y);
	ILW_HelpFrame.Box:SetSize(subData.HighLightBox.width, subData.HighLightBox.height);
	
	ILW_HelpFrame.GlowFrame:ClearAllPoints();
	ILW_HelpFrame.GlowFrame:SetPoint("TOPLEFT", parent, "TOPLEFT", subData.HighLightBox.x, subData.HighLightBox.y);
	ILW_HelpFrame.GlowFrame:SetSize(subData.HighLightBox.width, subData.HighLightBox.height);
	
	ILW_HelpFrame.Button:ClearAllPoints();
	ILW_HelpFrame.Button:SetPoint("TOPLEFT", parent, "TOPLEFT", subData.ButtonPos.x, subData.ButtonPos.y);
	ILW_HelpFrame.Button:SetSize(HELP_BUTTON_NORMAL_SIZE, HELP_BUTTON_NORMAL_SIZE);
	ILW_HelpFrame.Button:SetScript("OnShow", function(self) ShowButtonAnimation(self) end);
	ILW_HelpFrame.Button:SetScript("OnEnter", ShowTooltip);
	ILW_HelpFrame.Button:SetScript("OnLeave", HideTooltip);
	
	ILW_HelpFrame.Button.HelpIGlow:Hide();
	ILW_HelpFrame.Button.BgGlow:Hide();
	
	local tt = ILW_HelpFrame.Tooltip;
	tt:ClearAllPoints();
	tt:SetPoint("TOP", ILW_HelpFrame.Button, "BOTTOM", 0, -10);
	tt.Text:SetText(subData.ToolTipText);
	ILW_HelpFrame.Tooltip:SetHeight(tt.Text:GetHeight()+20);
	
end

function _help:ShowTutorial()
	ShowUIPanel(ILW_HelpFrame);
end

function _help:HideTutorial()
	ILW_HelpFrame:Hide();
end