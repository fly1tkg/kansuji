 数値を漢数字に、また漢数字を数値に変換するメッソドの実装
 実装は Integer 及び String のオープンクラスにて実装すること。

 実装結果例)
 ```ruby
 pry(main)> 123456789.to_kansuji
 => "一億二千三百四十五万六千七百八十九"
 pry(main)>
 pry(main)> "一億二千三百四十五万六千七百八十九".to_number
 => 123456789
 ```

また gem に pry を指定しているため、 binding.pry を行中に記載することでスッテプ実行が可能。
※ irb の代わりに bundle exec pry を使用することも可能

1. bundle install --path=vendor/bundle

2. kansuji.rb に実装

3. bundle exec rspec ./spec を実行


