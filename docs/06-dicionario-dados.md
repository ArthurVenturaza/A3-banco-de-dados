# 6. Dicionário de Dados

## idioma
| Coluna | Tipo | Nulo | Chave | Descrição |
|---|---|---|---|---|
| id_idioma | INT AUTO_INCREMENT | Não | PK | Identificador do idioma |
| nome | VARCHAR(50) | Não | UNIQUE | Nome do idioma |

## professor
| Coluna | Tipo | Nulo | Chave | Descrição |
|---|---|---|---|---|
| id_professor | INT AUTO_INCREMENT | Não | PK | Identificador do professor |
| nome | VARCHAR(100) | Não | | Nome completo |
| cpf | CHAR(11) | Não | UNIQUE | CPF (só números) |
| email | VARCHAR(100) | Não | UNIQUE | E-mail |
| telefone | VARCHAR(15) | Sim | | Telefone de contato |
| data_admissao | DATE | Não | | Data de contratação |

## professor_idioma
| Coluna | Tipo | Nulo | Chave | Descrição |
|---|---|---|---|---|
| id_professor | INT | Não | PK, FK | Professor habilitado |
| id_idioma | INT | Não | PK, FK | Idioma que o professor leciona |

## curso
| Coluna | Tipo | Nulo | Chave | Descrição |
|---|---|---|---|---|
| id_curso | INT AUTO_INCREMENT | Não | PK | Identificador do curso |
| id_idioma | INT | Não | FK | Idioma do curso |
| nome | VARCHAR(80) | Não | | Nome do curso |
| nivel | VARCHAR(20) | Não | | Basico, Intermediario ou Avancado |
| carga_horaria | SMALLINT | Não | | Horas totais (> 0) |
| valor_mensalidade | DECIMAL(8,2) | Não | | Valor mensal (> 0) |

## sala
| Coluna | Tipo | Nulo | Chave | Descrição |
|---|---|---|---|---|
| id_sala | INT AUTO_INCREMENT | Não | PK | Identificador da sala |
| nome | VARCHAR(30) | Não | UNIQUE | Nome/numeração |
| capacidade | SMALLINT | Não | | Lotação máxima (> 0) |

## turma
| Coluna | Tipo | Nulo | Chave | Descrição |
|---|---|---|---|---|
| id_turma | INT AUTO_INCREMENT | Não | PK | Identificador da turma |
| id_curso | INT | Não | FK | Curso oferecido |
| id_professor | INT | Não | FK | Professor responsável |
| id_sala | INT | Não | FK | Sala utilizada |
| semestre | CHAR(6) | Não | | Ex.: 2026/2 |
| dia_semana | VARCHAR(10) | Não | | Dia das aulas: Segunda, Terca, Quarta, Quinta, Sexta ou Sabado (CHECK) |
| hora_inicio | TIME | Não | | Início da aula |
| hora_fim | TIME | Não | | Fim da aula (> início) |
| vagas | SMALLINT | Não | | Número de vagas (> 0; não pode exceder a capacidade da sala, via TRIGGER) |

## aluno
| Coluna | Tipo | Nulo | Chave | Descrição |
|---|---|---|---|---|
| id_aluno | INT AUTO_INCREMENT | Não | PK | Identificador do aluno |
| nome | VARCHAR(100) | Não | | Nome completo |
| cpf | CHAR(11) | Não | UNIQUE | CPF (só números) |
| email | VARCHAR(100) | Não | UNIQUE | E-mail |
| telefone | VARCHAR(15) | Sim | | Telefone |
| data_nascimento | DATE | Não | | Data de nascimento |
| ativo | BOOLEAN | Não | | Adicionada via ALTER TABLE; padrão TRUE |

## matricula
| Coluna | Tipo | Nulo | Chave | Descrição |
|---|---|---|---|---|
| id_matricula | INT AUTO_INCREMENT | Não | PK | Identificador da matrícula |
| id_aluno | INT | Não | FK, UNIQUE(1) | Aluno matriculado |
| id_turma | INT | Não | FK, UNIQUE(2) | Turma escolhida |
| data_matricula | DATE | Não | | Data da matrícula |
| situacao | VARCHAR(15) | Não | | Ativa, Trancada, Concluida ou Cancelada (padrão Ativa) |

## pagamento
| Coluna | Tipo | Nulo | Chave | Descrição |
|---|---|---|---|---|
| id_pagamento | INT AUTO_INCREMENT | Não | PK | Identificador do pagamento |
| id_matricula | INT | Não | FK, UNIQUE(1) | Matrícula referente |
| numero_parcela | TINYINT | Não | UNIQUE(2) | Número da parcela |
| valor | DECIMAL(8,2) | Não | | Valor da parcela (> 0) |
| data_vencimento | DATE | Não | | Vencimento |
| data_pagamento | DATE | Sim | | Nulo = ainda não pago |
| forma_pagamento | VARCHAR(20) | Sim | | Pix, Boleto ou Cartao; preenchida se e somente se data_pagamento estiver preenchida (CHECK) |
