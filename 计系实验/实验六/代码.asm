.orig x3000

ld r6 stack;
ld r2 stack;
sti r2 KBSR;
ld r3 def;
sti r3 trap_;

loop_out;
ld r1 flag;

brz f0;
lea r0 ICS_1;
jsr delay;
puts;
and r1 r1 0;
st r1 flag;
lea r0 ICS_0;
and r3 r3 0;
add r3 r3 5;
brnzp f1;


f0:
lea r0 ICS_0;
and r3 r3 0;
add r3 r3 5;
add r1 r1 1;
st r1 flag;
f1:
jsr delay;
puts;
add r3 r3 -1;
brp f1;
ld r0 newline;
out;

brnzp loop_out;


halt
trap_ .fill x0180
def .fill x2000
stack .fill x4000
KBSR .fill xfe00
KBDR .fill xfe02
DDR .fill xfe06
DSR .fill xfe04
flag: .fill 1;
ICS_1: .stringz "ICS";
ICS_0: .stringz "   ICS";
newline: .fill x0A;


delay:
st r1 saver1;
ld r1 count;
rep: add r1 r1 #-1;
brp rep;
ld r1 saver1
ret
count .fill #25000
saver1 .fill 0; 
.end