# Database 2 期末試験

### 問1
employees表からjob列の種類(重複の排除)を取得するSQL?

### 問2
employees表からsalの多いトップ3を取得するSQL?

### 問3
employees表からyomiを10文字で表示し、足りない場合は左側に「*」で  
埋めるSQL?

### 問4
以下の形式の日付を表す文字列を日付値に変換し表示するSQL?  
なお日本語環境でOracleサーバを使用している  
「2019年12月11日」

### 問5
employee表からsal列の値がnullの場合は0とみなし、deptnoごとの平均を  
求める。集計結果のなかで、平均給与が20万未満のdeptnoを表示するSQL?

### 問6
2020年7月の最初の日曜日を表示するSQL?

### 問7
以下のSQL文はOKですか?NGの場合は修正してください

``` sql
select e.empno, e.ename, d.dname  
from employees e join departments d  
using(deptno)
where deptno in (10, 20);
```

### 問8
employees表のdeptno列がnullの行を含めて表示する、またdepartments表の  
だれも配属されていない部門も表示する外部結合を行う以下のSQL文はOKですか?  
NGの場合は修正してください

``` sql
select e.empno, e.ename, d.deptno, d.dname  
from employees e, departments d  
where e.deptno(+) = d.deptno(+);
```

### 問9
売上がない従業員の従業員番号と名前を取り出す  
以下のSQL文はOKですか?  
NGの場合は修正してください  
select empno, ename  
from employees e  
where exists  
(select * from orders o  
where o.salesman_no = e.empno);

### 問10
以下と同等のSQL文を作成してください

``` sql
select es.deptno, es.ename, es.sal  
from employees es
where es.sal =  
(select max(sal) from employees  
where deptno = es.deptno)  
and deptno in(20, 30)  
order by deptno;  
```