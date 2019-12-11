`timescale 1ns / 1ps
/*
* pps16_1
* Calculates a 16-bit partial square from a
* 15-bit input.
* Input: x
* Output: y
*/
module pps16_1 (x,y);
input [14:0] x;
output [15:0] y;
wire [15:0] y;
wire c1, c2, c3, c4;
wire [12:0] t1, t2, t3, t4;
xnor xn1 (c1, 0, x[0]);
xnor xn2 (c2, x[0],x[1]);
and a1 (c3, c2, c1);
not n1 (c4, c3);
and a2 (y[2], c4, c1);
assign y[1] = 0;
nor no1 (y[0], c1, c3);
codNeg13 cn1 (x[14:2],x[1],t1);
lshift13_1 ls1 (t1,t2);
mux21_13 m1 (t1, t2, c1, t3);
assign t4 = 0;
mux21_13 m2 (t3, t4, c3, y[15:3]);
endmodule
