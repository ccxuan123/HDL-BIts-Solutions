module top_module( 
    input [2:0] in,
    output [1:0] out );

    // method 1: implement procedure 
    // (combinational always block)
    always @ (*)
        case (in)
            3'h0 : out = 2'h0;
            3'h1 : out = 2'h1;
            3'h2 : out = 2'h1;
            3'h3 : out = 2'h2;
            3'h4 : out = 2'h1;
            3'h5 : out = 2'h2;
            3'h6 : out = 2'h2;
            3'h7 : out = 2'h3;
            default : out = 2'h0;
        endcase

    // method 2: using addition operator
    // SIMPLE METHOD WORKS THE BEST
    // assign out = in[0] + in[1] + in[2];

    // method 3: simply the truth table to boolean expression
    //
    // truth table
    // in[2:0] out[1:0]
	// 000      00
	// 001      01
	// 010      01
	// 011      10
	// 100      01
	// 101      10
	// 110      10
	// 111      11
    // assign out[0] = (~in[2] & ~in[1] & in[0]) | (~in[2] & in[1] & ~in[0]) | (in[2] & ~in[1] & ~in[0]) | (in[2] & in[1] & in[0]);
	// assign out[1] = (in[1] & in[0]) | (in[2] & in[0]) | (in[2] & in[1]);

endmodule