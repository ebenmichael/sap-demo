# Makefile to convert notebook to html (with code hide toggle) and pdf (w/o code)

.PHONY: pdf html all clean

pdf :
	@echo "\nConverting SAP to latex...\n"
	jupyter nbconvert --to latex --TemplateExporter.exclude_input=True prelim-demo.ipynb
	@echo "Compiling pdf...\n"
	pdflatex prelim-demo.tex
	@echo "Cleaning up...\n"
	rm prelim-demo.log prelim-demo.out prelim-demo.aux prelim-demo.tex
	@echo "\nConverting preliminary analysis to latex...\n"
	cd analysis && jupyter nbconvert --to latex --TemplateExporter.exclude_input=True analysis.ipynb
	@echo "Compiling pdf...\n"
	cd analysis && pdflatex analysis.tex
	@echo "Cleaning up...\n"
	cd analysis && rm -f analysis.log analysis.out analysis.aux analysis.tex

html :
	@echo "\nConverting SAP to html...\n"
	jupyter nbconvert --to html --template toggle_hidden prelim-demo.ipynb
	@echo "\nConverting SAP to html...\n"
	jupyter nbconvert --to html --template toggle_hidden analysis/analysis.ipynb



clean :
	@echo "Removing tex, pdf, and html files...\n"
	rm -f prelim-demo.tex prelim-demo.log prelim-demo.out prelim-demo.pdf prelim-demo.html prelim-demo.aux
	cd analysis && rm -f analysis.tex analysis.log analysis.out analysis.pdf analysis.html analysis.aux

all: pdf html
