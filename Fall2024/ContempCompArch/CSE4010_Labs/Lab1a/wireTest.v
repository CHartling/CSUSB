// Create a module called wireTest with wires named A, B, and C
module wireTest (A,B,C);

    input A;  // Wire A is an input wire
    output B; // Wire B is an output wire
    output C; // Wire C is an output wire

    assign B = A;  // Wire B has the same value/charge of A
    assign C = !A; // Wire C has the opposite value/charge of A

endmodule // End the module called wireTest