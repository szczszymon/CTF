## Description of all files in 'Wh0_4re_Y0u?' challenge repo

<details>
<summary>!! SPOILER WARNING !!</summary>

#### Files - directory with files that are given to the player

- Description.txt -- description of the task, that is shown on the CTF platform. Creates the story for the task.
- Drip.pdf -- Dean outfit (file for the story)
- I_love_SEEDz.pdf -- pictures of different seeds, last page is hidden and contains the seed required for flag generation
- My_LAST_pages.pdf -- hint that something might be hidden in the files, last page is hidden and contains false flag
- Nothing As It Seems.pdf -- .zip archive with its extenstion changed to .pdf. It contains the T000tally_Legit_Windows_Keygen.bat
- Oh_My_Lorem.pdf -- just a few paragraphs of Lorem Ipsum
- Thingz_I_Lieke.pdf -- file enumerating few hints about technologies and methods used in the task
- Uni_Hintz.txt -- tips for students (file for the story)


#### Solution - directory with files depicting major milestones for solving the challenge. Follow the alphabetical ordered steps in order to get the flag

- step-a_change_count.txt -- In Thingz_I_Lieke.pdf there is a hint for scientific paper on PDF Last Page Steganography. Increment the page count back to 2 to reveal last page.
- step-b_revealed_last_page.pdf -- Read the SEED from last page
- step-c_Nothing As It Seems.zip -- verify the magic bytes of 'Nothing_As_It_Seems' and change its extenstion back to .zip
- step-d_echo_T000tally_Legit_Windows_Keygen.bat -- deobfuscate the file or just echo the last line and add pause at the end
- step-e_echoed_batch.txt -- lookup the -EncodedCommand and learn that Base64 is used to decode the command
- step-f_decode_base64.PS1 -- get PowerShell oneliner by decoding Base64
- step-g_split_oneliner.PS1 -- split the oneliner by ';' character (reformat ';' to ';\n' with use of regular expressions)
- step-h_retrive_0.py -- this file describes 3 paths that can be followed in order to get the Python script. Easiest one is to run the script with last line commented
- step-i_fix_0.py -- Spot that the seed and iv variables are randomly chosen. Seed retirved from I_Love_SEEDz.pdf can be hardcoded here and the lambda function should be assigned to iv variable then the call of iv has to be fixed to utilize the new syntax of the function
- step-i_fix_0.py -- at this point running the Python script correctly decrypts the flag instead of returning random integer
- step-i_fix_0.py -- this file just shows the example of bad Python script output (random integer instead of the true flag)


#### Task generation - directory with scripts that generate the .bat file

- flag-gen.py -- Python script for flag generation (AES encryption)
- og_key-gen.py -- the core .py file with key = seed + iv for flag decryption
- key-gen.py -- stripped og_key-gen.py
- encode_Python.py -- encode the key-gen.py script into Base64
- enc_dec.PS1 -- takes the encoded py script and encrypts it with AES
- working.PS1 -- decryption template in PS1 for task
- cleaned_working.PS1 -- stripped version of the above (key less)
- oneliner.PS1 -- PS1 script from above is formatted into oneliner
- adapt.PS1 -- encodes PS 1onliner into Base64 (taken as Encoded Command in batch file)
- clear.bat -- original batch file that executes above PS1 oneliner
- obfuscate_bat.py -- generate T000tally_Legit_Windows_Keygen.bat that is deployed within CTF task as the obfuscated version of clear.bat
- T000tally_Legit_Windows_Keygen.bat -- obfuscated batch file (Ready to be solved)
- hide_pdfs_last_page.py -- Python script to hide secret within last page (append new page with content, then decrement the page count)

</details>