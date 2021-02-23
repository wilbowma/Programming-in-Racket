all: htmls

%.html: %.scrbl
	scribble --html --redirect-main "https://docs.racket-lang.org" ++xref-in setup/xref load-collections-xref 

htmls: *.scrbl *.css
	scribble --htmls --redirect-main "https://docs.racket-lang.org" ++xref-in setup/xref load-collections-xref scrible.scrbl

html: *.scrbl *.css
	scribble --html --redirect-main "https://docs.racket-lang.org" ++xref-in setup/xref load-collections-xref scrible.scrbl

pdf: *.scrbl *.tex
	scribble --pdf  --redirect-main "https://docs.racket-lang.org" ++xref-in setup/xref load-collections-xref scrible.scrbl