#
# Copyright (c) 2010 Joyent Inc., All rights reserved.
#

CC=gcc
CFLAGS=-Wall -W
SRC_ROOT=$(PWD)/../..

TARGETS=builder
OBJS=builder.o file_cp.o users.o

all: $(TARGETS)

builder: $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS)

%.o: %.c
	$(CC) -c $(CFLAGS) -o $@ $<

users.c:
	./build_users_c.sh $(SRC_ROOT)/overlay > users.c

clean:
	rm $(TARGETS) $(OBJS)
