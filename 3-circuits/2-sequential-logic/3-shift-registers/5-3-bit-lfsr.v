module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q

    reg [2:0] LEDR_next;
   	
    // combinational always block for predict the LEDR_next
    always @ (*) begin
    	LEDR_next[0] <= LEDR[2];
        LEDR_next[1] <= LEDR[0];
        LEDR_next[2] <= LEDR[2] ^ LEDR[1];
    end
    
    // edge triggered always block for pass LEDR_next to LEDR with dff
    always @ (posedge KEY[0]) begin
        if (KEY[1]) 
        	LEDR <= SW; 
        else 
            LEDR <= LEDR_next;
    end
endmodule


/*
module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q

    always @ (posedge KEY[0]) begin
        if (KEY[1]) begin
            LEDR <= SW;
        end 
        else begin
            LEDR <= { LEDR[2] ^ LEDR[1], LEDR[0], LEDR[2] };
            // alternative for shifting LEDR
            // LEDR[0] <= LEDR[2];
            // LEDR[1] <= LEDR[0];
            // LEDR[2] <= LEDR[2] ^ LEDR[1];
        end
    end
endmodule
/*
