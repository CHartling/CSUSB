// Simulates a NOR gate
module NORgate (A, B, Q); // Create module called NORgate
    // Input wires
    input A, B;
    // Output wires
    output Q;

    // Assign the output Q to the opposite of A OR B
    // NOR gate = NOT(A OR B)
    assign Q = !(A|B);

endmodule // End module NORgate

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

// Simulates all 7 gates with just NAND OR NOR gates
module Gates (A, B, QNOR, RNOR, SNOR, TNOR, UNOR, VNOR, XNOR, QNAND, RNAND, SNAND, TNAND, UNAND, VNAND, XNAND); // Create module called Gates
    // Input wires
    input A, B;
    // Output wires
    output QNOR, RNOR, SNOR, TNOR, UNOR, VNOR, XNOR;
    output QNAND, RNAND, SNAND, TNAND, UNAND, VNAND, XNAND;

    // Other non input, non output wires
    wire C, D, E, F, G;

    // NOR gate __________________________________________________________________
    // Using NOR gates
    NORgate u1(A, B, C); // NOT(A + B)
    assign QNOR = C;
    // Using NAND gates
    NANDgate u23(A, A, C); // NOT A
    NANDgate u24(B, B, D); // NOT B
    NANDgate u25(C, D, E); // A + B
    NANDgate u26(E, E, F); // NOT(A + B)
    assign QNAND = F;

    // NAND gate _________________________________________________________________
    // Using NOR gates
    NORgate u2(A, A, C); // NOT A
    NORgate u3(B, B, D); // NOT B
    NORgate u4(C, D, E); // A * B
    NORgate u5(E, E, F); // NOT(A * B)
    assign RNOR = F;
    // Using NAND gates
    NANDgate u27(A, B, C); // NOT(A * B)
    assign RNAND = C;

    // NOT gate __________________________________________________________________
    // Using NOR gates
    NORgate u6(A, A, C); // NOT A
    assign SNOR = C;
    // Using NAND gates
    NANDgate u28(A, A, C); // NOT A
    assign SNAND = C;

    // AND gate __________________________________________________________________
    // Using NOR gates
    NORgate u7(A, A, C); // NOT A
    NORgate u8(B, B, D); // NOT B
    NORgate u9(C, D, E); // A * B
    assign TNOR = E;
    // Using NAND gates
    NANDgate u29(A, B, C); // NOT(A * B)
    NANDgate u30(C, C, D); // A * B
    assign TNAND = D;

    // OR gate ___________________________________________________________________
    // Using NOR gates
    NORgate u10(A, B, C); // NOT (A + B)
    NORgate u11(C, C, D); // A + B
    assign UNOR = D;
    // Using NAND gates
    NANDgate u31(A, A, C); // NOT A
    NANDgate u32(B, B, D); // NOT B
    NANDgate u33(C, D, E); // A + B
    assign UNAND = E;

    // Buffer gate _______________________________________________________________
    // Using NOR gates
    NORgate u12(A, A, C); // NOT A
    NORgate u13(C, C, D); // A
    assign VNOR = D;
    // Using NAND gates
    NANDgate u34(A, A, C); // NOT A
    NANDgate u35(C, C, D); // A
    assign VNAND = D;

    // Exclusive-OR gate _________________________________________________________
    // Using NOR gates
    NORgate u14(A, A, C); // NOT A
    NORgate u15(B, B, D); // NOT B
    NORgate u16(A, B, E); // NOT (A + B)
    NORgate u17(C, D, F); // A * B
    NORgate u18(E, F, G); // A XOR B
    assign WNOR = G;
    // Using NAND gates
    NANDgate u36(A, B, C); // NOT (A * B)
    NANDgate u37(A, C, D); // (NOT A) + B
    NANDgate u38(B, C, E); // A + (NOT B)
    NANDgate u39(D, E, F); // A XOR B
    assign WNAND = F;

    // Exclusive-NOR gate ________________________________________________________
    // Using NOR gates
    NORgate u19(A, B, C); // NOT (A + B)
    NORgate u20(A, C, D); // (NOT A) * B
    NORgate u21(B, C, E); // A * (NOT B)
    NORgate u22(D, E, F); // A XNOR B
    assign XNOR = F;
    // Using NAND gates
    NANDgate u40(A, A, C); // NOT A
    NANDgate u41(B, B, D); // NOT B
    NANDgate u42(A, B, E); // NOT (A * B)
    NANDgate u43(C, D, F); // A + B
    NANDgate u44(E, F, G); // A XNOR B
    assign XNAND = G;


endmodule // End module Gates