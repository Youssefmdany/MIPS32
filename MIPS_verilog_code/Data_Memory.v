


module Data_Memory(ALU_res,write_data,read_data,wtite_en,clk);


input[31:0]ALU_res,write_data; //ALU_res is the result from ALU ,write_data is the data to be written in data memory

input wtite_en; //write enable

input clk; //clock

output[31:0] read_data; // read data from memory

reg[31:0] read_data;

reg[31:0] data_mem[0:255]; // the size of data memory is 1024 data words


initial 

begin 

data_mem[8]<=7;

end



always@(*)
begin 

if(wtite_en)// if the write signal is enabled 
    data_mem[ALU_res]<=write_data; //write the data in data memory
	 
end





always@(*)
begin 

if(!wtite_en)// if the write signal is disabled 
        read_data<=data_mem[ALU_res];//read data from data memory
	 
end






endmodule

