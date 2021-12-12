#交叉连接
select *
from r2 cross join s2;
/*类似于：
select *
from r2, s2;
*/

-- -------------------------------

#内连接
-- 非等值连接
/*
select *
from r2, s2
where r2.C < s2.E;
*/
select *
from r2 inner join s2 on r2.C < s2.E;

-- 等值连接
/*
select *
from r2,s2
where r2.B = s2.B;
*/
select *
from r2 inner join s2 on r2.B = s2.B;

-- -------------------------------

#自然连接
select *
from r2 natural join s2;
/*类似于使用using：  
select *
from r2 inner join s2 using(B);
*/

-- -------------------------------

#外连接
-- 左外连接
/*
select *
from r2 left join s2 on r2.B = s2.B;
或者；
select *
from r2 natural left join s2;
*/
select *
from r2 left join s2 using(B);

-- 右外连接
/*
select *
from r2 right join s2 on r2.B = s2.B;
或者：
select *
from r2 natural right join s2;
*/
select *
from r2 right join s2 using(B);
