--
--
select 
	distinct
	m.Id as MatriculaId,
	t.Id as TurmaId,
	t.RegionalId,
	t.UnidadeOperativaid,
	m.ContratoId,
	m.NumeroDaMatricula,
	m.NumeroAmigavel as MatriculaNumeroAmigavel,
	ValorDoCurso,
	CASE m.Origem when '3' then 'Matricula Web' else 'Matricula Presencial' end as Origem,
	PessoaFisicaID as AlunoId,
	(
		select top 1 estadoRA.DataDeLancamento
		from tgt.EstadoDaMatriculaRA estadoRA
		inner join tgt.EstadoDaMatricula estado on estado.Id = estadoRA.EstadoDaMatriculaId
		where estadoRa.MatriculaId = m.Id
		order by DataDeLancamento asc
	) as DataMatricula,
	(
		select top 1 esm.Nome from tgt.EstadoDaMatriculaRA era
		left join tgt.EstadoDaMatricula esm on era.EStadoDaMatriculaId = esm.id
		where era.MatriculaId = m.Id
		order by era.DataDeLancamento desc
	) as SituacaoMatricula,
	c.Nome as CanalNome,
	rf.Id RecursoFinanceiroMatriculaId,
	rf.Nome as RecursoFinanceiroMatriculaDR,
	rfin.nome as RecursoFinanceiroMatriculaDN,
	men.Descricao as MencaoNome,
	cct.DescricaoDoCentroDeCusto,
	cast((select STUFF(
	(SELECT distinct '/ '+ NomeFormaDeExecucao
	From tgt.TurmaPlanoDeExecucao tpde
	left join tgt.TurmaFormaDeExecucaoUnidadeCurricularDoPlanoDeExecucao fxuc on fxuc.TurmaPlanodeExecucaoID = tpde.Id
	left join tgt.FormaDeExecucao fde on fde.Id = fxuc.FormadeExecucaoId where tpde.TurmaId = t.Id and tpde.Selecionado = 1
	FOR XML PATH ('')), 1, 1, '') ) as varchar(max)) NomeFormaDeExecucao
into tgt.analise_matriculas
from 
	tgt.MatriculaRA m
	inner join tgt.turma t 
		on t.Id = m.TurmaMatriculadaId
	left join [tgt].[Canal] c 
		on c.Id = m.Canalid
	left join tgt.recursofinanceiro rf 
		on rf.Id = m.RecursoFinanceiroUtilizadoId
	left join (
		select id, nome
		from tgt.recursofinanceiro where situacao = 1 and nacional = 1
		union all
		select rfin.id,
		(select frNacional.nome from tgt.recursofinanceiro frNacional where frNacional.id = rfin.RecursoFinanceiroNacionalId) Nome
		from tgt.recursofinanceiro rfin where rfin.situacao = 1 and rfin.nacional = 0
		) rfin on rfin.Id = m.RecursoFinanceiroUtilizadoId
	left join tgt.CentroDeCustoDaTurma cct 
		on cct.RecursoFinanceiroId = m.RecursoFinanceiroUtilizadoId and t.Id = cct.TurmaId
	left join tgt.PessoaFisica pf 
		on pf.id = m.PessoaFisicaId
	left join tgt.mencao men 
		on men.id = m.mencaoID
	left join tgt.PrecificacaoDaTurma pt 
		on pt.TurmaId = t.id
	left join tgt.Contrato cnt 
		on m.ContratoId = cnt.Id

where 1=2
--and m.Id = 9013
--
;

--
--
select 
	distinct
	m.Id as MatriculaId,
	t.Id as TurmaId,
	t.RegionalId,
	t.UnidadeOperativaid,
	m.ContratoId,
	m.NumeroDaMatricula,
	m.NumeroAmigavel as MatriculaNumeroAmigavel,
	ValorDoCurso,
	CASE m.Origem when '3' then 'Matricula Web' else 'Matricula Presencial' end as Origem,
	PessoaFisicaID as AlunoId,
	(
		select top 1 estadoRA.DataDeLancamento
		from tgt.EstadoDaMatriculaRA estadoRA
		inner join tgt.EstadoDaMatricula estado on estado.Id = estadoRA.EstadoDaMatriculaId
		where estadoRa.MatriculaId = m.Id
		order by DataDeLancamento asc
	) as DataMatricula,
	(
		select top 1 esm.Nome from tgt.EstadoDaMatriculaRA era
		left join tgt.EstadoDaMatricula esm on era.EStadoDaMatriculaId = esm.id
		where era.MatriculaId = m.Id
		order by era.DataDeLancamento desc
	) as SituacaoMatricula,
	c.Nome as CanalNome,
	rf.Id RecursoFinanceiroMatriculaId,
	rf.Nome as RecursoFinanceiroMatriculaDR,
	rfin.nome as RecursoFinanceiroMatriculaDN,
	men.Descricao as MencaoNome,
	cct.DescricaoDoCentroDeCusto,
	cast((select STUFF(
	(SELECT distinct '/ '+ NomeFormaDeExecucao
	From tgt.TurmaPlanoDeExecucao tpde
	left join tgt.TurmaFormaDeExecucaoUnidadeCurricularDoPlanoDeExecucao fxuc on fxuc.TurmaPlanodeExecucaoID = tpde.Id
	left join tgt.FormaDeExecucao fde on fde.Id = fxuc.FormadeExecucaoId where tpde.TurmaId = t.Id and tpde.Selecionado = 1
	FOR XML PATH ('')), 1, 1, '') ) as varchar(max)) NomeFormaDeExecucao
from 
	tgt.MatriculaRA m
	inner join tgt.turma t 
		on t.Id = m.TurmaMatriculadaId
	left join [tgt].[Canal] c 
		on c.Id = m.Canalid
	left join tgt.recursofinanceiro rf 
		on rf.Id = m.RecursoFinanceiroUtilizadoId
	left join (
		select id, nome
		from tgt.recursofinanceiro where situacao = 1 and nacional = 1
		union all
		select rfin.id,
		(select frNacional.nome from tgt.recursofinanceiro frNacional where frNacional.id = rfin.RecursoFinanceiroNacionalId) Nome
		from tgt.recursofinanceiro rfin where rfin.situacao = 1 and rfin.nacional = 0
		) rfin on rfin.Id = m.RecursoFinanceiroUtilizadoId
	left join tgt.CentroDeCustoDaTurma cct 
		on cct.RecursoFinanceiroId = m.RecursoFinanceiroUtilizadoId and t.Id = cct.TurmaId
	left join tgt.PessoaFisica pf 
		on pf.id = m.PessoaFisicaId
	left join tgt.mencao men 
		on men.id = m.mencaoID
	left join tgt.PrecificacaoDaTurma pt 
		on pt.TurmaId = t.id
	left join tgt.Contrato cnt 
		on m.ContratoId = cnt.Id

where cnt.NumeroAmigavel ='2019.1.18' 
and m.Id = 9013
--
;




--
--
select top 1 estadoRA.DataDeLancamento
		from matricula.EstadoDaMatriculaRA estadoRA
		inner join matricula.EstadoDaMatricula estado on estado.Id = estadoRA.EstadoDaMatriculaId
		where estadoRa.MatriculaId = m.Id
		order by DataDeLancamento asc
--
;


--
--
select * from matricula.EstadoDaMatriculaRA where MatriculaId = 9013 order by DataDeLancamento asc
--
;




--
--
select * from matricula.EstadoDaMatricula where Id in (1,2,3,4)
--
;


--
--
select 
    m.Id as MatriculaID,
    t.Id as TurmaID,
    t.RegionalId,
	t.UnidadeOperativaId,
	m.ContratoId,
	m.NumeroDaMatricula,
	m.NumeroAmigavel as MatriculaNumeroAmigavel
from 
    matricula.MatriculaRA m
    inner join turma.turma t 
        on t.Id = m.TurmaMatriculadaId
where
    m.Id = 9013
--
;




select 
	count(*)
from 
	tgt.MatriculaRA m
	inner join tgt.turma t 
		on t.Id = m.TurmaMatriculadaId
	left join [tgt].[Canal] c 
		on c.Id = m.Canalid
	left join tgt.recursofinanceiro rf 
		on rf.Id = m.RecursoFinanceiroUtilizadoId
	left join (
		select id, nome
		from tgt.recursofinanceiro where situacao = 1 and nacional = 1
		union all
		select rfin.id,
		(select frNacional.nome from tgt.recursofinanceiro frNacional where frNacional.id = rfin.RecursoFinanceiroNacionalId) Nome
		from tgt.recursofinanceiro rfin where rfin.situacao = 1 and rfin.nacional = 0
		) rfin on rfin.Id = m.RecursoFinanceiroUtilizadoId
	left join tgt.CentroDeCustoDaTurma cct 
		on cct.RecursoFinanceiroId = m.RecursoFinanceiroUtilizadoId and t.Id = cct.TurmaId
	left join tgt.PessoaFisica pf 
		on pf.id = m.PessoaFisicaId
	left join tgt.mencao men 
		on men.id = m.mencaoID
	left join tgt.PrecificacaoDaTurma pt 
		on pt.TurmaId = t.id
	left join tgt.Contrato cnt 
		on m.ContratoId = cnt.Id