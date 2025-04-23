# AES-256 Encryption and Decryption in PowerShell with Execution Policy Bypass

# Set Execution Policy to Bypass
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force

# Define AES encryption function
Function Encrypt-String {
    param (
        [string]$PlainText,
        [string]$Key
    )
    $aes = [System.Security.Cryptography.Aes]::Create()
    $aes.KeySize = 256
    $aes.BlockSize = 128
    $aes.Mode = [System.Security.Cryptography.CipherMode]::CBC
    $aes.Padding = [System.Security.Cryptography.PaddingMode]::PKCS7
    $aes.GenerateIV()
    $aes.Key = [System.Convert]::FromBase64String($Key)
    
    $encryptor = $aes.CreateEncryptor()
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($PlainText)
    $encryptedBytes = $encryptor.TransformFinalBlock($bytes, 0, $bytes.Length)
    
    return @{ "Key" = $Key; "IV" = [System.Convert]::ToBase64String($aes.IV); "CipherText" = [System.Convert]::ToBase64String($encryptedBytes) }
}

# Define AES decryption function
Function Decrypt-String {
    param (
        [string]$CipherText,
        [string]$Key,
        [string]$IV
    )
    $aes = [System.Security.Cryptography.Aes]::Create()
    $aes.KeySize = 256
    $aes.BlockSize = 128
    $aes.Mode = [System.Security.Cryptography.CipherMode]::CBC
    $aes.Padding = [System.Security.Cryptography.PaddingMode]::PKCS7
    $aes.Key = [System.Convert]::FromBase64String($Key)
    $aes.IV = [System.Convert]::FromBase64String($IV)
    
    $decryptor = $aes.CreateDecryptor()
    $encryptedBytes = [System.Convert]::FromBase64String($CipherText)
    $decryptedBytes = $decryptor.TransformFinalBlock($encryptedBytes, 0, $encryptedBytes.Length)
    
    return [System.Text.Encoding]::UTF8.GetString($decryptedBytes)
}

# Generate AES Key
$AESKey = [System.Convert]::ToBase64String((1..32 | ForEach-Object { Get-Random -Maximum 256 } | ForEach-Object { [byte]$_ }))

# Encrypt and output results
$PlainText = "CmltcG9ydCBzZWNyZXRzCmltcG9ydCBiYXNlNjQKZnJvbSBDcnlwdG8uQ2lwaGVyIGltcG9ydCBBRVMKZnJvbSBDcnlwdG8uVXRpbC5QYWRkaW5nIGltcG9ydCB1bnBhZAoKbXNnID0gJzU4M0MvcEpqSVRJY0ErcGg0KzBpeklWTWlhVUlwVGR3ZUYxc2pkTWVvYlZTZTlBdmRodU9ScXFBZ3JyM0U0SEMnCml2ID0gc2VjcmV0cy50b2tlbl9ieXRlcygxNikKc2VlZCA9IHNlY3JldHMucmFuZGJpdHMoMjU2KQoKa2V5ID0gc2VlZC50b19ieXRlcygzMiwgYnl0ZW9yZGVyPSdiaWcnKQojIGl2ID0gbGFtYmRhIHg6IGJhc2U2NC5iNjRkZWNvZGUobXNnKVs6eF0KY2lwaGVyID0gQUVTLm5ldyhrZXksIEFFUy5NT0RFX0NCQywgaXYpCmRhdGEgPSBsYW1iZGEgeDogYmFzZTY0LmI2NGRlY29kZShtc2cpW3g6XQoKdHJ5OgogICAgZGVjcnlwdGVkID0gdW5wYWQoY2lwaGVyLmRlY3J5cHQoZGF0YSgxNikpLCBBRVMuYmxvY2tfc2l6ZSkKICAgIHdpdGggb3Blbigib3V0cHV0LnR4dCIsICJ3IikgYXMgZmlsZToKICAgICAgICBmaWxlLndyaXRlKGYiWW91ciBmbGFnIGlzOiB7ZGVjcnlwdGVkLmRlY29kZSgpfSIpCmV4Y2VwdCBWYWx1ZUVycm9yOgogICAgZGVjcnlwdGVkID0gc2VjcmV0cy5yYW5kYml0cygyNTYpLnRvX2J5dGVzKDMyLCBieXRlb3JkZXI9ImJpZyIpCiAgICB3aXRoIG9wZW4oIm91dHB1dC50eHQiLCAidyIpIGFzIGZpbGU6CiAgICAgICAgZmlsZS53cml0ZShmIllvdXIgZmxhZyBpczogZmxhZ3t7e2ludC5mcm9tX2J5dGVzKGRlY3J5cHRlZCl9fX0iKQo="
$EncryptionResult = Encrypt-String -PlainText $PlainText -Key $AESKey
Write-Host "AES Key: $($EncryptionResult.Key)"
Write-Host "AES IV: $($EncryptionResult.IV)"
Write-Host "Encrypted Text: $($EncryptionResult.CipherText)"

# Decrypt and output results
$DecryptedText = Decrypt-String -CipherText $EncryptionResult.CipherText -Key $EncryptionResult.Key -IV $EncryptionResult.IV
Write-Host "Decrypted Text: $DecryptedText"

# Pause for user input
Write-Host "Press Enter to exit..."
[void][System.Console]::ReadLine()