TARGETS=resume_pearson.html \
resume_pearson.pdf \
resume_pearson.docx \
resume_pearson.txt \
cv_pearson.html \
cv_pearson.pdf \
cv_pearson.docx \
cv_pearson.txt

PANDOC=pandoc

STYLE_CSS = file://$(shell readlink -f style.css)

all: $(TARGETS)

cv_pearson.html : cv.md style.css
	$(PANDOC) --standalone --filter ./cv.py -f markdown+smart -t html --css $(STYLE_CSS) -o $@ $<

#cv_pearson.pdf : cv.md style.css
	$(PANDOC) --standalone --filter ./cv.py -t html5 --css $(STYLE_CSS) -o $@ $<

cv_pearson.pdf : cv.md style.css
	$(PANDOC) --standalone --filter ./cv.py -t context --template=template.context.tex -o $@ $<

cv_pearson.docx : cv.md
	$(PANDOC) --standalone --filter ./cv.py -t docx --reference-doc=style.docx -o $@ $<

cv_pearson.txt : cv.md
	$(PANDOC) --standalone --filter ./cv.py -f markdown+smart -t plain -o $@ $<

resume_pearson.html : cv.md style.css

	$(PANDOC) --standalone --filter ./resume.py -f markdown+smart -t html --css $(STYLE_CSS) -o $@ $<

resume_pearson.pdf : cv.md style.css
	$(PANDOC) --standalone --filter ./resume.py -t html5 --css $(STYLE_CSS) -o $@ $<

resume_pearson.docx : cv.md
	$(PANDOC) --standalone --filter ./resume.py -t docx --reference-doc=style.docx -o $@ $<

resume_pearson.txt : cv.md
	$(PANDOC) --standalone --filter ./resume.py -f markdown+smart --to plain -o $@ $<


clean:
	rm -f $(TARGETS)
