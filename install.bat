:: AutoHotKey
mv %HOMEPATH%\Documents\AutoHotkeyU64.ahk %HOMEPATH%\Documents\_AutoHotkeyU64.ahk
mklink /H %HOMEPATH%\Documents\AutoHotkeyU64.ahk autohotkey-windows-mac-keyboard\MacKeyboard.ahk
:: VS Code
mv %APPDATA%\Code\User\settings.json
mklink /H %APPDATA%\Code\User\settings.json vscode.json