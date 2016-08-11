SpellGainz = LibStub("AceAddon-3.0"):NewAddon("SpellGainz", "AceConsole-3.0", "AceEvent-3.0")
AceGUI = LibStub("AceGUI-3.0")

function SpellGainz:OnInitialize()
  -- self.db = LibStub("AceDB-3.0"):New("SpellGainzDB", defaults, true)
  -- -- LibStub("AceConfig-3.0"):RegisterOptionsTable("SpellGainz", options)
  -- self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("SpellGainz", "SpellGainz")
  SpellGainz:CreateFrame()
end

function SpellGainz:OnEnable()
  local EventFrame = _G.CreateFrame("Frame", "GainzMade", _G.UIParent)
  self:RegisterEvent("LEARNED_SPELL_IN_TAB")
end

function SpellGainz:OnDisable()
  -- Called when the addon is disableds
end

function SpellGainz:CreateFrame()
  -- Create a container frame
  f = AceGUI:Create("Frame")
  f:SetCallback("OnClose",function(widget) AceGUI:Release(widget) end)
  f:SetTitle("Spell Gainz")
  f:SetStatusText("All the gainz you have made")
  f:SetLayout("Flow")
end

--Event Reaction
function SpellGainz:LEARNED_SPELL_IN_TAB(eventName, spellID)
  SpellGainz:AddNewSpell(spellID)
end

function SpellGainz:AddNewSpell(spellID)
  local name, rank, icon, castingTime, minRange, maxRange, spellID = GetSpellInfo(spellID)
  local spellTexture = GetSpellTextureFileName(name)
  self:Print(name)

  self:Print(spellTexture)
  -- Create a button
  local spell = AceGUI:Create("Icon")
  spell:SetImage(spellTexture)
  spell:SetLabel(name)
  spell:SetCallback("OnClick", function() PickupSpell(spellID) end)
  -- Add the button to the container
  f:AddChild(spell)
end
