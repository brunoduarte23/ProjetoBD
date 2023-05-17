CREATE DATABASE EMPRESA; 
    CREATE TABLE FUNCIONARIO
        (PNOME VARCHAR(15) NOT NULL, 
        NOMEDOMEIO VARCHAR(15),
        UNOME VARCHAR(15) NOT NULL,
        /*Ultimo nome*/
        DATADENASC DATE NOT NULL,
        CPF CHAR(11) NOT NULL UNIQUE,
        SEXO CHAR, 
        ENDERECO VARCHAR(50), 
        SALARIO FLOAT NOT NULL,
        CPF_SUPER CHAR(11),
        /*CPF supervisor*/
        NUMERO_DEPARTAMENTO INT NOT NULL,
        PRIMARY KEY(CPF)); 
    CREATE TABLE DEPARTAMENTO
        (NOME_DEPARTAMENTO VARCHAR(15) NOT NULL,
        NUMERO_DEPARTAMENTO INT NOT NULL,
        CPF_GERE CHAR NOT NULL,
        DATA_DE_INICIO_GERENTE DATE,
        PRIMARY KEY (NUMERO_DEPARTAMENTO),
        UNIQUE (NOME_DEPARTAMENTO),
        FOREIGN KEY (CPF_GERE) REFERENCES FUNCIONARIO(CPF));
    CREATE TABLE LOCALIZACAO_DEPARTAMENTO
        (NUMERO_DEPARTAMENTO INT NOT NULL,
        LOCALIZACAO VARCHAR(15) NOT NULL,
        PRIMARY KEY (NUMERO_DEPARTAMENTO, LOCALIZACAO),
        FOREIGN KEY (NUMERO_DEPARTAMENTO) REFERENCES DEPARTAMENTO(NUMERO_DEPARTAMENTO));
    CREATE TABLE PROJETO
        (NOME_PROJETO VARCHAR(15) NOT NULL,
        NUMERO_PROJETO INT NOT NULL,
        LOCAL_PROJETO VARCHAR(15),
        NUMERO_DEPARTAMENTO INT NOT NULL,
        PRIMARY KEY (NUMERO_PROJETO),
        UNIQUE (NOME_PROJETO),
        FOREIGN KEY (NUMERO_DEPARTAMENTO) REFERENCES DEPARTAMENTO(NUMERO_DEPARTAMENTO) );
    CREATE TABLE TRABALHA_EM
        (CPF_FUNCIONARIO CHAR(11) NOT NULL,
        NUMERO_PROJETO INT NOT NULL,
        HORAS DECIMAL(3,1) NOT NULL,
        PRIMARY KEY (CPF_FUNCIONARIO, NUMERO_PROJETO),
        FOREIGN KEY (CPF_FUNCIONARIO) REFERENCES FUNCIONARIO(CPF),
        FOREIGN KEY (NUMERO_PROJETO) REFERENCES PROJETO(NUMERO_PROJETO));
    CREATE TABLE DEPENDENTE
        (CPF_FUNCIONARIO CHAR(11) NOT NULL,
        NOME_DEPENDENTE VARCHAR(15) NOT NULL,
        SEXO CHAR,
        DATADENASC DATE,
        PARENTESCO VARCHAR(8),
        PRIMARY KEY (CPF_FUNCIONARIO, NOME_DEPENDENTE),
        FOREIGN KEY (CPF_FUNCIONARIO) REFERENCES FUNCIONARIO (CPF));
