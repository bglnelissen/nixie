C_UPPER_SRCS :=
CXX_SRCS :=
C++_SRCS :=
OBJ_SRCS :=
CC_SRCS :=
ASM_SRCS :=
C_SRCS :=
CPP_SRCS :=
O_SRCS :=
S_UPPER_SRCS :=
CC_DEPS :=
C++_DEPS :=
EXECUTABLES :=
OBJS :=
C_UPPER_DEPS :=
CXX_DEPS :=
C_DEPS :=
CPP_DEPS :=

RM := rm -rf

# Add inputs and outputs from these tool invocations to the build variables
CPP_SRCS += \
nixie.cpp

OBJS += \
nixie.o

CPP_DEPS += \
nixie.d

# Each subdirectory must supply rules for building sources it contributes
%.o: %.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


USER_OBJS :=

LIBS := -lwiringPi

# All Target
all: nixie

# Specific Targets
nixie: $(CPP_SRCS) $(OBJS) $(USER_OBJS)
	@echo 'Building target 'nixie' (original: $@)'
	@echo 'Invoking: Cross G++ Linker'
	g++  -o "./nixie" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target 'nixie' (original: $@)'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(CC_DEPS)$(C++_DEPS)$(EXECUTABLES)$(OBJS)$(C_UPPER_DEPS)$(CXX_DEPS)$(C_DEPS)$(CPP_DEPS) ../bin/nixie
	-@echo ' '
