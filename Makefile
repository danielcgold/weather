.PHONY: all
all: weather test

.PHONY: weather

weather: dist/weather.js dist/weather.min.js

dist/weather.js:
	mkdir -p ./dist/ && cp lib/weather.js $@

dist/weather.min.js: dist/weather.js
	mkdir -p ./dist/ && node_modules/.bin/uglifyjs -o $@ $<

.PHONY: test

test:
	@./node_modules/.bin/mocha ./test/weather --recursive --reporter list
