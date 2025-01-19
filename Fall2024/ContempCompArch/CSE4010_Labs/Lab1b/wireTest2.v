// Create a module called wireTest2 with wires named A, B, and C
module wireTest2 (W, X, Y, Z);
    // Input wires
    input W;
    input X;
    // Output wires
    output Y;
    output Z;

    assign Y = !X;  // Wire Y has the same value/charge of X
    assign Z = !Y; // Wire Z has the opposite value/charge of Y

endmodule // End the module called wireTest2