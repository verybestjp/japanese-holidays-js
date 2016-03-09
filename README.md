# japanese-holidays-js [![Build Status](https://travis-ci.org/osamutake/japanese-holidays-js.svg?branch=master)](https://travis-ci.org/osamutake/japanese-holidays-js)

日本の休日を JavaScript で計算するためのライブラリ

## Installation

```
npm install japanese-holidays
```

## Usage

### JapaneseHolidays.isHoliday(date, furikae = true)

指定された日が休日かどうかを判定して、休日ならその名前を返します。

休日でなければ null を返します。

furikae に false を指定すると振替休日を除きます。

内部ではキャッシュした値を使って計算するため繰り返し呼ぶ際にはとても高速に動作します。
 
```javascript
var Holidays = require('japanese-holidays');

var today = new Date();
var holiday = Holidays.isHoliday(today);
if(holiday) {
    console.log("今日は " + holiday + " です");
} else {
    console.log("今日は祝日ではありません");
}
```

### JapaneseHolidays.getHolidaysOf(year, furikae = true)
    
指定された年の休日を配列にして返します。

配列には {month: m, date: d, name: s} の形で表わされた休日が日付順に並びます。

furikae に false を指定すると、振替休日および国民の休日を除きます。

```javascript
var Holidays = require('japanese-holidays');

var today = new Date();
var holidays = Holidays.getHolidaysOf( today.getFullYear() );
for(holiday in holidays) {
    console.log(
        today.getFullYear() + "年" +
        holiday.month + "月" + 
        holiday.date + "日は " +
        holiday.name + " です"
    );
}
```

#### Properties

+ month: Integer - 月 (1～12)
+ date: Integer - 日 (1~31)
+ name: String - 休日名

## 春分・秋分の求め方について

春分・秋分の日は年によって日付が異なります。

この理由は、暦の上での１年の長さが閏年分だけ等間隔にならないため、
本来ほぼ正確に等間隔でやってくる春分・秋分の日付がカレンダー上でずれてしまうためです。
とはいえ、春分・秋分の間隔も完全に等間隔ではなく、毎年少しずつ揺れ動くようです。

Wikipedia の
[春分](https://ja.wikipedia.org/wiki/%E6%98%A5%E5%88%86) ・
[秋分](https://ja.wikipedia.org/wiki/%E7%A7%8B%E5%88%86)
のページに 1600年～2399年 のデータがあって、そこから周期を求めることで、
春分についてはすべての範囲で計算と実測とが一致しました。秋分については
ふらつきが大きいようで、計算だけではどうしても一致しなかったため、
いくつかの値についてのみ個別に指定しています。

結果として、1600年～2399年 の範囲で上記 Wikipedia のページにあった日付を
再現できています。

## License

MIT
