
--
--
select top 10 * from [SENAC_SIG_AUDIT].[matricula].[MatriculaRA]
-- 
;

--
--
select count(*) as qt from [SENAC_SIG_AUDIT].[matricula].[MatriculaRA]
-- 747502
;

--
--
select count(*) as qt from [SENAC_SIG].[matricula].[MatriculaRA]
-- 272095
;

--
--
select Id from [SENAC_SIG].[matricula].[MatriculaRA]
where Id not in (select Id from  [SENAC_SIG_AUDIT].[matricula].[MatriculaRA])
--
;