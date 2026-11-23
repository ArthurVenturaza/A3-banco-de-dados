CREATE TABLE professor_idioma (
    id_professor INT NOT NULL,
    id_idioma    INT NOT NULL,
    CONSTRAINT pk_professor_idioma PRIMARY KEY (id_professor, id_idioma),
    CONSTRAINT fk_pi_professor FOREIGN KEY (id_professor)
        REFERENCES professor (id_professor) ON DELETE CASCADE,
    CONSTRAINT fk_pi_idioma FOREIGN KEY (id_idioma)
        REFERENCES idioma (id_idioma) ON DELETE CASCADE
);
