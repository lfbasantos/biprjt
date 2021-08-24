--
--
CREATE TABLE stg.TurmaPlanoDeExecucao(
	Id bigint  NOT NULL,
	PlanoDeExecucaoOrigemId bigint NOT NULL,
	Nome nvarchar(75) NOT NULL,
	Ordem int NOT NULL,
	TurmaId int NOT NULL,
	Selecionado bit NOT NULL,
	LogAcao nvarchar(10) NOT NULL
) 
--
;

--
--
CREATE TABLE tgt.TurmaPlanoDeExecucao(
	Id bigint NOT NULL,
	PlanoDeExecucaoOrigemId bigint NOT NULL,
	Nome nvarchar(75) NOT NULL,
	Ordem int NOT NULL,
	TurmaId int NOT NULL,
	Selecionado bit NOT NULL,
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