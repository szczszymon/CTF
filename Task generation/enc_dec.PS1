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
$PlainText = "CiMgSSBrZWVwIGdldHRpbmcgbnVtYmVycy4uCiMgR3Vlc3MgdGhhdCBzb21lIHRoaW5neiBhcmUganVzdCBub3QgcmlnaHQsIGl0IGlzIHdoYXQgaXQgaXMuLgoKaW1wb3J0IHNlY3JldHMKaW1wb3J0IGJhc2U2NApmcm9tIENyeXB0by5DaXBoZXIgaW1wb3J0IEFFUwpmcm9tIENyeXB0by5VdGlsLlBhZGRpbmcgaW1wb3J0IHVucGFkCgptc2cgPSAiNTgzQy9wSmpJVEljQStwaDQrMGl6SVZNaWFVSXBUZHdlRjFzamRNZW9iVlNlOUF2ZGh1T1JxcUFncnIzRTRIQyIKaXYgPSBzZWNyZXRzLnRva2VuX2J5dGVzKDE2KQpzZWVkID0gc2VjcmV0cy5yYW5kYml0cygyNTYpCgprZXkgPSBzZWVkLnRvX2J5dGVzKDMyLCBieXRlb3JkZXI9J2JpZycpCiMgaXYgPSBsYW1iZGEgeDogYmFzZTY0LmI2NGRlY29kZShtc2cpWzp4XQpjaXBoZXIgPSBBRVMubmV3KGtleSwgQUVTLk1PREVfQ0JDLCBpdikKZGF0YSA9IGxhbWJkYSB4OiBiYXNlNjQuYjY0ZGVjb2RlKG1zZylbeDpdCgp0cnk6CiAgICBkZWNyeXB0ZWQgPSB1bnBhZChjaXBoZXIuZGVjcnlwdChkYXRhKDE2KSksIEFFUy5ibG9ja19zaXplKQogICAgd2l0aCBvcGVuKCJvdXRwdXQudHh0IiwgInciKSBhcyBmaWxlOgogICAgICAgIGZpbGUud3JpdGUoZiJZb3VyIGZsYWcgaXM6IHtkZWNyeXB0ZWQuZGVjb2RlKCl9IikKZXhjZXB0IFZhbHVlRXJyb3I6CiAgICBkZWNyeXB0ZWQgPSBzZWNyZXRzLnJhbmRiaXRzKDI1NikudG9fYnl0ZXMoMzIsIGJ5dGVvcmRlcj0iYmlnIikKICAgIHdpdGggb3Blbigib3V0cHV0LnR4dCIsICJ3IikgYXMgZmlsZToKICAgICAgICBmaWxlLndyaXRlKGYiWW91ciBmbGFnIGlzOiBmbGFne3t7aW50LmZyb21fYnl0ZXMoZGVjcnlwdGVkKX19fSIpCg=="
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