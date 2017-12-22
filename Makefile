all: E

main.tab.h main.tab.c: main.y
	bison -d -v main.y

lex.yy.c: main.l main.tab.h
	flex main.l

E: lex.yy.c main.tab.c main.tab.h
	gcc -o E main.tab.c lex.yy.c

clean:
	rm -f E main.tab.* lex.yy.c