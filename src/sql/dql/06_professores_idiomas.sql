-- Relatório 6: professores e idiomas em que estão habilitados
SELECT p.nome AS professor,
       GROUP_CONCAT(i.nome ORDER BY i.nome SEPARATOR ', ') AS idiomas
  FROM professor p
  LEFT JOIN professor_idioma pi ON pi.id_professor = p.id_professor
  LEFT JOIN idioma i            ON i.id_idioma = pi.id_idioma
 GROUP BY p.id_professor, p.nome
 ORDER BY p.nome;
