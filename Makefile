#Jonathan Lawrence
#CS3377.501
#jml160230@utdallas.edu
#Makefile for program4

#Flags for C++ implicit rules
CXX = g++
CPPFLAGS = -Wall

#Flags for Lex for C
LEX = /bin/flex

#Flags for YACC for C
YACC = /bin/bison
YFLAGS = -dy

PROJECTNAME = CS3377.Program4.LexBison

EXEC = program4

OBJS = parse.o scan.o program4.o

########################################################################

all: $(EXEC)

clean:
	rm -f $(OBJS) $(EXEC) y.tab.h *~ \#*

$(EXEC): $(OBJS)
	$(CXX) -o $@ $(OBJS)

backup:
	@make clean
	@mkdir -p ~/backups; chmod 700 ~/backups
	@$(eval CURDIRNAME := $(shell basename "`pwd`"))
	@$(eval MKBKUPNAME := ~/backups/$(PROJECTNAME)-$(shell date +'%Y.%m.%d-%H:%M:%S').tar.gz)
	@echo
	@echo Writing Backup file to: $(MKBKUPNAME)
	@echo
	@-tar zcfv $(MKBKUPNAME) ../$(CURDIRNAME) 2> /dev/null
	@chmod 600 $(MKBKUPNAME)
	@echo
	@echo Done!
