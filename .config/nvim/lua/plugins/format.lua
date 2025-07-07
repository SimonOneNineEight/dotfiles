return {
    "stevearc/conform.nvim",
    opts = {
        -- Add your formatters to the default list
        formatters_by_ft = {
            -- LazyVim already configures these
            -- lua = { "stylua" },

            -- Your additional formatters
            javascript = { "prettier" },
            typescript = { "prettier" },
            javascriptreact = { "prettier" },
            typescriptreact = { "prettier" },
            css = { "prettier" },
            html = { "prettier" },
            yaml = { "prettier" },
            json = { "prettier" },
            markdown = { "prettier" },
            graphql = { "prettier" },
            python = { "isort", "black" },
        },
    },
}
