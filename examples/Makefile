LFE_BIN_DIR = deps/lfe/bin
LFE = $(LFE_BIN_DIR)/lfe
LFEC = $(LFE_BIN_DIR)/lfec

CH2 = ../ch2/examples

all: compile ch2

repl:
	$(LFE) -sname lgtktutorial \
	-pa $(CH2)/ebin

repl-debug:
	$(LFE) -sname lgtktutorial \
	-s logjam \
	-pa $(CH2)/ebin

compile:
	rebar get-deps
	rebar compile

ch2:
	mkdir -p $(CH2)/ebin
	PATH=$(LFE_BIN_DIR):$(PATH) \
	$(LFEC) -o $(CH2)/ebin $(CH2)/lgtk-example-base.lfe

run-example-base:
	$(LFE) -pa $(CH2)/ebin -noshell -detach -s lgtk-example-base -s init stop
