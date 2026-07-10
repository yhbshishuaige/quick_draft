# QuickDraft — Windows 一键打字草稿

轻量、秒开：用快捷键立刻新建/打开一个文本草稿，可以立刻开始写,不用先找聊天框再复制粘贴

### (要求下载autohotkey)[https://www.autohotkey.com/]

### 默认配置

- 默认快捷键

| 快捷键 | 作用 |
|--------|------|
| **Win + N** | 新建一个带时间戳的空白 `.txt`，并用记事本打开 |
| **Win + J** | 打开`scratch.txt` |
| **Win + Alt + N** | 打开草稿所在文件夹 |

- 草稿路径：

```
%TEMP%\QuickDraft\
```

例如：`C:\Users\你的用户名\AppData\Local\Temp\QuickDraft\`


Win11 有时会占用 `Win+N`。改成例如：

```ahk
HotkeyNewDraft  := "#+n"    ; Win+Shift+N
HotkeyNewDraft  := "#q"     ; Win+Q
HotkeyNewDraft  := "#!d"    ; Win+Alt+D
```

符号含义：`#`=Win  `!`=Alt  `^`=Ctrl  `+`=Shift

### 配置设置

- 草稿目录

```ahk
DraftDir := "D:\tmp\drafts"
; 或
DraftDir := EnvGet("USERPROFILE") "\Documents\Drafts"
```

- 文本编辑器(eg:Notepad++)

```ahk
Editor := "C:\path\to\notepad++.exe"
