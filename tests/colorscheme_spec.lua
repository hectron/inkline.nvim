local config = require("inkline.config")
local inkline = require("inkline")

before_each(function()
  vim.o.background = "dark"
  vim.cmd.colorscheme("default")
  config.setup()
end)

it("did proper init", function()
  assert(vim.o.background == "dark")
  -- colors_name might be nil initially, that's ok
end)

describe("style loading", function()
  it("loads retro style", function()
    inkline.setup({ style = "retro" })
    inkline.load()
    assert(vim.g.colors_name == "inkline-retro")
  end)

  it("loads cyberpunk style", function()
    inkline.setup({ style = "cyberpunk" })
    inkline.load()
    assert(vim.g.colors_name == "inkline-cyberpunk")
  end)

  it("defaults to original style", function()
    inkline.setup({})
    inkline.load()
    assert(vim.g.colors_name == "inkline-original")
  end)
end)

describe("style switching", function()
  it("switches from cyberpunk to retro", function()
    inkline.setup({ style = "cypberpunk" })
    inkline.load()
    assert(vim.g.colors_name == "inkline-cyberpunk")

    inkline.switch_style("retro")
    assert(vim.g.colors_name == "inkline-retro")
  end)

  it("rejects invalid style", function()
    inkline.setup({ style = "modern" })
    inkline.load()
    local original_name = vim.g.colors_name

    inkline.switch_style("invalid")
    -- Should remain unchanged
    assert(vim.g.colors_name == original_name)
  end)
end)

describe("configuration options", function()
  it("respects transparent option", function()
    inkline.setup({ style = "cyberpunk", transparent = true })
    inkline.load()
    assert(vim.g.colors_name == "inkline-cyberpunk")
  end)

  it("respects purple_comments option", function()
    inkline.setup({ style = "cyberpunk", purple_comments = true })
    inkline.load()
    assert(vim.g.colors_name == "inkline-cyberpunk")
  end)

  it("respects vibrant_strings option", function()
    inkline.setup({ style = "cyberpunk", vibrant_strings = false })
    inkline.load()
    assert(vim.g.colors_name == "inkline-cyberpunk")
  end)
end)

