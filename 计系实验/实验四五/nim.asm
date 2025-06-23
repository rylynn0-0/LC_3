.orig x3000


nextgame:

ld r1 A;
ld r2 B;
add r1 r1 r2;
ld r2 C;
add r1 r1 r2;
brz gameover;
jsr check;
jsr player;
lea r0 newline;
puts;

ld r5 now;
add r5 r5 0;
brz k;
and r5 r5 0;
brnzp l;
k: and r5 r5 0;
add r5 r5 1;
l: st r5 now;


brnzp nextgame;

gameover:
ld r5 now;
add r5 r5 0;
brz win_1;
lea r0 win_1_out;
brnzp win_out;
win_1:
lea r0 win_2_out;
win_out:
puts;

add r1 r1 r1;

halt;


A: .fill x3;
B: .fill x5;
C: .fill x8;
Row_a: .stringz "ROW A:"
Row_b: .stringz "ROW B:"
Row_c: .stringz "ROW C:"

check:
st r1 saver1;
st r7 saver7;
lea r0 Row_a;
puts;

lea r0 o;
ld r1 A;
loop_a:
brnz show_b;
puts;
add r1 r1 #-1;
brnzp loop_a;

show_b:
lea r0 newline;

puts;
lea r0 Row_b;
puts;

lea r0 o;
ld r1 B;
loop_b:
brnz show_c;
puts;
add r1 r1 #-1;
brnzp loop_b;

show_c:
lea r0 newline;
puts;
lea r0 Row_c;
puts;

lea r0 o;
ld r1 C;
loop_c:
brnz show_next;
puts;
add r1 r1 #-1;
brnzp loop_c;
show_next:
lea r0 newline;
puts;

ld r1 saver1;
ld r7 saver7;
ret;

player:
st r7 psaver7;
st r1 psaver1;
st r2 psaver2;
st r3 psaver3;
st r4 psaver4;
input1: 
ld r6 now;
brz input2;
lea r0 p2;
brnzp input_show_over;
input2:
lea r0 p1;
input_show_over:
puts;
getc;
add r1 r0 0;
out;
getc;
add r2 r0 0;
out;
ld r4 Ascii;
add r4 r4 r2;
brnz error_1;
ld r4 more_10;
add r4 r4 r2;
brzp error_1;

ld r3 if_a;
add r3 r3 r1;
brn c_b1;
brp c_b1;
ld r4 Ascii;
add r2 r2 r4;
ld r4 A;
not r2 r2;
add r2 r2 #1
add r4 r4 r2;
brn error_1;

st r4 A;
brnzp next1;

c_b1:
ld r3 if_b;
add r3 r3 r1;
brn c_c1;
brp c_c1;
ld r4 Ascii;
add r2 r2 r4;
ld r4 B;
not r2 r2;
add r2 r2 #1
add r4 r4 r2;
brn error_1;

st r4 B;
brnzp next1;

c_c1:
ld r3 if_c;
add r3 r3 r1;
brn error_1;
brp error_1;
ld r4 Ascii;
add r2 r2 r4;
ld r4 C;
not r2 r2;
add r2 r2 #1
add r4 r4 r2;
brn error_1;

st r4 C;
brnzp next1;

error_1:
lea r0 newline;
puts;
lea r0 error ;
puts;
lea r0 newline;
puts;
brnzp input1;

next1:
lea r0 newline;
puts;


ld r7 psaver7;
ld r1 psaver1;
ld r2 psaver2;
ld r3 psaver3;
ld r4 psaver4;
ret

newline: .stringz "\n";
now: .fill x0;
p1: .stringz "Player 1, choose a row and number of rocks: ";
p2: .stringz "Player 2, choose a row and number of rocks: ";
win_1_out: .stringz "Player 1 Wins.\n"
win_2_out: .stringz "Player 2 Wins.\n"
o: .stringz "o";

if_a: .fill xffbf;
if_b: .fill xffbe;
if_c: .fill xffbd;
Ascii: .fill xffd0;
saver1: .fill 0;
saver2: .fill 0;
saver3: .fill 0;
saver4: .fill 0;
saver7: .fill 0;
more_10: .fill xffc6;
psaver1: .fill 0;
psaver2: .fill 0;
psaver3: .fill 0;
psaver4: .fill 0;
psaver7: .fill 0;
error: .stringz "Invalid move. Try again.";


.end;