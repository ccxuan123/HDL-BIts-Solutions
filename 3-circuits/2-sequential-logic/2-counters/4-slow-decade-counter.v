module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q
);    
    always @ (posedge clk) begin
        if (reset || (q==4'b1001 & slowena))
            q <= 4'b0000;
        else
            q <= slowena ? q + 1'b1 : q;
    end
    /*always @ (posedge clk) begin
        if (reset || (q==4'b1001&slowena))
            q <= 4'b0000;
        else begin
            if (slowena)
            	q <= q + 1'b1;
            else
            	q <= q;
        end
    end*/
endmodule
