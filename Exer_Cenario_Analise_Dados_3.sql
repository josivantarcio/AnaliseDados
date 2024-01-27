## 1- Quem são os técnicos (coaches) e atletas das equipes de Handball?
SELECT t.nome as TREINADOR, a.nome as ATLETA, a.disciplina as DISCIPLINA
FROM cap04.TB_ATLETAS as a
INNER JOIN cap04.TB_TREINADOR as t
ON a.disciplina LIKE '%Hand%' AND a.disciplina = t.disciplina
ORDER BY a.nome; 
