CC = gcc

CFLAGS = -Wall -Wextra -std=c99

SRCDIR = src
TARGETDIR = target
SRCS = $(wildcard $(SRCDIR)/*.c)
HEADERS = $(wildcard $(SRCDIR)/*.h)

OBJS = $(SRCS:$(SRCDIR)/%.c=$(TARGETDIR)/%.o)
TARGET = $(TARGETDIR)/clox

all: $(TARGETDIR) $(TARGET)

$(TARGETDIR):
	mkdir -p $(TARGETDIR)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^

$(TARGETDIR)/%.o: $(SRCDIR)/%.c $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(TARGETDIR)

.PHONY: all clean
