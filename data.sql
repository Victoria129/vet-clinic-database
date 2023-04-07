/* Day one queries */

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
  (1, 'Agumon', '2020-02-03', 0, true, 10.23),
  (2, 'Gabumon', '2018-11-15', 2, true, 8.0),
  (3, 'Pikachu', '2021-01-07', 1, false, 15.04),
  (4, 'Devimon', '2017-05-12', 5, true, 11.0);

/* Day two queries */

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (5, 'Charmander', '2020-02-08', 0, 'f', -11.0);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (6, 'Plantmon', '2021-11-15', 2, 't', -5.7);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (7, 'Squirtle', '1993-04-02', 3, 'f', -12.13);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (8, 'Angemon', '2005-06-12', 1, 't', -45.0);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (9, 'Boarmon', '2005-06-07', 7, 't', 20.4);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (10, 'Blossom', '1998-10-13', 3, 't', 17.0);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (11, 'Ditto', '2022-05-14', 4, 't', 22.0);

/* Day three queries */

-- insert woners data

INSERT INTO owners (full_name, age) VALUES
  ('Sam Smith', 34),
  ('Jennifer Orwell', 19),
  ('Bob', 45),
  ('Melody Pond', 77),
  ('Dean Winchester', 14),
  ('Jodie Whittaker', 38);

  SELECT * FROM owners;

--insert species data

INSERT INTO species (name) VALUES
  ('Pokemon'),
  ('Digimon');

  SELECT * FROM species;

  --modify animals

UPDATE animals
 SET species_id = (CASE
 WHEN name LIKE '%mon' THEN (SELECT id FROM species WHERE name = 'Digimon')
 ELSE (SELECT id FROM species WHERE name = 'Pokemon')
 END);

SELECT id, name, species_id FROM animals;

--modify animals owners

UPDATE animals
SET owner_id = (CASE
 WHEN name IN ('Agumon') THEN (SELECT id FROM owners WHERE full_name = 'Sam Smith')
 WHEN name IN ('Gabumon', 'Pikachu') THEN (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
 WHEN name IN ('Devimon', 'Plantmon') THEN (SELECT id FROM owners WHERE full_name = 'Bob')
 WHEN name IN ('Charmander', 'Squirtle', 'Blossom') THEN (SELECT id FROM owners WHERE full_name = 'Melody Pond')
 WHEN name IN ('Angemon', 'Boarmon') THEN (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
 END);

 SELECT * FROM species;

SELECT id, name, species_id, owner_id FROM animals;
