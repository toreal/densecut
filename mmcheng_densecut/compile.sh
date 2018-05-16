g++ *.cpp -O2 -Wall -I. -lcmcode -L../CmCode/CmLib -I../ -Wl,-rpath,../CmCode/CmLib -std=c++11 `pkg-config --libs --cflags opencv` -lomp -o densecut
