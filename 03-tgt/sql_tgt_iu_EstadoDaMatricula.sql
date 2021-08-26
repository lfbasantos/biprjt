--
-- Insert Novos 
insert into tgt.EstadoDaMatricula
(
    Id,
	RegionalId,
	Nome,
	Descricao,
	Aplicacao,
	TipoMencaoDoEstado,
	CalculaCargaHorariaExecutada,
	Tipo,
	OperadorFinanceiro,
    ctrlArquivo,
	ctrlDateIniIncr,
	ctrlDateFimIncr,
	ctrlAtivo,
	ctrlInsert
)
select 
    stg.Id,
	stg.RegionalId,
	stg.Nome,
	stg.Descricao,
	stg.Aplicacao,
    stg.TipoMencaoDoEstado,
    stg.CalculaCargaHorariaExecutada,
    stg.Tipo,
    stg.OperadorFinanceiro,
	'@{concat(pipeline().parameters.pTabela, '_', activity('lkp_ctl_incr').output.firstRow.fmtdt, '.csv')}',
	'@{activity('lkp_ctl_incr').output.firstRow.dt_ini_incr}',
	'@{activity('lkp_ctl_incr').output.firstRow.dt_fim_incr}',
	1,
	getdate()
from 
    stg.EstadoDaMatricula stg left join tgt.EstadoDaMatricula tgt
    on stg.Id = tgt.Id
where 
    tgt.Id is null 
--
;

--
-- Updates 
update tgt.EstadoDaMatricula
set
	RegionalId = stg.RegionalId,
	Nome = stg.Nome,
	Descricao = stg.Descricao,
	Aplicacao = stg.Aplicacao,
	TipoMencaoDoEstado = stg.TipoMencaoDoEstado,
	CalculaCargaHorariaExecutada = stg.CalculaCargaHorariaExecutada,
	Tipo = stg.Tipo ,
	OperadorFinanceiro = stg.OperadorFinanceiro,
    ctrlArquivo = '@{concat(pipeline().parameters.pTabela, '_', activity('lkp_ctl_incr').output.firstRow.fmtdt, '.csv')}',
	ctrlDateIniIncr = '@{activity('lkp_ctl_incr').output.firstRow.dt_ini_incr}',
	ctrlDateFimIncr = '@{activity('lkp_ctl_incr').output.firstRow.dt_fim_incr}',
	ctrlUpdate = getdate()
from 
    stg.EstadoDaMatricula stg left join tgt.EstadoDaMatricula tgt
    on stg.Id = tgt.Id
where 
    tgt.Id is not null 
    and 
    (
        tgt.RegionalId <> stg.RegionalId or
        tgt.Nome <> stg.Nome or
        tgt.Descricao <> stg.Descricao or
        tgt.Aplicacao <> stg.Aplicacao or
        tgt.TipoMencaoDoEstado <> stg.TipoMencaoDoEstado or
        tgt.CalculaCargaHorariaExecutada <> stg.CalculaCargaHorariaExecutada or
        tgt.Tipo <> stg.Tipo or
        tgt.OperadorFinanceiro <> stg.OperadorFinanceiro

    )
--
;

--
-- Delete
update tgt.EstadoDaMatricula
    set
	ctrlAtivo = 0,
	ctrlArquivo = '@{concat(pipeline().parameters.pTabela, '_', activity('lkp_ctl_incr').output.firstRow.fmtdt, '.csv')}',
	ctrlDateIniIncr = '@{activity('lkp_ctl_incr').output.firstRow.dt_ini_incr}',
	ctrlDateFimIncr = '@{activity('lkp_ctl_incr').output.firstRow.dt_fim_incr}',
	ctrlDelete = getdate()
from 
    stg.EstadoDaMatricula stg left join tgt.EstadoDaMatricula tgt
    on stg.Id = tgt.Id
where 
    tgt.Id is not null
	and 
	stg.logAcao = 'Excluir'
--
;