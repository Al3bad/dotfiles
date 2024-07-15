local M = {}

-------------------------------------------------
--- Utils
-------------------------------------------------
local get_buffer = function()
  return 0 -- current buffer
end

local function clear_buffer()
  local buf = get_buffer()
  if buf then
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, {})
  end
end

local function get_buf_content()
  local buf = get_buffer()
  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
  return lines
end

local function get_selected_content()
  local buf = get_buffer()

  local s_start = vim.fn.getpos "'<"
  local s_end = vim.fn.getpos "'>"
  local n_lines = math.abs(s_end[2] - s_start[2]) + 1
  local lines = vim.api.nvim_buf_get_lines(buf, s_start[2] - 1, s_end[2], false)

  if n_lines == 1 then
    lines[1] = string.sub(lines[1], s_start[3], s_end[3])
  else
    lines[1] = string.sub(lines[1], s_start[3])
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
  end

  return lines, s_start, s_end
end

local function set_buf_contents(contents, ft)
  local buf = get_buffer()
  clear_buffer()
  local lines = vim.split(contents, '\n')
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  if ft ~= nil then
    vim.api.nvim_buf_set_option(buf, 'filetype', ft)
  else
    vim.api.nvim_buf_set_option(buf, 'filetype', 'plaintext')
  end
end

-------------------------------------------------
--- Tools
-------------------------------------------------
M.DevFormatJSON = function()
  local content = get_buf_content()
  local result = vim.system({ 'jq', '.' }, { stdin = content, text = true }):wait()
  local code = result.code
  local stdout = result.stdout

  if code ~= 0 then
    print 'Invalid format!'
    return
  end

  set_buf_contents(stdout, 'json')
end

M.DevHexToRGB = function()
  local buf = get_buffer()
  local lines, s_start, s_end = get_selected_content()
  local hex_color = table.concat(lines)

  -- Remove the '#' symbol if present
  hex_color = hex_color:gsub('#', '')

  -- Check if the hex color matches the expected pattern (3, 4, 6, or 8 lowercase or uppercase hexadecimal characters)
  if not hex_color:match '^[0-9A-Fa-f]+$' or (#hex_color ~= 3 and #hex_color ~= 4 and #hex_color ~= 6 and #hex_color ~= 8) then
    print 'Invalid hex color code!'
    return
  end

  -- Convert the hex color to decimal
  local r, g, b, a
  if #hex_color == 3 then
    r = tonumber('0x' .. hex_color:sub(1, 1) .. hex_color:sub(1, 1))
    g = tonumber('0x' .. hex_color:sub(2, 2) .. hex_color:sub(2, 2))
    b = tonumber('0x' .. hex_color:sub(3, 3) .. hex_color:sub(3, 3))
  elseif #hex_color == 4 then
    r = tonumber('0x' .. hex_color:sub(1, 1) .. hex_color:sub(1, 1))
    g = tonumber('0x' .. hex_color:sub(2, 2) .. hex_color:sub(2, 2))
    b = tonumber('0x' .. hex_color:sub(3, 3) .. hex_color:sub(3, 3))
    a = tonumber('0x' .. hex_color:sub(4, 4) .. hex_color:sub(4, 4))
  elseif #hex_color == 6 then
    r = tonumber('0x' .. hex_color:sub(1, 2))
    g = tonumber('0x' .. hex_color:sub(3, 4))
    b = tonumber('0x' .. hex_color:sub(5, 6))
  else
    r = tonumber('0x' .. hex_color:sub(1, 2))
    g = tonumber('0x' .. hex_color:sub(3, 4))
    b = tonumber('0x' .. hex_color:sub(5, 6))
    a = tonumber('0x' .. hex_color:sub(7, 8))
  end

  -- Return the RGB values as a table
  local result
  if a then
    result = { 'rgba(' .. r .. ',' .. g .. ',' .. b .. ',' .. string.format('%.3f', a / 255) .. ')' }
  else
    result = { 'rgb(' .. r .. ',' .. g .. ',' .. b .. ')' }
  end

  vim.api.nvim_buf_set_text(buf, s_start[2] - 1, s_start[3] - 1, s_end[2] - 1, s_end[3], result)
end

-- TODO: DevRGBToHex

-- TODO: DevTimestampToDate

-- TODO: DevDateToTimestamp

-- TODO: DevDateToUTC

-- TODO: DevJWTDecode

-- TODO: DevJWTEncode

-- TODO: DevEvalJS

-- TODO: DevSplitURL (protocol, host, port, endpoint, querystring)

-------------------------------------------------
--- Setup
-------------------------------------------------
M.setup = function()
  vim.api.nvim_create_user_command('DevFormatJSON', function()
    M.DevFormatJSON()
  end, { range = true })

  vim.api.nvim_create_user_command('DevHexToRGB', function()
    M.DevHexToRGB()
  end, { range = true })
end

return M
