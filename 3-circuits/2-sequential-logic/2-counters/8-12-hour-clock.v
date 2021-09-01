module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 

    reg pm_temp;
    reg [3:0] ss_ones;
    reg [3:0] ss_tens;
    reg [3:0] mm_ones;
    reg [3:0] mm_tens;
    reg [3:0] hh_ones;
    reg [3:0] hh_tens;
    
    wire add_ss_ones;
    wire end_ss_ones;
    wire add_ss_tens;
    wire end_ss_tens;
    wire add_mm_ones;
    wire end_mm_ones;
    wire add_mm_tens;
    wire end_mm_tens;
    wire add_hh_ones;
    wire end_hh_ones_0;
    wire end_hh_ones_1;
    wire add_hh_tens;
    wire end_hh_tens_0;
    wire end_hh_tens_1;
    wire pm_toggle;
    
    // counter for ss_ones
    always @ (posedge clk) begin
        if (reset) 
            ss_ones <= 4'd0;
        else if (add_ss_ones) 
        	ss_ones <= end_ss_ones ? 4'd0 : ss_ones + 1'b1;
    end
    assign add_ss_ones = ena;
    assign end_ss_ones = add_ss_ones && (ss_ones == 4'd9);
    
    // counter for ss_tens
    always @ (posedge clk) begin
        if (reset)
        	ss_tens <= 4'd0;
        else if (add_ss_tens)
            ss_tens <= end_ss_tens ? 4'd0 : ss_tens + 1'b1;
    end
    assign add_ss_tens = end_ss_ones;
    assign end_ss_tens = add_ss_tens && (ss_tens == 4'd5);
    
    // counter for mm_ones
    always @ (posedge clk) begin
        if (reset)
            mm_ones <= 4'd0;
        else if (add_mm_ones)
            mm_ones <= end_mm_ones ? 4'd0 : mm_ones + 1'b1;
    end
    assign add_mm_ones = end_ss_tens;
    assign end_mm_ones = add_mm_ones && (mm_ones == 4'd9);
    
    // counter for mm_tens
    always @ (posedge clk) begin
        if (reset)
            mm_tens <= 4'd0;
        else if (add_mm_tens)
            mm_tens <= end_mm_tens ? 4'd0 : mm_tens + 1'b1;
    end
    assign add_mm_tens = end_mm_ones;
    assign end_mm_tens = add_mm_tens && (mm_tens == 4'd5);
    
    // counter for hh_ones
    always @ (posedge clk) begin
        if (reset)
            hh_ones <= 4'd2;
        else if (add_hh_ones) begin
            if(end_hh_ones_0)
                hh_ones <= 4'd0;
            else if (end_hh_ones_1)
                hh_ones <= 4'd1;
            else
                hh_ones <= hh_ones + 1'b1;
        end
    end
    assign add_hh_ones = end_mm_tens;
    assign end_hh_ones_0 = add_hh_ones && (hh_ones == 4'd9);
    assign end_hh_ones_1 = add_hh_ones && (hh_tens == 4'd1 && hh_ones == 4'd2);
    
    //counter for hh_tens
    always @ (posedge clk) begin
        if (reset)
            hh_tens <= 4'd1;
        else if (add_hh_tens) begin
            if (end_hh_tens_0)
                hh_tens <= 4'd0;
            else if (end_hh_tens_1)
                hh_tens <= 4'd1;
        end
    end
    assign add_hh_tens = end_mm_tens;
    assign end_hh_tens_0 = add_hh_tens && end_hh_ones_1;
    assign end_hh_tens_1 = add_hh_tens && end_hh_ones_0;
        
   	// circuit of pm
    always @ (posedge clk) begin
        if (reset)
            pm_temp <= 0;
        else if (pm_toggle)
            pm_temp <= ~pm_temp;
    end
    assign pm_toggle = (hh_tens == 4'd1) && (hh_ones == 4'd1) && end_mm_tens;
    
    assign pm = pm_temp;
    assign ss = {ss_tens, ss_ones};
    assign mm = {mm_tens, mm_ones};
    assign hh = {hh_tens, hh_ones};
    
endmodule

// alternate method
/*
module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 

    wire [2:0] ena_hms; // determine when hh, mm or ss will increase
    assign ena_hms[0] = ena;         // counter for ss will start as ena pulses
    assign ena_hms[1] = ss == 8'h59; // counter for mm will start as ss count to 59s
    assign ena_hms[2] = (mm == 8'h59) && (ss == 8'h59); // counter for hh will start as mm count to 59m and ss count to 59m
    
    count60 ss_counter (clk, reset, ena_hms[0], ss);
    count60 mm_counter (clk, reset, ena_hms[1], mm);
    
    // circuit for hh and pm
    always @ (posedge clk) begin
        if (reset) begin
            hh <= 8'h12;
        	pm <= 0;
        end
        else if (ena_hms[2]) begin
            if (hh == 8'h12)	// set to 01 if hh is 12
                hh <= 8'h01;
            else if (hh == 8'h11) begin  // toggle pm and set hh to 12 
                pm <= ~pm;
                hh <= 8'h12;
            end
            else if (hh[3:0] == 4'h9) begin 
                hh[3:0] <= 4'h0;
                hh[7:4] <= hh[7:4] + 1;
            end
            else
                hh[3:0] <= hh[3:0] + 1;
        end
        else 
            hh <= hh;
    end
endmodule


module count60 (
	input clk,
    input reset,
    input ena, 
    output [7:0] q
);
    always @ (posedge clk) begin
        if (reset)
            q <= 8'h00;
        else if (ena) begin
            if (q[3:0] == 4'h9) begin     
                if (q[7:4] == 4'h5)
                    q <= 8'h00;
                else begin 
                    q[7:4] <= q[7:4] + 1;
                    q[3:0] <= 4'h0;
                end
            end
            else begin
                q[3:0] <= q[3:0] + 1; 
            end
        end
        else
            q <= q;
    end
endmodule
*/