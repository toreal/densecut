# DENSECUT
![densecut](https://github.com/lchia/densecut/blob/master/DenseCut.jpg)

This is an extension from [jasonbunk's repo](https://github.com/jasonbunk/densecut-linux) of MingMing Cheng's "DenseCut". <br>

[DenseCut's Project](http://mmcheng.net/densecut/) <br>


## Compile CmCode

*  Open terminal and Go into CmLib foler <br>
``
cd CmCode/CmLib
``

*  Add Makefile <br>

    PROJECT := cmcode <br>
    CXX_SRC := $(shell find . -name "*.cpp" ! -wholename "*examples/*.cpp") <br>
    OBJ_FILES := ${CXX_SRC:%.cpp=%.o} <br>
    DYNAMIC_LIB := lib$(PROJECT).so <br>
    STATIC_LIB := lib$(PROJECT).a <br>
    INCLUDE_DIRS := . <br>
    LIBRARY_DIRS := <br>
    LIBRARIES :=
    COMMON_FLAGS := -Wall -O2 -std=c++11 -fopenmp <br>
    CXX_FLAGS := $(foreach include,$(INCLUDE_DIRS),-I$(include)) <br>
    LD_FLAGS := $(foreach lib,$(LIBRARY_DIRS),-L$(lib)) <br>
    LD_FLAGS := $(foreach lib,$(LIBRARIES),-l$(lib)) <br>
    all:obj lib <br>
    lib:$(DYNAMIC_LIB) $(STATIC_LIB) <br>
    obj:$(OBJ_FILES) <br>
    %.o:%.cpp <br>
    	g++ -fPIC -c -o $@ $< $(COMMON_FLAGS) $(CXX_FLAGS) <br>
    $(DYNAMIC_LIB):$(OBJ_FILES) <br>
    	g++ -shared -o $@ $(OBJ_FILES) <br>
    $(STATIC_LIB):$(OBJ_FILES) <br>
    	ar rcs $@ $(OBJ_FILES) <br>


*  Compile it <br>
``
make <br>
``

*  You will get 'libcmcode.a' and 'libcmcode.so' <br>

*  Done. <br>



## Compile DenseCut <br>

*  Open terminal and Go into 'mmcheng_densecut' foler <br>
``
cd mmcheng_densecut
``

*  Compile it <br>
``
g++ *.cpp -O2 -Wall -I. -lcmcode -L../CmCode/CmLib -I../ -Wl,-rpath,../CmCode/CmLib -std=c++11 `pkg-config --libs --cflags opencv` -lomp -o densecut
``

*  You will get 'densecut'. Done. <br>


	* Some erros occured. For example, "/usr/bin/ld: cannot find -lcufft", just locate libcufft and add the path to $LD_LIBRARY_PATH or $LIBRARY_PATH in the ~/.bashrc. <br>


## Demo <br>

* Run demo in 'mmcheng_densecut' and see the results in 'ASD/Sal4N'. <br>
``
./densecut ./
``

* Done. <br>


### `Thanks Tianli Zhao for the compilation of this code in linux.` 

