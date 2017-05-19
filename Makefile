TARGETS=resume_pearson.html \
resume_pearson.pdf \
resume_pearson.docx \
resume_pearson.txt \
cv_pearson.html \
cv_pearson.pdf \
cv_pearson.docx \
cv_pearson.txt

PANDOC=pandoc

all: $(TARGETS)

cv_pearson.html : cv.md style.css
	$(PANDOC) --standalone --filter ./cv.py -S --to html -c style.css -o $@ $<

#cv_pearson.pdf : cv.md style.css
#	$(PANDOC) --standalone --filter ./cv.py -t html5 --css style.css -o $@ $<

cv_pearson.pdf : cv.md style.css
	$(PANDOC) --standalone --filter ./cv.py -t context --template=template.context.tex -o $@ $<

cv_pearson.docx : cv.md
	$(PANDOC) --standalone --filter ./cv.py --to docx -o $@ $<

cv_pearson.txt : cv.md
	$(PANDOC) --standalone --filter ./cv.py --smart --from markdown --to plain -o $@ $<

resume_pearson.html : cv.md style.css
	$(PANDOC) --standalone --filter ./resume.py -S --to html -c style.css -o $@ $<

resume_pearson.pdf : cv.md style.css
	$(PANDOC) --standalone --filter ./resume.py -t html5 --css style.css -o $@ $<

resume_pearson.docx : cv.md
	$(PANDOC) --standalone --filter ./resume.py --to docx -o $@ $<

resume_pearson.txt : cv.md
	$(PANDOC) --standalone --filter ./resume.py --smart --from markdown --to plain -o $@ $<


clean:
	rm -f $(TARGETS)
