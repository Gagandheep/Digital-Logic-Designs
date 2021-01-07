module M16ASyncCounter(input clk, rst_n,
                       output [3:0] op);

    TFF_DFF tff0(1'b1, clk, rst_n, op[0]);
    TFF_DFF tff1(1'b1, ~op[0], rst_n, op[1]);
    TFF_DFF tff2(1'b1, ~op[1], rst_n, op[2]);
    TFF_DFF tff3(1'b1, ~op[2], rst_n, op[3]);
    
endmodule
