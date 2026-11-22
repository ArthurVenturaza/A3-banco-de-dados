# 3. Modelo Relacional (lógico)

Notação: **PK** em negrito/sublinhado, *FK* em itálico.

- **idioma** (**id_idioma**, nome)
- **professor** (**id_professor**, nome, cpf, email, telefone, data_admissao)
- **professor_idioma** (**\*id_professor**, **\*id_idioma**)
  - *id_professor* referencia professor; *id_idioma* referencia idioma
- **curso** (**id_curso**, *id_idioma*, nome, nivel, carga_horaria, valor_mensalidade)
  - *id_idioma* referencia idioma
- **sala** (**id_sala**, nome, capacidade)
- **turma** (**id_turma**, *id_curso*, *id_professor*, *id_sala*, semestre,
  dia_semana, hora_inicio, hora_fim, vagas)
  - *id_curso* referencia curso; *id_professor* referencia professor; *id_sala* referencia sala
- **aluno** (**id_aluno**, nome, cpf, email, telefone, data_nascimento)
- **matricula** (**id_matricula**, *id_aluno*, *id_turma*, data_matricula, situacao)
  - *id_aluno* referencia aluno; *id_turma* referencia turma; UNIQUE(id_aluno, id_turma)
- **pagamento** (**id_pagamento**, *id_matricula*, numero_parcela, valor,
  data_vencimento, data_pagamento, forma_pagamento)
  - *id_matricula* referencia matricula; UNIQUE(id_matricula, numero_parcela)

## Integridade referencial
| FK | Referência | ON DELETE |
|---|---|---|
| professor_idioma.id_professor | professor | CASCADE |
| professor_idioma.id_idioma | idioma | CASCADE |
| curso.id_idioma | idioma | RESTRICT |
| turma.id_curso | curso | RESTRICT |
| turma.id_professor | professor | RESTRICT |
| turma.id_sala | sala | RESTRICT |
| matricula.id_aluno | aluno | RESTRICT |
| matricula.id_turma | turma | RESTRICT |
| pagamento.id_matricula | matricula | CASCADE |
