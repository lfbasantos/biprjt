--
--
insert into tgt.PessoaFisica
(
    Id,
	RegionalId,
	Nome,
	NomeSocial,
	NomeAbreviado,
	DataDeNascimento,
	Sexo,
	Cpf,
	Rg,
	OrgaoEmissorDoRg,
	DataDeEmissaoDoRg,
	Email,
	Nacionalidade,
	UfId,
	CidadeId,
	Situacao,
	CodigoConfirmacao,
	DataDaUltimaAlteracao,
	IdLegado,
	SistemaLegado,
	GeneroDoNomeSocial,
	HashDaFoto,
    ctrlArquivo,
	ctrlDateIniIncr,
	ctrlDateFimIncr
)
select 
    stg.Id,
	stg.RegionalId,
	stg.Nome,
	stg.NomeSocial,
	stg.NomeAbreviado,
	stg.DataDeNascimento,
	stg.Sexo,
	stg.Cpf,
	stg.Rg,
	stg.OrgaoEmissorDoRg,
	stg.DataDeEmissaoDoRg,
	stg.Email,
	stg.Nacionalidade,
	stg.UfId,
	stg.CidadeId,
	stg.Situacao,
	stg.CodigoConfirmacao,
	stg.DataDaUltimaAlteracao,
	stg.IdLegado,
	stg.SistemaLegado,
	stg.GeneroDoNomeSocial,
	stg.HashDaFoto,
    'stg.ctrlArquivo',
	getdate(),
	getdate()
from 
    stg.PessoaFisica stg left join tgt.PessoaFisica tgt 
    on stg.Id = tgt.Id 
where 
    tgt.Id is null 
--
;


--
--
update tgt.PessoaFisica
set 
	RegionalId=stg.RegionalId,
	Nome=stg.Nome,
	NomeSocial=stg.NomeSocial,
	NomeAbreviado=stg.NomeAbreviado,
	DataDeNascimento=stg.DataDeNascimento,
	Sexo=stg.Sexo,
	Cpf=stg.Cpf,
	Rg=stg.Rg,
	OrgaoEmissorDoRg=stg.OrgaoEmissorDoRg,
	DataDeEmissaoDoRg=stg.DataDeEmissaoDoRg,
	Email=stg.Email,
	Nacionalidade=stg.Nacionalidade,
	UfId=stg.UfId,
	CidadeId=stg.CidadeId,
	Situacao=stg.Situacao,
	CodigoConfirmacao=stg.CodigoConfirmacao,
	DataDaUltimaAlteracao=stg.DataDaUltimaAlteracao,
	IdLegado=stg.IdLegado,
	SistemaLegado=stg.SistemaLegado,
	GeneroDoNomeSocial=stg.GeneroDoNomeSocial,
	HashDaFoto=stg.HashDaFoto,
    ctrlArquivo='',
	ctrlDateIniIncr=getdate(),
	ctrlDateFimIncr=getdate()
from 
    stg.PessoaFisica stg left join tgt.PessoaFisica tgt 
    on stg.Id = tgt.Id 
where 
    tgt.Id is not null 
    and 
    (
        tgt.RegionalId<>stg.RegionalId or
        tgt.Nome<>stg.Nome or
        tgt.NomeSocial<>stg.NomeSocial or
        tgt.NomeAbreviado<>stg.NomeAbreviado or
        tgt.DataDeNascimento<>stg.DataDeNascimento or
        tgt.Sexo<>stg.Sexo or
        tgt.Cpf<>stg.Cpf or
        tgt.Rg<>stg.Rg or
        tgt.OrgaoEmissorDoRg<>stg.OrgaoEmissorDoRg or
        tgt.DataDeEmissaoDoRg<>stg.DataDeEmissaoDoRg or
        tgt.Email<>stg.Email or
        tgt.Nacionalidade<>stg.Nacionalidade or
        tgt.UfId<>stg.UfId or
        tgt.CidadeId<>stg.CidadeId or
        tgt.Situacao<>stg.Situacao or
        tgt.CodigoConfirmacao<>stg.CodigoConfirmacao or
        tgt.DataDaUltimaAlteracao<>stg.DataDaUltimaAlteracao or
        tgt.IdLegado<>stg.IdLegado or
        tgt.SistemaLegado<>stg.SistemaLegado or
        tgt.GeneroDoNomeSocial<>stg.GeneroDoNomeSocial or
        tgt.HashDaFoto<>stg.HashDaFoto
    )
--
;