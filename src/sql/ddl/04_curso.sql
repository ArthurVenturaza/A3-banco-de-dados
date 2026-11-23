CREATE TABLE curso (
    id_curso          INT AUTO_INCREMENT,
    id_idioma         INT           NOT NULL,
    nome              VARCHAR(80)   NOT NULL,
    nivel             VARCHAR(20)   NOT NULL,
    carga_horaria     SMALLINT      NOT NULL,
    valor_mensalidade DECIMAL(8,2)  NOT NULL,
    CONSTRAINT pk_curso PRIMARY KEY (id_curso),
    CONSTRAINT fk_curso_idioma FOREIGN KEY (id_idioma)
        REFERENCES idioma (id_idioma),
    CONSTRAINT ck_curso_nivel CHECK (nivel IN ('Basico', 'Intermediario', 'Avancado')),
    CONSTRAINT ck_curso_carga CHECK (carga_horaria > 0),
    CONSTRAINT ck_curso_valor CHECK (valor_mensalidade > 0)
);
