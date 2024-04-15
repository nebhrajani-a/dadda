module tb #(parameter N = 32);
  localparam int NUM_TESTS = 1_000;

  reg [N-1:0] a;
  reg [N-1:0] b;
  wire [2*N-1:0] product;

  dadda_multiplier dut (.*);

  initial begin
    $dumpvars;
    for (int i = 0; i < NUM_TESTS; ++i) begin
      a <= N'({$urandom(), $urandom});
      b <= N'({$urandom(), $urandom});
      #10;
      assert (product == a * b) else
        $error("%d * %d = %d", a, b, product);
    end
    $display("[PASSED] Ran %0d tests on the Dadda multiplier.", NUM_TESTS);
    $finish;
  end

endmodule
