# General commands
ADD     Addition        Add two numbers together        add <DEST>, <ELEM [immediate, reg]>, <ELEM [immediate, reg]>    

# Branching
B       Branch          Jumps unconditionally           b <LABEL>

# Register-specific commands
STR     store value     Stores a value into memory      str <MEMORY ADDRESS>, [BASE, OFFSET]
LDR     load register   Loads a value into a register   ldr <REGISTER>, <MEMORY [immediate]>
