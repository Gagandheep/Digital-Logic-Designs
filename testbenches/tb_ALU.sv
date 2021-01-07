module sim;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
        #180
        $finish;
    end

endmodule

module tb_ALU;

    reg [7:0] a, b;
    reg [3:0] oper;
    reg clk;
    wire [7:0] resh, resl;
    wire [15:0] res;
    integer i;

    assign res = {resh, resl};

    ALU alu(.a(a), .b(b), .oper(oper), .clk(clk), .msb(resh), .lsb(resl));

    always #5 clk = ~clk;

    initial begin
        clk = 1'b0;
        #3
        a = 8'hFE;
        b = 8'h7F;
        for (i = 0; i <= 15; i = i + 1) begin
            #10
            oper = i;
        end
    end

endmodule
