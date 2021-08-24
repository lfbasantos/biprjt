--
--
insert into tgt.Mencao
(
    Id,
	RegionalId,
	CriterioDeAprovacao,
	Descricao,
	TipoMencao ,
	SiglaDaMencao,
	Feedback ,
    ctrlArquivo,
	ctrlDateIniIncr,
	ctrlDateFimIncr 
)
select 
    stg.Id,
	stg.RegionalId,
	stg.CriterioDeAprovacao,
	stg.Descricao,
	stg.TipoMencao ,
	stg.SiglaDaMencao,
	stg.Feedback ,
    '',
    getdate(),
    getdate()
from 
    stg.Mencao stg left join tgt.Mencao tgt
    on stg.Id = tgt.Id
where 
    tgt.Id is null
--
;

--
--
update tgt.Mencao
set 
	RegionalId=stg.RegionalId,
	CriterioDeAprovacao=stg.CriterioDeAprovacao,
	Descricao=stg.Descricao,
	TipoMencao=stg.TipoMencao,
	SiglaDaMencao=stg.SiglaDaMencao,
	Feedback=stg.Feedback,
    ctrlArquivo='',
	ctrlDateIniIncr=getdate(),
	ctrlDateFimIncr=getdate()
from 
    stg.Mencao stg left join tgt.Mencao tgt
    on stg.Id = tgt.Id
where 
    tgt.Id is not null
--
;