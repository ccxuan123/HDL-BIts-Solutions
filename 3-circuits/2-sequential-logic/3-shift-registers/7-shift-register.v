module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    
    wire [3:0] sr;
    
    always @ (posedge clk) begin
        if (!resetn) begin
        	sr <= 0;
        end
        else begin
            sr <= {sr[2:0], in};
            // sr[0] <= in;
            // sr[1] <= sr[0];
            // sr[2] <= sr[1];
            // sr[3] <= sr[2];
        end     
    end
    
    assign out = sr[3];
    
endmodule
