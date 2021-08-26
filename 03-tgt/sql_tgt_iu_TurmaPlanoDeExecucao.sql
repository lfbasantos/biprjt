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
	ctrlDateFimIncr,
	ctrlAtivo,
	ctrlInsert
)
select 
    stg.Id,
	stg.PlanoDeExecucaoOrigemId,
	stg.Nome,
	stg.Ordem,
	stg.TurmaId,
	stg.Selecionado,
	'@{concat(pipeline().parameters.pTabela, '_', activity('lkp_ctl_incr').output.firstRow.fmtdt, '.csv')}',
	'@{activity('lkp_ctl_incr').output.firstRow.dt_ini_incr}',
	'@{activity('lkp_ctl_incr').output.firstRow.dt_fim_incr}',
	1,
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
    ctrlArquivo = '@{concat(pipeline().parameters.pTabela, '_', activity('lkp_ctl_incr').output.firstRow.fmtdt, '.csv')}',
	ctrlDateIniIncr = '@{activity('lkp_ctl_incr').output.firstRow.dt_ini_incr}',
	ctrlDateFimIncr = '@{activity('lkp_ctl_incr').output.firstRow.dt_fim_incr}',
	ctrlUpdate = getdate()
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


--
--
update tgt.TurmaPlanoDeExecucao
    set
	ctrlAtivo = 0,
	ctrlArquivo = '@{concat(pipeline().parameters.pTabela, '_', activity('lkp_ctl_incr').output.firstRow.fmtdt, '.csv')}',
	ctrlDateIniIncr = '@{activity('lkp_ctl_incr').output.firstRow.dt_ini_incr}',
	ctrlDateFimIncr = '@{activity('lkp_ctl_incr').output.firstRow.dt_fim_incr}',
	ctrlDelete = getdate()
from 
    stg.TurmaPlanoDeExecucao stg left join tgt.TurmaPlanoDeExecucao tgt
    on stg.Id = tgt.Id
where 
    tgt.Id is not null
	and 
	stg.logAcao = 'Excluir'
--
;