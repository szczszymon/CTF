## Content description

#### Files - directory with files that are given to the player

- Description.txt -- description of the task, that is shown on the CTF platform. Creates the story for the task.
- Drip.pdf -- Dean outfit (file for the story)
- I_love_SEEDz.pdf -- pictures of different seeds, last page is hidden and contains the seed required for flag generation
- My_LAST_pages.pdf -- hint that something might be hidden in the files, last page is hidden and contains false flag
- Nothing as It Seems.pdf -- .zip archive with its extenstion changed to .pdf. It contains the T000tally_Legit_Windows_Keygen.bat
- Oh_My_Lorem.pdf -- just a few paragraphs of Lorem Ipsum
- Thingz_I_Lieke.pdf -- file enumerating few hints about technologies and methods used in the task
- Uni_Hintz.txt -- tips for students (file for the story)


#### Task generation - directory with scripts that generate the .bat file

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
- obfuscate_bat.py -- generate T000tally_Legit_Windows_Keygen.bat that is deployed within CTF task as the obfuscated version of clear.bat
- T000tally_Legit_Windows_Keygen.bat -- obfuscated batch file (Ready to be solved)