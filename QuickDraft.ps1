# QuickDraft PowerShell 备用方案（无需 AutoHotkey）
# 用法:
#   1. 右键「使用 PowerShell 运行」或在终端: powershell -File QuickDraft.ps1
#   2. 要绑定快捷键: 右键本脚本 → 创建快捷方式 → 放到桌面
#      右键快捷方式 → 属性 →「快捷键」栏按你想要的组合（如 Ctrl+Alt+N）
#      注意: 快捷方式方式不支持纯 Win+字母，且焦点在某些全屏程序时可能无效
#   3. 推荐仍使用 QuickDraft.ahk 获得真正的全局 Win 热键

param(
    [ValidateSet("new", "scratch", "folder")]
    [string]$Mode = "new"
)

$DraftDir = Join-Path $env:TEMP "QuickDraft"
if (-not (Test-Path $DraftDir)) {
    New-Item -ItemType Directory -Path $DraftDir | Out-Null
}

switch ($Mode) {
    "new" {
        $stamp = Get-Date -Format "yyyy-MM-dd_HHmmss"
        $path = Join-Path $DraftDir "draft_$stamp.txt"
        if (-not (Test-Path $path)) {
            New-Item -ItemType File -Path $path | Out-Null
        }
        Start-Process notepad.exe -ArgumentList "`"$path`""
    }
    "scratch" {
        $path = Join-Path $DraftDir "scratch.txt"
        if (-not (Test-Path $path)) {
            New-Item -ItemType File -Path $path | Out-Null
        }
        Start-Process notepad.exe -ArgumentList "`"$path`""
    }
    "folder" {
        Start-Process explorer.exe -ArgumentList "`"$DraftDir`""
    }
}
