.orig x2000
st r0 saver0;
st r1 saver1;
st r2 saver2;
ldi r0 KBDR;
and r1 r1 0;
add r1 r1 10;

loop brnz next;
ld r2 set;
sti r2 DSR;
sti r0 DDR;
add r1 r1 -1;
brnzp loop;

next:

ldi r0 KBDR;
ld r1 ent;
add r0 r0 r1;
brn next;
brp next;

and r1 r1 #0;
ld r1 reset;
sti r1 KBSR;
ld r0 saver0;
ld r1 saver1;
ld r2 saver2;

rti;
ent .fill xfff6;
reset .fill x4000;
set .fill xf000;
saver0 .fill 0;
saver1 .fill 1;
saver2 .fill 0;
KBSR .fill xfe00
KBDR .fill xfe02
DDR .fill xfe06
DSR .fill xfe04
.end