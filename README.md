# Docs

# How do i compile this?
-- Since this is written in windows you use these steps below:

  ```bash
  nasm -f win32 .\compile.asm -o compiler.obj
  gcc .\compiler.obj -o compiler.exe
  ```

# How do i use this and what is the purpose for it?
-- The general purpose for this was to extend my knowledge on how to read and write bytes in x86 assembly.
-- The usage of this program is the decompile binary on your own host without any external dependencies!
