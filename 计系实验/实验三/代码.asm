.orig x3000
and r6 r6 #0;
ld r6 ans;r6��Ϊ�����ַ
and r7 r7 #0;
add r7 r7 #15;��Ϊ��ѭ���ڱ�
out_loop brn next_part;


and r1 r1 #0;������ȡ����
and r2 r2 #0;�浱ǰѭ�����ֵ��
and r3 r3 #0;���ݵ�ַ
and r4 r4 #0;�浱ǰ���ֵʱr5��ֵ
and r5 r5 #0;
add r5 r5 #15;r5��Ϊ15����ѭ��--

ld r3 num; 
ldr r2 r3 #0;����һ�ζ�ȡ�����ݼ�Ϊ���
add r3 r3 #1;
add r5 r5 #-1;
add r4 r4 #15;

loop brn next_loop;�ڲ�ѭ������Ѱ�����ֵ
ldr r1 r3 #0;
not r1 r1;
add r1 r1 #1;
add r0 r1 r2;�Ƚϵ�ǰֵ�Ƿ�������ֵ
brzp next;
add r2 r1 #0;
not r2 r2 ;
add r2 r2 #1;��ֵ����r2
add r4 r5 #0;��¼��ǰ����
next add r3 r3 #1;
add r5 r5 #-1;
brnzp loop;

next_loop 
not r0 r7;
ld r6 ans;
add r0 r0 #1;
add r0 r0 #15;
add r6 r0 r6;
str r2 r6 #0;����ǰ���ֵд���Ӧλ��

not r4 r4 ;
add r3 r3 r4;
and r1 r1 #0;
str r1 r3 #0;��ԭ����ֵ��Ϊ0
add r7 r7 #-1;
brnzp out_loop;

next_part ;�������

 ;�����Щ������B
and r1 r1 #0;
ld r1 ans;
and r2 r2 #0;
add r2 r2 #7;
ld r4 B_score;
and r5 r5 #0;r5��¼�ж����˿�����B

loop_B;  Bѭ��ǰ8��
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

check_A;�����Щ������A
and r1 r1 #0;
ld r1 ans;
and r2 r2 #0;
add r2 r2 #3;
ld r4 A_score;
and r6 r6 #0;r6��¼��Щ������A

loop_A;  Aѭ��ǰ4��
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

over ;r5��ȥr6�õ�B������
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