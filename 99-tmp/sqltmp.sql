--
--
select * from [tgt].[tb_ctl_incr]
--
;

--
--
update [tgt].[tb_ctl_incr] set dt_fim_incr = getdate() where ds_tabela = 'EstadoDaMatriculaRA'
--
;

--
--
update [tgt].[tb_ctl_incr] set dt_ini_incr = getdate()-1 where ds_tabela = 'EstadoDaMatriculaRA'
--
;

--
--
select dt_ini_incr, dt_fim_incr, format(dt_fim_incr,'yyyyMMdd_HHmmss') as fmtdt from tgt.tb_ctl_incr where ds_tabela = 'EstadoDaMatriculaRA'
--
;

--
--
insert into [tgt].[tb_ctl_incr] (ds_tabela, dt_ini_incr, dt_fim_incr) values ('TurmaPlanoDeExecucao', getdate()-7, getdate())
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
select distinct ctrlArquivo from tgt.EstadoDaMatriculaRA
--
;

--
--
--truncate table tgt.EstadoDaMatriculaRA 
select * from tgt.EstadoDaMatriculaRA where ctrlArquivo = 'EstadoDaMatriculaRA_20210823_170537.csv'
--
;

--
-- update tgt.EstadoDaMatriculaRA  set ctrlAtivo = 1
--truncate table tgt.EstadoDaMatriculaRA 
select * from tgt.EstadoDaMatriculaRA where ctrlAtivo = 1
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


--
--
select * from sigbi.analise_matriculas where matriculaid = 9013
--
;


--
--
select top 1000 * from sigbi.analise_matriculas where MatriculaId = 357
--
;

--
--
select top 100 * from tgt.CentroDeCustoDaTurma
--
;