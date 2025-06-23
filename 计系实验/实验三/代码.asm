.orig x3000
and r6 r6 #0;
ld r6 ans;r6作为输出地址
and r7 r7 #0;
add r7 r7 #15;作为外循环哨兵
out_loop brn next_part;


and r1 r1 #0;用来读取数据
and r2 r2 #0;存当前循环最大值的
and r3 r3 #0;数据地址
and r4 r4 #0;存当前最大值时r5的值
and r5 r5 #0;
add r5 r5 #15;r5记为15，内循环--

ld r3 num; 
ldr r2 r3 #0;将第一次读取的数据记为最大
add r3 r3 #1;
add r5 r5 #-1;
add r4 r4 #15;

loop brn next_loop;内层循环用于寻找最大值
ldr r1 r3 #0;
not r1 r1;
add r1 r1 #1;
add r0 r1 r2;比较当前值是否大于最大值
brzp next;
add r2 r1 #0;
not r2 r2 ;
add r2 r2 #1;将值赋给r2
add r4 r5 #0;记录当前索引
next add r3 r3 #1;
add r5 r5 #-1;
brnzp loop;

next_loop 
not r0 r7;
ld r6 ans;
add r0 r0 #1;
add r0 r0 #15;
add r6 r0 r6;
str r2 r6 #0;将当前最大值写入对应位置

not r4 r4 ;
add r3 r3 r4;
and r1 r1 #0;
str r1 r3 #0;将原来的值变为0
add r7 r7 #-1;
brnzp out_loop;

next_part ;排序结束

 ;检查哪些可以是B
and r1 r1 #0;
ld r1 ans;
and r2 r2 #0;
add r2 r2 #7;
ld r4 B_score;
and r5 r5 #0;r5记录有多少人可以是B

loop_B;  B循环前8名
brn check_A;
ldr r3 r1 #0;
not r3 r3;
add r3 r3 #1;
add r3 r4 r3;

brp not_get_B;
add r5 r5 1;

not_get_B:
add r1 r1 #1;
add r2 r2 #-1;
brnzp loop_B

check_A;检查哪些可以是A
and r1 r1 #0;
ld r1 ans;
and r2 r2 #0;
add r2 r2 #3;
ld r4 A_score;
and r6 r6 #0;r6记录哪些可以是A

loop_A;  A循环前4名
brn over;
ldr r3 r1 #0;
not r3 r3;
add r3 r3 #1;
add r3 r4 r3;

brp not_get_A;
add r6 r6 #1;
not_get_A:
add r1 r1 #1;
add r2 r2 #-1;
brnzp loop_A

over ;r5减去r6得到B的人数
not r7 r6;
add r7 r7 #1;
add r5 r7 r5;

ld r1 score;
str r6 r1 #0;
str r5 r1 #1;


halt
num .fill x3200
ans .fill x4000
score .fill x4100

A .fill x0041
B .fill x0042
C .fill x0043;
A_score .fill x0055
B_score .fill x004B
.end