`timescale 1ns / 1ps
//`default_nettype none

module proj_tb;

    reg Clk; // Simulate based on clock
    
    //for multiply operation
    reg [3:0] X; // Define inputs as reg
    reg [3:0] Y; // Define inputs as reg
    wire [3:0] c; // Define outputs as wires
    wire [8:0] c_untruncatedCheck;
    //wire [7:0] Z_OUT; // Define outputs as wires

    // for add operation
    //reg [3:0] c_in; // Define inputs as reg
    reg [3:0] d; // Define inputs as reg
    wire [3:0] e; // Define outputs as wires
    wire [8:0] e_untruncatedCheck;
    
    // for subtract and multiply operations
    wire [3:0] f; // Define outputs as wires
    wire [8:0] f_untruncatedCheck;
    
cOut_arrayMult dut1 (c,c_untruncatedCheck, X, Y); // Instantiate DUT for multiply operation.

// for add operation
add_c_and_d dut2 (.e(e),.e_untruncatedCheck(e_untruncatedCheck), .c_in(c), .d(d)); // Instantiate DUT for add operation.

//for subtract and multiply operations
subtract_from_e dut3 (.f(f),.f_untruncatedCheck(f_untruncatedCheck),.e_in(e),.b(Y)); // Instantiate DUT for subtract and multiply operations.

initial
    begin
        Clk = 1'b1;
        forever #100 Clk = ~Clk; // Clock period definition
    end
    
initial
    begin        
        #0 d=4'b0; Y=4'b0;
        
        #50 X[3]=0; X[2]=0; X[1]=0; X[0]=0;    // 
        #50 Y[3]=1; Y[2]=1; Y[1]=1; Y[0]=1;    //
        
        #50 X[3]=1; X[2]=1; X[1]=1; X[0]=1;    // 
        #50 Y[3]=0; Y[2]=0; Y[1]=0; Y[0]=0;    //
        
        #50 X[3]=1; X[2]=1; X[1]=1; X[0]=1;    //
        #50 Y[3]=1; Y[2]=1; Y[1]=1; Y[0]=1;    //
        
        #50 X[3]=1; X[2]=1; X[1]=0; X[0]=0;    //
        #50 Y[3]=0; Y[2]=0; Y[1]=1; Y[0]=1;    //
        
        #50 d[3]=1; d[2]=1; d[0]=1; d[0]=0;    //
        #50 d[3]=0; d[2]=0; d[1]=1; d[0]=0;    //
        
        #50 d[3]=0; d[2]=0; d[1]=0; d[0]=1;    //
        #50 d[3]=0; d[2]=1; d[1]=1; d[0]=0;    //
        
        #50 #50 #50 #50 #50 #50 #50 #50
        /*#50 #50 #50 #50 #50 #50 #50 #50
        #50
		#50
        #50
        #50
        #50
		#50*/
        $finish;
    end

endmodule
