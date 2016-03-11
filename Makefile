.PHONY: test

lib/japanese-holidays.js: src/japanese-holidays.coffee
	@coffee -o lib -cm $<

test: lib/japanese-holidays.js
	@node test/shunbun.js
	@node test/shubun.js
	@node test/japanese.holiday.js
	@node test/holiday-jp.js
