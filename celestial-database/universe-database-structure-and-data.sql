pg_dump -cC --inserts -U freecodecamp universe > universe.sql

create database universe;

create table galaxy(
   galaxy_id serial primary key,
   name varchar(30) not null unique,
   magnitude numeric(4,1) not null,
   distance numeric,
   constellation varchar(20) not null,
   discovered varchar(4),
   notes text
);

create table star(
   star_id serial primary key,
   name varchar(30) not null unique,
   distance numeric,
   greek varchar(20) not null,
   galaxy_id int references galaxy(galaxy_id)
);

create table planet(
   planet_id serial primary key,
   name varchar(30) not null unique,
   distance_from_sun int not null,
   has_life boolean default false,
   star_id int references star(star_id)
);

create table moon(
   moon_id serial primary key,
   name varchar(30) not null unique,
   has_life boolean default false,
   wiki_id int not null,
   planet_id int references planet(planet_id)
);

create table wiki(
   wiki_id serial primary key,
   href varchar(30) not null,
   name varchar(30) unique,
   url varchar(35) not null,
   moon_id int
);

insert into galaxy(name, magnitude, distance, constellation, discovered, notes) 
values
('Andromeda Galaxy', 3.44, 2.5, 'Andromeda', '964', 'Once called the Great Andromeda Nebula, it is situated in the Andromeda constellation.'),
('Bodes Galaxy', 6.94, 11.7, 'Ursa Major', '1774', 'Highly experienced amateur astronomers may be able to see Messier 81 under exceptional observing conditions.'),
('Centaurus A', 6.84, 13.7, 'Centaurus', '1826', 'It appears to rotate backwards, as the tips of the spiral arms point in the direction of rotation'),
('Milky Way Galaxy', -20.5, 0, 'Galaxius', '1610', 'Once called the Great Andromeda Nebula, it is situated in the Andromeda constellation.'),
('Triangulum Galaxy', 5.7, 2.9, 'Triangulum', '1764', 'Being a diffuse object, its visibility is strongly affected by even small amounts of light pollution, ranging from easily visible in direct vision in truly dark skies to a difficult averted vision object in rural/suburban skies.'),
('Wolf Lundmark Melotte', 11, 3.04, 'Cetus', '1926', 'Named for the three astronomers instrumental in its discovery and identification.'),
('Sculptor Galaxy', 7.2, 12, 'Sculptor', '1783', 'Named after the constellation it is located in (Circinus).'),
('Eye of Sauron', 11.5, 61.97, 'Canes Venatici', '1970', 'Due to its resemblance to the Eye of Sauron from The Lord of the Rings.');

insert into star(name, distance, greek, galaxy_id) 
values
('Alpheratz', 97, 'Alpha Andromedae', 1),
('Mirach', 198, 'Beta Andromedae', 1),
('Almach', 358, 'Gamma Andromedae', 1),
('δ Andromedae', 105, 'Delta Andromedae', 1),
('ι Andromedae', 86, 'Iota Andromedae', 1),
('υ Andromedae', 44, 'Upsilon Andromedae', 1),
('Adhil', 598, 'Xi Andromedae', 1),
('Nembus', 177, '51 Andromedae', 1),
('Sol', 151.05, 'Helios', 4),
('β Trianguli', 127, 'Beta Trianguli', 5),
('Mothallah', 112, 'Alpha Trianguli', 5),
('ι Trianguli', 1075, 'Iota Trianguli', 5);

insert into planet(name, distance_from_sun, has_life, star_id)
values
('Mercury', 35, null, 9),
('Venus', 67, null, 9),
('Earth', 93, true, 9),
('Mars', 142, null, 9),
('Jupiter', 484, null, 9),
('Saturn', 889, null, 9),
('Uranus', 1790, null, 9),
('Neptune', 2880, null, 9),
('Unknown1', 0, null, 10),
('Unknown2', 0, null, 10),
('Unknown3', 0, null, 11),
('Unknown4', 0, null, 12);

insert into moon(name, has_life, wiki_id, planet_id)
values
('Moon', null, 1, 3),
('Europa', null, 2, 5),
('Ganymede', null, 3, 5),
('Io', null, 4, 5),
('Calista', null, 5, 5),
('Amalthea', null, 6, 5),
('Adrastea', null, 7, 5),
('Thebe', null, 8, 5),
('Valetuduo', null, 9, 5),
('Elara', null, 10, 5),
('Titan', null, 11, 6),
('Rhea', null, 12, 6),
('Cassini', null, 13, 6),
('Mimas', null, 14, 6),
('Iapetus', null, 15, 6),
('Enceladus', null, 16, 6),
('Tethys', null, 17,6),
('Telesto', null, 18, 4),
('Daphnis', null, 19, 4),
('Erriapus', null, 20, 4);

insert into wiki(href, url, moon_id)
values
('en.wikipedia.org/wiki/', 'Moon', 1),
('en.wikipedia.org/wiki/', 'Europa', 2),
('en.wikipedia.org/wiki/', 'Ganymede', 3),
('en.wikipedia.org/wiki/', 'Io', 4),
('en.wikipedia.org/wiki/', 'Calista', 5),
('en.wikipedia.org/wiki/', 'Amalthea', 6),
('en.wikipedia.org/wiki/', 'Adrastea', 7),
('en.wikipedia.org/wiki/', 'Thebe', 7),
('en.wikipedia.org/wiki/', 'Valetuduo', 8),
('en.wikipedia.org/wiki/', 'Elara', 10),
('en.wikipedia.org/wiki/', 'Titan', 11),
('en.wikipedia.org/wiki/', 'Rhea', 12),
('en.wikipedia.org/wiki/', 'Cassini', 13),
('en.wikipedia.org/wiki/', 'Mimas', 14),
('en.wikipedia.org/wiki/', 'Iepatus', 15),
('en.wikipedia.org/wiki/', 'Enceladus', 16),
('en.wikipedia.org/wiki/', 'Tethys', 17),
('en.wikipedia.org/wiki/', 'Telesto', 18),
('en.wikipedia.org/wiki/', 'Daphnis', 19),
('en.wikipedia.org/wiki/', 'Erriapus', 20);

select m.name, p.name, w.url from moon m
full join wiki w on w.wiki_id = m.wiki_id
full join planet p on p.planet_id = m.planet_id;