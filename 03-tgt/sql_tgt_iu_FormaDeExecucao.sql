--
--
insert into tgt.FormaDeExecucao
(
    Id,
	Nome,
	Cor,
    ctrlArquivo,
	ctrlDateIniIncr,
	ctrlDateFimIncr
)
select 
    stg.Id,
    stg.Nome,
    stg.Cor,
    '',
    getdate(),
    getdate()
from 
    stg.FormaDeExecucao stg left join tgt.FormaDeExecucao tgt
    on stg.Id = tgt.Id 
where 
    tgt.Id is null
--
;


--
--
update tgt.FormaDeExecucao
set
	Nome = stg.Nome,
	Cor = stg.Cor,
    ctrlArquivo ='',
	ctrlDateIniIncr = getdate(),
	ctrlDateFimIncr = getdate()
from 
    stg.FormaDeExecucao stg left join tgt.FormaDeExecucao tgt
    on stg.Id = tgt.Id 
where 
    tgt.Id is null
    and
    (
        tgt.Nome <> stg.Nome or
        tgt.Cor <> stg.Cor
    )
--
;