module pll(
    input clock_in,
    output clock_out
);
 
    SB_PLL40_PAD #(
    .FEEDBACK_PATH("SIMPLE"),
    .FEEDBACK_PATH("SIMPLE"),
`include "pll_settings.txt"
    ,
    .FEEDBACK_PATH("SIMPLE"),
    .DELAY_ADJUSTMENT_MODE_FEEDBACK("FIXED"),
    .FDA_FEEDBACK(4'b0000),
    .DELAY_ADJUSTMENT_MODE_RELATIVE("FIXED"),
    .FDA_RELATIVE(4'b0000),
    .SHIFTREG_DIV_MODE(2'b00),
    .PLLOUT_SELECT("GENCLK"),
    .ENABLE_ICEGATE(1'b0)
    ) usb_pll_inst (
    .PACKAGEPIN(clock_in),
    .PLLOUTCORE(clock_out),
    //.PLLOUTGLOBAL(),
    .EXTFEEDBACK(),
    .DYNAMICDELAY(),
    .RESETB(1'b1),
    .BYPASS(1'b0),
    .LATCHINPUTVALUE(),
    //.LOCK(),
    //.SDI(),
    //.SDO(),
    //.SCLK()
    );

endmodule