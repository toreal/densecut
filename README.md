# DENSECUT
==========

This is an extension from [jasonbunk's repo](https://github.com/jasonbunk/densecut-linux) of MingMing Cheng's "DenseCut". <br>

[DenseCut's Project](http://mmcheng.net/densecut/) <br>

#[![densecut]](http://mmcheng.net/densecut/)
//[densecut]:$IMAGEPATH "DenseCut Logo"


## Compile CmCode
----------------- 

*  Open terminal and Go into CmLib foler <br>
``
cd CmCode/CmLib <br>
``

*  Add Makefile <br>
``
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
``

*  Compile it <br>
``
make <br>
``

*  You will get 'libcmcode.a' and 'libcmcode.so' <br>

*  Done. <br>



## Compile DenseCut <br>
-------------------

*  Open terminal and Go into 'mmcheng_densecut' foler <br>
``
cd mmcheng_densecut <br>
``

*  Compile it <br>
``
g++ *.cpp -O2 -Wall -I. -lcmcode -L../CmCode/CmLib -I../ -Wl,-rpath,../CmCode/CmLib -std=c++11 `pkg-config --libs --cflags opencv` -lomp -o densecut <br>
``

*  You will get 'densecut'. <br>

*  Done. <br>

	* Some erros occured. <br>
	* For example, "/usr/bin/ld: cannot find -lcufft", just locate libcufft and add the path to $LD_LIBRARY_PATH or $LIBRARY_PATH in the ~/.bashrc. <br>


## Demo <br>
-------------------

* Run demo in 'mmcheng_densecut' and see the results in 'ASD/Sal4N'. <br>

``
./densecut ./
``

* Done. <br>


### `Thanks Tianli Zhao for the compilation of this code in linux.` 

