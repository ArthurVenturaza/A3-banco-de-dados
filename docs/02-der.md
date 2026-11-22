# 2. Diagrama Entidade-Relacionamento (conceitual)

```mermaid
erDiagram
    IDIOMA ||--o{ CURSO : "possui"
    CURSO ||--o{ TURMA : "e oferecido em"
    PROFESSOR ||--o{ TURMA : "ministra"
    SALA ||--o{ TURMA : "abriga"
    PROFESSOR }o--o{ IDIOMA : "e habilitado em"
    ALUNO ||--o{ MATRICULA : "realiza"
    TURMA ||--o{ MATRICULA : "recebe"
    MATRICULA ||--o{ PAGAMENTO : "gera"

    IDIOMA { int id_idioma PK
             string nome }
    CURSO { int id_curso PK
            string nome
            string nivel
            int carga_horaria
            decimal valor_mensalidade }
    PROFESSOR { int id_professor PK
                string nome
                string cpf
                string email
                string telefone
                date data_admissao }
    SALA { int id_sala PK
           string nome
           int capacidade }
    TURMA { int id_turma PK
            string semestre
            string dia_semana
            time hora_inicio
            time hora_fim
            int vagas }
    ALUNO { int id_aluno PK
            string nome
            string cpf
            string email
            string telefone
            date data_nascimento }
    MATRICULA { int id_matricula PK
                date data_matricula
                string situacao }
    PAGAMENTO { int id_pagamento PK
                int numero_parcela
                decimal valor
                date data_vencimento
                date data_pagamento
                string forma_pagamento }
```

## Cardinalidades
| Relacionamento | Cardinalidade |
|---|---|
| Idioma - Curso | 1:N (um idioma tem N cursos; um curso, 1 idioma) |
| Curso - Turma | 1:N |
| Professor - Turma | 1:N |
| Sala - Turma | 1:N |
| Professor - Idioma | N:N (vira a tabela professor_idioma) |
| Aluno - Turma | N:N, resolvido pela entidade Matrícula |
| Aluno - Matrícula / Turma - Matrícula | 1:N cada |
| Matrícula - Pagamento | 1:N |
