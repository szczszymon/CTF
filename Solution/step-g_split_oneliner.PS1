$a=[System.Security.Cryptography.Aes]::Create();
$a.KeySize=256;
$a.BlockSize=128;
$a.Mode=[System.Security.Cryptography.CipherMode]::CBC;
$a.Padding=[System.Security.Cryptography.PaddingMode]::PKCS7;
$a.Key=[System.Convert]::FromBase64String('sHROjI6fn579Yo7G6TtH5EopSuCbzo716FSeib1QHx4=');
$a.IV=[System.Convert]::FromBase64String('YZiBvz/z81HifcNTma695w==');
$e=[System.Convert]::FromBase64String('rlOG3NoaFlLvwr7y0mwPzskIZPruH2/rJpE6M1rS5UxSezU/Cojap1+ZNG107Mt09YKGYdpDVJjL1fz+7T2Z6Ro+fn9AkH3wIFtdxgPM6eC2W+XnAVudjCoMvTTACAWwKxZWpuChWA9TBJ3a5HFY59uRdQtzb6jD4gRnEY6cLEB56FZ+NcuYmmVicXq/UnNw6ZGfWPeBsd/yhdGgNTrBEI/fWN3pMrs427ZK9aeMFDjwy6/SM8dTUJxSNQtMU5nF9PTDf/TtJOWMUgyM3lL77dC2bv/tZpHtRt2skkWpPtPHmHjUBvYkktjoppziwzszQHeojV6DrSWCwkRXvH1yd6EjkI8JDJvTt+SqGmK4yadSmNnXkMa2FzYm+Wsw0ZV4cQ/1Vo4B9fFFWyeWliKs7zGd5LJrxXpIUCZEKekdOHhry58nyEZODSjL6TTDRHIdpeRwizh6AB0f56Yk6+OJnpp0mPhgeNMf+bCkib8QooeQWVpaj/npm6WIoamzNqgy/eZ1fDxB+MYi1g+GKJPlSdbJtqyGJVCq6vQx549rgarmu9XHDOztG10j6HsRILBBpNcYXHDO1O/7lBk4FZRdsT4UotxUc2OA98bMMrhWndLewKHBWLwXa0Ytzb0q3LAD7/fL3fUHD8lYn6jB5TdZKww5CHGRzuxVQDb+n5NJ5R6ZpHuO9/HHOcqVfrTnp39CL+lueffhzgd7x+VMb7j/00aqYYE45XBZOOoyomZXtVLrnUBOazpET8NmRS+Ng1NvJJZkyNPQ5qgs5/YKj4HwjvHQbGCCKpRW+vNO8sMMvjNqJh6B1//jMYihbXS9g4f8TQJ/X1A1bHqNSHg28iLqr+2DXqgg4GtB1LvLLGCORofONBBukOUwQ8ZmcBByKSHewW+PPkUi/EAogv+MHFAMRoi4AZtOqXb2ORdMifsp91c2SiXZtIGKlJEi3QBMn4ErIetjRdox9zJbj/fjupB+DadBQyBersPlqnBPCbgAyTBCrQDINDUQih7z5Gk0kb/CZqcVWCH4NhOUn0537+bekVCzzm4BwEOJU5tIKCBnhZwlarTBx/jKRjjkxzdk52qVQiAK+CTA/zc7IFVIbjKFxZoeQmR+4IfMPpYgV2d+D53Z2SumAtmQv/npzlYsUzxuKtpQ3kmmVT0twZeih6PM8UAAuwlyNlGJ3nVpHgCqxj0LrFNmUXq1AENHFCTxYYIjyh0EmgHDuA1PsveVeDOwOskW4LeysW7zvuZRl9nLofqr4UWPMwYiU37iy9RDarYei49FHOWOO2pPr/WTRrJwOtgleE/0Wrwhj3ZforX+1pIsL02lDEe8HaDnfUFGtXIy01KXWbarGv6aIwi+OLHusygHclZxsw1NX2A/OmEDve8s/VZgpNS1Tb6Gr/3nxGb2bZ4wmc8MmG8cxDLj99gWBnMrrPrtVPszbySjelHsRRb5V9zxyPmi5afXn9tyhUyd73a3dzkDN/oJHduq299i8DNQzmLmdGIlQgDsfLgbSaMsBFhOHOzeDAJoDilEkzBqt88KoVxqRxnXuUz7C+CI+KJshk4lTOQrpZJOrKPbfM0Kv9BOaAXHg03M0DIVPVsiRYHJShX6kif2xc3noqrl9kMakNrSQsM/yZyjAH99Ax4=');
$d=[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String([System.Text.Encoding]::UTF8.GetString($a.CreateDecryptor().TransformFinalBlock($e,0,$e.Length))));
$d|Out-File -FilePath "0" -Encoding utf8;
python "0";
#Remove-Item -Path "0" -Force;
# Path 1: Remove / Comment line 12 and run the .PS1 script to get .py script
# Path 2: Decrypt AES ciphertext using key and IV provided within the script using Powershell (modify the script to print the contents)
# Path 3: Skip deobfuscation of batch file by recovering the deleted file using 3rd party software