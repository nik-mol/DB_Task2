--Исполнители
CREATE TABLE IF NOT EXISTS Perfomer (
	id SERIAL PRIMARY KEY,
	name VARCHAR(30) NOT NULL
);

--Жанры
CREATE TABLE IF NOT EXISTS Genre (
	id SERIAL PRIMARY KEY,
	name VARCHAR(30) NOT NULL
);

--Сборники
CREATE TABLE IF NOT EXISTS Сompilation (
	id SERIAL PRIMARY KEY,	
	name VARCHAR(30) NOT NULL,
	year INTEGER NOT NULL
);	

--Альбомы
CREATE TABLE IF NOT EXISTS Album (
	id SERIAL PRIMARY KEY,
	name VARCHAR(30) NOT NULL,
	year INTEGER NOT NULL
);

--Треки
CREATE TABLE IF NOT EXISTS Track (
	id INTEGER PRIMARY KEY,
	album_id INTEGER UNIQUE REFERENCES Album(id),
	compilation_id INTEGER REFERENCES Сompilation(id),	
	name VARCHAR(30) NOT NULL,
	length TIME NOT NULL
);

--ИсполнителиЖанры 
CREATE TABLE IF NOT EXISTS PerfomerGenre (
	perfomer_id INTEGER REFERENCES Perfomer(id),
	genre_id INTEGER REFERENCES Genre(id),
	PRIMARY KEY (perfomer_id, genre_id)
);

--ИсполнителиАльбомы
CREATE TABLE IF NOT EXISTS PerfomerAlbum (
	perfomer_id INTEGER REFERENCES Perfomer(id),
	album_id INTEGER REFERENCES Album(id),
	PRIMARY KEY (perfomer_id, album_id)
);