CREATE TABLE idioma (
    id_idioma INT AUTO_INCREMENT,
    nome      VARCHAR(50) NOT NULL,
    CONSTRAINT pk_idioma PRIMARY KEY (id_idioma),
    CONSTRAINT uq_idioma_nome UNIQUE (nome)
);
