`timescale 1ns / 1ps
/*
* A 2X1 13-bit MUX that sets z to i2 if c is 1
* and to i2 otherwise.
* Inputs: i1 and i2
* Control: c
* Output: z
*/
module mux21_13 (i1, i2, c, z);
input[12:0] i1, i2;
input c;
output[12:0] z;
reg[12:0] z;
always @ (c or i1 or i2)
begin
if (c)
begin
z = i2;
end
else
begin
z = i1;
end
end
endmodule
