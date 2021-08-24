--
-- drop table [sigbi].[Analise_Matriculas] 
CREATE TABLE [sigbi].[Analise_Matriculas](
	[MatriculaId] [bigint] NOT NULL,
	[TurmaId] [int] NOT NULL,
	[RegionalId] [smallint] NULL,
	[UnidadeOperativaid] [int] NOT NULL,
	[ContratoId] [bigint] NOT NULL,
	[NumeroDaMatricula] [bigint] NOT NULL,
	[MatriculaNumeroAmigavel] [nvarchar](20) NOT NULL,
	[ValorDoCurso] [decimal](18, 2) NULL,
	[Origem] [varchar](20) NOT NULL,
	[AlunoId] [bigint] NOT NULL,
	[DataMatricula] [datetime2](7) NULL,
	[SituacaoMatricula] [nvarchar](40) NULL,
	[CanalNome] [nvarchar](150) NULL,
	[RecursoFinanceiroMatriculaId] [int] NULL,
	[RecursoFinanceiroMatriculaDR] [nvarchar](75) NULL,
	[RecursoFinanceiroMatriculaDN] [nvarchar](75) NULL,
	[MencaoNome] [nvarchar](max) NULL,
	[DescricaoDoCentroDeCusto] [nvarchar](150) NULL,
	[NomeFormaDeExecucao] [varchar](max) NULL
) 
--
;

--
--
CREATE NONCLUSTERED INDEX [Idx_Analise_Matriculas_MatriculaId] ON [sigbi].[Analise_Matriculas]
(
	[MatriculaId] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 95) 
--
;


--
--
CREATE NONCLUSTERED INDEX [Idx_Analise_Matriculas_TurmaId] ON [sigbi].[Analise_Matriculas]
(
	[TurmaId] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 95) 
--
;

--
--
CREATE NONCLUSTERED INDEX [Idx_Analise_Matriculas_RegionalId] ON [sigbi].[Analise_Matriculas]
(
	[RegionalId] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 95) 
--
;

--
--
CREATE NONCLUSTERED INDEX [Idx_Analise_Matriculas_ContratoId] ON [sigbi].[Analise_Matriculas]
(
	[ContratoId] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 95) 
--
;

--
--
CREATE NONCLUSTERED INDEX [Idx_Analise_Matriculas_AlunoId] ON [sigbi].[Analise_Matriculas]
(
	[AlunoId] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 95) 
--
;
