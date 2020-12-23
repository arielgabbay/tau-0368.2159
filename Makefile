# example: make hw06/hw06_2(.out)
# example: make hw07/test1(.inst)

%.S.o: %.S
	~/x-tools/mips-unknown-linux-uclibc/bin/mips-unknown-linux-uclibc-as -msoft-float -KPIC $^ -o $@

%.c.o: %.c
	~/x-tools/mips-unknown-linux-uclibc/bin/mips-unknown-linux-uclibc-gcc -c $^ -o $@

RELEVANT_SUBDIRS=

define SUBDIR6

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

define SUBDIR7

$1_DEP=$$(shell find $1 -maxdepth 1 -type f -a -name $$(notdir $1).S -printf "%p.o\n")

ifneq ($$($1_DEP),)

RELEVANT_SUBDIRS += $1

$1.inst: $$($1_DEP)
	~/x-tools/mips-unknown-linux-uclibc/bin/mips-unknown-linux-uclibc-objcopy --only-section=.text -I elf32-tradbigmips -O binary $$< $$@.hex
	echo "v2.0 raw" > $$@
	hexdump -e '/1 "%02X"' -e '/4 " 0 0 0\n"' -v $$@.hex >> $$@
	rm -f $$@.hex

$1: $1.inst

clean_$1:
	rm -f $$($1_DEP)
	rm -f $1.inst
	rm -f $1.inst.hex

.PHONY: $1 clean_$1

endif

endef

$(foreach subdir,$(shell find hw06 -mindepth 1 -type d),$(eval $(call SUBDIR6,$(subdir))))
$(foreach subdir,$(shell find hw07 -mindepth 1 -type d),$(eval $(call SUBDIR7,$(subdir))))

clean: $(RELEVANT_SUBDIRS:%=clean_%)

.PHONY: clean
