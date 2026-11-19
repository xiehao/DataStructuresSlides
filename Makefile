LATEXMK ?= latexmk
LATEXMK_FLAGS ?= -xelatex -interaction=nonstopmode -halt-on-error

CHAPTERS := DSA00-Introduction DSA01-LinearStructures DSA02-SemiLinearStructures \
            DSA03-NonLinearStructures DSA04-BasicAlgorithms
HANDOUTS := $(addsuffix -handout,$(CHAPTERS))

.PHONY: all chapters handouts clean chapter-00 chapter-01 chapter-02 chapter-03 \
        chapter-04 handout-00 handout-01 handout-02 handout-03 handout-04

all: chapters handouts
chapters: chapter-00 chapter-01 chapter-02 chapter-03 chapter-04
handouts: handout-00 handout-01 handout-02 handout-03 handout-04

chapter-00:
	$(LATEXMK) $(LATEXMK_FLAGS) DSA00-Introduction.tex
chapter-01:
	$(LATEXMK) $(LATEXMK_FLAGS) DSA01-LinearStructures.tex
chapter-02:
	$(LATEXMK) $(LATEXMK_FLAGS) DSA02-SemiLinearStructures.tex
chapter-03:
	$(LATEXMK) $(LATEXMK_FLAGS) DSA03-NonLinearStructures.tex
chapter-04:
	$(LATEXMK) $(LATEXMK_FLAGS) DSA04-BasicAlgorithms.tex

handout-00:
	$(LATEXMK) $(LATEXMK_FLAGS) DSA00-Introduction-handout.tex
handout-01:
	$(LATEXMK) $(LATEXMK_FLAGS) DSA01-LinearStructures-handout.tex
handout-02:
	$(LATEXMK) $(LATEXMK_FLAGS) DSA02-SemiLinearStructures-handout.tex
handout-03:
	$(LATEXMK) $(LATEXMK_FLAGS) DSA03-NonLinearStructures-handout.tex
handout-04:
	$(LATEXMK) $(LATEXMK_FLAGS) DSA04-BasicAlgorithms-handout.tex

clean:
	$(LATEXMK) -c $(addsuffix .tex,$(CHAPTERS) $(HANDOUTS))
