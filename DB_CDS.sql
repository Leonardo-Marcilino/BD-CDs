CREATE DATABASE Db_Cds;
USE Db_Cds;

CREATE TABLE Artista(
	Id_Cod_Art INT NOT NULL,
	Nome_Art VARCHAR(100) NOT NULL,
    CONSTRAINT Pk_Id_Cod_Art PRIMARY KEY(Id_Cod_Art)
);
CREATE TABLE Gravadora(
	Id_Cod_Grav INT NOT NULL,
    Cod_Grav INT NOT NULL,
    Nome_Grav VARCHAR(50) NOT NULL,
    CONSTRAINT Pk_Id_Cod_Grav PRIMARY KEY(Id_Cod_Grav)
);
CREATE TABLE Categoria(
	Id_Cod_Cat INT NOT NULL,
    Nome_Cat VARCHAR (50) NOT NULL,
	
    CONSTRAINT Pk_Id_Cod_Cat PRIMARY KEY(Id_Cod_Cat)
);
CREATE TABLE Estado(
	Id_Sigla_Est CHAR(2) NOT NULL,
    Nome_Est CHAR (50) NOT NULL,
    CONSTRAINT Pk_Id_Sigla_Est PRIMARY KEY(Id_Sigla_Est)
);
CREATE TABLE Cidade(
	Id_Cod_Cid INT NOT NULL,
    Fk_Sigla_Est CHAR(2) NOT NULL,
    Nome_Cid VARCHAR(100) NOT NULL,
    
    CONSTRAINT Pk_Id_Cod_Cid PRIMARY KEY(Id_Cod_Cid),
    
    CONSTRAINT Fk_Sigla_Est FOREIGN KEY(Fk_Sigla_Est)
    REFERENCES Estado (Id_Sigla_Est)
);
CREATE TABLE Cliente(
	Id_Cod_Cli INT NOT NULL,
    Fk_Cod_Cid INT NOT NULL,
    Nome_Cli VARCHAR(100) NOT NULL,
    End_Cli VARCHAR(200) NOT NULL,
    Renda_Cli DECIMAL(10,2) NOT NULL,
    Sexo_Cli ENUM('F', 'M') NOT NULL,
    
    CONSTRAINT Pk_Id_Cod_Cli PRIMARY KEY(Id_Cod_Cli),
    
    CONSTRAINT Fk_Cod_Cid FOREIGN KEY(Fk_Cod_Cid)
    REFERENCES Cidade (Id_Cod_Cid)
);

CREATE TABLE Conjuge(
	Fk_Cod_Cli INT NOT NULL,
    Nome_Conj VARCHAR(100) NOT NULL,
    Renda_Conj DECIMAL(10,2) NOT NULL,
    Sexo_Conj ENUM('F','M'),
    
    CONSTRAINT Fk_Cod_Cli FOREIGN KEY (Fk_Cod_Cli)
    REFERENCES Cliente (Id_Cod_Cli)
);
CREATE TABLE Funcionario(
	Id_Cod_Func INT NOT NULL,
    Nome_Func VARCHAR(100) NOT NULL,
    End_Func VARCHAR(200) NOT NULL,
    Sal_Func DECIMAL(10,2) NOT NULL,
    Sexo_Func ENUM('F','M'),
    
    CONSTRAINT Pk_Id_Cod_Func PRIMARY KEY(Id_Cod_Func)
);
CREATE TABLE Dependente(
	Id_Cod_Dep INT NOT NULL,
    Fk_Cod_Func INT NOT NULL,
    Nome_Dep VARCHAR(100) NOT NULL,
    Sexo_Dep ENUM('F','M'),
    
    CONSTRAINT Pk_Cod_Dep PRIMARY KEY(Id_Cod_Dep),
    
    CONSTRAINT Fk_Cod_Func FOREIGN KEY (Fk_Cod_Func)
    REFERENCES Funcionario (Id_Cod_Func)
);
CREATE TABLE TITULO(
	Id_Cod_Tit INT NOT NULL,
    Fk_Cod_Cat INT NOT NULL,
    Fk_Cod_Grav INT NOT NULL,
    Nome_CD VARCHAR(100) NOT NULL,
    VAL_CD DECIMAL(10,2) NOT NULL,
    Qtd_Estq INT NOT NULL,
    
    CONSTRAINT Pk_Id_Cod_Titulo PRIMARY KEY(Id_Cod_Tit),
    
    CONSTRAINT Fk_Cod_Cat FOREIGN KEY (Fk_Cod_Cat)
    REFERENCES Categoria (Id_Cod_Cat),
    
    CONSTRAINT Fk_Cod_Grav FOREIGN KEY (Fk_Cod_Grav)
    REFERENCES Gravadora (Id_Cod_Grav)
);
CREATE TABLE Pedido(
	Id_Num_Ped INT NOT NULL,
    Fk_Cod_Clii INT NOT NULL,
    Fk_Cod_Funcc INT NOT NULL,
    Data_Ped DATETIME NOT NULL,
    Val_Ped DECIMAL (10,2) NOT NULL,
	
    CONSTRAINT Pk_Id_Num_Ped PRIMARY KEY(Id_Num_Ped),
    
    CONSTRAINT Fk_Cod_Clii FOREIGN KEY (Fk_Cod_Clii)
    REFERENCES Cliente (Id_Cod_Cli),
    
    CONSTRAINT Fk_Cod_Funcc FOREIGN KEY (Fk_Cod_Funcc)
    REFERENCES Funcionario (Id_Cod_Func)
);
CREATE TABLE Titulo_Pedido(
	Fk_Num_Ped INT NOT NULL,
    Fk_Cod_Tit INT NOT NULL,
    Qtd_CD INT NOT NULL,
    Val_CD DECIMAL(10,2) NOT NULL,

    
    CONSTRAINT Fk_Num_Ped FOREIGN KEY (Fk_Num_Ped)
    REFERENCES Pedido (Id_Num_Ped),
    
    CONSTRAINT Fk_Cod_Tit FOREIGN KEY (Fk_Cod_Tit)
    REFERENCES Titulo (Id_Cod_Tit)
);
CREATE TABLE Titulo_Artista(
	Fk_Cod_Titt INT NOT NULL,
    Fk_Cod_Artt INT NOT NULL,
    
	CONSTRAINT Fk_Cod_Titt FOREIGN KEY (Fk_Cod_Titt)
    REFERENCES Titulo (Id_Cod_Tit),
    
	CONSTRAINT Fk_Cod_Art FOREIGN KEY (Fk_Cod_Artt)
    REFERENCES Artista (Id_Cod_Art)
    
);