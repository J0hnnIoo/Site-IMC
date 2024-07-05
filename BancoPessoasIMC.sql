drop database if exists pessoasIMC;
create database if not exists pessoasIMC;

use pessoasIMC;

create table pessoas(
	id_pessoa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    sobrenome VARCHAR(50),
    idade INT,
    peso DECIMAL(5,2),
    altura DECIMAL(4,2)
);

select * from pessoas;

insert into pessoas values (1, "teste", "teste", 19, 1, 1);
insert into pessoas values (2, "teste", "teste", 30, 1, 1);
insert into pessoas values (12, "teste", "teste", 40, 1, 1);
insert into pessoas values (18, "joao", "teste", 90, 1, 1);
insert into pessoas values (19, "joao", "teste", 9, 1, 1);
insert into pessoas values (20, "jonas", "teste", 90, 1, 1);

select max(idade) as MaiorIdade from pessoas;
select idade from pessoas order by idade desc limit 3;
select min(idade) from pessoas;

SELECT round(AVG(idade)) FROM pessoas;
SELECT nome
FROM pessoas
WHERE idade > (SELECT AVG(idade) FROM pessoas);

DELIMITER //

CREATE FUNCTION calcular_imc(peso DECIMAL(5,2), altura DECIMAL(4,2))
RETURNS DECIMAL(6,2)
BEGIN
    DECLARE imc DECIMAL(6,2);
    SET imc = peso / (altura * altura);
    RETURN imc;
END//

DELIMITER ;

SELECT nome, calcular_imc(peso, altura) AS imc
FROM pessoas;

select nome, calcular_imc(peso, altura) from pessoas order by idade desc limit 3;