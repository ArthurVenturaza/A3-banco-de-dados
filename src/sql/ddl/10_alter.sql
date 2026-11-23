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
