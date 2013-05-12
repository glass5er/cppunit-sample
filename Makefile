TARGET = test

GITREV    := $(shell git log --oneline . | head -n 1 | cut -d' ' -f1)
GITSTATUS := $(shell git status . -s | cut -c2 | grep "M" | head -n 1)

BUILDDATE := $(shell date +%Y/%m/%d)

SRC = \
	main.cpp \

INCLUDE = \
	-I./ \

LDFLAGS = \

LIB = 	\

LIBDEF=	  -lcppunit

DEFINE = \

CC = g++

CFLAGS = \
	-g \
	-O2 \
	-Wall



OBJ = $(patsubst %.cpp,%.o,$(filter %.cpp,$(SRC)))

.SUFFIXES: .cpp .o

.cpp.o:
	$(CC) $(CFLAGS) $(DEFINE) $(INCLUDE) -c $< -o $@

all: $(TARGET)

libraries:
	@ for d in $(dir $(LIB)); do \
		make -C $$d; \
	done

$(TARGET): $(OBJ) $(LIB)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS) $(LIB) $(LIBDEF)

clean:
	rm -f $(TARGET) $(OBJ)

clobber: clean
	@ for d in $(dir $(LIB)); do \
		make -C $$d clean; \
	done



