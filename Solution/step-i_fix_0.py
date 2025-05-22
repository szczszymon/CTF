# Author note: run 'pip install pycryptodomex'
import secrets
import base64
from Cryptodome.Cipher import AES
from Cryptodome.Util.Padding import unpad

msg = "583C/pJjITIcA+ph4+0izIVMiaUIpTdweF1sjdMeobVSe9AvdhuORqqAgrr3E4HC"
# Line below does not matter as the 'iv' variable is overwritten in, now uncommented, line 15
iv = secrets.token_bytes(16)
# Set the seed to the value retrived from I_Love_SEEDz.pdf file
#seed = secrets.randbits(256)
seed = 110925170690551037524409200614515311892598004290486498088999779904157295154696

key = seed.to_bytes(32, byteorder='big')
iv = lambda x: base64.b64decode(msg)[:x]
cipher = AES.new(key, AES.MODE_CBC, iv(16))
data = lambda x: base64.b64decode(msg)[x:]

try:
    decrypted = unpad(cipher.decrypt(data(16)), AES.block_size)
    with open("output.txt", "w") as file:
        file.write(f"Your flag is: {decrypted.decode()}")
except ValueError:
    decrypted = secrets.randbits(256).to_bytes(32, byteorder="big")
    with open("output.txt", "w") as file:
        file.write(f"Your flag is: flag{{{int.from_bytes(decrypted)}}}")

# I keep getting numbers..
# Guess that some thingz are just not right, it is what it is..