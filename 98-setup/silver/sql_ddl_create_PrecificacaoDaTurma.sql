--
-- 
CREATE TABLE stg.PrecificacaoDaTurma(
	Id bigint NOT NULL,
	RegionalId smallint NULL,
	TurmaId int NOT NULL,
	UnidadeOperativaId int NOT NULL,
	DataDeAlteracao datetime2(7) NOT NULL,
	ValorDoCurso decimal(18, 2) NOT NULL,
	ValorDoGmaha decimal(18, 2) NULL,
	TipoDePrecificacao int NOT NULL,
	OrigemDaPrecificacao int NOT NULL,
	LogAcao nvarchar(10) NOT NULL
)
--
;

--
--
CREATE TABLE tgt.PrecificacaoDaTurma(
	Id bigint NOT NULL,
	RegionalId smallint NULL,
	TurmaId int NOT NULL,
	UnidadeOperativaId int NOT NULL,
	DataDeAlteracao datetime2(7) NOT NULL,
	ValorDoCurso decimal(18, 2) NOT NULL,
	ValorDoGmaha decimal(18, 2) NULL,
	TipoDePrecificacao int NOT NULL,
	OrigemDaPrecificacao int NOT NULL,
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