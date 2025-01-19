// Simulates a half subtractor
module halfSubtractor(op1, op2, difference, borrow); // Create module called halfSubtractor

    // inputs and outputs
    input op1, op2;
    output difference, borrow;

    assign difference = op1 ^ op2;   // op1 XOR op2
    assign borrow = !op1 & op2; // NOT op1 AND op2

endmodule // End module halfSubtractor

// Simulates a full subtractor
module fullSubtractor(A, B, borrowIn, difference, borrowOut);  // Create module called fullSubtractor

    // inputs and outputs
    input A, B, borrowIn;
    output difference, borrowOut;

    // intermediary wires
    wire c, d, e, f;

    halfSubtractor u1(A, B, c, d);        // XOR result assigned to c, AND result assigned to d
    halfSubtractor u2(borrowIn, c, e, f);  // XOR result assigned to e, AND result assigned to f

    assign borrowOut = f | d; // f OR d result assigned to borrowOut
    assign difference = e;    // Assign e to difference

endmodule  // End module fullSubtractor