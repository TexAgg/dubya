all: dubya

main.tab.h main.tab.c: main.y
	bison -d -v main.y

lex.yy.c: main.l main.tab.h
	flex main.l

dubya: lex.yy.c main.tab.c main.tab.h
	g++ -o dubya main.tab.c lex.yy.c

clean:
	rm -f dubya main.tab.* lex.yy.c