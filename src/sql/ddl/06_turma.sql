CREATE TABLE turma (
    id_turma     INT AUTO_INCREMENT,
    id_curso     INT         NOT NULL,
    id_professor INT         NOT NULL,
    id_sala      INT         NOT NULL,
    semestre     CHAR(6)     NOT NULL,
    dia_semana   VARCHAR(10) NOT NULL,
    hora_inicio  TIME        NOT NULL,
    hora_fim     TIME        NOT NULL,
    vagas        SMALLINT    NOT NULL,
    CONSTRAINT pk_turma PRIMARY KEY (id_turma),
    CONSTRAINT fk_turma_curso FOREIGN KEY (id_curso)
        REFERENCES curso (id_curso),
    CONSTRAINT fk_turma_professor FOREIGN KEY (id_professor)
        REFERENCES professor (id_professor),
    CONSTRAINT fk_turma_sala FOREIGN KEY (id_sala)
        REFERENCES sala (id_sala),
    CONSTRAINT ck_turma_horario CHECK (hora_fim > hora_inicio),
    CONSTRAINT ck_turma_vagas CHECK (vagas > 0)
);
