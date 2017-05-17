TARGETS=resume_pearson.html resume_pearson.pdf resume_pearson.docx resume_pearson.txt
PANDOC=pandoc

all: $(TARGETS)

resume_pearson.html : resume.md
	$(PANDOC) --standalone --to html -c style.css -o resume_pearson.html $^

resume_pearson.pdf : resume.md
	$(PANDOC) --standalone -t html5 --css style.css -o resume_pearson.pdf $^

resume_pearson.docx : resume.md
	$(PANDOC) --standalone --to docx -o resume_pearson.docx $^

resume_pearson.txt : resume.md
	$(PANDOC) --standalone --smart --from markdown --to plain -o resume_pearson.txt $^


clean:
	rm -f $(TARGETS)
