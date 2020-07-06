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

dev.Rout: dev.R
	$(makeR)

set.Rout: set.R
	$(makeR)

use.Rout: use.R set.rda
	$(makeR)

reuse.Rout: use.R set.rdata
	$(makeR)

falibrate.Rout: set.rdata use.R
	$(makeR)

list.Rout: makestuff/makeRfuns.R.manual list.R
	$(makeR)

######################################################################

## run-R

runmake = TRUE

simple.Rout: simple.R

reads.Rout: simple.rda reads.R

readleg.Rout: simple.Rout reads.R
	$(run-R)

plotleg.Rout: reads.rda themes.R plots.R
	$(run-R)

## Test chain
## plotleg.Rout: simple.R

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
