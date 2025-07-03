# Compiler and flags
CXX := g++
CXXFLAGS := -Wall -Wextra -std=c++20 -Iinclude -MMD -MP -O2

# Directories
SRC_DIR := src
OBJ_DIR := obj
BIN := main

# Files
SRCS := $(wildcard $(SRC_DIR)/*.cpp)
OBJS := $(patsubst $(SRC_DIR)/%.cpp, $(OBJ_DIR)/%.o, $(SRCS))
DEPS := $(OBJS:.o=.d)

# Default target
all: $(BIN)

# Linking
$(BIN): $(OBJS)
	$(CXX) $(OBJS) -o $@

# Compile source to object
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp | $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Ensure object directory exists
$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

# Clean rule
clean:
	rm -rf $(OBJ_DIR)/*.o $(OBJ_DIR)/*.d $(BIN)

# Include automatically generated dependency files
-include $(DEPS)

.PHONY: all clean
