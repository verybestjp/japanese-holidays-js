"use strict"

isHoliday = require('./src/japanese-holidays.coffee').isHoliday



tests = [
  {arg: "2020-01-01",expected: "元日"},
  {arg: "2021-07-18", expected: "海の日"}
  {arg: "2021-07-23", expected: "スポーツの日"}
  {arg: "2021-07-18", expected: ""}
  {arg: "2021-07-18", expected: ""}
];

for t in tests
  actual = isHoliday(new Date(t.arg), {});
  if actual != t.expected 
    console.log "Err. ", "t.arg: " , t.arg, "actual: " , actual, ", expected: ", t.expected



