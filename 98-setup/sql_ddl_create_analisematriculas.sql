--
--
CREATE TABLE [tgt].[analise_matriculas](
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