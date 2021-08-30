module top_module (
    input clk,
    input [7:0] d,
    output [7:0] q
);
    // since q is a vector, multiple Dffs will created
    always @ (posedge clk)
        q <= d;

endmodule
