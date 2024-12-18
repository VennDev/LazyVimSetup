-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"
vim.o.fileencodings = "utf-8"

vim.api.nvim_create_user_command(
  'ConvertToUTF8',
  function()
    local file = vim.fn.expand('%') -- Lấy tên file hiện tại
    -- Chuyển mã hóa từ TCVN3 sang UTF-8
    vim.cmd('!iconv -f TCVN3 -t UTF-8 "' .. file .. '" -o "' .. file .. '"')
    -- Chuyển từ UTF-8-MAC (NFD) sang UTF-8 (NFC)
    vim.cmd('!iconv -f UTF-8-MAC -t UTF-8 "' .. file .. '" -o "' .. file .. '"')
    print("File đã được chuyển mã hóa sang UTF-8")
  end,
  { desc = "Chuyển mã hóa tệp sang UTF-8 bằng iconv" }
)