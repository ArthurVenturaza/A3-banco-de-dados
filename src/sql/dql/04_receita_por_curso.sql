-- Relatório 4: valor já recebido por curso
SELECT c.nome AS curso,
       SUM(pg.valor) AS total_recebido
  FROM pagamento pg
  JOIN matricula m ON m.id_matricula = pg.id_matricula
  JOIN turma t     ON t.id_turma = m.id_turma
  JOIN curso c     ON c.id_curso = t.id_curso
 WHERE pg.data_pagamento IS NOT NULL
 GROUP BY c.id_curso, c.nome
 ORDER BY total_recebido DESC;
