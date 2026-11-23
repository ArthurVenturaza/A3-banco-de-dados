CREATE TABLE sala (
    id_sala    INT AUTO_INCREMENT,
    nome       VARCHAR(30) NOT NULL,
    capacidade SMALLINT    NOT NULL,
    CONSTRAINT pk_sala PRIMARY KEY (id_sala),
    CONSTRAINT uq_sala_nome UNIQUE (nome),
    CONSTRAINT ck_sala_capacidade CHECK (capacidade > 0)
);
