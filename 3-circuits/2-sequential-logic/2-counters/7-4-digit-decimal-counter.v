module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    
    wire [3:0] ones;
    wire [3:0] tens;
    wire [3:0] hund;	// hundereds
    wire [3:0] thou;	// thousands
    
    bcdcount counter0 (clk, reset, 1, ones);
    bcdcount counter1 (clk, reset, ena[1], tens);
    bcdcount counter2 (clk, reset, ena[2], hund);
    bcdcount counter3 (clk, reset, ena[3], thou);
    
    assign ena[1] = ones == 4'd9 ? 1 : 0;
    assign ena[2] = (tens == 4'd9 && ones ==4'd9) ? 1 : 0;
    assign ena[3] = (hund == 4'd9 && tens == 4'd9 && ones == 4'd9) ? 1 : 0;
    assign q = {thou, hund, tens, ones};
    
endmodule      


module bcdcount(
  	input clk,
    input reset,
    input ena,
    output [3:0] q
);
    always @ (posedge clk) begin
        if (reset || (q==4'd9 && ena))
            q <= '0;
        else
            q <= ena ? q + 4'd1 : q;
    end
endmodule

// alternate solution
/*module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    
    wire [3:0] ones;
    wire [3:0] tens;
    wire [3:0] hund;	// hundereds
    wire [3:0] thou;	// thousands
    
    // for ones bcd counter
    always @ (posedge clk) begin
        if (reset || ones == 4'd9)
            ones <= '0;
        else
            ones <= ones + 1;
    end
    
    // for tens bcd counter
    always @ (posedge clk) begin
        if (reset || (tens == 4'd9 && ena[1]))
            tens <= '0;
        else
            tens <= ena[1] ? tens + 1 : tens;
    end
            
    // for hundreds bcd counter
    always @ (posedge clk) begin
        if (reset || (hund == 4'd9 && ena[2]))
            hund <= '0;
        else
            hund <= ena[2] ? hund + 1 : hund;
    end
            
    // for thousands bcd counter
    always @ (posedge clk) begin
        if (reset || (thou == 4'd9 && ena[3]))
            thou <= '0;
        else
            thou <= ena[3] ? thou + 1 : thou;
    end
    
    assign ena[1] = ones == 4'd9 ? 1 : 0;
    assign ena[2] = (tens == 4'd9 && ones ==4'd9) ? 1 : 0;
    assign ena[3] = (hund == 4'd9 && tens == 4'd9 && ones == 4'd9) ? 1 : 0;
    assign q = {thou, hund, tens, ones};
    
endmodule*/