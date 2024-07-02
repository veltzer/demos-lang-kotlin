##############
# parameters #
##############
# do you want dependency on the Makefile itself ?
DO_ALLDEP:=1
# do you want to show the commands executed ?
DO_MKDBG?=0
# do you want to build jar files?
DO_JARS:=1

########
# code #
########
ALL:=

# silent stuff
ifeq ($(DO_MKDBG),1)
Q:=
# we are not silent in this branch
else # DO_MKDBG
Q:=@
#.SILENT:
endif # DO_MKDBG

SOURCES:=$(shell find src -name "*.kt" -and -type f)
JARS:=$(addsuffix .jar, $(basename $(SOURCES)))

ifeq ($(DO_JARS),1)
ALL+=$(JARS)
endif # DO_JARS

#########
# rules #
#########
.PHONY: all
all: $(ALL)
	@true

.PHONY: debug
debug:
	$(info ALL is $(ALL))
	$(info SOURCES is $(SOURCES))
	$(info JARS is $(JARS))

.PHONY: clean_hard
clean_hard:
	$(Q)git clean -qffxd

.PHONY: clean
clean:
	$(Q)rm $(ALL)

############
# patterns #
############
$(JARS): %.jar: %.kt
	$(info doing [$@])
	$(Q)kotlinc $< -include-runtime -d $@
