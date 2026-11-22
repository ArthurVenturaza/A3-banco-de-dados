CREATE TABLE aluno (
    id_aluno        INT AUTO_INCREMENT,
    nome            VARCHAR(100) NOT NULL,
    cpf             CHAR(11)     NOT NULL,
    email           VARCHAR(100) NOT NULL,
    telefone        VARCHAR(15),
    data_nascimento DATE         NOT NULL,
    CONSTRAINT pk_aluno PRIMARY KEY (id_aluno),
    CONSTRAINT uq_aluno_cpf UNIQUE (cpf),
    CONSTRAINT uq_aluno_email UNIQUE (email)
);
