CREATE TABLE pagamento (
    id_pagamento    INT AUTO_INCREMENT,
    id_matricula    INT          NOT NULL,
    numero_parcela  TINYINT      NOT NULL,
    valor           DECIMAL(8,2) NOT NULL,
    data_vencimento DATE         NOT NULL,
    data_pagamento  DATE,
    forma_pagamento VARCHAR(20),
    CONSTRAINT pk_pagamento PRIMARY KEY (id_pagamento),
    CONSTRAINT fk_pagamento_matricula FOREIGN KEY (id_matricula)
        REFERENCES matricula (id_matricula) ON DELETE CASCADE,
    CONSTRAINT uq_pagamento_parcela UNIQUE (id_matricula, numero_parcela),
    CONSTRAINT ck_pagamento_forma
        CHECK (forma_pagamento IS NULL OR forma_pagamento IN ('Pix', 'Boleto', 'Cartao'))
);
