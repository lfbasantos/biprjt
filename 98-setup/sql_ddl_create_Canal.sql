--
--
CREATE TABLE [stg].[Canal](
	[Id] [int] NOT NULL,
	[Nome] [nvarchar](150) NOT NULL
) 
--
;

--
--
CREATE TABLE [tgt].[Canal](
	[Id] [int] NOT NULL,
	[Nome] [nvarchar](150) NOT NULL,
    [ctrlArquivo] varchar(255) null,
	[ctrlDateIniIncr] datetime null,
	[ctrlDateFimIncr] datetime null    
) 
--
;