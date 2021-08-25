--
--
insert into tgt.CentroDeCustoDaTurma
(
    Id,
	TurmaId,
	CodigoDoCentroDeCusto,
	DataDeEncerramento,
	RecursoFinanceiroId,
	Enviado,
	DescricaoDoCentroDeCusto,
    ctrlArquivo,
	ctrlDateIniIncr,
	ctrlDateFimIncr,
	ctrlAtivo,
	ctrlInsert
)
select 
	stg.Id,
	stg.TurmaId,
	stg.CodigoDoCentroDeCusto,
	stg.DataDeEncerramento,
	stg.RecursoFinanceiroId,
	stg.Enviado,
	stg.DescricaoDoCentroDeCusto,
    '@{concat(pipeline().parameters.pTabela, '_', activity('lkp_ctl_incr').output.firstRow.fmtdt, '.csv')}',
	'@{activity('lkp_ctl_incr').output.firstRow.dt_ini_incr}',
	'@{activity('lkp_ctl_incr').output.firstRow.dt_fim_incr}',
	1,
	getdate()
from 
    stg.CentroDeCustoDaTurma stg left join tgt.CentroDeCustoDaTurma tgt 
    on stg.Id = tgt.Id 
where
    tgt.Id is null 
--
;

--
--
update tgt.CentroDeCustoDaTurma
set 
	TurmaId=stg.TurmaId,
	CodigoDoCentroDeCusto=stg.CodigoDoCentroDeCusto,
	DataDeEncerramento=stg.DataDeEncerramento,
	RecursoFinanceiroId=stg.RecursoFinanceiroId,
	Enviado=stg.Enviado,
	DescricaoDoCentroDeCusto=stg.DescricaoDoCentroDeCusto,
    ctrlArquivo = '@{concat(pipeline().parameters.pTabela, '_', activity('lkp_ctl_incr').output.firstRow.fmtdt, '.csv')}',
	ctrlDateIniIncr = '@{activity('lkp_ctl_incr').output.firstRow.dt_ini_incr}',
	ctrlDateFimIncr = '@{activity('lkp_ctl_incr').output.firstRow.dt_fim_incr}',
	ctrlUpdate = getdate()
from 
    stg.CentroDeCustoDaTurma stg left join tgt.CentroDeCustoDaTurma tgt 
    on stg.Id = tgt.Id 
where
    tgt.Id is not null 
    and
    (
        tgt.TurmaId<>stg.TurmaId or
        tgt.CodigoDoCentroDeCusto<>stg.CodigoDoCentroDeCusto or
        tgt.DataDeEncerramento<>stg.DataDeEncerramento or
        tgt.RecursoFinanceiroId<>stg.RecursoFinanceiroId or
        tgt.Enviado<>stg.Enviado or
        tgt.DescricaoDoCentroDeCusto<>stg.DescricaoDoCentroDeCusto
    )
--
;

--
--
update tgt.CentroDeCustoDaTurma
    set
	ctrlAtivo = 0,
	ctrlArquivo = '@{concat(pipeline().parameters.pTabela, '_', activity('lkp_ctl_incr').output.firstRow.fmtdt, '.csv')}',
	ctrlDateIniIncr = '@{activity('lkp_ctl_incr').output.firstRow.dt_ini_incr}',
	ctrlDateFimIncr = '@{activity('lkp_ctl_incr').output.firstRow.dt_fim_incr}',
	ctrlDelete = getdate()
from 
    stg.CentroDeCustoDaTurma stg left join tgt.CentroDeCustoDaTurma tgt
    on stg.Id = tgt.Id
where 
    tgt.Id is not null
	and 
	stg.logAcao = 'Excluir'
--
;