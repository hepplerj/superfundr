.PHONY : docs deploy-docs

docs :
	Rscript -e "pkgdown::clean_site(); pkgdown::build_site(run_dont_run = TRUE)"

deploy-docs :
	rsync --checksum --delete -avz docs/* jasonhep@jasonheppler.org:~/www/jasonheppler.org/software/superfundr/
