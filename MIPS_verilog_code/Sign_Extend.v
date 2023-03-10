

module Sign_Extend(imm,sign_imm);

input[15:0]imm; //immediate

output[31:0]sign_imm;//immediate after extension

reg[31:0]sign_imm;

always@(imm)
begin 

sign_imm<={{16{imm[15]}},imm}; //extend immediate to be 32bit data and keep the sign of number like shift right arithmetic

end

endmodule
