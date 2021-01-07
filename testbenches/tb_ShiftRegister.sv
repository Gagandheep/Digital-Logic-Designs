module sim;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
        #120
        $finish;
    end

endmodule

module tb_ShiftRegister;

    reg clk, rst_n, ser_in;
    reg [3:0] in;
    reg [1:0] s;
    wire [3:0] q;

    ShiftRegister sr(.in(in), .s(s), .serial_in(ser_in), .clk(clk), .rst_n(rst_n), .q(q));

    always #5 clk = ~clk;

    initial begin
        clk = 1'b0;
        rst_n = 1'b1;
        s = 2'b11;
        in = 4'b1010;
        ser_in = 1'b1;
        #3
        rst_n = 1'b0;
        #10
        rst_n = 1'b1;
        #10
        s = 2'b01;
        #20
        s = 2'b00;
        #10
        s = 2'b10;
        #10
        ser_in = 1'b0;
    end

endmodule
