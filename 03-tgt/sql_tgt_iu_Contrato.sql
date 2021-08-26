--
--
insert into tgt.Contrato
(
    Id,
	RegionalId,
	RecursoFinanceiroId,
	TipoDoResponsavel,
	ResponsavelPessoaFisicaId,
	ResponsavelPessoaJuridicaId,
	UnidadeOperativaId,
	UsuarioId,
	Numero,
	Ano,
	DataDeCadastro,
	Situacao,
	VigenciaInicial,
	VigenciaFinal,
	Descricao,
	ObservacaoDaAlteracao,
	PercentualParaDevolucao,
	PermiteDevolucao,
	PermiteMatriculaAposConsumoDoSaldo,
	TipoDeContrato,
	ValorDoContrato,
	DataCancelamento,
	JustificativaCancelamento,
	UsuarioCancelamentoId,
	ValorDaDispensaDeUnidadeCurricular,
	NumeroAmigavel,
	IdLegado,
	JustificativaDeRescisao,
	EmailResponsavelPesquisaSatisfacao,
	NomeResponsavelPesquisaSatisfacao,
    ctrlArquivo,
	ctrlDateIniIncr,
	ctrlDateFimIncr,
	ctrlAtivo,
	ctrlInsert	
)
select 
    stg.Id,
	stg.RegionalId,
	stg.RecursoFinanceiroId,
	stg.TipoDoResponsavel,
	stg.ResponsavelPessoaFisicaId,
	stg.ResponsavelPessoaJuridicaId,
	stg.UnidadeOperativaId,
	stg.UsuarioId,
	stg.Numero,
	stg.Ano,
	stg.DataDeCadastro,
	stg.Situacao,
	stg.VigenciaInicial,
	stg.VigenciaFinal,
	stg.Descricao,
	stg.ObservacaoDaAlteracao,
	stg.PercentualParaDevolucao,
	stg.PermiteDevolucao,
	stg.PermiteMatriculaAposConsumoDoSaldo,
	stg.TipoDeContrato,
	stg.ValorDoContrato,
	stg.DataCancelamento,
	stg.JustificativaCancelamento,
	stg.UsuarioCancelamentoId,
	stg.ValorDaDispensaDeUnidadeCurricular,
	stg.NumeroAmigavel,
	stg.IdLegado,
	stg.JustificativaDeRescisao,
	stg.EmailResponsavelPesquisaSatisfacao,
	stg.NomeResponsavelPesquisaSatisfacao,
    '@{concat(pipeline().parameters.pTabela, '_', activity('lkp_ctl_incr').output.firstRow.fmtdt, '.csv')}',
	'@{activity('lkp_ctl_incr').output.firstRow.dt_ini_incr}',
	'@{activity('lkp_ctl_incr').output.firstRow.dt_fim_incr}',
	1,
	getdate()
from 
    stg.Contrato stg left join tgt.Contrato tgt 
    on stg.Id = tgt.id 
where 
    tgt.Id is null 
--
;

--
--
update tgt.Contrato
set 
	RegionalId=stg.RegionalId,
	RecursoFinanceiroId=stg.RecursoFinanceiroId,
	TipoDoResponsavel=stg.TipoDoResponsavel,
	ResponsavelPessoaFisicaId=stg.ResponsavelPessoaFisicaId,
	ResponsavelPessoaJuridicaId=stg.ResponsavelPessoaJuridicaId,
	UnidadeOperativaId=stg.UnidadeOperativaId,
	UsuarioId=stg.UsuarioId,
	Numero=stg.Numero,
	Ano=stg.Ano,
	DataDeCadastro=stg.DataDeCadastro,
	Situacao=stg.Situacao,
	VigenciaInicial=stg.VigenciaInicial,
	VigenciaFinal=stg.VigenciaFinal,
	Descricao=stg.Descricao,
	ObservacaoDaAlteracao=stg.ObservacaoDaAlteracao,
	PercentualParaDevolucao=stg.PercentualParaDevolucao,
	PermiteDevolucao=stg.PermiteDevolucao,
	PermiteMatriculaAposConsumoDoSaldo=stg.PermiteMatriculaAposConsumoDoSaldo,
	TipoDeContrato=stg.TipoDeContrato,
	ValorDoContrato=stg.ValorDoContrato,
	DataCancelamento=stg.DataCancelamento,
	JustificativaCancelamento=stg.JustificativaCancelamento,
	UsuarioCancelamentoId=stg.UsuarioCancelamentoId,
	ValorDaDispensaDeUnidadeCurricular=stg.ValorDaDispensaDeUnidadeCurricular,
	NumeroAmigavel=stg.NumeroAmigavel,
	IdLegado=stg.IdLegado,
	JustificativaDeRescisao=stg.JustificativaDeRescisao,
	EmailResponsavelPesquisaSatisfacao=stg.EmailResponsavelPesquisaSatisfacao,
	NomeResponsavelPesquisaSatisfacao=stg.NomeResponsavelPesquisaSatisfacao,
    ctrlArquivo = '@{concat(pipeline().parameters.pTabela, '_', activity('lkp_ctl_incr').output.firstRow.fmtdt, '.csv')}',
	ctrlDateIniIncr = '@{activity('lkp_ctl_incr').output.firstRow.dt_ini_incr}',
	ctrlDateFimIncr = '@{activity('lkp_ctl_incr').output.firstRow.dt_fim_incr}',
	ctrlUpdate = getdate()
from 
    stg.Contrato stg left join tgt.Contrato tgt 
    on stg.Id = tgt.id 
where 
    tgt.Id is not null 
--
;

--
--
update tgt.Contrato
    set
	ctrlAtivo = 0,
	ctrlArquivo = '@{concat(pipeline().parameters.pTabela, '_', activity('lkp_ctl_incr').output.firstRow.fmtdt, '.csv')}',
	ctrlDateIniIncr = '@{activity('lkp_ctl_incr').output.firstRow.dt_ini_incr}',
	ctrlDateFimIncr = '@{activity('lkp_ctl_incr').output.firstRow.dt_fim_incr}',
	ctrlDelete = getdate()
from 
    stg.Contrato stg left join tgt.Contrato tgt
    on stg.Id = tgt.Id
where 
    tgt.Id is not null
	and 
	stg.logAcao = 'Excluir'
--
;