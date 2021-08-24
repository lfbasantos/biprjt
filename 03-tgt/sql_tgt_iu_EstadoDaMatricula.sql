--
-- Insert Novos 
insert into [tgt].[EstadoDaMatricula]
(
    [Id],
	[RegionalId],
	[Nome],
	[Descricao],
	[Aplicacao],
	[TipoMencaoDoEstado],
	[CalculaCargaHorariaExecutada],
	[Tipo],
	[OperadorFinanceiro],
    [ctrlArquivo],
	[ctrlDateIniIncr],
	[ctrlDateFimIncr]
)
select 
    stg.Id,
	stg.RegionalId,
	stg.Nome,
	stg.Descricao,
	stg.UsuarioId,
	stg.Aplicacao,
    stg.TipoMencaoDoEstado,
    stg.CalculaCargaHorariaExecutada,
    stg.Tipo,
    stg.OperadorFinanceiro,
	'INCR',
	getdate(),
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
update [tgt].[EstadoDaMatricula]
set
	RegionalId = stg.RegionalId,
	Nome = stg.Nome,
	Descricao = stg.Descricao,
	Aplicacao = stg.Aplicacao,
	TipoMencaoDoEstado = stg.TipoMencaoDoEstado,
	CalculaCargaHorariaExecutada = stg.CalculaCargaHorariaExecutada,
	Tipo = stg.Tipo ,
	OperadorFinanceiro = stg.OperadorFinanceiro,
    ctrlArquivo = '',
	ctrlDateIniIncr = getdate(),
	ctrlDateFimIncr = getdate()
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