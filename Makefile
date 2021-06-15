OBJS = ALU.o DFlipFlop.o Reg.o  RegFile.o  calculator.o  calculator_tb.o  demux.o  fullAddComp.o  fullAdder.o  fullSub.o  fullSubComp.o  halfAddComp.o  halfSubComp.o  mux.o  muxTwoOne.o  print.o
SOURCES = ALU.vhd  DFlipFlop.vhd  Makefile  Reg.vhd  RegFile.vhd  calculator.vhd  calculator_tb.vhd  demux.vhd  fullAddComp.vhd  fullAdder.vhd  fullSub.vhd  fullSubComp.vhd  halfAddComp.vhd  halfSubComp.vhd  mux.vhd  muxTwoOne.vhd  print.vhd
CC = ghdl
CFLAGS = -e
LIBS = --ieee=standard

calculator_tb:vhd.o
	${CC} ${CFLAGS} ${LIBS} calculator_tb

vhd.o:
	${CC} -a *.vhd

clean:
	rm *.o calculator_tb work*