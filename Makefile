CC = gcc

CFLAGS = -Wall -Wextra -std=c99

SRCS = main.c memory.c chunk.c
HEADERS = chunk.h common.h memory.h

OBJS = $(SRCS:.c=.o)
TARGET = clox

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^

%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) $(TARGET)

.PHONY: all clean
