// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

@SCREEN
D=A
@screen_current_address
M=D
@8192
D=D+A
@screen_end_address
M=D

(LOOP)
@screen_current_address
D=M
@screen_end_address
D=D-M
@NO_OVERFLOW
D; JLE
@SCREEN
D=A
@screen_current_address
M=D

(NO_OVERFLOW)
@KBD
D=M
@CLEAR_SCREEN
D; JEQ

// Fill the screen
@screen_current_address
A=M
M=-1
@screen_current_address
M=M+1
@LOOP
0; JMP

(CLEAR_SCREEN)
@screen_current_address
A=M
M=0
@screen_current_address
M=M+1
@LOOP
0; JMP
