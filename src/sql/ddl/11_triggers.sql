-- Triggers: regras de negócio que CHECK não consegue expressar,
-- pois dependem de outras tabelas.

DELIMITER $$

-- R1: o professor da turma precisa estar habilitado no idioma do curso (INSERT)
CREATE TRIGGER trg_turma_professor_habilitado_ins
BEFORE INSERT ON turma
FOR EACH ROW
BEGIN
    DECLARE v_idioma INT;
    DECLARE v_habilitado INT;

    SELECT id_idioma INTO v_idioma FROM curso WHERE id_curso = NEW.id_curso;
    SELECT COUNT(*) INTO v_habilitado
      FROM professor_idioma
     WHERE id_professor = NEW.id_professor AND id_idioma = v_idioma;

    IF v_habilitado = 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Professor nao habilitado no idioma do curso da turma';
    END IF;
END$$

-- R1: o mesmo controle para alterações (UPDATE)
CREATE TRIGGER trg_turma_professor_habilitado_upd
BEFORE UPDATE ON turma
FOR EACH ROW
BEGIN
    DECLARE v_idioma INT;
    DECLARE v_habilitado INT;

    SELECT id_idioma INTO v_idioma FROM curso WHERE id_curso = NEW.id_curso;
    SELECT COUNT(*) INTO v_habilitado
      FROM professor_idioma
     WHERE id_professor = NEW.id_professor AND id_idioma = v_idioma;

    IF v_habilitado = 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Professor nao habilitado no idioma do curso da turma';
    END IF;
END$$

-- R2: número de vagas da turma não pode exceder a capacidade da sala (INSERT)
CREATE TRIGGER trg_turma_vagas_ins
BEFORE INSERT ON turma
FOR EACH ROW
BEGIN
    DECLARE v_capacidade INT;

    SELECT capacidade INTO v_capacidade FROM sala WHERE id_sala = NEW.id_sala;

    IF NEW.vagas > v_capacidade THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Vagas da turma excedem a capacidade da sala';
    END IF;
END$$

-- R2: o mesmo controle para alterações (UPDATE)
CREATE TRIGGER trg_turma_vagas_upd
BEFORE UPDATE ON turma
FOR EACH ROW
BEGIN
    DECLARE v_capacidade INT;

    SELECT capacidade INTO v_capacidade FROM sala WHERE id_sala = NEW.id_sala;

    IF NEW.vagas > v_capacidade THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Vagas da turma excedem a capacidade da sala';
    END IF;
END$$

-- R3: não é possível remover a habilitação de um professor em um idioma
-- enquanto ele ministrar turma desse idioma
CREATE TRIGGER trg_professor_idioma_bd
BEFORE DELETE ON professor_idioma
FOR EACH ROW
BEGIN
    DECLARE v_turmas INT;

    SELECT COUNT(*) INTO v_turmas
      FROM turma t
      JOIN curso c ON c.id_curso = t.id_curso
     WHERE t.id_professor = OLD.id_professor
       AND c.id_idioma = OLD.id_idioma;

    IF v_turmas > 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Habilitacao em uso por turma do professor; nao pode ser removida';
    END IF;
END$$

DELIMITER ;
