$exePath = "C:\Program Files\llamacpp\llama-server.exe"
$argsFile = "C:\Program Files\llamacpp\llama-args.txt"
if (!(Test-Path $argsFile)) { Write-Error "Config not found: $argsFile"; exit 1 }
$argsText = (Get-Content $argsFile -Raw).Trim()
$argsList = [regex]::Matches($argsText, '(?:"[^"]*"|[^\s]+)') | ForEach-Object { $_.Value }
Write-Host "Booting llama-server..." -ForegroundColor Cyan
& $exePath @argsList
