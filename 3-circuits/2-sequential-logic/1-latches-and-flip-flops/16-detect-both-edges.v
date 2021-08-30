module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    wire [7:0] trigger;
    always @ (posedge clk) begin
        trigger <= in;
        anyedge <= in ^ trigger; // output 1 if `in` is changed, 
        
        // anyedge <= in&~trigger | ~in&trigger;
        // in&~trigger for positive edge
        // ~in&trigger for negative edge
    end
endmodule
