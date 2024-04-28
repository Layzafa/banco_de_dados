CREATE TABLE usuario (
    id_usuario SERIAL PRIMARY KEY,
    nome VARCHAR NOT NULL,
    email VARCHAR NOT NULL,
    telefone INT NOT NULL,
    endereco VARCHAR NOT NULL
);

CREATE TABLE genero (
    id_genero SERIAL PRIMARY KEY,
    nome_genero VARCHAR NOT NULL
);

CREATE TABLE editora (
    id_editora SERIAL PRIMARY KEY,
    nome_editora VARCHAR NOT NULL,
    CNPJ_editora INT NOT NULL
);

CREATE TABLE autor (
    id_autor SERIAL PRIMARY KEY,
    nome_autor VARCHAR NOT NULL,
    nacionalidade VARCHAR NOT NULL,
    ano_nascimento INT NOT NULL
);

CREATE TABLE livro (
    id_livro SERIAL PRIMARY KEY,
    titulo VARCHAR NOT NULL,
    autor INT REFERENCES autor(id_autor),
    genero INT REFERENCES genero(id_genero),
    ano_publicacao INT NOT NULL,
    editora INT REFERENCES editora(id_editora),
    status VARCHAR NOT NULL
);

CREATE TABLE status_emprestimo (
    id_status SERIAL PRIMARY KEY,
    descricao VARCHAR NOT NULL
);

CREATE TABLE emprestimo (
    id_emprestimo SERIAL PRIMARY KEY,
    id_livro SERIAL REFERENCES livro(id_livro),
    id_usuario INT REFERENCES usuario(id_usuario),
    data_emprestimo DATE NOT NULL,
    devolucao DATE NOT NULL,
    status INTEGER REFERENCES status_emprestimo(id_status)
);

INSERT INTO usuario (nome, email, telefone, endereco)
VALUES
    ('João Silva', 'joao@email.com', 123456789, 'Rua A, 123'),
    ('Maria Souza', 'maria@email.com', 987654321, 'Avenida B, 456'),
    ('Pedro Santos', 'pedro@email.com', 111222333, 'Rua C, 789'),
    ('Ana Oliveira', 'ana@email.com', 444555666, 'Avenida D, 987'),
    ('Carlos Pereira', 'carlos@email.com', 777888999, 'Rua E, 654');
	
INSERT INTO genero (nome_genero)
VALUES
    ('Ficção'),
    ('Romance'),
    ('Fantasia'),
    ('Aventura');
	
INSERT INTO editora (id_editora, nome_editora, CNPJ_editora)
VALUES
    (1, 'Editora A', 123456789),
    (2, 'Editora B', 234567890),
    (3, 'Editora C', 345678901),
    (4, 'Editora D', 456789012),
    (5, 'Editora E', 567890123);

INSERT INTO autor (nome_autor, nacionalidade, ano_nascimento)
VALUES
    ('George Orwell', 'Britânico', 1903),
    ('Miguel de Cervantes', 'Espanhol', 1547),
    ('J.R.R. Tolkien', 'Britânico', 1892),
    ('J.K. Rowling', 'Britânico', 1965),
    ('Jane Austen', 'Britânico', 1775);
	
INSERT INTO livro (titulo, autor, genero, ano_publicacao, editora, status)
VALUES
    ('1984', 1, 1, 1949, 1, 'Disponível'),
    ('Dom Quixote', 2, 2, 1605, 2, 'Disponível'),
    ('O Senhor dos Anéis: A Sociedade do Anel', 3, 4, 1954, 3, 'Disponível'),
    ('Harry Potter e a Pedra Filosofal', 4, 4, 1997, 4, 'Disponível'),
    ('Orgulho e Preconceito', 5, 2, 1813, 5, 'Disponível');

INSERT INTO status_emprestimo (descricao)
VALUES
    ('Em andamento'),
    ('Atrasado'),
    ('Concluído');
	
INSERT INTO emprestimo (id_livro, id_usuario, data_emprestimo, devolucao, status)
VALUES
    (6, 2, '2024-03-01', '2024-03-15', 1),
    (7, 3, '2024-03-02', '2024-03-16', 1),
    (8, 4, '2024-03-03', '2024-03-17', 1),
    (9, 5, '2024-03-04', '2024-03-18', 1),
    (10, 1, '2024-03-05', '2024-03-19', 1);

SELECT * FROM emprestimo;


