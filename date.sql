select round(to_char('19-06-30', 'RR-MM-DD'), 'YEA
R') from dual;
-- 19-01-01
 select round(to_date('19-07-01', 'RR-MM-DD'), 'YEA
R') from dual;
-- 20-01-01
select round(to_date('19-06-15', 'RR-MM-DD'), 'MON
TH') from dual;
-- 19-06-01
select round(to_date('19-06-16', 'RR-MM-DD'), 'MON
TH') from dual;
-- 19-07-01