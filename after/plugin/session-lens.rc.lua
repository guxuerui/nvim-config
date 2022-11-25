local status, sessionLens = pcall(require, "session-lens")
if (not status) then return end

sessionLens.setup({
  -- path_display = {'shorten'},
  theme_conf = { border = true },
  previewer = true,
  prompt_title = 'YEAH SESSIONS',
})
