# Quiz

## 02/5

1. 以下のSQLはOKですか?NGなら修正してください
  - 顧客ごとの売上合計を売上が大きい順で表示
  - その際、いくつかの選択条件を指定

``` sql
select c.customer_id, sum(o.order_total) "total"
from customers c join orders o
on c.customer_id = o.customer_id
where c.customer_id > 150
and order_total > 1000
group by c.customer_id
having sum(o.order_total) >- 30000
order by total;
```

2. 以下のSQLはOKですか?NGなら修正してください
  - 製品カテゴリごとに製品の一覧を1行で表示
  - 表示する順番は価格の安い順
  - 製品名の間は「:」で区切る
  - カテゴリごとに最も安い製品の単価を表示

``` sq
select product_category "Product Category",
listagg(product_name, ',') within group
(order by unit_price) "Product List",
min(unit_price) "Lowest"
from products
group by product_category order by "Product Category"
```

3. P514の問54を行うSQL文を書いてください

## 02/04

1. 以下のSQLはOKですか?NGなら修正してください
  - PRODUCTS表の単価の高い順に並べる
  - 上位の11番目から10行分の製品を表示
``` sql
select prod_id, prod_name, unit_price
from products
order by unit_price desc
offset 10 rows fetch 10 rows only;
```

2. 以下のSQLはOKですか?NGなら修正してください
  - 各部門の職種の一覧表示
``` sql
select distinct department_id, job
from employees
order by department_id, job;
```

3. 以下のSQLはOKですか?NGなら修正してください
  - 1999年1月1日から2000年12月31日までの間に入社した
  - 職種は'SA_MAN'または'SE_MAN'
``` sql
select employee_id, last_name, job_id, hire_date
from employees
where job_id =any ('SA_MAN', 'SE_MAN') or
hire_date between '99-01-01' and '00-12-31';
```

## 01/30

1. 以下のSQLはOKですか?NGなら修正してください
  - PRODUCTS表のQUANTITY列の大きい順に並べる
  - 上位の10%の製品の情報を表示
  - 同位の行はすべて表示
``` sql
select prod_id, prod_name, quantity
from products
fetch first 10 rows only
order by quantity desc;
```

2. 以下のSQLはOKですか?NGなら修正してください
  - 1回目の実行では、col1、col2、tableの入力が必要
  - 2回目はcol1、col2の入力が必要
``` sql
select &col1, &col2
from &table
order by 1;
```

3. 以下のSQLの出力結果は

```
products表
product_id   list_price     min_price
1           100             120
2           null            120
3           100             null
4           null            null
```
``` sql
select prodoct_id, nvl2(nullif(list_price, min_price), 100, 0)
from products;
```

4. 以下のSQLの出力結果は

``` sql
select round(round(1234.567, 2), 1) from dual;
```

5. 以下のSQLはOKですか?NGなら修正してください
  - EMPLOYEES表から2番目に給与が低い社員の情報を表示する

``` sql
select employee_id, name
from employees
where employee_id in
  (select employee_id
  from employees
  where salary = 
    (select min(salary)
    from employees
    where salary <any (select salary from employees)))
```

## 01/29

1. 第1正規形を第2正規形にするために何を行いますか?

2. 以下のSQLはOKですか?NGなら修正してください

``` sql
select employee_id, last_name "LastName"
from employees
where department_id = 30
union
select emloyee_id EMP_NO, last_name
from employees
where department_id = 60
order by 1, LastName;
```

3. 以下のSQLの実行結果はどうなりますか

```
employees表
job_id    salary
SA_MAN    14000
SA_REP    11500
SA_MAN    11000
SA_REP    11000

```

``` sql
select job_id, salary,
case when salary >= 12000 and job_id = 'SA_MAN' then 'RANK A'
when salary >= 10000 and job_id = 'SA_REP' then 'RANK A'
else 'RANK B' end rank
from employees;
```

## 01/28

1. 以下のSQL文
  - departments表をコピーしdept_copy表
  - 但し、データはコピーしない
  - deptnoにprimary key(主キー)
1. 以下のSQL文
  - 上記で作成したdept_copy表に以下の列追加
  - 列名: manager_id
    - 型: number(4)
    - 外部キー(employees表のempno列)
1. 以下のSQL文
  - 上記で作成したdept_copy表に以下の列削除
    - 列名: dname, loc

## 01/23

1. 以下のテーブルを作成するSQL文
  - テーブル名(emp1)
    - empno
      - データ型
        - 数値4桁
      - 制約
        - 制約名
          - emp1_empno_pk
          - 主キー
    - ename
      - データ型
        - 文字10桁
      - 制約
        - 制約名
          - emp1_ename_nn
          - not null
    - job
      - データ型
        - 文字20桁
      - 制約
        - 制約名
          - なし
          - not null
    - deptno
      - データ型
        - 数値3桁
      - 制約
        - 制約名
          - emp1_dept1_deptno_fk
          - 外部キー
            - dept1
              - deptno
        - 制約名
          - emp1__deptno_nn
          - not null
    - job, deptno
      - 制約
        - 制約名
          - emp1_deptno_job_uk
          - 一意キー
      
## 01/22

1. 以下viewを作成するSQL文?
  - view名はe_d_v
  - employees表とdepartments表を結合
  - empno, ename, dname, loc列を表示
  - deptnoの10, 20のみ

2. 以下の順序を作成するSQL文?
  - 順序名はs_dept_deptno
  - 初期値は10
  - 刻み幅は10

3. 以下のテーブルを作成するSQL文
  - テーブル名はdeptt
  - 列定義
    - deptno
      - データ型 - 数値型(4桁)
      - デフォルト値 - s_dept_deptnoのnextvalを設定
    - dname
      - データ型 - 可変長文字型(30バイト)

4. 上記のテーブルに以下のデータを追加するSQL文
  - dname
    - システム技術部
    - システム開発部

5. 上記のテーブルを完全に削除(ごみ箱に移動しない)SQL文

## 01/21

- 以下のSQL文を実行しました。どのDML文がcommitされますか
  1. insert文(1)
  2. savepoint a;
  3. delete文(1)
  4. savepoint b;
  5. update文(1)
  6. savepoint c;
  7. rollback to b;
  8. commit;

- 以下のSQL文を実行しました。どのDML文がcommitされますか
  1. insert文(1)
  2. savepoint a;
  3. delete文(1)
  4. savepoint b;
  5. update文(1)
  6. savepoint c;
  7. commit;
  8. insert文(2)
  9. savepoint d;
  10. rollback;
  11. commit;

- 部門表に対して以下の手順でSQLを実行しました
  1. A: deptno = 10のloc 東京 -> 大阪
  2. A: commit
  3. C: deptno = 10を検索
  4. B: deptno = 20のloc 大手町 -> 新宿  
  その後、以下のSQL文を実行、返す値はなんですか  
  - B: select loc from 部門表 where deptno in(10, 20);
  - C: select loc from 部門表 where deptno in(10, 20);

- 部門表に対して以下の手順でSQLを実行しました
  1. A: deptno = 10のloc 東京 -> 大阪
  2. A: commit
  3. C: deptno = 10を検索
  4. B: deptno = 20のloc 大手町 -> 新宿
  5. B: commit  
  その後、以下のSQL文を実行、返す値はなんですか  
  - B: select loc from 部門表 where deptno in(10, 20);
  - C: select loc from 部門表 where deptno in(10, 20);

- 部門表に対して以下の手順でSQLを実行しました
  1. A: deptno = 60を検索(for update)
  2. B: deptno = 60を検索(for update nowait)
  3. C: deptno = 60を検索(通常の検索)
  4. A: deptno = 60のloc 大阪 -> 沖縄
  5. B: deptno = 60のloc 大阪 -> 青森
  6. C: deptno = 60を検索(通常の検索)
  7. A: commit
  8. A: deptno = 60を検索(通常の検索)
  9. B: deptno = 60を検索(通常の検索)
  10. C: deptno = 60を検索(通常の検索)  
  ⅱ ⅲ, ⅵ, ⅷ, ⅸ, ⅹの検索の結果は何ですか

## 01/16

1. insert into dept_copy values((select 列名...))の形式で  
以下の値を追加するSQL文
    - deptno - 現在のdeptnoの最大値+10の値
    - dname - 開発部
    - loc - null
2. emp_copyのempnoが1010以降のsalを10,000増やすSQL文
3. dept_copyのdeptnoでdepartments表にない行を削除するSQL文

## 01/15

1. 以下と同等のSQL文を作成してください  
``` sql
select empno, ename  
from employees e  
where not exists  
(select * from orders o  
where o.salesman_no = e.empno);  
```
2. 以下と同等のSQL文を作成してください  
``` sql
select es.deptno, es.ename, es.sal  
from employees es
where es.sal =  
(select max(sal) from employees  
where deptno = es.deptno)  
and deptno in(20, 30)  
order by deptno;  
```
``` sql
select e.deptno, e.ename, e.sal  
from employees e join  
(select deptno, max(sal) ms  
from employees  
group by deptno) m  
on e.deptno = m.deptno and e.sal = m.ms  
where e.deptno in (20, 30);
```

## 01/14

1. 今年の抱負を教えてください
1. 以下のSQL文はOKですか?  
NGの場合は修正してください  
select empno, ename, job, mgr, deptno  
from employees  
where empno =  
(select mgr from employees  
where ename in ('山田', '伊藤'));
1. mgr列がnullの行が含まれる場合、以下のSQL文はOKですか?     
NGの場合は修正してください  
select empno, ename  
from employees
where empno not in (select mgr from employees);
1. 以下のSQL文を説明してください  
select empno, ename, sal, deptno  
from employees  
where (sal, deptno) =  
(select sal, deptno from employees  
where empno = 1013);
1. 以下のSQL文を説明してください  
select empno, ename  
from employees e  
where not exists  
(select * from orders o  
where o.salesman_no = e.empno);

## 12/19

1. mgr列がnullの行を含めて表示する外部結合を行う以下のSQL文はOKですか?  
NGの場合は修正してください  
select w.ename, w.sal, m.ename  
from employees w join employees m  
on w.mgr = m.empno;
1. mgr列がnullの行を含めて表示する外部結合を行う以下のSQL文はOKですか?  
NGの場合は修正してください  
select w.ename, w.sal, m.ename  
from employees w ,employees m  
where w.mgr = m.empno;  
1. employees表のdeptno列がnullの行を含めて表示する外部結合を行う以下  
のSQL文はOKですか?NGの場合は修正してください  
select e.empno, e.ename, d.deptno, d.dname  
from employees e join departments d  
on e.deptno = d.deptno;  
1. employees表のdeptno列がnullの行を含めて表示する外部結合を行う以下  
のSQL文はOKですか?NGの場合は修正してください  
select e.empno, e.ename, d.deptno, d.dname  
from employees e ,departments d  
where e.deptno = d.deptno;  
1. employees表のdeptno列がnullの行を含めて表示する、またdepartments表の  
だれも配属されていない部門も表示する外部結合を行う以下のSQL文はOKですか?  
NGの場合は修正してください  
select e.empno, e.ename, d.deptno, d.dname  
from employees e, departments d  
where e.deptno(+) = d.deptno(+);

## 12/18

1. 以下のSQL文はOKですか?NGの場合は修正してください  
select sysdate - '00-01-01' from dual;
1. 以下のSQL文はOKですか?NGの場合は修正してください  
select ename, hiredate  
from employees  
where hiredate >= to_date('2003-01-01', 'RR-MON-DD',  
'nls_date_language = AMERICAN');
1. 以下のSQL文はOKですか?NGの場合は修正してください  
select e.empno, e.ename, d.dname, e.deptno  
from employees e, departments d; 
1. 以下のSQL文はOKですか?NGの場合は修正してください  
select e.empno, e.ename, d.deptno, d.dname  
from employees e natural join departments d;
1. 以下のSQL文はOKですか?NGの場合は修正してください  
select e.empno, e.ename, d.dname  
from employees e join departments d  
on e.deptno = d.deptno  
where deptno in (10, 20);

## 12/17

1. test表のtest列の前後の"(ダブルクォート)を削除するSQL?
1. employee表からsal列の降順でソートしたデータの3番目から3件データを  
表示するSQL?
1. employee表からデータを取り出す時、SQL実行時に選択条件のdeptnoを  
ユーザに指定させるSQL?
1. 2020年7月の最初の日曜日を表示するSQL?
1. 以下のSQL文はエラーになります。修正してください  
select round('19-06-30', 'YEAR') from dual;

## 12/12

1. employee表からsal列の値がnullの場合は0とみなし、deptnoごとの平均を  
求める。集計結果のなかで、平均給与が20万未満のdeptnoを表示するSQL?
1. 以下のSQL文はOKですか?NGの場合は修正箇所を説明してください  
select deptno, job, count(*) from employees  
where count(\*) >= 2  
group by deptno, job  
order by deptno, job;
1. 以下のSQL文はOKですか?NGの場合は修正箇所を説明してください  
select prod_category, sum(prod_list_price)  
from produccts  
group by prod_category  
having min(prod_list_price) > 10;
1. products表のPRICE列に以下のデータが入っいる  
200, 200, 300, null, 400  
以下のSQLの結果は?  
select avg(price), avg(distinct price), avg(nvl(price, 0))  
from products;  
1. 以下のSQL文はOKですか?NGの場合は修正箇所を説明してください  
select depno 部門番号, avg(sal) 平均給与 from employees  
goup by deptno  
order by min(sal) desc; 


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