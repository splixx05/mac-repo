**Benötigte Pakete für nvim**

< sudo apt install ripgrep >
< sudo apt install fzf >

**Prüfe, ob lazy.nvim korrekt installiert ist**

# ~/.local/share/nvim/lazy/lazy.nvim

bzw.

< ls ~/.local/share/nvim/lazy/lazy.nvim >

Wenn es nicht vorhanden ist, musst du das Plugin möglicherweise erneut installieren. Du kannst das manuell tun, indem du den folgenden Befehl ausführst:

< git clone https://github.com/folke/lazy.nvim.git --branch=stable ~/.local/share/nvim/lazy/lazy.nvim >

Debugging
Wenn die vorherigen Schritte nicht helfen, kannst du versuchen die Logfiles zu prüfen:

< nvim --log-level=trace >

Danach kannst du die Log-Datei unter ~/.local/state/nvim/log einsehen.

Teste Lazy.nvim isoliert: Erstelle eine minimalistische init.lua, die nur Lazy.nvim lädt, um zu testen, ob es mit einer einfachen Konfiguration funktioniert.

< local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath) 

require("lazy").setup({}) >

Starte Neovim und überprüfe, ob die Fehlermeldung immer noch auftritt.

**Zusätzliche Lua-Module:**

< sudo nala install -y luarocks >

Sobald LuaRocks installiert ist, kannst du ein Lua-Modul so installieren:

< sudo luarocks install modulname >
























