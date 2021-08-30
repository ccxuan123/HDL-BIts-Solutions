module top_module (
    input clk,    // Clocks are used in sequential circuits
    input d,
    output reg q 
);
    // non-blocking assignment is used for edge-triggered always blocks
    always @ (posedge clk)
        q <= d;
       
endmodule
