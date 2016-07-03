GPP=g++
GCC=gcc
LIBS=-lCppUTest 
INCLUDE=-I../src
CPP_SRC=$(wildcard *.cpp)
CPP_FLAGS = -g
#获取到本目录下所有cpp
OBJ_PATH=./bin/
ALL_CPP=$(wildcard *.cpp)
#构造预期的目标 .o 文件
ALL_OBJ=$(patsubst %.cpp,%.o, $(ALL_CPP))
#指定 .o 文件生成的目录
ALL_OBJ_POS=$(addprefix  $(OBJ_PATH),$(ALL_OBJ))
target=test

ALL_C=../src/func.c
ALL_C_OBJ=$(patsubst %.c,%.o,$(ALL_C))
target_c_obj=$(addprefix $(OBJ_PATH),$(notdir $(ALL_C_OBJ)))


all:$(ALL_OBJ) $(ALL_C_OBJ)

	$(GPP) -o $(target) $(target_c_obj) $(ALL_OBJ_POS)   $(LIBS) $(INCLUDE)  $(CPP_FLAGS)


$(ALL_OBJ):%.o:%.cpp
	$(GPP) -c  $< -o $(OBJ_PATH)$@ $(INCLUDE) $(CPP_FLAGS)

clean :
	-rm $(OBJ_PATH)*.o $(BIN) *.o


$(ALL_C_OBJ):%.o:%.c
	echo $(target_c_obj)
	$(GCC) -c $< -o  $(OBJ_PATH)$(notdir $@) $(INCLUDE) $(CPP_FLAGS)
