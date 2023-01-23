setup:
	curl -sf https://goblin.barelyhuman.xyz/codeberg.org/reaper/alvu | sh

build:  
	alvu

watch:
	ls ./**/* | entr -cr alvu 

w: watch