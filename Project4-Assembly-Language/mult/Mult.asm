// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)


// Getting value of R1 from RAM[0]
@1
D=M

// setting times to R1
@times
M=D

// Getting R2 from RAM[1]
@0
D=M

// setting number to R0
@number
M=D

// setting variable to zero
@sum
M=0

(ADD_LOOP)
@number
D=M

@sum
M=M+D

@times
M=M-1

D=M

@ADD_LOOP
D;JGT

// moving value from sum variable to RAM[2]
@sum
D=M

@2
M=D

(INFI_LOOP)
@INFI_LOOP
0;JMP
