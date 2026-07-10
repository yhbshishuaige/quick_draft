; ============================================================
; QuickDraft — 快捷键一键打开打字草稿
; 需要: AutoHotkey v2 (https://www.autohotkey.com/)
; 用法: 双击运行本脚本，或放入启动文件夹实现开机自启
; ============================================================

#Requires AutoHotkey v2.0
#SingleInstance Force
Persistent

; -------------------- 配置区（按需修改） --------------------
; 草稿保存目录（默认：用户临时目录下的 QuickDraft）
DraftDir := EnvGet("TEMP") "\QuickDraft"

; 快捷键（# = Win 键）
; #n  = Win+N   新建草稿并打开
; #!n = Win+Alt+N  打开草稿文件夹
; 注意：Win+N 在 Win11 上可能被系统占用，可改成 #j 或 #+n 等
HotkeyNewDraft  := "#n"      ; Win+N  新建并打开草稿
HotkeyOpenFolder := "#!n"    ; Win+Alt+N  打开草稿目录
HotkeyScratch   := "#j"      ; Win+J  打开/聚焦「常驻草稿」（同一文件反复追加）

; 用什么程序打开（留空 = 系统默认关联程序，通常是记事本）
; 示例: Editor := "notepad.exe"
; 示例: Editor := "C:\Program Files\Notepad++\notepad++.exe"
Editor := "notepad.exe"

; 常驻草稿文件名（Win+J 始终打开同一个文件，适合随手记）
ScratchName := "scratch.txt"
; -----------------------------------------------------------

if !DirExist(DraftDir)
    DirCreate(DraftDir)

; 新建带时间戳的草稿并打开
Hotkey HotkeyNewDraft, (*) => NewDraft()

; 打开草稿文件夹
Hotkey HotkeyOpenFolder, (*) => Run(DraftDir)

; 打开常驻草稿（同一文件）
Hotkey HotkeyScratch, (*) => OpenScratch()

; 托盘提示
A_IconTip := "QuickDraft`n" HotkeyNewDraft " 新建草稿`n" HotkeyScratch " 常驻草稿`n" HotkeyOpenFolder " 打开目录"

NewDraft() {
    global DraftDir, Editor
    ; 文件名: draft_2026-07-10_143052.txt
    stamp := FormatTime(, "yyyy-MM-dd_HHmmss")
    path := DraftDir "\draft_" stamp ".txt"
    if !FileExist(path)
        FileAppend("", path, "UTF-8")
    OpenFile(path)
}

OpenScratch() {
    global DraftDir, Editor, ScratchName
    path := DraftDir "\" ScratchName
    if !FileExist(path)
        FileAppend("", path, "UTF-8")
    OpenFile(path)
}

OpenFile(path) {
    global Editor
    if Editor != ""
        Run(Editor ' "' path '"')
    else
        Run(path)
}
