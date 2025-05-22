import secrets
import base64
from Cryptodome.Cipher import AES
from Cryptodome.Util.Padding import pad, unpad

# Data to be encrypted
flag = "flag{JU5T_4_STUD3NT}"

# AES IV used for encryption 
IV = 308120042839036245204340258669194977996
IV = IV.to_bytes(16, byteorder="big")
# IV = secrets.token_bytes(16)
# print("IV")
# print(IV)
# print(int.from_bytes(IV, byteorder="big"))

# Generate a 256-bit seed
seed = 110925170690551037524409200614515311892598004290486498088999779904157295154696
# seed = secrets.randbits(256)

# Convert seed to bytes (AES-256 key)
key = seed.to_bytes(32, byteorder='big')
# print("key")
# print(int.from_bytes(key))

# Encrypt the data
cipher = AES.new(key, AES.MODE_CBC, IV)
ciphertext = cipher.encrypt(pad(flag.encode(), AES.block_size))
# print("ciphertext")
# print(ciphertext)

encrypted_data = IV + ciphertext
encrypted_data = base64.b64encode(encrypted_data).decode()
print("encrypted_data")
print(encrypted_data)

print("-------")

print("decryption")
data = base64.b64decode(encrypted_data)
IV = data[:16]
data = data[16:]
c2 = AES.new(key, AES.MODE_CBC, IV)
data = unpad(c2.decrypt(data), AES.block_size).decode()
print(data)
