--
-- Insert Novos Administrativo Assinatura
insert into tgt.administrativo_assinatura
(
    TipoDePosicao,
	VinculoDoContratoDoColaboradorId,
	Portaria,
	Id,
	Situacao,
	ModeloDeAssinaturaId,
	Aluno,
	AssinaturaDigitalizada,
	NomeAbreviado
)
select 
    t1.TipoDePosicao,
	t1.VinculoDoContratoDoColaboradorId,
	t1.Portaria,
	t1.Id,
	t1.Situacao,
	t1.ModeloDeAssinaturaId,
	t1.Aluno,
	t1.AssinaturaDigitalizada,
	t1.NomeAbreviado
from 
    dbo.administrativo_assinatura t1 left join tgt.administrativo_assinatura t2
    on t1.id = t2.id 
where 
    t2.id is null 
--
;


--
-- Updates Administrativo Assinatura
update tgt.administrativo_assinatura
    set
    TipoDePosicao = t2.TipoDePosicao,
	VinculoDoContratoDoColaboradorId = t2.VinculoDoContratoDoColaboradorId,
	Portaria = t2.Portaria,
	Situacao = t2.Situacao,
	ModeloDeAssinaturaId = t2.ModeloDeAssinaturaId,
	Aluno = t2.Aluno,
	AssinaturaDigitalizada = t2.AssinaturaDigitalizada,
	NomeAbreviado = t2.NomeAbreviado
from 
    dbo.administrativo_assinatura_old t1 left join tgt.administrativo_assinatura t2
    on t1.id = t2.id 
where 
    t2.id is not null
--
;