module sim;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
        #40
        $finish;
    end

endmodule

module tb_AND_MUX2_1;

    reg a, b;
    wire y;

    AND_MUX2_1 and_mux(.a(a), .b(b), .y(y));

    initial begin
        a = 1'b0;
        b = 1'b0;
        #10
        a = 1'b0;
        b = 1'b1;
        #10
        a = 1'b1;
        b = 1'b0;
        #10
        a = 1'b1;
        b = 1'b1;
    end

endmodule