local status, cursorline = pcall(require, "nvim-cursorline")
if (not status) then return end

cursorline.setup ({
  cursorline = {
    enable = true,
    timeout = 500,
    number = false,
  },
  cursorword = {
    enable = true,
    min_length = 3,
    hl = { underline = true },
  }
})
