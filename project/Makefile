# rule for making report  
report.html: figures summary R/report.Rmd
	cd R && \
	Rscript -e "rmarkdown::render('report.Rmd', output_file='../report/report.html')"

.PHONY: report
report: report.html

.PHONY: build
build: 
	docker build -t proj .

# PHONY rule for install R package 
.PHONY: install
install:
	Rscript -e 'if (!require("ggplot2")) install.packages("ggplot2",repos="http://cran.us.r-project.org")'
	Rscript -e 'if (!require("dplyr")) install.packages("dplyr",repos="http://cran.us.r-project.org")'

# rule for making figs  
.PHONY: figures
figures: summary R/make_comparefig.R 
	chmod +x R/make_comparefig.R && \
	Rscript R/make_comparefig.R

# PHONY rule for all summary data 
.PHONY: summary
summary: data/summaryg.csv data/summaryp.csv data/summarys.csv data/summaryz.csv

data/summary%.csv: R/data_summary.R raw_data/result%.RData
	chmod +x R/data_summary.R && \
	Rscript R/data_summary.R

# clean up directory clean:
.PHONY: clean 
clean:
	rm R/report.html data/* figs/*

# PHONY rule for help
.PHONY: help 
help:
	@echo "report.html : Generate final analysis report." 
	@echo "install : Install all the needed R packages." 
	@echo "summary : Generate summary of raw_data and output as .csv files." 
	@echo "figs/comparefig.png : Make heatmaps across methods."
	@echo "clean : Remove cleaned data, figure and report."
	@echo "build : Build the docker image named proj"




