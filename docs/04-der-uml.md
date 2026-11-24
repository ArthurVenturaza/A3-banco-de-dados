# 4. DER em notação alternativa (UML - diagrama de classes)

O diagrama editável está em `diagramas/escola-idiomas.drawio`, na página **DER UML**.
Como em UML a ligação entre classes já é a associação, não há chaves estrangeiras nem classe associativa:
a N:N entre Professor e Idioma é uma associação direta com multiplicidade 0..* dos dois lados.

```mermaid
classDiagram
    class Idioma { +id_idioma : int  +nome : string }
    class Curso { +id_curso : int  +nome : string  +nivel : string  +carga_horaria : int  +valor_mensalidade : decimal }
    class Professor { +id_professor : int  +nome : string  +cpf : string  +email : string  +telefone : string  +data_admissao : date }
    class Sala { +id_sala : int  +nome : string  +capacidade : int }
    class Turma { +id_turma : int  +semestre : string  +dia_semana : string  +hora_inicio : time  +hora_fim : time  +vagas : int }
    class Aluno { +id_aluno : int  +nome : string  +cpf : string  +email : string  +telefone : string  +data_nascimento : date  +ativo : boolean }
    class Matricula { +id_matricula : int  +data_matricula : date  +situacao : string }
    class Pagamento { +id_pagamento : int  +numero_parcela : int  +valor : decimal  +data_vencimento : date  +data_pagamento : date  +forma_pagamento : string }

    Idioma "1" --> "0..*" Curso : possui
    Curso "1" --> "0..*" Turma : oferecido em
    Professor "1" --> "0..*" Turma : ministra
    Sala "1" --> "0..*" Turma : abriga
    Professor "0..*" -- "0..*" Idioma : habilitado em
    Aluno "1" --> "0..*" Matricula : realiza
    Turma "1" --> "0..*" Matricula : recebe
    Matricula "1" --> "1..*" Pagamento : gera
```

As multiplicidades são as mesmas do DER conceitual (`docs/02-der.md`).
