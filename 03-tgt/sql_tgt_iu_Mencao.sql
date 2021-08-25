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
	ctrlDateFimIncr,
	ctrlAtivo,
	ctrlInsert
)
select 
    stg.Id,
	stg.RegionalId,
	stg.CriterioDeAprovacao,
	stg.Descricao,
	stg.TipoMencao ,
	stg.SiglaDaMencao,
	stg.Feedback ,
    '@{concat(pipeline().parameters.pTabela, '_', activity('lkp_ctl_incr').output.firstRow.fmtdt, '.csv')}',
	'@{activity('lkp_ctl_incr').output.firstRow.dt_ini_incr}',
	'@{activity('lkp_ctl_incr').output.firstRow.dt_fim_incr}',
	1,
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
    ctrlArquivo = '@{concat(pipeline().parameters.pTabela, '_', activity('lkp_ctl_incr').output.firstRow.fmtdt, '.csv')}',
	ctrlDateIniIncr = '@{activity('lkp_ctl_incr').output.firstRow.dt_ini_incr}',
	ctrlDateFimIncr = '@{activity('lkp_ctl_incr').output.firstRow.dt_fim_incr}',
	ctrlUpdate = getdate()
from 
    stg.Mencao stg left join tgt.Mencao tgt
    on stg.Id = tgt.Id
where 
    tgt.Id is not null
--
;

--
--
update tgt.Mencao
    set
	ctrlAtivo = 0,
	ctrlArquivo = '@{concat(pipeline().parameters.pTabela, '_', activity('lkp_ctl_incr').output.firstRow.fmtdt, '.csv')}',
	ctrlDateIniIncr = '@{activity('lkp_ctl_incr').output.firstRow.dt_ini_incr}',
	ctrlDateFimIncr = '@{activity('lkp_ctl_incr').output.firstRow.dt_fim_incr}',
	ctrlDelete = getdate()
from 
    stg.Mencao stg left join tgt.Mencao tgt
    on stg.Id = tgt.Id
where 
    tgt.Id is not null
	and 
	stg.logAcao = 'Excluir'
--
;