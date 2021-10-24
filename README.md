A few 'aliases' for Microsoft Windows' `cmd` prompt for fuzzy finding, grepping, ..., implemented as batch files.

- `s.bat` to grep for a regular expression (using [ripgrep](https://chocolatey.org/packages/ripgrep) or [ag](https://chocolatey.org/packages/ag) for searching and [less](https://chocolatey.org/packages/less) for paging the results, whenever available)

---

- `fe.bat` to fuzzy find a file to be edited in `%EDITOR%`, `vim` or `notepad` (using [fd](https://chocolatey.org/packages/fd), `ripgrep` or `ag` as file finder and [fzf](https://chocolatey.org/packages/fzf) or [peco](https://chocolatey.org/packages/peco) as fuzzy selector, whenever available)
- `fo.bat` to fuzzy find a file to be opened (with its standard application)
- `ff.bat` to fuzzy find a folder to be switched to

---

- `e.bat` to edit in `%EDITOR%`, `vim` or `notepad`
- `o.bat` to open a file with its standard application

- `oo.bat` to spawn a file manager showing the current directory (using [totalcommander](https://chocolatey.org/packages/totalcommander), whenever available)
- `pw.bat` to spawn `powershell` in the current directory

---

- `rs.bat` to sync two directories with [rsync](https://chocolatey.org/packages/rsync)

- `ln.bat` to create a hard link (or junction) similar to `ln` under Unix (possible with user permissions)
- `ln-s.bat` to create a symbolic link similar to `ln -s` under Unix (needs extra permissions as documented in the initial comments)

- `l.bat` to list files or folders
- `ll.bat` to list files or folders with some details

- `cp.bat` to copy a file or folder

- `mcd.bat` to create a directory and switch to it
- `mv.bat` to move a file or folder

- `r.bat` as alias for the file manager [lf](https://chocolatey.org/packages/lf), similar to `ranger`

- `rn.bat` as alias for [mmv](https://github.com/itchyny/mmv) to rename files in your `%EDITOR%`

- `rm.bat` to delete a file or folder

---

- `g.bat` as alias for `git`
- `lzg.bat` as alias for [lazygit](https://community.chocolatey.org/packages/lazygit)
- `tig.bat` to start `tig` from Git for Windows

---

- `pass.bat` as alias for [gopass](https://community.chocolatey.org/packages/gopass)

- `p.bat` as alias for `%PAGER%` (with [less](https://community.chocolatey.org/packages/less) or `more` as fallback)

- `qurl.bat` to download an URL resource (with [aria2](https://community.chocolatey.org/packages/aria2) or [curl](https://community.chocolatey.org/packages/curl))

