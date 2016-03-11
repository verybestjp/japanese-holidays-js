.PHONY: test

all: lib/japanese-holidays.js lib/japanese-holidays.min.js

lib/japanese-holidays.js: src/japanese-holidays.coffee
	@coffee -o lib -cm $<

lib/japanese-holidays.min.js: src/japanese-holidays.coffee
	@node_modules/uglify-js/bin/uglifyjs lib/japanese-holidays.js -c \
		--in-source-map lib/japanese-holidays.js.map \
		--source-map lib/japanese-holidays.min.js.map \
		--source-map-url japanese-holidays.min.js.map \
		-o lib/japanese-holidays.min.js \
		--mangle all
	@# Why is this needed?
	@sed -i -E 's/"sources":\["\.\.\//"sourceRoot":"..","sources":["/' \
		lib/japanese-holidays.min.js.map

test: all
	@node test/shunbun.js
	@node test/shubun.js
	@node test/japanese.holiday.js
	@node test/holiday-jp.js
