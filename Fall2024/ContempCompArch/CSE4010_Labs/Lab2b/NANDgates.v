// Simulates a NAND gate
module NORgate (A, B, Q); // Create module called NORgate
    // Input wires
    input A, B;
    // Output wires
    output Q;

    // Assign the output Q to the opposite of A OR B
    // NOR gate = NOT(A OR B)
    assign Q = !(A|B);

endmodule // End module NORgate

// Simulates a NAND gate with a collection of NOR gates
module NANDusingNOR (A, B, Q); // Create module called NANDusingNOR
    // Input wires
    input A, B;
    // Output wires
    output Q;

    // Other non input, non output wires
    wire C, D, E, F;

    // NOR A, A, = C
    NORgate u1(A, A, C); // NOT A
    // NOR B, B, = D
    NORgate u2(B, B, D); // NOT B
    // NOR u1, u2, = E
    NORgate u3(C, D, E); // A * B
    // NOR u3, u3, = F
    NORgate u4(E, E, F); // NOT(A * B) = NAND

    // Assign the result of the four NAND gates to the output Q
    assign Q = F;

endmodule // End module NANDusingNOR