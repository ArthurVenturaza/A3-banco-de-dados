-- Relatório 2: lista de chamada (alunos com matrícula ativa por turma)
SELECT t.id_turma,
       c.nome AS curso,
       a.nome AS aluno,
       a.email,
       m.data_matricula
  FROM matricula m
  JOIN aluno a ON a.id_aluno = m.id_aluno
  JOIN turma t ON t.id_turma = m.id_turma
  JOIN curso c ON c.id_curso = t.id_curso
 WHERE m.situacao = 'Ativa'
 ORDER BY t.id_turma, a.nome;
