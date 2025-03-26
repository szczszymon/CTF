## File writeup

- flag-gen.py -- Python script for flag generation (AES encryption)
- og_key-gen.py -- the core .py file with key = seed + iv for flag decryption
- key-gen.py -- stripped og_key-gen.py
- encode_python.py -- encode the key-gen.py script into Base64
- enc_dec.PS1 -- takes the encoded py script and encrypts it with AES
- working.PS1 -- decryption template in PS1 for task
- cleaned_working.PS1 -- stripped version of the above (key less)
- oneliner.PS1 -- PS1 script from above is formatted into oneliner
- adapt.PS1 -- encodes PS 1onliner into Base64 (taken as Encoded Command in batch file)
- clear.bat -- original batch file that executes above PS1 oneliner
- obfuscate_bat.py -- generate actual.bat that is deployed within CTF task as the obfuscated version of clear.bat
- actual.bat -- obfuscated batch file (Ready to be solved)