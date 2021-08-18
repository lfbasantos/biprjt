--
--
CREATE TABLE [stg].[Contrato](
	[Id] [bigint]  NOT NULL,
	[RegionalId] [smallint] NULL,
	[RecursoFinanceiroId] [int] NOT NULL,
	[TipoDoResponsavel] [int] NOT NULL,
	[ResponsavelPessoaFisicaId] [bigint] NULL,
	[ResponsavelPessoaJuridicaId] [int] NULL,
	[UnidadeOperativaId] [int] NOT NULL,
	[UsuarioId] [bigint] NOT NULL,
	[Numero] [int] NOT NULL,
	[Ano] [int] NOT NULL,
	[DataDeCadastro] [date] NOT NULL,
	[Situacao] [int] NOT NULL,
	[VigenciaInicial] [date] NOT NULL,
	[VigenciaFinal] [date] NOT NULL,
	[Descricao] [nvarchar](250) NULL,
	[ObservacaoDaAlteracao] [nvarchar](250) NULL,
	[PercentualParaDevolucao] [decimal](18, 2) NULL,
	[PermiteDevolucao] [bit] NULL,
	[PermiteMatriculaAposConsumoDoSaldo] [bit] NULL,
	[TipoDeContrato] [int] NULL,
	[ValorDoContrato] [decimal](18, 2) NULL,
	[DataCancelamento] [datetime2](7) NULL,
	[JustificativaCancelamento] [nvarchar](500) NULL,
	[UsuarioCancelamentoId] [bigint] NULL,
	[ValorDaDispensaDeUnidadeCurricular] [decimal](18, 2) NULL,
	[NumeroAmigavel] [nvarchar](20) NOT NULL,
	[IdLegado] [nvarchar](75) NULL,
	[JustificativaDeRescisao] [nvarchar](600) NULL,
	[EmailResponsavelPesquisaSatisfacao] [nvarchar](250) NULL,
	[NomeResponsavelPesquisaSatisfacao] [nvarchar](250) NULL
) 
--
;

--
--
CREATE TABLE [tgt].[Contrato](
	[Id] [bigint]  NOT NULL,
	[RegionalId] [smallint] NULL,
	[RecursoFinanceiroId] [int] NOT NULL,
	[TipoDoResponsavel] [int] NOT NULL,
	[ResponsavelPessoaFisicaId] [bigint] NULL,
	[ResponsavelPessoaJuridicaId] [int] NULL,
	[UnidadeOperativaId] [int] NOT NULL,
	[UsuarioId] [bigint] NOT NULL,
	[Numero] [int] NOT NULL,
	[Ano] [int] NOT NULL,
	[DataDeCadastro] [date] NOT NULL,
	[Situacao] [int] NOT NULL,
	[VigenciaInicial] [date] NOT NULL,
	[VigenciaFinal] [date] NOT NULL,
	[Descricao] [nvarchar](250) NULL,
	[ObservacaoDaAlteracao] [nvarchar](250) NULL,
	[PercentualParaDevolucao] [decimal](18, 2) NULL,
	[PermiteDevolucao] [bit] NULL,
	[PermiteMatriculaAposConsumoDoSaldo] [bit] NULL,
	[TipoDeContrato] [int] NULL,
	[ValorDoContrato] [decimal](18, 2) NULL,
	[DataCancelamento] [datetime2](7) NULL,
	[JustificativaCancelamento] [nvarchar](500) NULL,
	[UsuarioCancelamentoId] [bigint] NULL,
	[ValorDaDispensaDeUnidadeCurricular] [decimal](18, 2) NULL,
	[NumeroAmigavel] [nvarchar](20) NOT NULL,
	[IdLegado] [nvarchar](75) NULL,
	[JustificativaDeRescisao] [nvarchar](600) NULL,
	[EmailResponsavelPesquisaSatisfacao] [nvarchar](250) NULL,
	[NomeResponsavelPesquisaSatisfacao] [nvarchar](250) NULL,
    [ctrlArquivo] varchar(255) null,
	[ctrlDateIniIncr] datetime null,
	[ctrlDateFimIncr] datetime null    
) 
--
;