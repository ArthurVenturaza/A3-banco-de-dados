# 1. Contextualização

A **Escola de Idiomas** oferece cursos de Inglês, Espanhol, Francês e Alemão em
vários níveis (Básico, Intermediário e Avançado). Hoje o controle é feito em
planilhas, o que gera dados duplicados, conflitos de horário e dificuldade para
saber quem está inadimplente.

## Regras de negócio
1. Cada **idioma** possui vários **cursos**; um curso pertence a um único idioma
   e tem nível, carga horária e valor de mensalidade.
2. Um **professor** pode estar habilitado a ensinar vários idiomas, e um idioma
   pode ter vários professores habilitados (N:N).
3. Um curso é oferecido em várias **turmas** por semestre. Cada turma pertence a
   um curso, tem um único professor, ocorre em uma única **sala**, em um dia da
   semana e horário definidos, e possui um limite de vagas.
4. Uma sala pode abrigar várias turmas (em horários diferentes).
5. Um **aluno** pode se matricular em várias turmas, e uma turma tem vários
   alunos (N:N). A relação é materializada pela **matrícula**, que guarda data
   e situação (Ativa, Trancada, Concluída, Cancelada).
6. Um aluno não pode ter duas matrículas na mesma turma.
7. Cada matrícula gera várias **parcelas de pagamento** (mensalidades), com
   vencimento, valor e, quando pagas, data e forma de pagamento.

## Entidades (8 + 1 associativa)
Idioma, Curso, Professor, Sala, Turma, Aluno, Matrícula, Pagamento e a
associativa Professor_Idioma.
