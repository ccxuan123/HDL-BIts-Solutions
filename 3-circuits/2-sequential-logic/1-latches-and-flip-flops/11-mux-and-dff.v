module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q
);
	always @ (posedge clk)
		case (L)
			1'b0 : Q <= q_in;
			1'b1 : Q <= r_in;
		endcase

    // wire d;
    // assign d = L ? r_in : q_in;
    // always @ (posedge clk)
    //     Q <= d;

endmodule