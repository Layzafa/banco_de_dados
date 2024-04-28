create table usuario(
	id_usuario int primary key,
	nome varchar not null, 
	email varchar not null, 
	telefone int not null,
	endereço varchar not null
);

create table autor(
	id_autor serial primary key,
	autor varchar not null,
	nacionalidade varchar not null,
	ano_nascimento int not null
	
);

create table editora(
	id_editora serial primary key,
	editora varchar not null,
	CNPJ_editora int not null
);

create table genero(
	id_genero serial primary key,
	genero varchar not null
);

create table livro(
	id_livro serial primary key,
	titulo varchar not null,
	autor varchar references autor(id_autor),
	genero varchar references genero(id_genero),
	ano_publicacao int not null,
	editora varchar references editora(id_editora),
	status varchar not null
);

create table emprestimo(
	id_emprestimo serial primary key,
	foreign key (id_livro) references livro(id_livro),
	foreign key (id_usuario) references usuario(id_usuario),
	data_emprestimo date not null,
	devolucao date not null
);

