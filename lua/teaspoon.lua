local lush = require("lush")
local hsl = lush.hsl

local sea_foam  = hsl(208, 80, 80)  -- Try presing C-a and C-x
local sea_crest = hsl(208, 90, 30)  -- to increment or decrement
local sea_deep  = hsl(208, 90, 10)  -- the integers used here.

local sea_gull = hsl("#c6c6c6") -- as as string, preceeded with a #
local sea_foam_triadic = sea_foam.rotate(120)
local sea_foam_complement = sea_foam.rotate(180).darken(10).saturate(10)

---@diagnostic disable: undefined-global
local theme = lush(function()
  return {

    Normal { bg = sea_deep, fg = sea_foam }, -- normal text
  }
end)
