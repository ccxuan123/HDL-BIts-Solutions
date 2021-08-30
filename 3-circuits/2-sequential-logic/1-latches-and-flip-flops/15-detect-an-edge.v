module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    reg [7:0] trigger;
    always @ (posedge clk ) begin
    	trigger <= in;  // data in will pass to trigger 
                        // after 1 clk cycle
        pedge <= in & ~trigger; // combination logic output HIGH 
                                // when positive edge is detected
        // more explaination:
        // https://www.chipverify.com/verilog/verilog-positive-edge-detector
    end

endmodule