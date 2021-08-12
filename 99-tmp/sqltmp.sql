
--
--
truncate table dbo.administrativo_assinatura 
--
;

--
--
select * from dbo.administrativo_assinatura  
order by id 
--
;

--
--
select * from tgt.administrativo_assinatura  
order by id 
--
;

--
--
select * into dbo.administrativo_assinatura_old 
from dbo.administrativo_assinatura
where id = 1
--
;

--
--
select 
--
;