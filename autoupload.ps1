$gitMessage = "Auto Upload $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
git add .
git commit -m $gitMessage
git push -u origin main