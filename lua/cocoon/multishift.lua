local function multishift(direction)
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")

  local n = vim.v.count1
  vim.cmd.normal("V" .. n .. direction)

  vim.fn.setpos("'<", start_pos)
  vim.fn.setpos("'>", end_pos)
end

local function multiindent()
  multishift(">")
end

local function multidedent()
  multishift("<")
end

local MultiIndentKey = "<Plug>MultiIndent"
local MultiDedentKey = "<Plug>MultiDedent"

local config = {
  keymap = {
    indent = "g>",
    dedent = "g<",
  }
}

local function merge_config(default_config, user_config)
  local merged_config = {}
  for k, v in pairs(default_config) do
    if type(v) == "table" then
      merged_config[k] = merge_config(v, user_config[k] or {})
    else
      merged_config[k] = user_config[k] or v
    end
  end
  return merged_config
end

local function setup(user_config)
  vim.keymap.set("n", MultiIndentKey, multiindent, {remap = false, silent = true})
  vim.keymap.set("n", MultiDedentKey, multidedent, {remap = false, silent = true})

  config = merge_config(config, user_config or {})

  vim.keymap.set("n", config.keymap.indent, MultiIndentKey, {remap = true, silent = true})
  vim.keymap.set("n", config.keymap.dedent, MultiDedentKey, {remap = true, silent = true})
end

return {
  setup = setup,
}

