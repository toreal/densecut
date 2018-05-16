PROJECT := cmcode

CXX_SRC := $(shell find . -name "*.cpp" ! -wholename "*examples/*.cpp")

OBJ_FILES := ${CXX_SRC:%.cpp=%.o}

DYNAMIC_LIB := lib$(PROJECT).so
STATIC_LIB := lib$(PROJECT).a

INCLUDE_DIRS := . 
LIBRARY_DIRS := 
LIBRARIES := 

COMMON_FLAGS := -Wall -O2 -std=c++11 -fopenmp
CXX_FLAGS := $(foreach include,$(INCLUDE_DIRS),-I$(include))
LD_FLAGS := $(foreach lib,$(LIBRARY_DIRS),-L$(lib))
LD_FLAGS := $(foreach lib,$(LIBRARIES),-l$(lib))

all:obj lib

lib:$(DYNAMIC_LIB) $(STATIC_LIB)

obj:$(OBJ_FILES)

%.o:%.cpp
	g++ -fPIC -c -o $@ $< $(COMMON_FLAGS) $(CXX_FLAGS)

$(DYNAMIC_LIB):$(OBJ_FILES)
	g++ -shared -o $@ $(OBJ_FILES)

$(STATIC_LIB):$(OBJ_FILES)
	ar rcs $@ $(OBJ_FILES)
