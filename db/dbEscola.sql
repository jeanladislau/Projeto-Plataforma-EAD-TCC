create database Prod_school;

use Prod_school;



-- Parte 1 ------------------
Create Table Tblusu(
Idusu Int Primary Key auto_increment,
Nome_Comp Varchar(100) Not Null,
Email Varchar(100) Not Null,
Telefone Varchar(13),
Matricula Int(9) Not Null,
Dt_Nasc Date Not Null,
Dt_Cad datetime
);


-- Apagar todo registro maior que 0 ou 1
delete from tblusu where Idusu>0;	

 -- Realizar consulta	
select* from Tblusu order by 1;	

INSERT INTO Tblusu (Nome_Comp, Email, Telefone, Matricula, Dt_Nasc,Dt_Cad) VALUES 
('Valdirene Pereira Da Silva','vavasailva@gmail.com','62 99246-2613','202110038', str_to_date('28/11/1985', '%d/%m/%Y'),sysdate()),
('Jotinha Dos Santos','jtota@gmail.com','62 99244-9836','202110040', str_to_date('05/02/1975', '%d/%m/%Y'),sysdate()),
('Mariana Leonel Alves','mariazinha@gmail.com','62 99151-8928','202110077', str_to_date('08/08/1987', '%d/%m/%Y'),sysdate()),
('Tiago Soares da conceicao','tiago.soares@hotmail.com','62 99151-8928','202120120', str_to_date('20/10/1993', '%d/%m/%Y'),sysdate());
 
 
 -- Consultar usuario e senha  de login
 SELECT  concat(substring(Usu.NOME_COMP, 1,1), substring_index(USU.NOME_COMP,' ',-1)),  date_format(Dt_Nasc , "%d%m%Y")  FROM TBLUSU USU;	
 
-- Visualizar credenciais;
 select * from view_credenciais Where usuario='Tconceicao' and SENHA='20101993';


 select * from view_credenciais;


-- verifica matricua se existe 
SELECT COUNT(*) FROM TBLUSU WHERE Matricula = '202120120' ;

-- Consultar nome de usuario para login
SELECT  concat(substring(Usu.NOME_COMP, 1,1), substring_index(USU.NOME_COMP,' ',-1)) FROM TBLUSU USU;

 
-- Consultar senha de login
select  date_format(Dt_Nasc , "%d%m%Y") from Tblusu;
 
 
 
-- Verificar credenciais de login PHP
select  concat(substring(Usu.NOME_COMP, 1,1), substring_index(USU.NOME_COMP,' ',-1)), date_format(Dt_Nasc , '%d%m%Y')  FROM TBLUSU USU
where  concat(substring(Usu.NOME_COMP, 1,1), substring_index(USU.NOME_COMP,' ',-1)) = 'Tconceicao' and date_format(Dt_Nasc , '%d%m%Y') = '20101993';

 
  -- conferir dados e fazer login
select Nome_Comp, dt_nasc from tblusu;
 
 



-- Parte 2 --------------------------------------------------------------------
/*primeiro os dados são inseridos pelo adm na tblmat com os dados principais*/
Create Table Tblmat(
	Idusu Int Primary Key Auto_Increment,
	Matricula Int Unique Not Null ,
    Nome_Comp Varchar(100) Not Null,
    Tipusu Int Not Null,
    Dt_Cad Date Not Null,
    DT_CAD Date
);

-- Apagar todo registro maior que 0 ou 1
-- delete from Tblmat where Idusu>0;

-- Realizar consulta	
select* from Tblmat order by 1;


INSERT INTO TBLMAT (MATRICULA,NOME_COMP,TIPUSU,DT_CAD) VALUES 
(202110038,'Valdirene Pereira da Silva',1, str_to_date('28/11/2022', '%d/%m/%Y'),sysdate()),  /*tipo de usuário 1 ADM*/
(202110040,'Jotinha Dos Santos',2, str_to_date('29/11/2022', '%d/%m/%Y'),sysdate()),         /*Tipo De Usuário 2 PROFESSOR*/
(202110077,'Mariana Leonel Alves',3, str_to_date('30/11/2022', '%d/%m/%Y'),sysdate());      /*Tipo De Usuário 3 ALUNO*/



-- Realizar consulta data fazendo a conversão 
select  date_format(DT_cad , "%d%m%Y") from tblmat;	


-- verificar senha de login do usuario 
select* from Tblmat where nome_comp='Valdirene Pereira Da Silva' and matricula='202110038';



-- Parte 3 --------------------------------------------------------------------
Create Table Tblfreq(
	status boolean not null,
    dt date,
    conteudo varchar(200),
    justificativa varchar(200) not null,
    idusu int not null,
    tipusu int not null,
    iddisplina int not null,
    idturno int not null,
	idserie int not null
    
);


Create Table Tblserie(
	idserie int primary key auto_increment,
    iddisplina int not null,
    idcronograma int not null,
    idusu int not null,
    tipusu int not null,
    idturno int not null
    
);




Create Table Tblturno(
	idturno int primary key auto_increment,
    periodo varchar(20) not null,
    hrinicio varchar(20) not null,
    hrfim varchar(20) not null,
    dtinicio date,
    difim date,
    idserie int not null
);


Create Table Tblati(
	idatividade int primary key auto_increment ,
    resp_atividade varchar(1000) not null,
    prazo_entrega varchar(80),
    nota double,
    iddisplina int not null,
    idserie int
    
);



Create Table Tblcron(
	idcronograma int primary key auto_increment,
    dtinicio date,
    difim date,
    hrinicio varchar(20) not null,
    hrfim varchar(20) not null,
    iddisplina int not null
    
);



create table tbldisci (
	iddisciplina int primary key auto_increment,
    nome_comp varchar(100) not null,
    idusu int not null,
    tipusu int not null,
    idserie int not null,
    idcronograma int not null
);



Create Table Tblchat (
    idchat int primary key auto_increment,
    duvidas varchar(200),
    resp_duvida varchar(200),
    nome_comp varchar(100),
	dtinicio date,
    difim date,
    tipusu int not null,
    idserie int not null    
);








