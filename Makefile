alvu=./bin/alvu

setup:
	mkdir -p bin
	curl -sf https://goblin.run/github.com/barelyhuman/alvu | PREFIX=./bin sh

build:  
	$(alvu) -highlight -highlight-theme=xcode-dark

watch:
	$(alvu) -highlight -highlight-theme=xcode-dark -serve

w: watch