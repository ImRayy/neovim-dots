return {
  -- Session manager
  {
    "rmagatti/auto-session",
    opts = {
      auto_session_root_dir = os.getenv("HOME") .. "/" .. ".neovim_sessions/",
      auto_session_enable_last_session = false,
      auto_session_create_enabled = false,
      auto_session_suppress_dirs = { "~/", "~/Downloads/", "/" },
      session_lens = {
        buftypes_to_ignore = {},
        load_on_setup = true,
        theme_conf = { border = true },
        prompt_title = "Projects",
      },
    },
  },
}
