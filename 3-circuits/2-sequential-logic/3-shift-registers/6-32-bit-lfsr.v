module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 32'h1
    output [31:0] q
); 
    reg [31:0] q_next;
    
    // combinational always block for prediction of q_next
    always @ (*) begin
		q_next = {q[0], q[31:1]}; 
        q_next[21] = q[22] ^ q[0];
        q_next[1] = q[2] ^ q[0];
        q_next[0] = q[1] ^ q[0];      
    end
    
    // edge triggered always block for pass the q_next to q by dff
    always @ (posedge clk) begin
        if (reset)
            q <= 32'h1;
        else
            q <= q_next;
    end
endmodule

/*
module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 32'h1
    output [31:0] q
); 
    always @ (posedge clk) begin
        if (reset)
            q <= 32'h1;
        else begin
            q <= {q[0], q[31:1]}; // tap at 32 is equivalent of q[31] = q[0]
            q[21] <= q[22] ^ q[0];
            q[1] <= q[2] ^ q[0];
            q[0] <= q[1] ^ q[0];
        end
    end
endmodule
*/
