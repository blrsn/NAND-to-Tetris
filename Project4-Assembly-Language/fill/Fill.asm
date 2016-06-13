// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.



(GET_KEYPRESS)
@KBD
D=M                       // Moving keypress value to D

@WHITE_PIXEL_VALUE
D;JEQ                     // setting white pixel if D is zero (i.e Key not pressed)

@BLACK_PIXEL_VALUE
0;JMP                     // setting black pixel if D is non-zero (i.e Key pressed)


(COUNTER_RESET)
// storing the base address of screen to a variable screen_address
@SCREEN
D=A
@screen_address
M=D

// setting initial value of counter as 8000
// 8000 because SCREEN has 8k registers which all has to be turned on or off.
@8000
D=A
@counter
M=D

// This loops through each 16 bit register of screen and writes either 'black' or 'white'
(PIXEL_WRITE_LOOP)
@counter
M=M-1               // Decrementing counter

@pixel_row
D=M                 // setting D to value in pixel_row

@screen_address
A=M
M=D                 // setting value of screen address  to D

@screen_address
M=M+1               // incrementing screen address by 1

@counter
D=M                 // getting current counter value in D

@GET_KEYPRESS
D;JEQ                // Jumping back to get keypress after counter reaches to zero

@PIXEL_WRITE_LOOP
D;JGT                // Jumping to pixel write loop to write each register.


(BLACK_PIXEL_VALUE)
@pixel_row
M=-1
@COUNTER_RESET
0;JMP                 // sets pixel row to all high

(WHITE_PIXEL_VALUE)
@pixel_row
M=0
@COUNTER_RESET
0;JMP                 // sets pixel row to all low
