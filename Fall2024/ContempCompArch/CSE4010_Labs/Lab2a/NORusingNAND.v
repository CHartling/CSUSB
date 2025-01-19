// Simulates a NAND gate
module NANDgate (A, B, Q); // Create module called NANDgate
    // Input wires
    input A, B;
    // Output wires
    output Q;

    // Assign the output Q to the opposite of A AND B
    // NAND gate = NOT(A AND B)
    assign Q = !(A&B);

endmodule // End module NANDgate

// Simulates a NOR gate with a collection of NAND gates
module NORusingNAND (A, B, Q); // Create module called NORusingNAND
    // Input wires
    input A, B;
    // Output wires
    output Q;

    // Other non input, non output wires
    wire C, D, E, F;

    // NAND A, A, = C
    NANDgate u1(A, A, C); // NOT A
    // NAND B, B, = D
    NANDgate u2(B, B, D); // NOT B
    // NAND u1, u2, = E
    NANDgate u3(C, D, E); // A * B
    // NAND u3, u3, = F
    NANDgate u4(E, E, F); // NOT(A * B) = NOR

    // Assign the result of the four NAND gates to the output Q
    assign Q = F;

endmodule // End module NORusingNAND