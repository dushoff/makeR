## This is makeR; it's supposed to be my first R package!

current: target
-include target.mk

# -include makestuff/perl.def

vim_session:
	bash -cl "vmt"

######################################################################

Sources += $(wildcard R/*.R)
## dev.Rout: dev.R

######################################################################

dev.R: ;

Sources += $(wildcard *.R)

fake.%:
	$(touch $@)

dev.Rout: R/funs.R dev.R

set.Rout: R/funs.R set.R

use.Rout: R/funs.R set.rda use.R

reuse.Rout: use.R R/funs.R set.rdata
	$(makeR)

######################################################################

### Makestuff

Sources += Makefile

## Sources += content.mk
## include content.mk

Ignore += makestuff
msrepo = https://github.com/dushoff

## Want to chain and make makestuff if it doesn't exist
## Compress this ¶ to choose default makestuff route
Makefile: makestuff/Makefile
makestuff/Makefile:
	git clone $(msrepo)/makestuff
	ls makestuff/Makefile

-include makestuff/os.mk

-include makestuff/makeR.mk

-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/projdir.mk
