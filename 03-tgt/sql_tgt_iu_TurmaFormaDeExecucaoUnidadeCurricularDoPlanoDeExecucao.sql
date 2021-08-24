--
-- Insert
insert into tgt.TurmaFormaDeExecucaoUnidadeCurricularDoPlanoDeExecucao
(
    [Id],
	[NomeFormaDeExecucao],
	[FormaDeExecucaoId] ,
	[TipoCombinacaoDaFormaDeExecucao],
	[ComportamentoDaFormaDeExecucao],
	[FormaDeExecucaoDaUnidadeCurricularDoPlanoDeExecucaoOrigemId],
	[CargaHorariaMinima],
	[CargaHorariaMaxima] ,
	[CargaHorariaMaximaParaPagamentoDeProfissional] ,
	[UnidadeCurricularDoPlanoDoCursoId],
	[OfertaDoPlanoDoCursoUnidadeCurricularId],
	[TurmaPlanoDeExecucaoId],
	[OrdemDaOfertaDoPlanoDoCurso],
	[DataDeInicio],
	[DataDeTermino] 
    [ctrlArquivo],
	[ctrlDateIniIncr] 
	[ctrlDateFimIncr]
)
select
    stg.[Id],
	stg.[NomeFormaDeExecucao],
	stg.[FormaDeExecucaoId] ,
	stg.[TipoCombinacaoDaFormaDeExecucao],
	stg.[ComportamentoDaFormaDeExecucao],
	stg.[FormaDeExecucaoDaUnidadeCurricularDoPlanoDeExecucaoOrigemId],
	stg.[CargaHorariaMinima],
	stg.[CargaHorariaMaxima] ,
	stg.[CargaHorariaMaximaParaPagamentoDeProfissional] ,
	stg.[UnidadeCurricularDoPlanoDoCursoId],
	stg.[OfertaDoPlanoDoCursoUnidadeCurricularId],
	stg.[TurmaPlanoDeExecucaoId],
	stg.[OrdemDaOfertaDoPlanoDoCurso],
	stg.[DataDeInicio],
	stg.[DataDeTermino] 
    '[ctrlArquivo]',
	'[ctrlDateIniIncr]' 
	'[ctrlDateFimIncr]'
from
    stg.TurmaFormaDeExecucaoUnidadeCurricularDoPlanoDeExecucao stg left join tgt.TurmaFormaDeExecucaoUnidadeCurricularDoPlanoDeExecucao tgt
    on stg.Id = tgt.Id 
where 
    tgt.Id is null
--
;

--
-- Update
update tgt.TurmaFormaDeExecucaoUnidadeCurricularDoPlanoDeExecucao
set 
	[NomeFormaDeExecucao] = stg.[NomeFormaDeExecucao],
	[FormaDeExecucaoId] = stg.FormaDeExecucaoId,
	[TipoCombinacaoDaFormaDeExecucao] = stg.TipoCombinacaoDaFormaDeExecucao,
	[ComportamentoDaFormaDeExecucao] = stg.ComportamentoDaFormaDeExecucao,
	[FormaDeExecucaoDaUnidadeCurricularDoPlanoDeExecucaoOrigemId] = stg.FormaDeExecucaoDaUnidadeCurricularDoPlanoDeExecucaoOrigemId,
	[CargaHorariaMinima] = stg.CargaHorariaMinima,
	[CargaHorariaMaxima] = stg.CargaHorariaMaxima,
	[CargaHorariaMaximaParaPagamentoDeProfissional] = stg.CargaHorariaMaximaParaPagamentoDeProfissional,
	[UnidadeCurricularDoPlanoDoCursoId] = stg.UnidadeCurricularDoPlanoDoCursoId,
	[OfertaDoPlanoDoCursoUnidadeCurricularId] = stg.OfertaDoPlanoDoCursoUnidadeCurricularId,
	[TurmaPlanoDeExecucaoId] = stg.TurmaPlanoDeExecucaoId,
	[OrdemDaOfertaDoPlanoDoCurso] = stg.OrdemDaOfertaDoPlanoDoCurso,
	[DataDeInicio] = stg.DataDeInicio,
	[DataDeTermino] = stg.DataDeTermino
    [ctrlArquivo] = '',
	[ctrlDateIniIncr] = '' 
	[ctrlDateFimIncr] = ''
from
    stg.TurmaFormaDeExecucaoUnidadeCurricularDoPlanoDeExecucao stg left join tgt.TurmaFormaDeExecucaoUnidadeCurricularDoPlanoDeExecucao tgt
    on stg.Id = tgt.Id 
where 
    tgt.Id is not null
    and 
    (
        NomeFormaDeExecucao <> stg.NomeFormaDeExecucao or
        FormaDeExecucaoId <> stg.FormaDeExecucaoId or
        TipoCombinacaoDaFormaDeExecucao <> stg.TipoCombinacaoDaFormaDeExecucao or
        ComportamentoDaFormaDeExecucao <> stg.ComportamentoDaFormaDeExecucao or
        FormaDeExecucaoDaUnidadeCurricularDoPlanoDeExecucaoOrigemId <> stg.FormaDeExecucaoDaUnidadeCurricularDoPlanoDeExecucaoOrigemId or
        CargaHorariaMinima <> stg.CargaHorariaMinima or
        CargaHorariaMaxima <> stg.CargaHorariaMaxima or
        CargaHorariaMaximaParaPagamentoDeProfissional <> stg.CargaHorariaMaximaParaPagamentoDeProfissional or
        UnidadeCurricularDoPlanoDoCursoId <> stg.UnidadeCurricularDoPlanoDoCursoId or
        OfertaDoPlanoDoCursoUnidadeCurricularId <> stg.OfertaDoPlanoDoCursoUnidadeCurricularId or
        TurmaPlanoDeExecucaoId <> stg.TurmaPlanoDeExecucaoId or
        OrdemDaOfertaDoPlanoDoCurso <> stg.OrdemDaOfertaDoPlanoDoCurso or
        DataDeInicio <> stg.DataDeInicio or
        DataDeTermino <> stg.DataDeTermino
    )
--
;