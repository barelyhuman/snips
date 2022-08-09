build: 
	alvu

w: watch

watch: 
	ls ./pages/* ./hooks/* | entr -cr alvu

