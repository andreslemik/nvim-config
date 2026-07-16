# AGENTS.md — Neovim Config (LazyVim)

## Repo structure

```
init.lua                → require("config.lazy")  (bootstraps lazy.nvim)
lua/config/             → lazy.lua, options.lua, keymaps.lua, autocmds.lua
lua/plugins/            → 17 plugin spec files, auto-imported by lazy.nvim
lazyvim.json            → LazyVim extras enabled (see below)
stylua.toml             → Lua formatter config (2-space indent, 120 cols)
.neoconf.json           → neodev + lua_ls settings
```

## Extras enabled (in lazyvim.json)

mini-comment, mini-surround, yanky, snacks_picker, telescope, prettier, docker, git, json, markdown, python, ruby, toml, typescript+vtsls, yaml, project

## Non-obvious overrides

- Python 3 provider **disabled** — `vim.g.loaded_python3_provider = 0`
- Perl provider **disabled**
- `nil_ls` excluded from mason auto-install **and** disabled in LSP config
- Ruby LSP runs via `~/.asdf/shims/ruby-lsp`, **not** mason or bundle exec
- JS/JSX files forced to `javascriptreact` filetype via autocmd (`.ts`/`.tsx` use normal TypeScript detection)
- `*.arb` files treated as Ruby
- StandardJS used for JS/TS formatting (not prettier despite extras)
- Tabby agent runs via `npx tabby-agent --stdio`
- Snacks picker shows hidden + gitignored files by default
- `showtabline = 0`, `signcolumn = "yes:1"`, `winborder = "rounded"`

## Keymaps

| Leader    | Action                                 |
|-----------|----------------------------------------|
| `<leader>fp` | Copy full file path to clipboard    |
| `<leader>fn` | Copy file name to clipboard         |
| `<leader>gg` | LazyGit                             |
| `<leader>gG` | LazyGit filtered (current file)     |
| `<leader>gb` | Toggle git blame                    |
| `<leader>pd` | Overlook: peek definition           |
| `<leader>pc` | Overlook: close all popups          |
| `<leader>pu` | Overlook: restore popup             |
| `<leader>fy` | Copy relative path (copy-path.nvim) |
| `<leader>fY` | Copy full path (copy-path.nvim)     |
| `<leader>fl` | Copy path + line number             |
| `<leader>fG` | GitHub permalink with line          |
| `<M-h/j/k/l>` | Move block (mini.move)           |
| `<C-l>` (insert) | Jump to next closing character (EscapePair) |

## Conventions

- All plugin specs live in `lua/plugins/*.lua`, returned as a table
- For `mini.nvim` use `config`, never `opts` — mini has no global `setup()`
- Use `optional = true` to override a LazyVim default spec
- Format Lua with `stylua` (2-space indent, 120 col width)
- Ruby formatting via bundled `./bin/rubocop --stdin --autocorrect-all`
- ERB formatting via `erb_format` gem
- Go-to-definition popup via `overlook.nvim` (not built-in LSP hover)
