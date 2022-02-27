CREATE DATABASE RpgOnlineBD2

USE RpgOnlineBD2

CREATE TABLE Usuarios (
	UsuarioId INT PRIMARY KEY IDENTITY
	,Email VARCHAR(100) UNIQUE NOT NULL
	,Senha VARCHAR(255) NOT NULL
)
GO

CREATE TABLE Classe (
	ClasseId INT PRIMARY KEY IDENTITY
	,ClasseNome VARCHAR(50) UNIQUE NOT NULL
	,ClasseDescricao VARCHAR(255)
)
GO

CREATE TABLE Habilidade (
	HabilidadeId INT PRIMARY KEY IDENTITY
	,HabilidadeNome VARCHAR(50) UNIQUE NOT NULL
	,HabilidadeDescricao VARCHAR(255)
)
GO

CREATE TABLE Personagem (
	PersonagemId INT PRIMARY KEY IDENTITY
	,PersonagemNome VARCHAR(15) NOT NULL
	,PersonagemLVL INT NOT NULL
	,UsuarioId INT UNIQUE FOREIGN KEY REFERENCES Usuarios(UsuarioId)
	,ClasseId INT UNIQUE FOREIGN KEY REFERENCES Classe(ClasseId)
)	
GO

CREATE TABLE ClasseHabilidade (
	ClasseId INT FOREIGN KEY REFERENCES Classe(ClasseId)
	,HabilidadeId INT FOREIGN KEY REFERENCES Habilidade(HabilidadeId)
)
GO


--DML

 -- USER 1 TESTE

INSERT INTO Usuarios VALUES ('jubileu@gmail.com','melhorsenha')

INSERT INTO Classe VALUES ('Arqueiro','atira flechas `-` ')

INSERT INTO Habilidade VALUES ('TriFlechas', 'Atira 3 flechas de uma só vez')

INSERT INTO Personagem (PersonagemNome, PersonagemLVL,UsuarioId, ClasseId) VALUES ('RoninhoArqueiro', 100, 1, 1)

INSERT INTO ClasseHabilidade (ClasseId, HabilidadeId) VALUES(1,1)

 -- USER 2 TESTE

INSERT INTO Usuarios VALUES ('emaildocaraquevaijogarorpg@gmail.com','supersenhasecreta')

INSERT INTO Classe VALUES ('Mago medroso','')

INSERT INTO Habilidade VALUES ('Escudo Supremo','ativa um super escudo para sua proteçao')
INSERT INTO Habilidade VALUES ('Surdina', 'Voce fica na surdina')

INSERT INTO Personagem (PersonagemNome, PersonagemLVL,UsuarioId, ClasseId) VALUES ('RepolhoSelvagem', 30, 2, 2)

INSERT INTO ClasseHabilidade (ClasseId, HabilidadeId) VALUES(2,2),(2,3)

UPDATE Classe
SET ClasseDescricao = 'um magro novato que tem medo de ir a guerra'
WHERE ClasseId = 2

-- DQL

SELECT * FROM Usuarios
SELECT * FROM Personagem
SELECT * FROM Classe
SELECT * FROM Habilidade
SELECT * FROM ClasseHabilidade

SELECT * FROM Personagem 
INNER JOIN Classe
ON Personagem.ClasseId = Classe.ClasseId -- BASICO


SELECT P.PersonagemNome 'Nome do Personagem', P.PersonagemLVL 'LVL do Personagem ', C.ClasseNome 'Nome da Classe' , C.ClasseDescricao 'Descriçao da Classe' FROM Personagem AS P -- APELIDO
JOIN Classe C -- MESMO SEM "AS" RECONHECE COMO APELIDO
ON P.ClasseId = C.ClasseId 

