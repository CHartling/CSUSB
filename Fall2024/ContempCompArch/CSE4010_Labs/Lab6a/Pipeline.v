`include "IFetch.v" // Links IFetch.v to this file

module pipeline ();

    wire [31:0] IF_ID_instr, IF_ID_npc;  // IF/ID instruction and IF/ID npc
    reg EX_MEM_PCSrc;
    reg [31:0] EX_MEM_NPC;

    I_Fetch I_Fetch1 (.IF_ID_instr(IF_ID_instr), .IF_ID_npc(IF_ID_npc), .EX_MEM_PCSrc(EX_MEM_PCSrc), .EX_MEM_NPC(EX_MEM_NPC));

    initial begin
        EX_MEM_PCSrc <= 0;
        EX_MEM_NPC <= 0;
    end

endmodule // End module pipeline