FC     := gfortran
SRC    := src
BUILD  := build
BIN    := bin

TARGET := $(BIN)/epidemic_simulation

SRCS := $(SRC)/mtfort90.f90 $(SRC)/utils.f90 $(SRC)/epidemic_simulation.f90
OBJS := $(BUILD)/mtfort90.o $(BUILD)/utils.o $(BUILD)/epidemic_simulation.o

.PHONY: all clean dirs
all: dirs $(TARGET)

dirs:
	mkdir -p $(BUILD) $(BIN)

$(TARGET): $(OBJS)
	$(FC) -o $@ $^

$(BUILD)/%.o: $(SRC)/%.f90 | dirs
	$(FC) $(FFLAGS) -J$(BUILD) -I$(BUILD) -c $< -o $@

clean:
	rm -rf $(BUILD) $(BIN)
