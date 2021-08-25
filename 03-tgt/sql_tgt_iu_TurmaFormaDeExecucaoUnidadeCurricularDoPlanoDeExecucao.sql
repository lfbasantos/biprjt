--
-- Insert
insert into tgt.TurmaFormaDeExecucaoUnidadeCurricularDoPlanoDeExecucao
(
    Id,
	NomeFormaDeExecucao,
	FormaDeExecucaoId ,
	TipoCombinacaoDaFormaDeExecucao,
	ComportamentoDaFormaDeExecucao,
	FormaDeExecucaoDaUnidadeCurricularDoPlanoDeExecucaoOrigemId,
	CargaHorariaMinima,
	CargaHorariaMaxima ,
	CargaHorariaMaximaParaPagamentoDeProfissional ,
	UnidadeCurricularDoPlanoDoCursoId,
	OfertaDoPlanoDoCursoUnidadeCurricularId,
	TurmaPlanoDeExecucaoId,
	OrdemDaOfertaDoPlanoDoCurso,
	DataDeInicio,
	DataDeTermino,
    ctrlArquivo,
	ctrlDateIniIncr,
	ctrlDateFimIncr,
	ctrlAtivo,
	ctrlInsert
)
select
    stg.Id,
	stg.NomeFormaDeExecucao,
	stg.FormaDeExecucaoId ,
	stg.TipoCombinacaoDaFormaDeExecucao,
	stg.ComportamentoDaFormaDeExecucao,
	stg.FormaDeExecucaoDaUnidadeCurricularDoPlanoDeExecucaoOrigemId,
	stg.CargaHorariaMinima,
	stg.CargaHorariaMaxima ,
	stg.CargaHorariaMaximaParaPagamentoDeProfissional ,
	stg.UnidadeCurricularDoPlanoDoCursoId,
	stg.OfertaDoPlanoDoCursoUnidadeCurricularId,
	stg.TurmaPlanoDeExecucaoId,
	stg.OrdemDaOfertaDoPlanoDoCurso,
	stg.DataDeInicio,
	stg.DataDeTermino,
    '@{concat(pipeline().parameters.pTabela, '_', activity('lkp_ctl_incr').output.firstRow.fmtdt, '.csv')}',
	'@{activity('lkp_ctl_incr').output.firstRow.dt_ini_incr}',
	'@{activity('lkp_ctl_incr').output.firstRow.dt_fim_incr}',
	1,
	getdate()
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
	NomeFormaDeExecucao = stg.NomeFormaDeExecucao,
	FormaDeExecucaoId = stg.FormaDeExecucaoId,
	TipoCombinacaoDaFormaDeExecucao = stg.TipoCombinacaoDaFormaDeExecucao,
	ComportamentoDaFormaDeExecucao = stg.ComportamentoDaFormaDeExecucao,
	FormaDeExecucaoDaUnidadeCurricularDoPlanoDeExecucaoOrigemId = stg.FormaDeExecucaoDaUnidadeCurricularDoPlanoDeExecucaoOrigemId,
	CargaHorariaMinima = stg.CargaHorariaMinima,
	CargaHorariaMaxima = stg.CargaHorariaMaxima,
	CargaHorariaMaximaParaPagamentoDeProfissional = stg.CargaHorariaMaximaParaPagamentoDeProfissional,
	UnidadeCurricularDoPlanoDoCursoId = stg.UnidadeCurricularDoPlanoDoCursoId,
	OfertaDoPlanoDoCursoUnidadeCurricularId = stg.OfertaDoPlanoDoCursoUnidadeCurricularId,
	TurmaPlanoDeExecucaoId = stg.TurmaPlanoDeExecucaoId,
	OrdemDaOfertaDoPlanoDoCurso = stg.OrdemDaOfertaDoPlanoDoCurso,
	DataDeInicio = stg.DataDeInicio,
	DataDeTermino = stg.DataDeTermino,
    ctrlArquivo = '@{concat(pipeline().parameters.pTabela, '_', activity('lkp_ctl_incr').output.firstRow.fmtdt, '.csv')}',
	ctrlDateIniIncr = '@{activity('lkp_ctl_incr').output.firstRow.dt_ini_incr}',
	ctrlDateFimIncr = '@{activity('lkp_ctl_incr').output.firstRow.dt_fim_incr}',
	ctrlUpdate = getdate()
from
    stg.TurmaFormaDeExecucaoUnidadeCurricularDoPlanoDeExecucao stg left join tgt.TurmaFormaDeExecucaoUnidadeCurricularDoPlanoDeExecucao tgt
    on stg.Id = tgt.Id 
where 
    tgt.Id is not null
--
;



--
--
update tgt.TurmaFormaDeExecucaoUnidadeCurricularDoPlanoDeExecucao
    set
	ctrlAtivo = 0,
	ctrlArquivo = '@{concat(pipeline().parameters.pTabela, '_', activity('lkp_ctl_incr').output.firstRow.fmtdt, '.csv')}',
	ctrlDateIniIncr = '@{activity('lkp_ctl_incr').output.firstRow.dt_ini_incr}',
	ctrlDateFimIncr = '@{activity('lkp_ctl_incr').output.firstRow.dt_fim_incr}',
	ctrlDelete = getdate()
from 
    stg.TurmaFormaDeExecucaoUnidadeCurricularDoPlanoDeExecucao stg left join tgt.TurmaFormaDeExecucaoUnidadeCurricularDoPlanoDeExecucao tgt
    on stg.Id = tgt.Id
where 
    tgt.Id is not null
	and 
	stg.logAcao = 'Excluir'
--
;