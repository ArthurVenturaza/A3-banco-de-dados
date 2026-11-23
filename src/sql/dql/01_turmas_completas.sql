-- Relatório 1: grade de turmas com curso, idioma, professor e sala
SELECT t.id_turma,
       i.nome  AS idioma,
       c.nome  AS curso,
       p.nome  AS professor,
       s.nome  AS sala,
       t.dia_semana,
       t.hora_inicio,
       t.hora_fim
  FROM turma t
  JOIN curso c     ON c.id_curso = t.id_curso
  JOIN idioma i    ON i.id_idioma = c.id_idioma
  JOIN professor p ON p.id_professor = t.id_professor
  JOIN sala s      ON s.id_sala = t.id_sala
 WHERE t.semestre = '2026/2'
 ORDER BY t.id_turma;
