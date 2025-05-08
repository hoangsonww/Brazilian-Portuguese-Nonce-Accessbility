.PHONY: all analysis report clean

# Analysis script and data
SCRIPT      := bp_nonce_analysis.R
DATA        := bp-nonce.csv

# Outputs
HTML        := bp_nonce_report.html
TEX         := bp_nonce_report.tex
PDF         := bp_nonce_report.pdf

all: analysis report

analysis: $(DATA)
	Rscript $(SCRIPT)

report: analysis $(HTML)

$(HTML): $(TEX) analysis
	Rscript -e "rmarkdown::render('$(TEX)', output_format='html_document', output_file='$(HTML)')"

clean:
	rm -f *.html *.pdf *.aux *.log *.out
