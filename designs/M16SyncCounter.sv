module M16SyncCounter(input clk, rst,
                     output [3:0] op);

    wire w0, w1;
    assign w0 = op[0] & op[1];
    assign w1 = w0 & op[2];

    TFF_DFF tff0(1'b1, clk, rst, op[0]);
    TFF_DFF tff1(op[0], clk, rst, op[1]);
    TFF_DFF tff2(w0, clk, rst, op[2]);
    TFF_DFF tff3(w1, clk, rst, op[3]);
    
endmodule