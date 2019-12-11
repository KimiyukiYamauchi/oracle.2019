# Quiz

## 12/11

1. employee表からhiredateを以下の文字書式で表示するSQL?  
なお英語環境でOracleサーバを使用している  
Twenty-Sixth of May,2014
1. employee表からsalを以下の文字書式で表示するSQL?  
なお日本語環境でOracleサーバを使用している  
また100万以上のsalのデータはない  
￥500,000
1. 以下の形式の日付を表す文字列を日付値に変換し表示するSQL?  
なお日本語環境でOracleサーバを使用している  
「2019年12月11日」
1. 本日、以下のSQL文を実行した時の表示?  
select to_char(to_date('07-26-95, 'MM-DD-RR'), 'YYYY-MM-DD'),  
select to_char(to_date('07-26-45, 'MM-DD-RR'), 'YYYY-MM-DD')  
from dual;
1. employee表のsalが以下の条件の処理後、表示を行うSQL?  
  - 23万以下なら1.5倍
  - 38万以下なら1.2倍
  - それ以外は1.1倍

## 12/10

1. employees表からyomiの「先頭文字を大文字、それ以外を小文字」で表示  
するSQL?
1. employees表からyomiを10文字で表示し、足りない場合は左側に「*」で  
埋めるSQL?
1. employees表からenameの前後のスペースを取り除いて表示するSQL?
1. employees表からsalの10000未満(1000の位を四捨五入)して表示するSQL?
1. employees表からhiredateから最初の日曜日の日付を表示するSQL?


## 12/05

1. employees表からdeptnoが30でsalが30万以上のデータを取得するSQL?
1. employees表からcommにデータが入っているデータを取得するSQL?
1. products表からpnameが'100%'から始まるデータを取得するSQL?
1. employees表らsalの多い順にソートしたデータを取得するSQL?
1. employees表らsalの多いトップ3を取得するSQL?

## 12/04

1. 「射影」について説明してください
1. employees表からsalay列の12倍を"Annual Salary"の別名で取得する  
SQL?
1. employees表からjob列の種類を取得するSQL?
1. NULL値を含む算術式の問題点は何か?
1. departments表の全ての列を取得するSQL?

## 12/03

1. リレーショナルデータベースでデータは何に保存しますか？
1. フィールドに値が格納されていない状態を何といいますか？
1. 主キーの制約はユニークともう１つは何ですか？
1. SQLの分類で、selectやmergeが含まれる分類は何ですか
1. SQLの分類で、commitやrollbackが含まれる分類は何ですか