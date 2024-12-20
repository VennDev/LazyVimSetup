return {
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = ",as", -- Add surrounding in Normal and Visual modes
        delete = "ds", -- Delete surrounding
        find = ",fs", -- Find surrounding (to the right)
        find_left = ",Fs", -- Find surrounding (to the left)
        highlight = ",hs", -- Highlight surrounding
        replace = "cs", -- Replace surrounding
        update_n_lines = ",ns", -- Update `n_lines`
      },
    },
  },
  {
    "echasnovski/mini.pairs",
    opts = {
      modes = { insert = true, command = false, terminal = false },
    },
  },
  {
    "echasnovski/mini.icons",
    enabled = false,
  },
  {
    "echasnovski/mini.ai",
    enabled = false,
  },
  {
    "echasnovski/mini.indentscope",
    opts = {
      draw = {
        animation = function()
          -- return 10  -- top-to-bottom animation
          -- return -10 -- bottom-to-top animation
          -- return 0   -- no animation
          return 10     -- current setting
        end,
        delay = 50,
        priority = 2,
      },
      symbol = "│",
    },
  },
  -- {
  --   "echasnovski/mini.pairs",
  --   enabled = false,
  -- },
}
