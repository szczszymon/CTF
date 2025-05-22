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
$PlainText = "CiMgQXV0aG9yIG5vdGU6IHJ1biAncGlwIGluc3RhbGwgcHljcnlwdG9kb21leCcKaW1wb3J0IHNlY3JldHMKaW1wb3J0IGJhc2U2NApmcm9tIENyeXB0b2RvbWUuQ2lwaGVyIGltcG9ydCBBRVMKZnJvbSBDcnlwdG9kb21lLlV0aWwuUGFkZGluZyBpbXBvcnQgdW5wYWQKCm1zZyA9ICI1ODNDL3BKaklUSWNBK3BoNCswaXpJVk1pYVVJcFRkd2VGMXNqZE1lb2JWU2U5QXZkaHVPUnFxQWdycjNFNEhDIgppdiA9IHNlY3JldHMudG9rZW5fYnl0ZXMoMTYpCnNlZWQgPSBzZWNyZXRzLnJhbmRiaXRzKDI1NikKCmtleSA9IHNlZWQudG9fYnl0ZXMoMzIsIGJ5dGVvcmRlcj0nYmlnJykKIyBpdiA9IGxhbWJkYSB4OiBiYXNlNjQuYjY0ZGVjb2RlKG1zZylbOnhdCmNpcGhlciA9IEFFUy5uZXcoa2V5LCBBRVMuTU9ERV9DQkMsIGl2KQpkYXRhID0gbGFtYmRhIHg6IGJhc2U2NC5iNjRkZWNvZGUobXNnKVt4Ol0KCnRyeToKICAgIGRlY3J5cHRlZCA9IHVucGFkKGNpcGhlci5kZWNyeXB0KGRhdGEoMTYpKSwgQUVTLmJsb2NrX3NpemUpCiAgICB3aXRoIG9wZW4oIm91dHB1dC50eHQiLCAidyIpIGFzIGZpbGU6CiAgICAgICAgZmlsZS53cml0ZShmIllvdXIgZmxhZyBpczoge2RlY3J5cHRlZC5kZWNvZGUoKX0iKQpleGNlcHQgVmFsdWVFcnJvcjoKICAgIGRlY3J5cHRlZCA9IHNlY3JldHMucmFuZGJpdHMoMjU2KS50b19ieXRlcygzMiwgYnl0ZW9yZGVyPSJiaWciKQogICAgd2l0aCBvcGVuKCJvdXRwdXQudHh0IiwgInciKSBhcyBmaWxlOgogICAgICAgIGZpbGUud3JpdGUoZiJZb3VyIGZsYWcgaXM6IGZsYWd7e3tpbnQuZnJvbV9ieXRlcyhkZWNyeXB0ZWQpfX19IikKCiMgSSBrZWVwIGdldHRpbmcgbnVtYmVycy4uCiMgR3Vlc3MgdGhhdCBzb21lIHRoaW5neiBhcmUganVzdCBub3QgcmlnaHQsIGl0IGlzIHdoYXQgaXQgaXMuLgo="
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