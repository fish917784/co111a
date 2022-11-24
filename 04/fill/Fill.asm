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
(LOOP)
@0
M=D
@8191
D=A
@1
M=D
D=0
@24576
D=M
@END
D;JGT
@POS
D;JEQ
(POS)
@1
D=M
@24575
M=0
A=A-D
M=0
@1
M=M-1
D=M
@POS
D;JGT
@LOOP
D;JEQ
@LOOP
0;JMP
(END)
@1
D=M
@24575
M=-1
A=A-D
M=-1
@1
M=M-1
D=M
@END
D;JGT
@LOOP
D;JEQ