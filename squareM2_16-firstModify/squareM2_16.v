`timescale 1ns / 1ps
/* Calculates the 16-bit (NOT 64-bit) product
* of two 16-bit (NOT 64-bit) inputs
* Inputs: i1, i2
* Output: o
*/
module squareM2_16 (o, i1, i2);
input[15:0] i1, i2;
output[15:0] o;
reg[15:0] o;
wire[15:0] t1, t2;
reg[15:0] t3, t4;
reg[16:0] t5, t6;
reg[16:0] t7;
reg[16:0] t8;
// Add the two inputs
// Subtract the smaller input
// from the larger on
always @ (i1 or i2)
begin
if (i1 > i2)
begin
t3 = i1;
t4 = i2;
end
else
begin
t3 = i2;
t4 = i1;
end
t5 = t3 - t4;
t6 = t3 + t4;
end
// square the difference
radix4_16 s1 (t5[16:1], t1);
// square the sum
radix4_16 s2 (t6[16:1], t2);
// Truncation correction
always @ (t2)
begin
if (t6[0] == 1)
begin
t7 = t2 + t6[16:1];
end
else
begin
t7[15:0] = t2;
t7[16] = 0;
end
end
always @ (t1)
begin
if (t5[0] == 1)
begin
t8 = t1 + t5[16:1];
end
else
begin
t8[15:0] = t1;
t8[16] = 0;
end
end
// Subtract the smaller square
// from the larger one
always @ (t7 or t8)
begin
o = (t7 - t8);
end
endmodule
