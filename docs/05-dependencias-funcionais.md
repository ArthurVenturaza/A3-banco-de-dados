# 5. Dependências Funcionais e Normalização (até a 3FN)

## 5.1 Dependências funcionais por relação
| Relação | Dependências funcionais |
|---|---|
| idioma | id_idioma -> nome ; nome -> id_idioma |
| professor | id_professor -> nome, cpf, email, telefone, data_admissao ; cpf -> id_professor ; email -> id_professor |
| professor_idioma | (id_professor, id_idioma) -> (nenhum atributo extra; chave composta) |
| curso | id_curso -> id_idioma, nome, nivel, carga_horaria, valor_mensalidade |
| sala | id_sala -> nome, capacidade ; nome -> id_sala |
| turma | id_turma -> id_curso, id_professor, id_sala, semestre, dia_semana, hora_inicio, hora_fim, vagas ; (id_sala, semestre, dia_semana, hora_inicio) -> id_turma |
| aluno | id_aluno -> nome, cpf, email, telefone, data_nascimento, ativo ; cpf -> id_aluno ; email -> id_aluno |
| matricula | id_matricula -> id_aluno, id_turma, data_matricula, situacao ; (id_aluno, id_turma) -> id_matricula |
| pagamento | id_pagamento -> id_matricula, numero_parcela, valor, data_vencimento, data_pagamento, forma_pagamento ; (id_matricula, numero_parcela) -> id_pagamento |

## 5.2 Exemplo de normalização no contexto
Planilha original (tabela única, não normalizada):

`MATRICULA_GERAL(id_aluno, nome_aluno, id_turma, nome_curso, idioma, valor_mensalidade, nome_professor, nome_sala, capacidade_sala, data_matricula)`

**1FN:** todos os atributos são atômicos (sem listas de telefones ou de turmas na mesma célula). Chave: (id_aluno, id_turma).

**Dependências que violam a 2FN (dependência parcial da chave):**
- id_aluno -> nome_aluno
- id_turma -> nome_curso, idioma, valor_mensalidade, nome_professor, nome_sala, capacidade_sala

**2FN:** separamos `aluno(id_aluno, nome)`, `turma(id_turma, ...)` e `matricula(id_aluno, id_turma, data_matricula)`.

**Dependências que violam a 3FN (dependência transitiva):**
- id_turma -> id_curso -> nome_curso, valor_mensalidade, id_idioma -> idioma
- id_turma -> id_sala -> nome_sala, capacidade_sala
- id_turma -> id_professor -> nome_professor

**3FN:** criamos `idioma`, `curso`, `sala` e `professor`; `turma` passa a guardar as chaves
estrangeiras e os atributos próprios da turma (semestre, dia, horário e vagas). Resultado: o modelo relacional do documento 03.

## 5.3 Verificação das relações finais
Cada relação do modelo final está na 3FN, pois todo atributo não chave depende da chave inteira e somente dela
(nenhuma dependência parcial ou transitiva). Além disso, todo determinante é superchave, o que atende à BCNF:

| Relação | Determinantes | Superchave? |
|---|---|---|
| idioma | id_idioma, nome | sim (ambos são chaves candidatas) |
| professor | id_professor, cpf, email | sim |
| professor_idioma | (id_professor, id_idioma) | sim (única dependência) |
| curso | id_curso | sim |
| sala | id_sala, nome | sim |
| turma | id_turma, (id_sala, semestre, dia_semana, hora_inicio) | sim |
| aluno | id_aluno, cpf, email | sim |
| matricula | id_matricula, (id_aluno, id_turma) | sim |
| pagamento | id_pagamento, (id_matricula, numero_parcela) | sim |
