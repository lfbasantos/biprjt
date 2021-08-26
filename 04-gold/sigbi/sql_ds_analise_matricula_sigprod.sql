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
		from matricula.EstadoDaMatriculaRA estadoRA
		inner join matricula.EstadoDaMatricula estado on estado.Id = estadoRA.EstadoDaMatriculaId
		where estadoRa.MatriculaId = m.Id
		order by DataDeLancamento asc
	) as DataMatricula,
	(
		select top 1 esm.Nome from matricula.EstadoDaMatriculaRA era
		left join matricula.EstadoDaMatricula esm on era.EStadoDaMatriculaId = esm.id
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
	From turma.TurmaPlanoDeExecucao tpde
	left join turma.TurmaFormaDeExecucaoUnidadeCurricularDoPlanoDeExecucao fxuc on fxuc.TurmaPlanodeExecucaoID = tpde.Id
	left join planodecurso.FormaDeExecucao fde on fde.Id = fxuc.FormadeExecucaoId where tpde.TurmaId = t.Id and tpde.Selecionado = 1
	FOR XML PATH ('')), 1, 1, '') ) as varchar(max)) NomeFormaDeExecucao
from 
	matricula.MatriculaRA m
	inner join turma.turma t 
		on t.Id = m.TurmaMatriculadaId
	left join [matricula].[Canal] c 
		on c.Id = m.Canalid
	left join administrativo.recursofinanceiro rf 
		on rf.Id = m.RecursoFinanceiroUtilizadoId
	left join (
		select id, nome
		from administrativo.recursofinanceiro where situação = 1 and nacional = 1
		union all
		select rfin.id,
		(select frNacional.nome from administrativo.recursofinanceiro frNacional where frNacional.id = rfin.RecursoFinanceiroNacionalId) Nome
		from administrativo.recursofinanceiro rfin where rfin.situação = 1 and rfin.nacional = 0
		) rfin on rfin.Id = m.RecursoFinanceiroUtilizadoId
	left join turma.CentroDeCustoDaTurma cct 
		on cct.RecursoFinanceiroId = m.RecursoFinanceiroUtilizadoId and t.Id = cct.TurmaId
	left join administrativo.PessoaFisica pf 
		on pf.id = m.PessoaFisicaId
	left join matricula.mencao men 
		on men.id = m.mencaoID
	left join turma.PrecificacaoDaTurma pt 
		on pt.TurmaId = t.id
	left join financeiro.Contrato cnt 
		on m.ContratoId = cnt.Id

where m.id = 357

