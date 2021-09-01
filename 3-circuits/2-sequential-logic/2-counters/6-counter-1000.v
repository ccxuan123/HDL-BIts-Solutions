module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //
    wire [3:0] one, ten, hundred;
    
    assign c_enable = {one == 4'd9 && ten == 4'd9, one == 4'd9, 1'b1};
    assign OneHertz = one == 4'd9 && ten == 4'd9 && hundred == 4'd9;
    
    // a counter need 10 clk cycle to count from 0 to 9
    bcdcount counter0 (clk, reset, c_enable[0], one); //c_enable[0] is always HIGH
    
    // as counter 1 only enable once when counter0 fully count from 0 to 9
    // the counter1 is fully count to 9 if counter0 complete 10 count cycle
    bcdcount counter1 (clk, reset, c_enable[1], ten); // e_enable[1] have 100Hz
    
    // counter2 if fully count to 9 if counter2 complete 10 count cycle
    bcdcount counter2 (clk, reset, c_enable[2], hundred); // e_enable[2] have 10Hz

endmodule
