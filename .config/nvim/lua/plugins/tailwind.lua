return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tailwindcss = {
          settings = {
            tailwindCSS = {
              includeLanguages = {
                typescript = "javascript",
                typescriptreact = "javascript",
              },
              experimental = {
                classRegex = {
                  -- CVA (class-variance-authority) patterns
                  { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
                  { "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                  
                  -- Common CVA patterns with template literals
                  "(?:twMerge|twJoin)\\(([^\\);]*)[\\);]",
                  
                  -- Class variance authority with variants
                  { "(?:base|variants|compoundVariants)\\s*:\\s*['\"`]([^'\"`]*)['\"`]" },
                  
                  -- Clsx and classnames patterns
                  { "clsx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                  { "classnames\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                  
                  -- Template literal patterns
                  "`([^`]*)`",
                  "\"([^\"]*)\""
                }
              }
            }
          }
        }
      }
    }
  },
  
  -- TypeScript plugin for better Tailwind integration
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      settings = {
        tsserver_plugins = {
          "@tailwindcss/typescript-plugin"
        },
        typescript = {
          inlayHints = {
            includeInlayParameterNameHints = "literal",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = false,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          }
        },
        javascript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = false,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          }
        }
      }
    }
  }
}