LEX=flex
YACC=bison
CC=g++
OBJECT=tinyC #生成的目标文件

$(OBJECT): lex.yy.o  yacc.tab.o Symbol.o
	$(CC) lex.yy.o yacc.tab.o Symbol.o -o $(OBJECT)

Symbol.o: Symbol.cpp
	$(CC) -c Symbol.cpp

lex.yy.o: lex.yy.c  yacc.tab.h  main.h
	$(CC) -c lex.yy.c

yacc.tab.o: yacc.tab.c  main.h
	$(CC) -c yacc.tab.c

yacc.tab.c  yacc.tab.h: yacc.y
# bison使用-d参数编译.y文件
	$(YACC) -d yacc.y

lex.yy.c: lex.l
	$(LEX) lex.l

clean:
	@rm -f $(OBJECT)  *.o