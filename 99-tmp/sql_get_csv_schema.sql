--
--
select column_name from information_schema.columns 
where 
TABLE_CATALOG = 'SENAC_SIG_AUDIT'
and
TABLE_SCHEMA = 'matricula'
and
TABLE_NAME = 'EstadoDaMatricula'
order by ORDINAL_POSITION
--
;