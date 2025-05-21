
# I keep getting numbers..
# Guess that some thingz are just not right, it is what it is..

import secrets
import base64
from Crypto.Cipher import AES
from Crypto.Util.Padding import unpad

msg = "583C/pJjITIcA+ph4+0izIVMiaUIpTdweF1sjdMeobVSe9AvdhuORqqAgrr3E4HC"
iv = secrets.token_bytes(16)
seed = secrets.randbits(256)

key = seed.to_bytes(32, byteorder='big')
# iv = lambda x: base64.b64decode(msg)[:x]
cipher = AES.new(key, AES.MODE_CBC, iv)
data = lambda x: base64.b64decode(msg)[x:]

try:
    decrypted = unpad(cipher.decrypt(data(16)), AES.block_size)
    with open("output.txt", "w") as file:
        file.write(f"Your flag is: {decrypted.decode()}")
except ValueError:
    decrypted = secrets.randbits(256).to_bytes(32, byteorder="big")
    with open("output.txt", "w") as file:
        file.write(f"Your flag is: flag{{{int.from_bytes(decrypted)}}}")

