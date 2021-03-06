# minimalist makefile
.SUFFIXES:
#
.SUFFIXES: .cpp .o .c .h
ifeq ($(DEBUG),1)
CFLAGS = -fPIC  -std=c99 -ggdb  -march=native -Wall -Wextra -pedantic -Wshadow -fsanitize=undefined  -fno-omit-frame-pointer -fsanitize=address
else
CFLAGS = -fPIC -std=c99 -O3   -march=native -Wall -Wextra -pedantic -Wshadow
endif # debug

HEADERS=include/simdpcg32.h  include/pcg32.h 


all: fillarray 

fillarray: ./benchmark/fillarray.c $(HEADERS) 
	$(CC) $(CFLAGS) -o fillarray ./benchmark/fillarray.c  -Iinclude



clean:
	rm -f  fillarray 
