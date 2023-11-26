# include after default target, e.g. all:

OLD_VARS:= $(filter-out NEWTARGET,$(.VARIABLES))

.PHONY: vars targets

vars:
	$(foreach v,$(filter-out $(OLD_VARS) OLD_VARS,$(.VARIABLES)), $(info $(v) = $($(v))))

# see https://stackoverflow.com/questions/4219255/how-do-you-get-the-list-of-targets-in-a-makefile
targets:
	@LC_ALL=C $(MAKE) -pRrq -f $(firstword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/(^|\n)# Files(\n|$$)/,/(^|\n)# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | grep -E -v -e '^[^[:alnum:]]' -e '^$@$$'

# e.g. to be able to use $\{n} in $(subst
define \n


endef

SPACE:=$(subst ,, )
