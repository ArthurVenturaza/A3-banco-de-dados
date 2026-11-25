# Banco de Dados - Escola de Idiomas

Trabalho A3 (Banco de Dados) - UNISUL. Projeto completo de um banco de dados
relacional para uma escola de idiomas: modelagem conceitual, lógica, física e SQL.

## Equipe
| Nome completo | RA | GitHub |
|---|---|---|
| Pedro Henrique Francio Della Giustina | 10725110773 | [PedroDella](https://github.com/PedroDella) |
| Arthur Zamprogna Ventura | 10725111773 | [ArthurVenturaza](https://github.com/ArthurVenturaza) |

## Estrutura do repositório
```
docs/        contextualização, DER, modelo relacional, DFs, dicionário, UML
diagramas/   escola-idiomas.drawio (página DER conceitual e página DER UML)
src/sql/
  00_database.sql   criação do banco (recria o banco se já existir)
  ddl/              CREATE TABLE (um arquivo por tabela), ALTER TABLE e triggers (11_triggers.sql)
  dml/              INSERT, UPDATE e DELETE
  dql/              consultas SELECT com JOIN (relatórios)
  99_run_all.sql    executa tudo na ordem correta
LICENSE      licença MIT
```

## Como executar (MySQL 8+)
Execute a partir da **raiz do repositório**, porque os caminhos do script são relativos:
```bash
mysql -u root -p < src/sql/99_run_all.sql
```
O script apaga o banco `escola_idiomas` se ele já existir e o recria do zero.
As consultas ficam em `src/sql/dql/` e podem ser executadas uma a uma.

## Convenção de commits
Conventional Commits: `feat(ddl): ...`, `feat(dml): ...`, `feat(dql): ...`,
`docs: ...`, `chore: ...`, `fix: ...`. Um commit por arquivo/funcionalidade.
