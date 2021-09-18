module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 5'h1
    output [4:0] q
);
    reg [4:0] q_next;
    
    // create a combinational always block to predict the next q
    always @ (*) begin
        q_next = {q[0], q[4:1]}; // this q_next is incorrect, q[3] will overwrite on next line
        q_next[2] = q[3] ^ q[0];
    end
    
    // use dff to change to q to predicted q
    always @ (posedge clk) begin
        if (reset)
            q <= 5'h1;
        else
            q <= q_next;
    end
endmodule

// alternate method
/*
module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 5'h1
    output [4:0] q
);
    always @ (posedge clk) begin
        if (reset)
            q <= 5'h1;
        else begin
            q[0] <= q[1];
            q[1] <= q[2];
            q[2] <= q[3] ^ q[0];
            q[3] <= q[4];
            q[4] <= q[0];
        end
    end
endmodule
*/