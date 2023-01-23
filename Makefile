setup:
	curl -sf https://goblin.barelyhuman.xyz/codeberg.org/reaper/alvu | sh

build:  
	alvu -highlight -highlight-theme=xcode-dark

watch:
	ls ./**/* | entr bash -c 'alvu -highlight -highlight-theme=xcode-dark -serve'

w: watch