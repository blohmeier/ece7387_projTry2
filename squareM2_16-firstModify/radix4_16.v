`timescale 1ns / 1ps
/* Calculates the 16-bit square
* from a 16-bit input
* Input: i
* Output: o
*/
module radix4_16 (o,i);
input[15:0] i;
output[15:0] o;
reg[15:0] o;
wire[15:0] t1;
wire[11:0] t2;
wire[7:0] t3;
wire[3:0] t4;
reg[11:0] t5;
reg[7:0] t6;
// Calculate partial squares
pps16_1 p1 (t1,i[14:0]);
pps16_2 p2 (t2,i[12:1]);
pps16_3 p3 (t3,i[10:3]);
pps16_4 p4 (t4,i[8:5]);
// Added partial squares together
always @ (t1 or t2 or t3 or t4)
begin
o[3:0] = t1[3:0];
t5 = t1[15:4] + t2;
o[7:4] = t5[3:0];
t6[3:0] = t3[3:0];
t6[7:4] = t3[7:4] + t4;
o[15:8] = t6 + t5[11:4];
end
endmodule
