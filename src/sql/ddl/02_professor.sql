CREATE TABLE professor (
    id_professor  INT AUTO_INCREMENT,
    nome          VARCHAR(100) NOT NULL,
    cpf           CHAR(11)     NOT NULL,
    email         VARCHAR(100) NOT NULL,
    telefone      VARCHAR(15),
    data_admissao DATE         NOT NULL,
    CONSTRAINT pk_professor PRIMARY KEY (id_professor),
    CONSTRAINT uq_professor_cpf UNIQUE (cpf),
    CONSTRAINT uq_professor_email UNIQUE (email)
);
