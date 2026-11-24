-- Executa todo o projeto a partir da raiz do repositório:
--   mysql -u root -p < src/sql/99_run_all.sql
SOURCE src/sql/00_database.sql;

SOURCE src/sql/ddl/01_idioma.sql;
SOURCE src/sql/ddl/02_professor.sql;
SOURCE src/sql/ddl/03_professor_idioma.sql;
SOURCE src/sql/ddl/04_curso.sql;
SOURCE src/sql/ddl/05_sala.sql;
SOURCE src/sql/ddl/06_turma.sql;
SOURCE src/sql/ddl/07_aluno.sql;
SOURCE src/sql/ddl/08_matricula.sql;
SOURCE src/sql/ddl/09_pagamento.sql;
SOURCE src/sql/ddl/10_alter.sql;
SOURCE src/sql/ddl/11_triggers.sql;

SOURCE src/sql/dml/01_idioma.sql;
SOURCE src/sql/dml/02_professor.sql;
SOURCE src/sql/dml/03_professor_idioma.sql;
SOURCE src/sql/dml/04_curso.sql;
SOURCE src/sql/dml/05_sala.sql;
SOURCE src/sql/dml/06_turma.sql;
SOURCE src/sql/dml/07_aluno.sql;
SOURCE src/sql/dml/08_matricula.sql;
SOURCE src/sql/dml/09_pagamento.sql;
SOURCE src/sql/dml/10_update.sql;
SOURCE src/sql/dml/11_delete.sql;

SOURCE src/sql/dql/01_turmas_completas.sql;
SOURCE src/sql/dql/02_alunos_por_turma.sql;
SOURCE src/sql/dql/03_alunos_por_curso.sql;
SOURCE src/sql/dql/04_receita_por_curso.sql;
SOURCE src/sql/dql/05_inadimplentes.sql;
SOURCE src/sql/dql/06_professores_idiomas.sql;
SOURCE src/sql/dql/07_ocupacao_turmas.sql;
SOURCE src/sql/dql/08_alunos_varias_turmas.sql;
