CXX      ?= c++
CXXFLAGS ?= -std=c++11 -O2 -Wall
OPENCV   := $(shell pkg-config --cflags --libs opencv5 2>/dev/null || pkg-config --cflags --libs opencv4 2>/dev/null || pkg-config --cflags --libs opencv)

BIN := build/seam_carving

$(BIN): src/seam_carving.cpp
	@mkdir -p build
	$(CXX) $(CXXFLAGS) $< -o $@ $(OPENCV)

.PHONY: run clean
run: $(BIN)
	./$(BIN) images/1.jpg

clean:
	rm -rf build
