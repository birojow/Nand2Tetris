// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.
@R2
M=0

@R0
D=M
@SET_RESULT_AS_ZERO
D; JEQ
@END
D; JLT

@R1
D=M
@SET_RESULT_AS_ZERO
D; JEQ
@END
D; JLT

(PERFORM_MULTIPLICATION)
@R0
D=M
@R2
M=M+D
@R1
M=M-1
@R1
D=M
@END
D; JEQ
@PERFORM_MULTIPLICATION
0; JMP

(SET_RESULT_AS_ZERO)
@R2
M=0

(END)
@END
0, JMP
