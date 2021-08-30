module top_module (
    input clk,
    input reset,            // Synchronous reset
    input [7:0] d,
    output [7:0] q
);

    always @ (posedge clk) begin
        q <= reset ? '0 : d; 
    end
    
    // using if else statement
    // always @ (posedge clk) begin
    //   	if (reset) 
    // 	    	q <= 8'h0;
    //   	else 
    //	    	q <= d;
    // end
    
endmodule
