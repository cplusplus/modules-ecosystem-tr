### -*- mode: makefile-gmake -*-

STDPDF = pdflatex iso_cpp_modules_ecosystem_technical_report | grep -v "^Overfull"

default: rebuild

clean:
	rm -f iso_cpp_modules_ecosystem_technical_report.pdf *.aux config/*.aux *.idx config/*.idx *.ilg *.ind *.log *.lot *.lof *.tmp *.out *.glo *.gls *.fls *.fdb* *.toc *.xtr

refresh:
	$(STDPDF)

rebuild:
	$(STDPDF)
	$(STDPDF)
	$(STDPDF)

full: reindex

reindex: rebuild
	makeindex -s generalindex.ist generalindex
	$(STDPDF)
	makeindex -s basic.gst -o xrefindex.gls xrefindex.glo
	$(STDPDF)
	$(STDPDF)

### Makefile ends here
