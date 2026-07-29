# Docs

# How do i compile this?
- Since this is written in windows you use these steps below:

  ```bash
  nasm -f win32 .\compile.asm -o compiler.obj
  gcc .\compiler.obj -o compiler.exe
  ```

# How do i use this and what is the purpose for it?
- The purpose of this project was to expand my knowledge of reading and writing bytes in x86 assembly.  
  This program can decompile a binary on your local machine without requiring any external dependencies.
