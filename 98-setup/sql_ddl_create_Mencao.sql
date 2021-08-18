--
--
CREATE TABLE [stg].[Mencao](
	[Id] [int] NOT NULL,
	[RegionalId] [smallint] NULL,
	[CriterioDeAprovacao] [nvarchar](max) NOT NULL,
	[Descricao] [nvarchar](max) NOT NULL,
	[TipoMencao] [int] NOT NULL,
	[SiglaDaMencao] [nvarchar](max) NOT NULL,
	[Feedback] [bit] NOT NULL
) 
--
;

--
--
CREATE TABLE [tgt].[Mencao](
	[Id] [int] NOT NULL,
	[RegionalId] [smallint] NULL,
	[CriterioDeAprovacao] [nvarchar](max) NOT NULL,
	[Descricao] [nvarchar](max) NOT NULL,
	[TipoMencao] [int] NOT NULL,
	[SiglaDaMencao] [nvarchar](max) NOT NULL,
	[Feedback] [bit] NOT NULL,
    [ctrlArquivo] varchar(255) null,
	[ctrlDateIniIncr] datetime null,
	[ctrlDateFimIncr] datetime null    
) 
--
;