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
@KBD
D=A
@k_addr
M=D

@k_addr
D=M
@SCREEN
D=D-A
@n
M=D

@value
M=0

(CHEAK_KEY_PRESSED)
@k_addr
A=M
D=M
@BLACK
D;JGT

(CLEAR)
@value
M=0
@PRINT_SCREEN
0;JMP

(BLACK)
@value
M=-1
@PRINT_SCREEN
0;JMP

(PRINT_SCREEN)
@SCREEN
D=A
@s_addr
M=D

@i
M=0

(PRINT_LOOP)
@i
D=M
@n
D=D-M
@CHEAK_KEY_PRESSED
D;JEQ

@value
D=M

@s_addr
A=M
M=D

@s_addr
M=M+1

@i
M=M+1

@PRINT_LOOP
0;JMP