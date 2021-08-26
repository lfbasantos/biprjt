--
--
insert into tgt.FormaDeExecucao
(
    Id,
	Nome,
	Cor,
    ctrlArquivo,
	ctrlDateIniIncr,
	ctrlDateFimIncr,
    ctrlAtivo,
	ctrlInsert
)
select 
    stg.Id,
    stg.Nome,
    stg.Cor,
    '@{concat(pipeline().parameters.pTabela, '_', activity('lkp_ctl_incr').output.firstRow.fmtdt, '.csv')}',
	'@{activity('lkp_ctl_incr').output.firstRow.dt_ini_incr}',
	'@{activity('lkp_ctl_incr').output.firstRow.dt_fim_incr}',
	1,
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
    ctrlArquivo = '@{concat(pipeline().parameters.pTabela, '_', activity('lkp_ctl_incr').output.firstRow.fmtdt, '.csv')}',
	ctrlDateIniIncr = '@{activity('lkp_ctl_incr').output.firstRow.dt_ini_incr}',
	ctrlDateFimIncr = '@{activity('lkp_ctl_incr').output.firstRow.dt_fim_incr}',
	ctrlUpdate = getdate()
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

--
--
update tgt.FormaDeExecucao
    set
	ctrlAtivo = 0,
	ctrlArquivo = '@{concat(pipeline().parameters.pTabela, '_', activity('lkp_ctl_incr').output.firstRow.fmtdt, '.csv')}',
	ctrlDateIniIncr = '@{activity('lkp_ctl_incr').output.firstRow.dt_ini_incr}',
	ctrlDateFimIncr = '@{activity('lkp_ctl_incr').output.firstRow.dt_fim_incr}',
	ctrlDelete = getdate()
from 
    stg.FormaDeExecucao stg left join tgt.FormaDeExecucao tgt
    on stg.Id = tgt.Id
where 
    tgt.Id is not null
	and 
	stg.logAcao = 'Excluir'
--
;