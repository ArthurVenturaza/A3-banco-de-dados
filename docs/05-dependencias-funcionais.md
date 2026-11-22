# 5. Dependências Funcionais e Normalização (até a 3FN)

## 5.1 Dependências funcionais por relação
| Relação | Dependências funcionais |
|---|---|
| idioma | id_idioma -> nome ; nome -> id_idioma |
| professor | id_professor -> nome, cpf, email, telefone, data_admissao ; cpf -> id_professor ; email -> id_professor |
| professor_idioma | (id_professor, id_idioma) -> (nenhum atributo extra; chave composta) |
| curso | id_curso -> id_idioma, nome, nivel, carga_horaria, valor_mensalidade |
| sala | id_sala -> nome, capacidade ; nome -> id_sala |
| turma | id_turma -> id_curso, id_professor, id_sala, semestre, dia_semana, hora_inicio, hora_fim, vagas |
| aluno | id_aluno -> nome, cpf, email, telefone, data_nascimento ; cpf -> id_aluno ; email -> id_aluno |
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

**3FN:** criamos `idioma`, `curso`, `sala` e `professor`; `turma` guarda apenas as
chaves estrangeiras. Resultado: o modelo relacional do documento 03.

## 5.3 Verificação das relações finais
Em todas as relações, cada atributo não chave depende **da chave inteira** e
**somente da chave** (nenhuma dependência parcial ou transitiva), portanto o
esquema está na 3FN. As chaves candidatas alternativas (cpf, email) são chaves,
logo as dependências cpf -> ... também respeitam a 3FN (e a BCNF).
