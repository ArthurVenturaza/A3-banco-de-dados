# Banco de Dados - Escola de Idiomas

Trabalho A3 (Banco de Dados) - UNISUL. Projeto completo de um banco de dados
relacional para uma escola de idiomas: modelagem conceitual, lógica, física e SQL.

## Integrantes
| Nome | Curso/Semestre |

| Arthur Zamprogna Ventura | (Ciencia da Computação 4º semestre) |
| Pedro Henrique Francio Della Giustina | (Ciencia da Computação 4º semestre) |

## Estrutura do repositório
```
docs/        contextualização, DER, modelo relacional, UML, DFs, dicionário
diagramas/   arquivo .drawio (DER e UML)
src/sql/
  00_database.sql   criação do banco
  ddl/              CREATE TABLE (um arquivo por tabela) e ALTER TABLE
  dml/              INSERT, UPDATE e DELETE
  dql/              consultas SELECT com JOIN (relatórios)
  99_run_all.sql    executa tudo na ordem correta
```

## Como executar (MySQL 8+)
```bash
mysql -u root -p < src/sql/99_run_all.sql
```
As consultas ficam em `src/sql/dql/` e podem ser executadas uma a uma.

## Convenção de commits
Conventional Commits: `feat(ddl): ...`, `feat(dml): ...`, `feat(dql): ...`,
`docs: ...`, `chore: ...`, `fix: ...`. Um commit por arquivo/funcionalidade.
