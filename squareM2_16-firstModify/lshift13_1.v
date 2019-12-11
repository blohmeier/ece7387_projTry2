`timescale 1ns / 1ps
/*
* Left shifts a 13-bit input i
* one place to the left for a
* 13-bit output o.
* Input: i
* Output: o
*/
module lshift13_1 (o, i);
input[12:0] i;
output[12:0] o;
reg [12:0] o;
always @ (i)
begin
o = i << 1;
end
endmodule
