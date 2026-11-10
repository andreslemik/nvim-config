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
- Herb (`herb_ls`, `herb_format`) configured in `lua/plugins/herb.lua`; see below
- `.herb` files are filetype `eruby` via `vim.filetype.add` in `lua/config/autocmds.lua`

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
- ERB formatting via `herb-format` (conform formatter `herb_format`, `cwd` = nearest `.herb.yml`/`Gemfile`/`.git`)
- `erb_format` is no longer used: the mason package's shebang points at a removed asdf ruby
- Go-to-definition popup via `overlook.nvim` (not built-in LSP hover)

## Herb (HTML+ERB)

`lua/plugins/herb.lua` wires both halves of [Herb](https://herb-tools.dev):

- **LSP** `herb_ls` — binary `herb-language-server` from mason package `herb-language-server`
  (npm `@herb-tools/language-server`). `filetypes = { "html", "eruby" }`, so `.html.erb`,
  `.herb` and plain `.html` all attach. Diagnostics, hover, completion, folding,
  document/range formatting, on-type ERB `end` closing.
- **Formatter** `herb_format` — global npm `herb-format`, run through conform on `BufWritePre`
  (`conform.format`, `lsp_format = "fallback"`). Formats the buffer via stdin.

Herb settings come from two places, and a project's `.herb.yml` wins over personal ones:

- Client `settings.languageServerHerb` (in `herb.lua`) are personal defaults, delivered over
  `workspace/configuration`. `formatter.enabled = true` there is what turns LSP formatting on:
  without it `textDocument/formatting` returns only autofix edits.
- `.herb.yml` in the project (`version`, `framework: actionview`, `formatter.*`) is authoritative
  for `formatter.enabled`, `indentWidth`, `maxLineLength` and the linter rule set.

`herb-format` exits 0 and echoes the input unchanged when `formatter.enabled: false` is set in
`.herb.yml`, so a project that explicitly opts out is untouched on save. A project with **no**
`.herb.yml` is formatted with the personal defaults above. `herb_format`'s `cwd` is the nearest
`.herb.yml`/`Gemfile`/`.git`, which is how `.herb.yml` discovery works from stdin.

Gotchas:

- `herb-format` and `herb-lint` are separate npm packages; mason only ships `herb-language-server`.
  Install with `npm i -g @herb-tools/language-server @herb-tools/formatter @herb-tools/linter`
  (the `herb` gem also proxies them via `herb lsp` / `herb format`, but spawns `npx` per call).
- `eruby` maps to treesitter parser `embedded_template`, not `erb` — `ensure_installed = { "erb" }`
  silently installs nothing. Parser lives in `~/.local/share/nvim/site/parser/embedded_template.so`.
- `.herb` has no builtin filetype; the `herb = "eruby"` extension entry is required.
- Lint on save is done by the server (`linter.fixOnSave`), not by nvim-lint; nvim-lint's `herb`
  linter would duplicate diagnostics.

