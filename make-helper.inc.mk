# include after default target, e.g. all:

OLD_VARS:= $(filter-out NEWTARGET,$(.VARIABLES))

.PHONY: vars targets

vars:
	$(foreach v,$(filter-out $(OLD_VARS) OLD_VARS,$(.VARIABLES)), $(info $(v) = $($(v))))

#FIXME: this only uses the main Makefile
targets:
	@grep -Po '^[^\.#[:space:]].*(?=:(?!=))' $(CURDIR)/$(firstword $(MAKEFILE_LIST))

# e.g. to be able to use $\{n} in $(subst
define \n


endef

SPACE:=$(subst ,, )
