module top_module(
    input clk,
    input in,
    input areset,
    output out); //

    reg [1:0] state; 
    reg [1:0] next_state; 
    parameter A=2'b00, B=2'b01, C=2'b10, D=2'b11;
    
    // State transition logic
    always @ (*) begin 
        case (state)  
        	A : next_state = in ? B : A;
            B : next_state = in ? B : C;
            C : next_state = in ? D : A;
            D : next_state = in ? B : C;
        endcase
    end

    // State flip-flops with asynchronous active high reset
    always @ (posedge clk, posedge areset) begin
        if (areset) 
            state <= A; 
        else
            state <= next_state;
    end

    // Output logic
    assign out = (state == D) ? 1 : 0;

endmodule
