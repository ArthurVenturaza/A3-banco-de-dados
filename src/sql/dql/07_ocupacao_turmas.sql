-- Relatório 7: ocupação das turmas (vagas x matrículas ativas)
SELECT t.id_turma,
       c.nome AS curso,
       t.vagas,
       COUNT(m.id_matricula) AS ocupadas,
       t.vagas - COUNT(m.id_matricula) AS vagas_livres,
       ROUND(COUNT(m.id_matricula) * 100 / t.vagas, 1) AS percentual_ocupacao
  FROM turma t
  JOIN curso c          ON c.id_curso = t.id_curso
  LEFT JOIN matricula m ON m.id_turma = t.id_turma AND m.situacao = 'Ativa'
 GROUP BY t.id_turma, c.nome, t.vagas
 ORDER BY percentual_ocupacao DESC;
