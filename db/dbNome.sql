create database dbNome;

use dbNome;

create table usuario(
id int primary key auto_increment,
Nome varchar(100) not null,
Dt_Nasc date not null
);

-- Apagar todo registro maior que 0 ou 1
delete from usuario where id>0;					

select * from  usuario order by 1;			

insert into usuario(Nome,Dt_Nasc ) values('Tiago Soares da Conceição', str_to_date('20/10/1993', '%d/%m/%Y'));

-- Consulta nome de login
SELECT  concat(substring(us.Nome, 1,1), substring_index(us.Nome,' ',-1)) FROM usuario us;

-- Consulta nome e senha de login 
select  concat(substring(us.Nome, 1,1), substring_index(us.Nome,' ',-1)), date_format(Dt_Nasc , '%d%m%Y')  FROM usuario us
where  concat(substring(us.Nome, 1,1), substring_index(us.Nome,' ',-1)) = 'Tconceicao' and date_format(Dt_Nasc , '%d%m%Y') = '20101993';


