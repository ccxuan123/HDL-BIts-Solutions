module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
	// my_dff8 ( input clk, input [7:0] d, output [7:0] q );
    wire [7:0] dff1_q;
    wire [7:0] dff2_q;
    wire [7:0] dff3_q;
    my_dff8 dff1 ( clk, d, dff1_q );
    my_dff8 dff2 ( clk, dff1_q, dff2_q );
    my_dff8 dff3 ( clk, dff2_q, dff3_q );
    mux_4_to_1 mux ( d, dff1_q, dff2_q, dff3_q, sel, q );
    
endmodule


module mux_4_to_1 (
    input [7:0] a, b, c, d,
    input [1:0] sel,
    output [7:0] out
);

    always @ (a, b, c, d, sel, out) begin
        case  (sel)
            2'b00: out = a;
            2'b01: out = b;
            2'b10: out = c;
            2'b11: out = d;
        endcase
    end
endmodule

/*
HDL-bit solution

module top_module (
	input clk,
	input [7:0] d,
	input [1:0] sel,
	output reg [7:0] q
);

	wire [7:0] o1, o2, o3;		// output of each my_dff8
	
	// Instantiate three my_dff8s
	my_dff8 d1 ( clk, d, o1 );
	my_dff8 d2 ( clk, o1, o2 );
	my_dff8 d3 ( clk, o2, o3 );

	// This is one way to make a 4-to-1 multiplexer
	always @(*)		// Combinational always block
		case(sel)
			2'h0: q = d;
			2'h1: q = o1;
			2'h2: q = o2;
			2'h3: q = o3;
		endcase

endmodule
*/