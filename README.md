# QuickDraft — Windows 一键打字草稿

轻量、秒开：用快捷键立刻新建/打开一个文本草稿，想到什么就写什么，不用先找聊天框再复制粘贴。

## 你需要什么

1. 安装 [AutoHotkey v2](https://www.autohotkey.com/)（安装包约几 MB，脚本本身几乎不占资源）
2. 双击运行 `QuickDraft.ahk`

## 默认快捷键

| 快捷键 | 作用 |
|--------|------|
| **Win + N** | 新建一个带时间戳的空白 `.txt`，并用记事本打开 |
| **Win + J** | 打开「常驻草稿」`scratch.txt`（同一文件反复写） |
| **Win + Alt + N** | 打开草稿所在文件夹 |

草稿默认保存在：

```
%TEMP%\QuickDraft\
```

例如：`C:\Users\你的用户名\AppData\Local\Temp\QuickDraft\`

## 5 分钟上手

1. 安装 AutoHotkey v2  
2. 把 `QuickDraft.ahk` 拷到任意目录（建议 `Documents\QuickDraft\`）  
3. 双击运行 → 托盘出现绿色 H 图标即生效  
4. 按 **Win+N** 或 **Win+J** 试一下  

### 开机自启（推荐）

1. 按 `Win+R`，输入 `shell:startup`，回车  
2. 把 `QuickDraft.ahk` **快捷方式** 放进该文件夹  
3. 之后登录 Windows 会自动挂起快捷键  

## 常见自定义

用记事本打开 `QuickDraft.ahk`，改顶部「配置区」：

### 1. 换快捷键（Win+N 被系统占用时）

Win11 有时会占用 `Win+N`。改成例如：

```ahk
HotkeyNewDraft  := "#+n"    ; Win+Shift+N
; 或
HotkeyNewDraft  := "#q"     ; Win+Q
; 或
HotkeyNewDraft  := "#!d"    ; Win+Alt+D
```

符号含义：`#`=Win  `!`=Alt  `^`=Ctrl  `+`=Shift

### 2. 换草稿目录

```ahk
DraftDir := "D:\tmp\drafts"
; 或
DraftDir := EnvGet("USERPROFILE") "\Documents\Drafts"
```

### 3. 用 Notepad++ / VS Code / 其他编辑器

```ahk
Editor := "C:\Program Files\Notepad++\notepad++.exe"
; 或
Editor := "code"   ; 若 code 已在 PATH
```

### 4. 只要「一个常驻记事本」

只用 **Win+J** 即可，始终是同一个 `scratch.txt`，最简单、最快。

## 比「找对话框」好在哪

- 全局快捷键，任意窗口下都能触发  
- 直接落到文件，不会丢（不像某些临时输入框）  
- 时间戳草稿可按次保留；常驻草稿适合连续碎碎念  
- 只依赖系统记事本 + 一个常驻的 AHK 进程，几乎无感知  

## 可选：不用 AutoHotkey 的 PowerShell 版

若你暂时不想装 AHK，可用系统自带方式绑定（体验稍逊，见 `QuickDraft.ps1`）。

更推荐还是 AutoHotkey：热键更稳、启动更快、可扩展。

## 卸载

1. 托盘图标右键 → Exit  
2. 从启动文件夹删掉快捷方式  
3. 删除脚本即可（草稿文件不会自动删，可手动清 `%TEMP%\QuickDraft`）
