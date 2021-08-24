--
--
insert into tgt.CentroDeCustoDaTurma
(
    [Id],
	[TurmaId],
	[CodigoDoCentroDeCusto],
	[DataDeEncerramento],
	[RecursoFinanceiroId],
	[Enviado],
	[DescricaoDoCentroDeCusto],
    [ctrlArquivo],
	[ctrlDateIniIncr],
	[ctrlDateFimIncr]
)
select 
	stg.Id,
	stg.TurmaId,
	stg.CodigoDoCentroDeCusto,
	stg.DataDeEncerramento,
	stg.RecursoFinanceiroId,
	stg.Enviado,
	stg.DescricaoDoCentroDeCusto,
    '',
	getdate(),
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
    ctrlArquivo='',
	ctrlDateIniIncr=getdate(),
	ctrlDateFimIncr=getdate()
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