--
-- Insert  
insert into  tgt.EstadoDaMatriculaRA
(
    Id,
	RegionalId,
	MatriculaId,
	EstadoDaMatriculaId,
	UsuarioId,
	DataDeOcorrencia,
	DataDeLancamento,
	MotivoId,
	RequerimentoId,
	GeradoManualmente,
	Justificativa,
	EstadoOriginadoDeUmaTransferenciaInterna,
	ctrlArquivo,
	ctrlDateIniIncr,
	ctrlDateFimIncr,
	ctrlAtivo,
	ctrlInsert
)
select 
    stg.Id,
	stg.RegionalId,
	stg.MatriculaId,
	stg.EstadoDaMatriculaId,
	stg.UsuarioId,
	stg.DataDeOcorrencia,
	stg.DataDeLancamento,
	stg.MotivoId,
	stg.RequerimentoId,
	stg.GeradoManualmente,
	stg.Justificativa,
	stg.EstadoOriginadoDeUmaTransferenciaInterna,
	'@{concat(pipeline().parameters.pTabela, '_', activity('lkp_ctl_incr').output.firstRow.fmtdt, '.csv')}',
	'@{activity('lkp_ctl_incr').output.firstRow.dt_ini_incr}',
	'@{activity('lkp_ctl_incr').output.firstRow.dt_fim_incr}',
	1,
	getdate()
from 
    stg.EstadoDaMatriculaRA stg left join tgt.EstadoDaMatriculaRA tgt
    on stg.Id = tgt.Id
where 
    tgt.Id is null 
--
;


--
-- Updates 
update  tgt.EstadoDaMatriculaRA
    set
	RegionalId = stg.RegionalId,
	MatriculaId = stg.MatriculaId,
	EstadoDaMatriculaId = stg.EstadoDaMatriculaId,
	UsuarioId = stg.UsuarioId,
	DataDeOcorrencia = stg.DataDeOcorrencia,
	DataDeLancamento = stg.DataDeLancamento,
	MotivoId = stg.MotivoId,
	RequerimentoId = stg.RequerimentoId,
	GeradoManualmente = stg.GeradoManualmente,
	Justificativa = stg.Justificativa,
	EstadoOriginadoDeUmaTransferenciaInterna = stg.EstadoOriginadoDeUmaTransferenciaInterna,
	ctrlArquivo = '@{concat(pipeline().parameters.pTabela, '_', activity('lkp_ctl_incr').output.firstRow.fmtdt, '.csv')}',
	ctrlDateIniIncr = '@{activity('lkp_ctl_incr').output.firstRow.dt_ini_incr}',
	ctrlDateFimIncr = '@{activity('lkp_ctl_incr').output.firstRow.dt_fim_incr}',
	ctrlUpdate = getdate()
from 
    stg.EstadoDaMatriculaRA stg left join tgt.EstadoDaMatriculaRA tgt
    on stg.Id = tgt.Id
where 
    tgt.Id is not null
	and 
	(
		tgt.RegionalId <> stg.RegionalId
		or
		tgt.MatriculaId <> stg.MatriculaId
		or
		tgt.EstadoDaMatriculaId <> stg.EstadoDaMatriculaId
		or
		tgt.UsuarioId <> stg.UsuarioId
		or
		tgt.DataDeOcorrencia <> stg.DataDeOcorrencia
		or
		tgt.DataDeLancamento <> stg.DataDeLancamento
		or
		tgt.MotivoId <> stg.MotivoId
		or
		tgt.RequerimentoId <> stg.RequerimentoId
		or
		tgt.GeradoManualmente <> stg.GeradoManualmente
		or
		tgt.Justificativa <> stg.Justificativa
		or
		tgt.EstadoOriginadoDeUmaTransferenciaInterna <> stg.EstadoOriginadoDeUmaTransferenciaInterna
	)
--
;

--
--
update tgt.EstadoDaMatriculaRA
    set
	ctrlAtivo = 0,
	ctrlArquivo = '@{concat(pipeline().parameters.pTabela, '_', activity('lkp_ctl_incr').output.firstRow.fmtdt, '.csv')}',
	ctrlDateIniIncr = '@{activity('lkp_ctl_incr').output.firstRow.dt_ini_incr}',
	ctrlDateFimIncr = '@{activity('lkp_ctl_incr').output.firstRow.dt_fim_incr}',
	ctrlDelete = getdate()
from 
    stg.EstadoDaMatriculaRA stg left join tgt.EstadoDaMatriculaRA tgt
    on stg.Id = tgt.Id
where 
    tgt.Id is not null
	and 
	stg.logAcao = 'Excluir'
--
;