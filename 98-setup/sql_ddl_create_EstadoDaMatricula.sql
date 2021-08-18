--
--
CREATE TABLE [stg].[EstadoDaMatricula](
	[Id] [int] NOT NULL,
	[RegionalId] [smallint] NULL,
	[Nome] [nvarchar](40) NOT NULL,
	[Descricao] [nvarchar](250) NOT NULL,
	[Aplicacao] [int] NOT NULL,
	[TipoMencaoDoEstado] [int] NULL,
	[CalculaCargaHorariaExecutada] [bit] NOT NULL,
	[Tipo] [int] NOT NULL,
	[OperadorFinanceiro] [int] NULL
)
--
;

--
--
CREATE TABLE [tgt].[EstadoDaMatricula](
	[Id] [int] NOT NULL,
	[RegionalId] [smallint] NULL,
	[Nome] [nvarchar](40) NOT NULL,
	[Descricao] [nvarchar](250) NOT NULL,
	[Aplicacao] [int] NOT NULL,
	[TipoMencaoDoEstado] [int] NULL,
	[CalculaCargaHorariaExecutada] [bit] NOT NULL,
	[Tipo] [int] NOT NULL,
	[OperadorFinanceiro] [int] NULL,
    [ctrlArquivo] varchar(255) null,
	[ctrlDateIniIncr] datetime null,
	[ctrlDateFimIncr] datetime null
)
--
;