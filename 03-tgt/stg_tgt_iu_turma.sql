--
--
insert into tgt.Turma
(
    Id,
	RegionalId,
	CodigoDaTurma,
	NomeUnidadeOperativa,
	NomeTurma,
	Sigla,
	AnoExercicio,
	DivulgacaoOnline,
	DivulgacaoComMatriculaOnline,
	DataDeEncerramentoPresencial,
	DataDeEncerramentoOnline,
	TotalVagas,
	DataPeriodoExecucaoInicial,
	DataPeriodoExecucaoFinal,
	PlanoDoCursoId,
	TurmaPlanejada,
	UnidadeOperativaId,
	Situacao,
	Estado,
	QuadroDeAcaoId,
	CidadeId,
	TurmaPlanejadaId,
	CargaHoraria,
	RegimentoDeAvaliacaoId,
	DistribuirDiasLetivosParaUnidadeCurricularDoTipoPratica,
	DistribuirDiasLetivosParaUnidadeCurricularDoTipoPraticaAprendizagem,
	CodigoFormatado,
	DataTerminoInformativoContrato,
	DataCriacaoDaTurma,
	IdLegado,
	IgnorarValidacaoDiario,
	CargaHorariaCompleta,
	DataAtualizacao,
	IntegrarOffice365,
	ComplementoDoNomeDaTurma,
	InCompany,
	PlanoDoCursoDrDesatualizado,
	EscolaAberta,
	PeriodoDeExecucacaoFoiInformadoManualmente,
    ctrlArquivo,
	ctrlDateIniIncr,
	ctrlDateFimIncr,
	ctrlAtivo,
	ctrlInsert
)
select 
    stg.Id,
	stg.RegionalId,
	stg.CodigoDaTurma,
	stg.NomeUnidadeOperativa,
	stg.NomeTurma,
	stg.Sigla,
	stg.AnoExercicio,
	stg.DivulgacaoOnline,
	stg.DivulgacaoComMatriculaOnline,
	stg.DataDeEncerramentoPresencial,
	stg.DataDeEncerramentoOnline,
	stg.TotalVagas,
	stg.DataPeriodoExecucaoInicial,
	stg.DataPeriodoExecucaoFinal,
	stg.PlanoDoCursoId,
	stg.TurmaPlanejada,
	stg.UnidadeOperativaId,
	stg.Situacao,
	stg.Estado,
	stg.QuadroDeAcaoId,
	stg.CidadeId,
	stg.TurmaPlanejadaId,
	stg.CargaHoraria,
	stg.RegimentoDeAvaliacaoId,
	stg.DistribuirDiasLetivosParaUnidadeCurricularDoTipoPratica,
	stg.DistribuirDiasLetivosParaUnidadeCurricularDoTipoPraticaAprendizagem,
	stg.CodigoFormatado,
	stg.DataTerminoInformativoContrato,
	stg.DataCriacaoDaTurma,
	stg.IdLegado,
	stg.IgnorarValidacaoDiario,
	stg.CargaHorariaCompleta,
	stg.DataAtualizacao,
	stg.IntegrarOffice365,
	stg.ComplementoDoNomeDaTurma,
	stg.InCompany,
	stg.PlanoDoCursoDrDesatualizado,
	stg.EscolaAberta,
	stg.PeriodoDeExecucacaoFoiInformadoManualmente,
    '@{concat(pipeline().parameters.pTabela, '_', activity('lkp_ctl_incr').output.firstRow.fmtdt, '.csv')}',
	'@{activity('lkp_ctl_incr').output.firstRow.dt_ini_incr}',
	'@{activity('lkp_ctl_incr').output.firstRow.dt_fim_incr}',
	1,
	getdate()
from    
    stg.turma stg left join tgt.turma tgt
    on stg.Id = tgt.Id 
where 
    tgt.Id is null
--
;

--
--
update tgt.turma 
set 
		
	RegionalId=stg.RegionalId,
	CodigoDaTurma=stg.CodigoDaTurma,
	NomeUnidadeOperativa=stg.NomeUnidadeOperativa,
	NomeTurma=stg.NomeTurma,
	Sigla=stg.Sigla,
	AnoExercicio=stg.AnoExercicio,
	DivulgacaoOnline=stg.DivulgacaoOnline,
	DivulgacaoComMatriculaOnline=stg.DivulgacaoComMatriculaOnline,
	DataDeEncerramentoPresencial=stg.DataDeEncerramentoPresencial,
	DataDeEncerramentoOnline=stg.DataDeEncerramentoOnline,
	TotalVagas=stg.TotalVagas,
	DataPeriodoExecucaoInicial=stg.DataPeriodoExecucaoInicial,
	DataPeriodoExecucaoFinal=stg.DataPeriodoExecucaoFinal,
	PlanoDoCursoId=stg.PlanoDoCursoId,
	TurmaPlanejada=stg.TurmaPlanejada,
	UnidadeOperativaId=stg.UnidadeOperativaId,
	Situacao=stg.Situacao,
	Estado=stg.Estado,
	QuadroDeAcaoId=stg.QuadroDeAcaoId,
	CidadeId=stg.CidadeId,
	TurmaPlanejadaId=stg.TurmaPlanejadaId,
	CargaHoraria=stg.CargaHoraria,
	RegimentoDeAvaliacaoId=stg.RegimentoDeAvaliacaoId,
	DistribuirDiasLetivosParaUnidadeCurricularDoTipoPratica=stg.DistribuirDiasLetivosParaUnidadeCurricularDoTipoPratica,
	DistribuirDiasLetivosParaUnidadeCurricularDoTipoPraticaAprendizagem=stg.DistribuirDiasLetivosParaUnidadeCurricularDoTipoPraticaAprendizagem,
	CodigoFormatado=stg.CodigoFormatado,
	DataTerminoInformativoContrato=stg.DataTerminoInformativoContrato,
	DataCriacaoDaTurma=stg.DataCriacaoDaTurma,
	IdLegado=stg.IdLegado,
	IgnorarValidacaoDiario=stg.IgnorarValidacaoDiario,
	CargaHorariaCompleta=stg.CargaHorariaCompleta,
	DataAtualizacao=stg.DataAtualizacao,
	IntegrarOffice365=stg.IntegrarOffice365,
	ComplementoDoNomeDaTurma=stg.ComplementoDoNomeDaTurma,
	InCompany=stg.InCompany,
	PlanoDoCursoDrDesatualizado=stg.PlanoDoCursoDrDesatualizado,
	EscolaAberta=stg.EscolaAberta,
	PeriodoDeExecucacaoFoiInformadoManualmente=stg.PeriodoDeExecucacaoFoiInformadoManualmente,
    ctrlArquivo = '@{concat(pipeline().parameters.pTabela, '_', activity('lkp_ctl_incr').output.firstRow.fmtdt, '.csv')}',
	ctrlDateIniIncr = '@{activity('lkp_ctl_incr').output.firstRow.dt_ini_incr}',
	ctrlDateFimIncr = '@{activity('lkp_ctl_incr').output.firstRow.dt_fim_incr}',
	ctrlUpdate = getdate()
from    
    stg.turma stg left join tgt.turma tgt
    on stg.Id = tgt.Id 
where 
    tgt.Id is not null
--
;


--
--
update tgt.turma
    set
	ctrlAtivo = 0,
	ctrlArquivo = '@{concat(pipeline().parameters.pTabela, '_', activity('lkp_ctl_incr').output.firstRow.fmtdt, '.csv')}',
	ctrlDateIniIncr = '@{activity('lkp_ctl_incr').output.firstRow.dt_ini_incr}',
	ctrlDateFimIncr = '@{activity('lkp_ctl_incr').output.firstRow.dt_fim_incr}',
	ctrlDelete = getdate()
from 
    stg.turma stg left join tgt.turma tgt
    on stg.Id = tgt.Id
where 
    tgt.Id is not null
	and 
	stg.logAcao = 'Excluir'
--
;