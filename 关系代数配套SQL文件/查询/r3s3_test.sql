# 除运算 
-- 方式1
select A
from r3 natural join s3  
GROUP BY r3.A
HAVING count(r3.A) = (
	SELECT count(*)
	FROM s3 
);

-- 方式2
select A
from r3 left join s3 using(B,C)  /*使用left join 是因为MySQL不支持💖完全外连接*/
GROUP BY r3.A
HAVING count(r3.A) = (
	SELECT count(*)
	FROM s3 
);