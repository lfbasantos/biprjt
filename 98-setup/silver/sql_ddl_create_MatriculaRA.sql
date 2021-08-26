--
-- drop table tgt.MatriculaRA
CREATE TABLE stg.MatriculaRA (
	Id bigint NOT NULL,
	TurmaMatriculadaId int NOT NULL,
	RecursoFinanceiroUtilizadoId int NOT NULL,
	ContratoId bigint NOT NULL,
	NumeroDaMatricula bigint NOT NULL,
	NumeroAmigavel nvarchar(20) NOT NULL,
	Origem int NOT NULL,
	PessoaFisicaId bigint NOT NULL,
	NecessitaDeAssistencia bit NOT NULL,
	ObservacaoSobreAssistencia nvarchar(250) NULL,
	CanalId int NOT NULL,
	Ano int NOT NULL,
	CodigoDeAutenticacaoDoDiploma nvarchar(40) NULL,
	NumeroDoCertificadoDiploma nvarchar(250) NULL,
	MencaoId int NULL,
	QuantidadeTotalDeFaltas int NOT NULL,
	NotificacaoDeMatriculaEnviada bit NULL,
	CadastroMatriculaCompleto bit NULL,
	PessoaJuridicaDaPraticaDeAprendizagemId int NULL,
	PessoaFisicaDaPraticaDeAprendizagemId bigint NULL,
	PercentualCargaHorariaUltimaPesquisaDeSatisfacaoEnviada int NULL,
	PesquisaDeSatisfacaoPJEnviada bit NOT NULL,
	LogAcao nvarchar(10) NOT NULL
) 
--
;

--
-- drop table  tgt.MatriculaRA
CREATE TABLE tgt.MatriculaRA(
	Id bigint NOT NULL,
	TurmaMatriculadaId int NOT NULL,
	RecursoFinanceiroUtilizadoId int NOT NULL,
	ContratoId bigint NOT NULL,
	NumeroDaMatricula bigint NOT NULL,
	NumeroAmigavel nvarchar(20) NOT NULL,
	Origem int NOT NULL,
	PessoaFisicaId bigint NOT NULL,
	NecessitaDeAssistencia bit NOT NULL,
	ObservacaoSobreAssistencia nvarchar(250) NULL,
	CanalId int NOT NULL,
	Ano int NOT NULL,
	CodigoDeAutenticacaoDoDiploma nvarchar(40) NULL,
	NumeroDoCertificadoDiploma nvarchar(250) NULL,
	MencaoId int NULL,
	QuantidadeTotalDeFaltas int NOT NULL,
	NotificacaoDeMatriculaEnviada bit NULL,
	CadastroMatriculaCompleto bit NULL,
	PessoaJuridicaDaPraticaDeAprendizagemId int NULL,
	PessoaFisicaDaPraticaDeAprendizagemId bigint NULL,
	PercentualCargaHorariaUltimaPesquisaDeSatisfacaoEnviada int NULL,
	PesquisaDeSatisfacaoPJEnviada bit NOT NULL,
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