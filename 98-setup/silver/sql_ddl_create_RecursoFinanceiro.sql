--
-- 
CREATE TABLE stg.RecursoFinanceiro(
	Id int  NOT NULL,
	RegionalId smallint NULL,
	Nome nvarchar(75) NOT NULL,
	TipoDeRecurso int NULL,
	FonteDeRecursoPSG bit NOT NULL,
	Situacao bit NOT NULL,
	Nacional bit NOT NULL,
	RecursoFinanceiroNacionalId int NULL,
	LogAcao nvarchar(10) NOT NULL
) 
--
;

--
--
CREATE TABLE tgt.RecursoFinanceiro(
	Id int  NOT NULL,
	RegionalId smallint NULL,
	Nome nvarchar(75) NOT NULL,
	TipoDeRecurso int NULL,
	FonteDeRecursoPSG bit NOT NULL,
	Situacao bit NOT NULL,
	Nacional bit NOT NULL,
	RecursoFinanceiroNacionalId int NULL,
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