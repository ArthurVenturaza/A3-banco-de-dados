-- Remove a matricula 10; as parcelas sao removidas em cascata
DELETE FROM matricula
 WHERE id_matricula = 10;

-- Remove o vinculo do professor 4 com Frances (vinculo sem turma ativa;
-- o professor continua habilitado em Ingles e Alemao, usados nas turmas 2 e 6)
DELETE FROM professor_idioma
 WHERE id_professor = 4 AND id_idioma = 3;
