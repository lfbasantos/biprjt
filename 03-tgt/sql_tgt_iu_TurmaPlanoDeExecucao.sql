--
-- Insert  
insert into tgt.TurmaPlanoDeExecucao
(
    Id,
	PlanoDeExecucaoOrigemId,
	Nome,
	Ordem,
	TurmaId,
	Selecionado,
    ctrlArquivo,
	ctrlDateIniIncr,
	ctrlDateFimIncr
)
select 
    stg.Id,
	stg.PlanoDeExecucaoOrigemId,
	stg.Nome,
	stg.Ordem,
	stg.TurmaId,
	stg.Selecionado,
	'MAN',
	getdate(),
	getdate()
from 
    stg.TurmaPlanoDeExecucao stg left join tgt.TurmaPlanoDeExecucao tgt
    on stg.Id = tgt.Id
where 
    tgt.Id is null 
--
;


--
-- Updates 
update  tgt.TurmaPlanoDeExecucao
    set
	PlanoDeExecucaoOrigemId = stg.PlanoDeExecucaoOrigemId,
	Nome = stg.Nome,
	Ordem = stg.Ordem,
	TurmaId = stg.TurmaId,
	Selecionado= stg.Selecionado,
    ctrlArquivo= 'INCR',
	ctrlDateIniIncr = getdate(),
	ctrlDateFimIncr = getdate()
from 
    stg.TurmaPlanoDeExecucao stg left join tgt.TurmaPlanoDeExecucao tgt
    on stg.Id = tgt.Id
where 
    tgt.Id is not null
	and 
	(
		tgt.PlanoDeExecucaoOrigemId <> stg.PlanoDeExecucaoOrigemId
		or
		tgt.Nome <> stg.Nome
		or
		tgt.Ordem <> stg.Ordem
		or
		tgt.TurmaId <> stg.TurmaId
		or
		tgt.Selecionado <> stg.Selecionado
	)
--
;

