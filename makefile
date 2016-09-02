SOURSES = $(wildcard ./src/*)
OBJECTS = $(patsubst ./src/%.cpp, ./build/%.o, $(SOURSES))

CXX = clang++
CXXFLAGS = -std=c++14 -g -I./include
LDLIBS = 

build/a.out: $(OBJECTS)
	$(CXX) $^ -o $@ $(LDLIBS) 

build/%.o: src/%.cpp
	@mkdir -p build
	$(CXX) -c $< -o $@ $(CXXFLAGS)
	{ echo "./build/"; $(CXX) $< $(CXXFLAGS) -MM; } > ./build/$*.d 

-include $(wildcard ./build/*.d)
