Function Decrypt-String{
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
    $aes.Key = [System.Convert]::FromBase64String("ptVIg0pZoLl4Z/WtvRkPS5b38x8Lyitu0e5hfZocezA=")
    $aes.IV = [System.Convert]::FromBase64String("Jq4y7z0k5atfgmTVQM1aCw==")
    
    $decryptor = $aes.CreateDecryptor()
    $encryptedBytes = [System.Convert]::FromBase64String($CipherText)
    $decryptedBytes = $decryptor.TransformFinalBlock($encryptedBytes, 0, $encryptedBytes.Length)
    
    return [System.Text.Encoding]::UTF8.GetString($decryptedBytes)
}

$NotACipher = "kqo80iqKtjBbqIiQrELqRC87bM6wXJSl9tLYnjOLJVTNj9WbSrCUobdVd7GeSGzItFue7Uu3+XE7QM6+pQtRblgTn75ucVU7ShXIaPEg9pt5oMBhW18oUBOvscY4UeTFx8lZNf3trE0aAEyKz1iRlnBU/IOx7l2xanpUkxh7e79NiNC4VDXa6nqB6KH2MKBPvavk3+91zDYDyPxAWYrdf/Bj5+Ka0dWWbqCNieZ0OazBYh9OiJvpDr2VMvP/yfzGJCZb39HpOnTIZsBXRSckAkwQlgCqnwldI/UH1DSYRXx9xoGTipSOIgZ+qGh4ZAuAlULr59L1nha9kTDHQ7eHf5KDRMLZDNVxmIJGjA9Z2wiSDM1bMrwo1YeXxgzjKKIcR6/FYBRiw787WfAT1i07w4QS1OazZScBbBcnANnE7ud0FUxp/3AuaUe6AKb0zp6jhb47vqfhv1YOYL8B1vkNVpPP4WF62MQiOErwwSy7hTDTPUgH0TVbQ/FdxEPkV6hg6TcbcslZlDzGtOYCOrPQv6LtxE1GWcyqjjo6dSENCI9oTft8lAWvlYG9MneQ52sNa5J/OHgNSpYiVljxyWHIDmKjKVb3RPdi76cD0atbsqBYVlwV4UXrMVVL9FUOMlSBrbl9K+YpswrftjR0zqDY7BYsXuKaObcJIdxqNgxH4gifsGuUi5FVRyegA9ttjUBiTuLYErIzWHHdPq+fzJnRLC60/hezo3NKUwCyoVk2STx8I9uyvSCHd30cRP9Ch5LI0wGSnOD/NvqXd6EKqJ4WGSUzh+nrdc9yZCKp7+uJvhKXBsWvJ/5uweAQFvvwwL7CR6pkVLAK30Vnsls3lpLsP+/QsKguI5sRWyjiMvb6Ri/sAiE0MUK9dQmbVG1zQhLxgV3KI1RrUcaXQdwQlpJF/MBWXNiR1HpadvnILmADsSO2fP3RIHai42DuhmSmXXH6yD4OEweKbw5sOWpvfOz1g8Rgzt2IcLLxf/dCLRDoANbaMsTe/PKSvv3rAreuKYxCRHeAK0gXwsKxH9cQtGUO/zLPXdFL7vzPdaC8yJMhyvh60vd716bQBzpgEuVt4oUjHmeoJqsCVki0Lrm7hNPhtIqh+6XnIWYYShSpeUsmFZd9PXCS5YWbOXGWqyNn8wuINv/YSy36QB3gbZOcecN9RtYBhWkpbiLHbT5q8NJsW4ks8Mkiq1ADfPwM6I5aiiXaw2G24GWrwilKc5Ms1MSqkPrj4oHdc1IIvXGbwaDG8EE/znkU+goVvnJZyC0cNfZXWZZWEraxjiksl2UqsBwBg75/U6N4rrZboHSYVtY+Ubuory2xhqY3ykJvMTWlZ0xl0sXRIuqsajUFGagn2VdGPCK9bFHd7WcN2nD9tu8Rz2tBSekv/szMndA8snRy8n0Tvjd76QoK07l9AJf+zt/ok2VWY3CEXN7o1wVX/RrZwYqDSYDEKgWrjLYWqD9wCRoqTMoo722y98uO7uZt9/KEMlJA2WMmQ1mpHgBuWnwfNB/AhlYli59EgrPl3M+H3ow0o4uhXveJ69/qt+5yC8LjAQ=="

$DecryptedText = Decrypt-String -CipherText $NotACipher
Write-Host "Decrypted Text: $DecryptedText"

$DecodedText = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($DecryptedText))
Write-Host "DecodedText: $DecodedText"
$DecodedText | Out-File -FilePath "tmp.py" -Encoding utf8
python tmp.py
Remove-Item -Path "tmp.py" -Force