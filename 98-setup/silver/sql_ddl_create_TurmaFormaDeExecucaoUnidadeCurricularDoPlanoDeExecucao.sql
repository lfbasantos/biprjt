--
-- 
CREATE TABLE stg.TurmaFormaDeExecucaoUnidadeCurricularDoPlanoDeExecucao(
	Id bigint NOT NULL,
	NomeFormaDeExecucao nvarchar(50) NOT NULL,
	FormaDeExecucaoId bigint NOT NULL,
	TipoCombinacaoDaFormaDeExecucao int NOT NULL,
	ComportamentoDaFormaDeExecucao int NOT NULL,
	FormaDeExecucaoDaUnidadeCurricularDoPlanoDeExecucaoOrigemId bigint NOT NULL,
	CargaHorariaMinima int NOT NULL,
	CargaHorariaMaxima int NOT NULL,
	CargaHorariaMaximaParaPagamentoDeProfissional int NULL,
	UnidadeCurricularDoPlanoDoCursoId bigint NOT NULL,
	OfertaDoPlanoDoCursoUnidadeCurricularId bigint NOT NULL,
	TurmaPlanoDeExecucaoId bigint NOT NULL,
	OrdemDaOfertaDoPlanoDoCurso int NOT NULL,
	DataDeInicio datetime2(7) NULL,
	DataDeTermino datetime2(7) NULL,
	LogAcao nvarchar(10) NOT NULL
) 
--
;

--
--
CREATE TABLE tgt.TurmaFormaDeExecucaoUnidadeCurricularDoPlanoDeExecucao(
	Id bigint NOT NULL,
	NomeFormaDeExecucao nvarchar(50) NOT NULL,
	FormaDeExecucaoId bigint NOT NULL,
	TipoCombinacaoDaFormaDeExecucao int NOT NULL,
	ComportamentoDaFormaDeExecucao int NOT NULL,
	FormaDeExecucaoDaUnidadeCurricularDoPlanoDeExecucaoOrigemId bigint NOT NULL,
	CargaHorariaMinima int NOT NULL,
	CargaHorariaMaxima int NOT NULL,
	CargaHorariaMaximaParaPagamentoDeProfissional int NULL,
	UnidadeCurricularDoPlanoDoCursoId bigint NOT NULL,
	OfertaDoPlanoDoCursoUnidadeCurricularId bigint NOT NULL,
	TurmaPlanoDeExecucaoId bigint NOT NULL,
	OrdemDaOfertaDoPlanoDoCurso int NOT NULL,
	DataDeInicio datetime2(7) NULL,
	DataDeTermino datetime2(7) NULL,
    ctrlArquivo varchar(255) null,
	ctrlDateIniIncr datetime null,
	ctrlDateFimIncr datetime null,
	ctrlAtivo smallint,
	ctrlInsert datetime null,
	ctrlUpdate datetime null,
	ctrlDelete datetime null 
) 
--
;