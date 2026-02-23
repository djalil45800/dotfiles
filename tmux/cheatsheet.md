# 🚀 Tmux Cheatsheet (Tokyo Night & Bash Edition)

> **Current Prefix:** `Ctrl` + `Space`

---

## 📂 Session Management

| Action                                 | Shortcut       |
| :------------------------------------- | :------------- |
| **Sessionizer** (Project fuzzy finder) | `Prefix` + `f` |
| Detach from session (keep it running)  | `Prefix` + `d` |
| Reload configuration                   | `Prefix` + `r` |
| List active sessions (from Shell)      | `tmux ls`      |
| Attach to last session (from Shell)    | `tmux a`       |

---

## 🪟 Pane Management (Splits)

| Action                                | Shortcut                               |
| :------------------------------------ | :------------------------------------- |
| **Vertical Split** (side by side)     | `Prefix` + `v`                         |
| **Horizontal Split** (top/bottom)     | `Prefix` + `s`                         |
| **Quick Navigate** (No prefix needed) | `Alt` + `h` `j` `k` `l`                |
| Close current pane                    | `Prefix` + `x` (then `y`)              |
| Maximize / Restore pane (Zoom)        | `Prefix` + `m`                         |
| Resize Panes (Vim Style)              | `Prefix` + `h` `j` `k` `l` (hold keys) |

---

## 📑 Window Management (Tabs)

| Action                 | Shortcut                    |
| :--------------------- | :-------------------------- |
| Create new window      | `Prefix` + `c`              |
| Go to window by index  | `Prefix` + `1`, `2`, `3`... |
| Previous / Next window | `Prefix` + `p` / `n`        |
| Rename current window  | `Prefix` + `,`              |

---

## 📝 Copy Mode (Vim Style)

| Action                                | Shortcut       |
| :------------------------------------ | :------------- |
| Enter copy mode                       | `Prefix` + `[` |
| Start selection                       | `v`            |
| Copy selection (**wl-copy** / Fedora) | `y`            |
| Paste from buffer                     | `Prefix` + `P` |
| Exit copy mode                        | `Esc` or `q`   |

---

## 🎨 Interface & UI (Tokyo Night)

- **Status Bar:** Located at the **Top**.
- **Left Side:** ` Session_Name` (Blue).
- **Center:** Window list aligned to the middle.
- **Focus:** Current window is **Blue + Underscored**.
- **Right Side:** ` Total_Windows` (Magenta).

---

## 🛠️ Maintenance & Paths

- **Kill entire server:** `tmux kill-server`
- **Config path:** `~/.config/tmux/tmux.conf`
