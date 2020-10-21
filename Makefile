# rule for making report  
report.html: figs/comparefig.png summary R/report.Rmd
	Rscript -e "rmarkdown::render('R/report.Rmd', quiet = TRUE)"

.PHONY: report
report: report.html

# PHONY rule for install R package 
.PHONY: install
install:
	Rscript -e 'if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager")' &&\
	Rscript -e 'if (!require("ComplexHeatmap")) BiocManager::install("ComplexHeatmap")'
	Rscript -e 'if (!require("ggplot2")) install.packages("ggplot2")'
	Rscript -e 'if (!require("circlize")) install.packages("circlize")'
	Rscript -e 'if (!require("dplyr")) install.packages("dplyr")'

# rule for making figs  
figs/comparefig.png: R/make_comparefig.R summary
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
