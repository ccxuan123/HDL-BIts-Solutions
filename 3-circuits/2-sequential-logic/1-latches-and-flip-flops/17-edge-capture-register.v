module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    wire [31:0] in_last;
    always @ (posedge clk) begin
        in_last <= in;
        if (reset) 
            out <= '0;
        else
            out <= out | ~in&in_last;
        // ~in&in_last to detect negative edge
        // add an OR gate to latch the output
        
        // or write if else in ternary form
        // out = reset ? 0 : out | ~in&in_last ; 
    end

endmodule
