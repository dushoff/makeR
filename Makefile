## This is makeR; it's supposed to be my first R package!
## Developing now in makestuff instead (neutral face)

current: target
-include target.mk

# -include makestuff/perl.def

vim_session:
	bash -cl "vmt"

######################################################################

Sources += $(wildcard R/*.R)
## dev.Rout: dev.R

## particulates.pdf: particulates.Rmd
%.pdf: %.Rmd
	$(knitpdf)

Ignore += particulates.html
Sources += particulates.Rmd particulates.csv
## particulates.html: particulates.Rmd
particulates.html: particulates.Rmd particulates.csv
%.html: %.Rmd
	$(knithtml)

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

list.Rout: list.R
	$(makeR)

uselist.Rout: list.rds uselist.R 
	$(makeR)

######################################################################

wrap_makeR = TRUE

## Environment list

z.Rout: z.R x.rda y.rda
	$(makeR)

## SaveVars

vars.Rout: vars.R
	$(makeR)

readvars.Rout: readvars.R vars.rda
	$(makeR)

######################################################################

## run-R

simple.Rout: simple.R

reads.Rout: simple.rda reads.R

readleg.Rout: simple.Rout reads.R
	$(run-R)

plotleg.Rout: reads.rda themes.R plots.R
	$(run-R)

## Test chain
## plotleg.Rout: simple.R

#####################################################################

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
