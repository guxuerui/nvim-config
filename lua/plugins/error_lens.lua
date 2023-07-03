return {
  {
    "chikko80/error-lens.nvim",
    event = "BufRead",
    opts = {
      enabled = true,
      auto_adjust = {
        enable = true,
        theme_bg = '#222436',
        step = 5,
        total = 30,
      },
      prefix = 4,
    }
  }
}
