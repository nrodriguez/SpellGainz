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
  self:RegisterEvent("CHAT_MSG_SYSTEM")
  SpellGainz:CreateFrame()
end

function SpellGainz:OnDisable()
  -- Called when the addon is disabled
end

---All setup for those gainz
function SpellGainz:CreateFrame()
  -- Create a container frame
  f = AceGUI:Create("Frame")
  f:SetTitle("Spell Gainz")
  f:SetStatusText("All the gainz you have made")
  f:SetLayout("Flow")
  f:Hide() -- We don't want to display it immediately

  --Set Callbacks
  f:SetCallback("OnClose", function(widget) f:Hide() end)
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
      hide = {
        name = "Hide Gainz",
        desc = "Hide your gainz",
        type = "execute",
        func = function() f:Hide() end
      },
      clear = {
        name = "Clear Gainz",
        desc = "Clear out previous gainz",
        type = "execute",
        func = function() f:ReleaseChildren() end
      },
      --Used for debugging specific spells
      -- test = {
      --   name = "Test Gainz",
      --   desc = "Test your gainz",
      --   type = "execute",
      --   func = function(info, input)
      --     SpellGainz:MIMIC_SPELL_LEARN("eventName", 372608)
      --   end,
      -- }
    },
  }
  LibStub("AceConfig-3.0"):RegisterOptionsTable("SpellGainz", options, { "gainz", "spellgainz", "sg" })
end

-- We use the system chat message to know when spells have been unlearned
-- and use that as the chance to reset the skills in the frame
function SpellGainz:CHAT_MSG_SYSTEM(eventName, message)
  local unlearnedSpellMessage = string.match(message, "(You have unlearned )")

  if unlearnedSpellMessage then
    f:ReleaseChildren()
    if tablelength(f.children) == 0 then
      f:Hide() -- If there are no active spells in the frame we should hide it
    end
  end
end

function SpellGainz:IS_DRAGONRIDING_SPELL(spellID)
  --Ignore Dragonriding Spells
  local dragonRidingSpellIds = {
    372608, --Surge Forward
    372610, --Skyward Ascent
    374990, --Bronze Timelock
    361584, --Whirling Surge
    403092  -- Aerial Halt

  }

  for _, v in pairs(dragonRidingSpellIds) do
    if v == spellID then
      return true
    end
  end
  return false
end

--Used for testing specific spells
-- function SpellGainz:MIMIC_SPELL_LEARN(eventName, spellID)
--   local name, rank, icon, castingTime, minRange, maxRange, spellID, originalIcon = GetSpellInfo(spellID)

--   if not IsPassiveSpell(spellID) and not SpellGainz:IS_DRAGONRIDING_SPELL(spellID) then
--     SpellGainz:AddNewSpell(spellID)
--     f:Show()
--   end
-- end

function SpellGainz:LEARNED_SPELL_IN_TAB(eventName, spellID)
  local name, rank, icon, castingTime, minRange, maxRange, spellID, originalIcon = GetSpellInfo(spellID)

  if not IsPassiveSpell(spellID) and not SpellGainz:IS_DRAGONRIDING_SPELL(spellID) then
    SpellGainz:AddNewSpell(spellID)
    f:Show()
  end
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function SpellGainz:AddNewSpell(spellID)
  --Gets the spell information and the texture
  local name, rank, icon, castingTime, minRange, maxRange, spellID, originalIcon = GetSpellInfo(spellID)

  -- Create a button for the spell
  local spell = AceGUI:Create("Icon")
  spell:SetImage(originalIcon)
  spell:SetLabel(name)
  spell:SetImageSize(40, 40)
  spell:SetCallback("OnClick", function() PickupSpell(spellID) end)
  spell:SetCallback("OnEnter", function()
    GameTooltip:SetOwner(spell.frame, "ANCHOR_BOTTOMRIGHT")
    GameTooltip:SetHyperlink(GetSpellLink(spellID))
    GameTooltip:Show()
  end)
  spell:SetCallback("OnLeave", function() GameTooltip:Hide() end)
  -- Add the button to the container
  f:AddChild(spell)
end
