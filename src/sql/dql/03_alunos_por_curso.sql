-- Relatório 3: quantidade de alunos ativos por curso
SELECT c.nome AS curso,
       COUNT(m.id_matricula) AS total_alunos
  FROM curso c
  JOIN turma t          ON t.id_curso = c.id_curso
  LEFT JOIN matricula m ON m.id_turma = t.id_turma AND m.situacao = 'Ativa'
 GROUP BY c.id_curso, c.nome
 ORDER BY total_alunos DESC, c.nome;
