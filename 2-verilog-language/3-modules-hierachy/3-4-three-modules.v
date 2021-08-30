module top_module ( input clk,
                    input d,
                    output q );

    wire dff1_q;
    wire dff2_q;
    my_dff dff1 ( .clk(clk), .d(d),      .q(dff1_q) );
    my_dff dff2 ( .clk(clk), .d(dff1_q), .q(dff2_q) );
    my_dff dff3 ( .clk(clk), .d(dff2_q), .q(q)      );

endmodule

/* another example
module top_module (
	input clk,
	input d,
	output q
);

	wire a, b;	// Create two wires. I called them a and b.

	// Create three instances of my_dff, with three different instance names (d1, d2, and d3).
	// Connect ports by position: ( input clk, input d, output q)
	my_dff d1 ( clk, d, a );
	my_dff d2 ( clk, a, b );
	my_dff d3 ( clk, b, q );

endmodule
*/
