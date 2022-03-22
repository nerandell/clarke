# Memory Referencing

This part deals with dealing with memory. When the bootloader loads, it only loads the 512 bytes of memory assigned to the boot sector. 

`simple_memory_referencing.asm` is a simple example of how to use memory referencing. A string is store at memory location referenced by a variable `memory_ref`. If we try to print the variable directly, we will not get the contents of the string printer. To print the contents directly, we need to enclose the reference in square brackets.

`stack_memory_referencing.asm` is an example of how to use memory referencing with a stack. Operators `bp` and `sp` are used to reference the two ends of the stack and `push` and `pop` are used to push and pop values onto the stack.

`print_hex.asm` and `print_string.asm` are examples of how to print hex and null terminated string values built on the top of what we have learnt so far in this chapter. 
