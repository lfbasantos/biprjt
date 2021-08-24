--
-- drop table stg.estadodamatriculara
CREATE TABLE stg.EstadoDaMatriculaRA(
	Id int NOT NULL,
	RegionalId smallint NULL,
	MatriculaId bigint NOT NULL,
	EstadoDaMatriculaId int NOT NULL,
	UsuarioId bigint NOT NULL,
	DataDeOcorrencia date NOT NULL,
	DataDeLancamento datetime2(7) NOT NULL,
	MotivoId bigint NULL,
	RequerimentoId bigint NULL,
	GeradoManualmente bit NOT NULL,
	Justificativa nvarchar(max) NULL,
	EstadoOriginadoDeUmaTransferenciaInterna bit NOT NULL,
	LogAcao nvarchar(10) NOT NULL
)
--
;

--
-- drop table tgt.estadodamatriculara
CREATE TABLE tgt.EstadoDaMatriculaRA(
	Id int NOT NULL,
	RegionalId smallint NULL,
	MatriculaId bigint NOT NULL,
	EstadoDaMatriculaId int NOT NULL,
	UsuarioId bigint NOT NULL,
	DataDeOcorrencia date NOT NULL,
	DataDeLancamento datetime2(7) NOT NULL,
	MotivoId bigint NULL,
	RequerimentoId bigint NULL,
	GeradoManualmente bit NOT NULL,
	Justificativa nvarchar(max) NULL,
	EstadoOriginadoDeUmaTransferenciaInterna bit NOT NULL,
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