# Docs

# How do i compile this?
- Since this is written in windows you use these steps below:

  ```bash
  nasm -f win32 .\compile.asm -o compiler.obj
  gcc .\compiler.obj -o compiler.exe
  ```

# What is the purpose for this program and how do i use it?
- The purpose of this project was to expand my knowledge of reading and writing bytes in x86 assembly.
- You can use this program by putting the exe into a folder, alongside an input.txt and an output.txt. Where you input the binary into the input.txt and run the program as it outputs it into output.txt
