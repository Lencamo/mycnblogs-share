# 自连接
-- 查询每一门课的间接先修课(即先修课的先修课)
select fist.Cno, second.Cpno
from Coures as fist, Coures as second
where fist.Cpno = second.Cno;


# 选择 σ
select  * 
from Student 
where Sage < 20;


# 投影 π
select Sname,Sdept  
from Student; 