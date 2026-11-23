-- Relatório 8: alunos matriculados em mais de uma turma
SELECT a.nome AS aluno,
       COUNT(m.id_matricula) AS total_matriculas
  FROM aluno a
  JOIN matricula m ON m.id_aluno = a.id_aluno
 GROUP BY a.id_aluno, a.nome
HAVING COUNT(m.id_matricula) > 1
 ORDER BY total_matriculas DESC, a.nome;
