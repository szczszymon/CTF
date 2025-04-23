$c = Read-Host "Paste onliner here"
$bytes = [System.Text.Encoding]::Unicode.GetBytes($c)
$encodedCommand = [Convert]::ToBase64String($bytes)
Write-Host "Your output:"
Write-Host $encodedCommand