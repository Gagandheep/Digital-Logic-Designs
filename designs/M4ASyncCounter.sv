module M4ASyncCounter(input clk, rst_n,
                      output [1:0] op);

    TFF_DFF tff0(.t(1'b1), .clk(clk), .rst_n(rst_n), .q(op[0]));
    TFF_DFF tff1(.t(1'b1), .clk(~op[0]), .rst_n(rst_n), .q(op[1]));
    
endmodule
