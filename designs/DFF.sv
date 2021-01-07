module DFF(input din, rst_n, clk, output reg q);

    always @(posedge clk, negedge rst_n) q <= ~rst_n ? 1'b0 : din;

endmodule

