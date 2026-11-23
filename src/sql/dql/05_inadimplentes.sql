-- Relatório 5: parcelas vencidas e não pagas (inadimplência)
SELECT a.nome AS aluno,
       a.telefone,
       c.nome AS curso,
       pg.numero_parcela,
       pg.valor,
       pg.data_vencimento,
       DATEDIFF(CURDATE(), pg.data_vencimento) AS dias_em_atraso
  FROM pagamento pg
  JOIN matricula m ON m.id_matricula = pg.id_matricula
  JOIN aluno a     ON a.id_aluno = m.id_aluno
  JOIN turma t     ON t.id_turma = m.id_turma
  JOIN curso c     ON c.id_curso = t.id_curso
 WHERE pg.data_pagamento IS NULL
   AND pg.data_vencimento < CURDATE()
 ORDER BY dias_em_atraso DESC;
