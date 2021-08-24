--
--
CREATE TABLE stg.PessoaFisica(
	Id bigintNOT NULL,
	RegionalId smallint NOT NULL,
	Nome nvarchar(75) NOT NULL,
	NomeSocial nvarchar(75) NULL,
	NomeAbreviado nvarchar(40) NULL,
	DataDeNascimento datetime2(7) NOT NULL,
	Sexo int NOT NULL,
	Cpf nvarchar(11) NOT NULL,
	Rg nvarchar(25) NULL,
	OrgaoEmissorDoRg nvarchar(75) NULL,
	DataDeEmissaoDoRg datetime2(7) NULL,
	Email nvarchar(250) NULL,
	Nacionalidade int NULL,
	UfId int NULL,
	CidadeId int NULL,
	Situacao bit NOT NULL,
	CodigoConfirmacao int NULL,
	DataDaUltimaAlteracao datetime2(7) NULL,
	IdLegado nvarchar(75) NULL,
	SistemaLegado nvarchar(75) NULL,
	GeneroDoNomeSocial int NULL,
	HashDaFoto nvarchar(32) NULL,
	LogAcao nvarchar(10) NOT NULL
) 
--
;

--
--
CREATE TABLE tgt.PessoaFisica(
	Id bigintNOT NULL,
	RegionalId smallint NOT NULL,
	Nome nvarchar(75) NOT NULL,
	NomeSocial nvarchar(75) NULL,
	NomeAbreviado nvarchar(40) NULL,
	DataDeNascimento datetime2(7) NOT NULL,
	Sexo int NOT NULL,
	Cpf nvarchar(11) NOT NULL,
	Rg nvarchar(25) NULL,
	OrgaoEmissorDoRg nvarchar(75) NULL,
	DataDeEmissaoDoRg datetime2(7) NULL,
	Email nvarchar(250) NULL,
	Nacionalidade int NULL,
	UfId int NULL,
	CidadeId int NULL,
	Situacao bit NOT NULL,
	CodigoConfirmacao int NULL,
	DataDaUltimaAlteracao datetime2(7) NULL,
	IdLegado nvarchar(75) NULL,
	SistemaLegado nvarchar(75) NULL,
	GeneroDoNomeSocial int NULL,
	HashDaFoto nvarchar(32) NULL,
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