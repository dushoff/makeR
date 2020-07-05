## :my $useCLArgs = "for (a in commandArgs(TRUE)){ eval(parse(text=a)) }";

loadEnvironments <- function(fl = commandArgs(TRUE)
	, exts = c("RData", "Rdata", "rda")
)
{
	envl <- character(0)
	for (ext in exts){
		ss <- paste0("\\.", ext, "$")
		envl <- c(envl, grep(ss, fl, value=TRUE))
	}
	print(envl)
	for (env in envl){
		load(env, .GlobalEnv)
	}
}

saveEnvironment <- function(fl = commandArgs(TRUE)[[1]], ext="rda"){
	base <- sub("Rout$", "", fl)
	save.image(file=paste0(base, ext))
}
