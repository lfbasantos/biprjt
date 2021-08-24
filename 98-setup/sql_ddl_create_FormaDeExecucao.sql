--
--
CREATE TABLE stg.FormaDeExecucao(
	Id bigint NOT NULL,
	Nome nvarchar(50) NOT NULL,
	Cor nvarchar(10) NULL,
	LogAcao nvarchar(10) NOT NULL
) 
--
;

--
--
CREATE TABLE tgt.FormaDeExecucao(
	Id bigint NOT NULL,
	Nome nvarchar(50) NOT NULL,
	Cor nvarchar(10) NULL,
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