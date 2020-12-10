%.S.o: %.S
	~/x-tools/mips-unknown-linux-uclibc/bin/mips-unknown-linux-uclibc-as -msoft-float -KPIC $^ -o $@

%.c.o: %.c
	~/x-tools/mips-unknown-linux-uclibc/bin/mips-unknown-linux-uclibc-gcc -c $^ -o $@

RELEVANT_SUBDIRS=

define SUBDIR

$1_DEPS=$$(shell find $1 -maxdepth 1 -type f -a \( -name "*.S" -o -name "*.c" \) -printf "%p.o\n")

ifneq ($$($1_DEPS),)

RELEVANT_SUBDIRS += $1

$1.out: $$($1_DEPS)
	~/x-tools/mips-unknown-linux-uclibc/bin/mips-unknown-linux-uclibc-gcc -static $$^ -o $$@

$1: $1.out

clean_$1:
	rm -f $$($1_DEPS)
	rm -f $1.out

.PHONY: $1 clean_$1

endif

endef

$(foreach subdir,$(shell find . -mindepth 1 -type d),$(eval $(call SUBDIR,$(subdir))))

clean: $(RELEVANT_SUBDIRS:%=clean_%)

.PHONY: clean
