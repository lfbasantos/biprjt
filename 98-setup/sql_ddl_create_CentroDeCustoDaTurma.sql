--
--
CREATE TABLE [stg].[CentroDeCustoDaTurma](
	[Id] [int] NOT NULL,
	[TurmaId] [int] NOT NULL,
	[CodigoDoCentroDeCusto] [nvarchar](25) NOT NULL,
	[DataDeEncerramento] [datetime2](7) NULL,
	[RecursoFinanceiroId] [int] NOT NULL,
	[Enviado] [bit] NOT NULL,
	[DescricaoDoCentroDeCusto] [nvarchar](150) NULL
) 
--
;

--
--
CREATE TABLE [tgt].[CentroDeCustoDaTurma](
	[Id] [int] NOT NULL,
	[TurmaId] [int] NOT NULL,
	[CodigoDoCentroDeCusto] [nvarchar](25) NOT NULL,
	[DataDeEncerramento] [datetime2](7) NULL,
	[RecursoFinanceiroId] [int] NOT NULL,
	[Enviado] [bit] NOT NULL,
	[DescricaoDoCentroDeCusto] [nvarchar](150) NULL,
    [ctrlArquivo] varchar(255) null,
	[ctrlDateIniIncr] datetime null,
	[ctrlDateFimIncr] datetime null    
) 
--
;