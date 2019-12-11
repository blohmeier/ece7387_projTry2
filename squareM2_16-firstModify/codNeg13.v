`timescale 1ns / 1ps
/*
* Negates the 13-bit input i if
* c is 1.
* Input: i
* Output: o
*/
module codNeg13 (o, i, c);
input[12:0] i;
input c;
output[12:0] o;
reg[12:0] o;
integer j;
always @ (i or c)
begin
for (j = 0; j < 13; j = j + 1)
begin
o[j] = c ^ i[j];
end
end
endmodule
