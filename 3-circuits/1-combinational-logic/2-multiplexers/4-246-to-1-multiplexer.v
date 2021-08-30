module top_module (
	input [255:0] in,
	input [7:0] sel,
	output  out
);

	// Select one bit from vector in[]. The bit being selected can be variable.
    // example:
    // sel = 8'd9
    // in[sel]=in[9]
	assign out = in[sel];
	
endmodule
