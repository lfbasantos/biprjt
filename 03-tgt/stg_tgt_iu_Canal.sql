--
--
insert into tgt.Canal 
(
    Id,
    Nome,
    ctrlArquivo,
	ctrlDateIniIncr,
	ctrlDateFimIncr
)
select 
    stg.Id,
    stg.Nome,
    '',
    getdate(),
    getdate()
from    
    stg.Canal stg left join tgt.Canal tgt 
    on stg.Id = tgt.Id
where 
    tgt.Id is null
--
;

--
--
update tgt.Canal 
set 
    Canal = stg.Canal,
    ctrlArquivo = '',
	ctrlDateIniIncr = getdate(),
	ctrlDateFimIncr = getdate()
from    
    stg.Canal stg left join tgt.Canal tgt 
    on stg.Id = tgt.Id
where 
    tgt.Id is not null
    and 
    (
        stg.Nome <> tgt.Nome
    )
--
;