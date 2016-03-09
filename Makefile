.PHONY: test

test: lib/japanese-holidays.js
	@node test/shunbun.js
	@node test/shubun.js
	@node test/japanese.holiday.js
	@node test/holiday-jp.js

lib/japanese-holidays.js: src/japanese-holidays.coffee
	@coffee -o lib -c $<
