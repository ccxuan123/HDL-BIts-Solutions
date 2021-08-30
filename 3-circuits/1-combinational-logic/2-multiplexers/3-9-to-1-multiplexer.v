module top_module( 
    input [15:0] a, b, c, d, e, f, g, h, i,
    input [3:0] sel,
    output [15:0] out );

    // always block is always executed when the value of the included variable changes
    always @ (a, b, c, d, e, f, g, h, i, sel, out) begin
        case (sel)
            // value for `sel` can use hexadecimal
            4'b0000 : out = a; 
            4'b0001 : out = b; 
            4'b0010 : out = c; 
            4'b0011 : out = d; 
            4'b0100 : out = e; 
            4'b0101 : out = f; 
            4'b0110 : out = g; 
            4'b0111 : out = h; 
            4'b1000 : out = i; 
            default : out = {16{1'b1}};
        endcase
    end     
endmodule

/*
HDL-Bits solution
module top_module (
	input [15:0] a,
	input [15:0] b,
	input [15:0] c,
	input [15:0] d,
	input [15:0] e,
	input [15:0] f,
	input [15:0] g,
	input [15:0] h,
	input [15:0] i,
	input [3:0] sel,
	output logic [15:0] out
);

	// Case statements can only be used inside procedural blocks (always block)
	// This is a combinational circuit, so use a combinational always @(*) block.
	always @(*) begin
		out = '1;		// '1 is a special literal syntax for a number with all bits set to 1.
						// '0, 'x, and 'z are also valid.
						// I prefer to assign a default value to 'out' instead of using a
						// default case.
		case (sel)
			4'h0: out = a;
			4'h1: out = b;
			4'h2: out = c;
			4'h3: out = d;
			4'h4: out = e;
			4'h5: out = f;
			4'h6: out = g;
			4'h7: out = h;
			4'h8: out = i;
		endcase
	end
	
endmodule
*/