SpellGainz = LibStub("AceAddon-3.0"):NewAddon("SpellGainz", "AceConsole-3.0", "AceEvent-3.0")
AceGUI = LibStub("AceGUI-3.0")

function SpellGainz:OnInitialize()
  SpellGainz:CreateFrame()
  SpellGainz:SetUpConfig()
end

function SpellGainz:OnEnable()
  local EventFrame = _G.CreateFrame("Frame", "GainzMade", _G.UIParent)

  --Events
  self:RegisterEvent("LEARNED_SPELL_IN_TAB")

  SpellGainz:CreateFrame()
end

function SpellGainz:OnDisable()
  -- Called when the addon is disableds
end


---All setup for those gainz
function SpellGainz:CreateFrame()
  -- Create a container frame
  f = AceGUI:Create("Frame")
  f:SetCallback("OnClose",function(widget) f:Hide() end)
  f:SetTitle("Spell Gainz")
  f:SetStatusText("All the gainz you have made")
  f:SetLayout("Flow")
  f:Hide() -- We don't want to display it immediately
end

function SpellGainz:SetUpConfig()
  SpellGainz:SetupSlashConfig()
  self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("SpellGainz", "Gainz")

end

function SpellGainz:SetupSlashConfig()
  local options = {
      name = "SpellGainz",
      handler = SpellGainz,
      type = 'group',
      args = {
          show = {
              name = "Show Gainz",
              desc = "Show your gainz",
              type = "execute",
              func = function() f:Show() end
          },
          -- config = {
          --   name = "Configure",
          --   desc = "Configure your gainz panel",
          --   type = "execute",
          --   func = function() InterfaceOptionsFrame_OpenToCategory("SpellGainz") end
          -- }
      },
  }
  LibStub("AceConfig-3.0"):RegisterOptionsTable("SpellGainz", options, {"gainz", "spellgainz"})
end


--Event Reaction
function SpellGainz:PLAYER_ENTERING_WORLD()
  self:RegisterEvent("SPELLS_CHANGED")
end

-- We use the system chat message to know when spells have been unlearned
-- and use that as the chance to reset the skills in the frame
function SpellGainz:CHAT_MSG_SYSTEM(eventName, message)
  local unlearnedSpellMessage = string.match(message, "(You have unlearned )")

  if unlearnedSpellMessage then
    -- local spellName = string.match(message, '%[(.+)%]')
    -- local link = GetSpellLink(spellName)
    f:ReleaseChildren()
  end
end

function SpellGainz:SPELLS_CHANGED(eventName, spellID)
  self:RegisterEvent("CHAT_MSG_SYSTEM")
end

function SpellGainz:LEARNED_SPELL_IN_TAB(eventName, spellID)
  SpellGainz:AddNewSpell(spellID)
  f:Show()
end

function SpellGainz:AddNewSpell(spellID)
  --Gets the spell information and the texture
  local name, rank, icon, castingTime, minRange, maxRange, spellID = GetSpellInfo(spellID)
  local spellTexture = GetSpellTextureFileName(name)

  -- Create a button for the spell
  local spell = AceGUI:Create("Icon")
  spell:SetImage(spellTexture)
  spell:SetLabel(name)
  spell:SetImageSize(40,40)
  spell:SetCallback("OnClick", function() PickupSpell(spellID) end)
  -- Add the button to the container
  f:AddChild(spell)
end
