module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
); 
    // heater only ON when mode==1 and too_cold==1
    assign heater = mode & too_cold;
    
    // aircon only ON when mode==0 and too_hot==1
    assign aircon = ~mode & too_hot;
    
    // fan only on when heater/aircon ON or fan_on==1
	assign fan = fan_on | heater | aircon;
    
    // * Unlike real thermostats, there is no "off" mode here.
endmodule
