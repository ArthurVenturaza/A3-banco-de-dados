CREATE TABLE matricula (
    id_matricula   INT AUTO_INCREMENT,
    id_aluno       INT         NOT NULL,
    id_turma       INT         NOT NULL,
    data_matricula DATE        NOT NULL,
    situacao       VARCHAR(15) NOT NULL DEFAULT 'Ativa',
    CONSTRAINT pk_matricula PRIMARY KEY (id_matricula),
    CONSTRAINT fk_matricula_aluno FOREIGN KEY (id_aluno)
        REFERENCES aluno (id_aluno),
    CONSTRAINT fk_matricula_turma FOREIGN KEY (id_turma)
        REFERENCES turma (id_turma),
    CONSTRAINT uq_matricula_aluno_turma UNIQUE (id_aluno, id_turma),
    CONSTRAINT ck_matricula_situacao
        CHECK (situacao IN ('Ativa', 'Trancada', 'Concluida', 'Cancelada'))
);
