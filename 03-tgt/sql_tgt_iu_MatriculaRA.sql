--
--
insert into tgt.MatriculaRA
(
	Id,
	TurmaMatriculadaId,
	RecursoFinanceiroUtilizadoId,
	ContratoId,
	NumeroDaMatricula,
	NumeroAmigavel,
	Origem,
	PessoaFisicaId,
	NecessitaDeAssistencia,
	ObservacaoSobreAssistencia,
	CanalId,
	Ano,
	CodigoDeAutenticacaoDoDiploma,
	NumeroDoCertificadoDiploma,
	MencaoId,
	QuantidadeTotalDeFaltas,
	NotificacaoDeMatriculaEnviada,
	CadastroMatriculaCompleto,
	PessoaJuridicaDaPraticaDeAprendizagemId,
	PessoaFisicaDaPraticaDeAprendizagemId,
	PercentualCargaHorariaUltimaPesquisaDeSatisfacaoEnviada,
	PesquisaDeSatisfacaoPJEnviada,
    ctrlArquivo,
	ctrlDateIniIncr,
	ctrlDateFimIncr
)
select
    stg.Id,
	stg.TurmaMatriculadaId,
	stg.RecursoFinanceiroUtilizadoId,
	stg.ContratoId,
	stg.NumeroDaMatricula,
	stg.NumeroAmigavel,
	stg.Origem,
	stg.PessoaFisicaId,
	stg.NecessitaDeAssistencia,
	stg.ObservacaoSobreAssistencia,
	stg.CanalId,
	stg.Ano,
	stg.CodigoDeAutenticacaoDoDiploma,
	stg.NumeroDoCertificadoDiploma,
	stg.MencaoId,
	stg.QuantidadeTotalDeFaltas,
	stg.NotificacaoDeMatriculaEnviada,
	stg.CadastroMatriculaCompleto,
	stg.PessoaJuridicaDaPraticaDeAprendizagemId,
	stg.PessoaFisicaDaPraticaDeAprendizagemId,
	stg.PercentualCargaHorariaUltimaPesquisaDeSatisfacaoEnviada,
	stg.PesquisaDeSatisfacaoPJEnviada,
    '',
	getdate(),
	getdate()
from
    stg.MatriculaRA stg left join tgt.MatriculaRA tgt 
    on stg.Id = tgt.Id 
where 
    tgt.Id is null 
--
;


--
--
update tgt.MatriculaRA
set 
    TurmaMatriculadaId=stg.TurmaMatriculadaId,
	RecursoFinanceiroUtilizadoId=stg.RecursoFinanceiroUtilizadoId,
	ContratoId=stg.ContratoId,
	NumeroDaMatricula=stg.NumeroDaMatricula,
	NumeroAmigavel=stg.NumeroAmigavel,
	Origem=stg.Origem,
	PessoaFisicaId=stg.PessoaFisicaId,
	NecessitaDeAssistencia=stg.NecessitaDeAssistencia,
	ObservacaoSobreAssistencia=stg.ObservacaoSobreAssistencia,
	CanalId=stg.CanalId,
	Ano=stg.Ano,
	CodigoDeAutenticacaoDoDiploma=stg.CodigoDeAutenticacaoDoDiploma,
	NumeroDoCertificadoDiploma=stg.NumeroDoCertificadoDiploma,
	MencaoId=stg.MencaoId,
	QuantidadeTotalDeFaltas=stg.QuantidadeTotalDeFaltas,
	NotificacaoDeMatriculaEnviada=stg.NotificacaoDeMatriculaEnviada,
	CadastroMatriculaCompleto=stg.CadastroMatriculaCompleto,
	PessoaJuridicaDaPraticaDeAprendizagemId=stg.PessoaJuridicaDaPraticaDeAprendizagemId,
	PessoaFisicaDaPraticaDeAprendizagemId=stg.PessoaFisicaDaPraticaDeAprendizagemId,
	PercentualCargaHorariaUltimaPesquisaDeSatisfacaoEnviada=stg.PercentualCargaHorariaUltimaPesquisaDeSatisfacaoEnviada,
	PesquisaDeSatisfacaoPJEnviada=stg.PesquisaDeSatisfacaoPJEnviada,
    ctrlArquivo = '',
	ctrlDateIniIncr = getdate(),
	ctrlDateFimIncr = getdate()
from
    stg.MatriculaRA stg left join tgt.MatriculaRA tgt 
    on stg.Id = tgt.Id 
where 
    tgt.Id is not null 
    and
    (
        tgt.TurmaMatriculadaId<>stg.TurmaMatriculadaId or
        tgt.RecursoFinanceiroUtilizadoId<>stg.RecursoFinanceiroUtilizadoId or
        tgt.ContratoId<>stg.ContratoId or
        tgt.NumeroDaMatricula<>stg.NumeroDaMatricula or
        tgt.NumeroAmigavel<>stg.NumeroAmigavel or
        tgt.Origem<>stg.Origem or
        tgt.PessoaFisicaId<>stg.PessoaFisicaId or
        tgt.NecessitaDeAssistencia<>stg.NecessitaDeAssistencia or
        tgt.ObservacaoSobreAssistencia<>stg.ObservacaoSobreAssistencia or
        tgt.CanalId<>stg.CanalId or
        tgt.Ano<>stg.Ano or
        tgt.CodigoDeAutenticacaoDoDiploma<>stg.CodigoDeAutenticacaoDoDiploma or
        tgt.NumeroDoCertificadoDiploma<>stg.NumeroDoCertificadoDiploma or
        tgt.MencaoId<>stg.MencaoId or
        tgt.QuantidadeTotalDeFaltas<>stg.QuantidadeTotalDeFaltas or
        tgt.NotificacaoDeMatriculaEnviada<>stg.NotificacaoDeMatriculaEnviada or
        tgt.CadastroMatriculaCompleto<>stg.CadastroMatriculaCompleto or
        tgt.PessoaJuridicaDaPraticaDeAprendizagemId<>stg.PessoaJuridicaDaPraticaDeAprendizagemId or
        tgt.PessoaFisicaDaPraticaDeAprendizagemId<>stg.PessoaFisicaDaPraticaDeAprendizagemId or
        tgt.PercentualCargaHorariaUltimaPesquisaDeSatisfacaoEnviada<>stg.PercentualCargaHorariaUltimaPesquisaDeSatisfacaoEnviada or
        tgt.PesquisaDeSatisfacaoPJEnviada<>stg.PesquisaDeSatisfacaoPJEnviada
    )
--
;