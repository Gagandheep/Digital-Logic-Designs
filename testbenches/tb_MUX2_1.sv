module sim;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
        #80
        $finish;
    end

endmodule

module tb_MUX2_1;

    reg d0, d1, s;
    wire y;

    MUX2_1 mux(.data({d0, d1}), .sel(s), .y(y));

    always #5 d0 = ~d0;
    always #10 d1 = ~d1;

    initial begin
        d0 = 1'b0;
        d1 = 1'b0;
        s = 1'b0;
        #40
        s = 1'b1;
    end

endmodule