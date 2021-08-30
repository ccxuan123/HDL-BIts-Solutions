module top_module (
    input clk,
    input x,
    output z
); 
    wire [2:0]Q;
    initial Q = '0; // all dff are reset initially
    
    // using non blocking assignment will require 3 clk cycle update all 3 dff
    // therefore blocking assignment is more suitable in this scenario
    // as all 3 dff must update at the same clk cycle
    // https://www.nandland.com/articles/blocking-nonblocking-verilog.html
    
    always @ (posedge clk) begin
        Q[0] = Q[0] ^ x;
        Q[1] = ~Q[1] & x;
        Q[2] = ~Q[2] | x;
    end
    
    assign z = ~(Q[0] | Q[1] | Q[2]);

endmodule