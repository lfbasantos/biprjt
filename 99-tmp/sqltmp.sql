--
--
select * from [tgt].[tb_ctl_incr]
--
;

--
--
insert into [tgt].[tb_ctl_incr] (ds_tabela, dt_ini_incr, dt_fim_incr) values ('EstadoDaMatriculaRA', getdate(), getdate())
--
;

--
--
update  [tgt].[tb_ctl_incr] set dt_ini_incr = getdate()-2 where ds_tabela = 'EstadoDaMatriculaRA'
--
;

--
--
select * from [matricula].[EstadoDaMatriculaRA] where logdata > getdate()-2
--
;

--
--
select dt_ini_incr, dt_fim_incr, format(dt_fim_incr,'yyyyMMdd_hhmmss') as fmtdt from tgt.tb_ctl_incr where ds_tabela = 'EstadoDaMatriculaRA'
--
;

--
--
select * from stg.EstadoDaMatriculaRA
--
;

--
--
--truncate table tgt.EstadoDaMatriculaRA 
select * from tgt.EstadoDaMatriculaRA
--
;

--
--
select COLUMN_NAME from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME = 'EstadoDaMatricula' and TABLE_SCHEMA = 'matricula'
order by ORDINAL_POSITION
--
;


--
--
select * from tgt.canal
--
;

--
--
update tgt.canal 
set ctrlArquivo = 'FULL', ctrldateiniincr = getdate(), ctrldatefimincr = getdate()
--
;

--
--
select count(*) from tgt.PessoaFisica
--
;