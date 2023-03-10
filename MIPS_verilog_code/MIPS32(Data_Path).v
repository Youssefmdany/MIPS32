

module MIPS32(clk);

input clk;

wire[31:0]instruction;

reg[31:0]PC;

wire[31:0]PC_;

wire memtoreg,memwrite,branch,ALUSrc,regdst,regwrite;

wire[1:0] alu_op;

wire[2:0] alu_control;

wire[4:0] dst_reg;

wire[31:0] RD1,RD2;

wire[31:0]result_dm;

wire[31:0]result_se;

wire[31:0]SrcB;

wire[31:0]ALU_result;

wire zero_sig;

wire[31:0] RD_dm;

wire [31:0]n_PC;

wire[31:0] B_PC;

wire PCScr;


initial 

begin 

PC<=32'b0;

end


Instruction_Memory instruction_mem(PC,instruction);


Control_Unit C_U(instruction[31:26],memtoreg,memwrite,branch,ALUSrc,regdst,regwrite,alu_op,alu_control,instruction[5:0]);


mux5_2_1 mux_1(instruction[20:16],instruction[15:11],regdst,dst_reg);


Register_File register_file(instruction[25:21],instruction[20:16],dst_reg,RD1,RD2,result_dm,regwrite,clk);


Sign_Extend sign_extend(instruction[15:0],result_se);


mux32_2_1 mux_2(RD2,result_se,ALUSrc,SrcB);


ALU alu(RD1,SrcB,alu_control,ALU_result,zero_sig);


Data_Memory data_memory(ALU_result,RD2,RD_dm,memwrite,clk);


mux32_2_1 mux_3(ALU_result,RD_dm,memtoreg,result_dm);


add4_PC next_PC(PC,n_PC);


PC_Branch PC_branch(result_se,n_PC,B_PC);


and(PCScr,branch,zero_sig);


mux32_2_1 mux_4(n_PC,B_PC,PCScr,PC_);







always@(posedge clk)

begin


PC<=PC_;


end



endmodule 




module MIPS32_Test;


reg clk;


initial


begin

clk<=1'b0;

#10 clk<=1'b1;
#10 clk<=1'b0;


#10 clk<=1'b1;
#10 clk<=1'b0;


#10 clk<=1'b1;
#10 clk<=1'b0;


#10 clk<=1'b1;
#10 clk<=1'b0;


#10 clk<=1'b1;
#10 clk<=1'b0;


#10 clk<=1'b1;
#10 clk<=1'b0;


end

MIPS32 mips32(clk);

endmodule

