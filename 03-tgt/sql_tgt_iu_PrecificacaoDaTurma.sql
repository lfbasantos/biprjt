--
--
insert into tgt.PrecificacaoDaTurma
(
    Id,
	RegionalId,
	TurmaId,
	UnidadeOperativaId,
	DataDeAlteracao,
	ValorDoCurso,
	ValorDoGmaha,
	TipoDePrecificacao,
	OrigemDaPrecificacao,
	ctrlArquivo,
	ctrlDateIniIncr,
	ctrlDateFimIncr,
	ctrlAtivo,
	ctrlInsert
)
select 
	stg.Id,
	stg.RegionalId,
	stg.TurmaId,
	stg.UnidadeOperativaId,
	stg.DataDeAlteracao,
	stg.ValorDoCurso,
	stg.ValorDoGmaha,
	stg.TipoDePrecificacao,
	stg.OrigemDaPrecificacao,
	'@{concat(pipeline().parameters.pTabela, '_', activity('lkp_ctl_incr').output.firstRow.fmtdt, '.csv')}',
	'@{activity('lkp_ctl_incr').output.firstRow.dt_ini_incr}',
	'@{activity('lkp_ctl_incr').output.firstRow.dt_fim_incr}',
	1,
	getdate()
from 
    stg.PrecificacaoDaTurma stg left join tgt.PrecificacaoDaTurma tgt 
    on stg.Id = tgt.Id
where 
    tgt.Id is null 
--
;


--
--
update tgt.PrecificacaoDaTurma 
set 
    RegionalId=stg.RegionalId,
	TurmaId=stg.TurmaId,
	UnidadeOperativaId=stg.UnidadeOperativaId,
	DataDeAlteracao=stg.DataDeAlteracao,
	ValorDoCurso=stg.ValorDoCurso,
	ValorDoGmaha=stg.ValorDoGmaha,
	TipoDePrecificacao=stg.TipoDePrecificacao,
	OrigemDaPrecificacao=stg.OrigemDaPrecificacao,
	ctrlArquivo='',
	ctrlDateIniIncr=getdate(),
	ctrlDateFimIncr=getdate()
from 
    stg.PrecificacaoDaTurma stg left join tgt.PrecificacaoDaTurma tgt 
    on stg.Id = tgt.Id
where 
    tgt.Id is not null 
--
;