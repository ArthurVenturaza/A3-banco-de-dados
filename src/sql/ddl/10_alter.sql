-- Ajustes posteriores à criação das tabelas (ALTER TABLE)

-- 1) Permite inativar alunos sem apagar o histórico
ALTER TABLE aluno
    ADD COLUMN ativo BOOLEAN NOT NULL DEFAULT TRUE;

-- 2) Garante que o valor das parcelas seja positivo
ALTER TABLE pagamento
    ADD CONSTRAINT ck_pagamento_valor CHECK (valor > 0);

-- 3) Acelera a busca de turmas por semestre
ALTER TABLE turma
    ADD INDEX idx_turma_semestre (semestre);

-- 4) Acelera a busca de parcelas por vencimento (relatório de inadimplência)
ALTER TABLE pagamento
    ADD INDEX idx_pagamento_vencimento (data_vencimento);

-- 5) Regra: não pode haver duas turmas na mesma sala no mesmo dia e horário de início
ALTER TABLE turma
    ADD CONSTRAINT uq_turma_sala_horario UNIQUE (id_sala, semestre, dia_semana, hora_inicio);

-- 6) Regra: dia da semana restrito aos dias letivos da escola
ALTER TABLE turma
    ADD CONSTRAINT ck_turma_dia CHECK (dia_semana IN ('Segunda', 'Terca', 'Quarta', 'Quinta', 'Sexta', 'Sabado'));

-- 7) Regra: forma de pagamento só existe quando a parcela foi paga (e vice-versa)
ALTER TABLE pagamento
    ADD CONSTRAINT ck_pagamento_pago CHECK ((data_pagamento IS NULL) = (forma_pagamento IS NULL));
