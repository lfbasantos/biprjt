--
--
insert into tgt.RecursoFinanceiro
(
	Id,
	RegionalId,
	Nome ,
	TipoDeRecurso,
	FonteDeRecursoPSG,
	Situacao,
	Nacional ,
	RecursoFinanceiroNacionalId,
    ctrlArquivo,
	ctrlDateIniIncr,
	ctrlDateFimIncr,
	ctrlAtivo,
	ctrlInsert
)
select
    stg.Id,
	stg.RegionalId,
	stg.Nome,
	stg.TipoDeRecurso,
	stg.FonteDeRecursoPSG,
	stg.Situacao,
	stg.Nacional,
	stg.RecursoFinanceiroNacionalId,
    '@{concat(pipeline().parameters.pTabela, '_', activity('lkp_ctl_incr').output.firstRow.fmtdt, '.csv')}',
	'@{activity('lkp_ctl_incr').output.firstRow.dt_ini_incr}',
	'@{activity('lkp_ctl_incr').output.firstRow.dt_fim_incr}',
	1,
	getdate()
from
    stg.RecursoFinanceiro stg left join tgt.RecursoFinanceiro tgt 
    on stg.Id = tgt.Id 
where 
    tgt.Id is null 
--
;


--
--
update tgt.RecursoFinanceiro
set 
    RegionalId=stg.RegionalId,
	Nome=stg.Nome,
	TipoDeRecurso=stg.TipoDeRecurso,
	FonteDeRecursoPSG=stg.FonteDeRecursoPSG,
	Situacao=stg.Situacao,
	Nacional=stg.Nacional,
	RecursoFinanceiroNacionalId=stg.RecursoFinanceiroNacionalId,
    ctrlArquivo = '',
	ctrlDateIniIncr = getdate(),
	ctrlDateFimIncr = getdate()
from
    stg.RecursoFinanceiro stg left join tgt.RecursoFinanceiro tgt 
    on stg.Id = tgt.Id 
where 
    tgt.Id is not null 
    and
    (
        tgt.RegionalId<>stg.RegionalId or
        tgt.Nome<>stg.Nome or
        tgt.TipoDeRecurso<>stg.TipoDeRecurso or
        tgt.FonteDeRecursoPSG<>stg.FonteDeRecursoPSG or
        tgt.Situacao<>stg.Situacao or
        tgt.Nacional<>stg.Nacional or
        tgt.RecursoFinanceiroNacionalId<>stg.RecursoFinanceiroNacionalId
    )
--
;