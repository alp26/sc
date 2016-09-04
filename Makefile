.PHONY: clean all test
all:
	mkdir ebin
	erlc -o ./ebin *.erl  
test:
	erl -noshell -pa ebin -eval "eunit:test(game_tests, [verbose])" -s init stop
clean:
	rm -rf ./ebin
