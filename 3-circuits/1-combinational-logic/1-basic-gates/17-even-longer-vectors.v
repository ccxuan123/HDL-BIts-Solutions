module top_module( 
    input [99:0] in,
    output [98:0] out_both,
    output [99:1] out_any,
    output [99:0] out_different );
    
    assign out_both = in[98:0] & in[99:1] ;
    assign out_any = in[99:1] | in[98:0] ; 
    assign out_different = in ^ {in[0], in[99:1]} ;

    /*
    Answer from HDL-bits
    assign out_both = in & in[99:1];
	assign out_any = in[99:1] | in ;
	assign out_different = in ^ {in[0], in[99:1]};

    this could works maybe the program wil start
    compare from the lowest bit

    example:
    input [3:0] in, output [2:0]
    out_both = in & in[3:1] same as in[2:0] & in[3:1]
    in[0] & in[1]
    in[1] & in[2]
    in[2] & in[3]
    */

endmodule
