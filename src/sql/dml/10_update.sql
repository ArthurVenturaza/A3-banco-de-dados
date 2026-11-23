-- Aluno regularizou a parcela 3 da matricula 1
UPDATE pagamento
   SET data_pagamento = '2026-10-12', forma_pagamento = 'Pix'
 WHERE id_matricula = 1 AND numero_parcela = 3;

-- Aluno trancou a matricula 7
UPDATE matricula
   SET situacao = 'Trancada'
 WHERE id_matricula = 7;

-- Reajuste de 5% nos cursos de Ingles
UPDATE curso
   SET valor_mensalidade = ROUND(valor_mensalidade * 1.05, 2)
 WHERE id_idioma = (SELECT id_idioma FROM idioma WHERE nome = 'Ingles');

-- Atualiza telefone de professor
UPDATE professor
   SET telefone = '48991110004'
 WHERE id_professor = 4;
