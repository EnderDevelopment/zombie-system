CREATE TABLE IF NOT EXISTS zombie_nests (
    id INT AUTO_INCREMENT PRIMARY KEY,
    x FLOAT NOT NULL,
    y FLOAT NOT NULL,
    z FLOAT NOT NULL,
    radius FLOAT NOT NULL,
    zombie_count INT NOT NULL DEFAULT 0
);

INSERT INTO zombie_nests (x, y, z, radius, zombie_count) VALUES
(-265.0, -955.0, 31.2, 50.0, 0),
(440.0, -980.0, 30.6, 50.0, 0),
(1200.0, -1400.0, 35.2, 50.0, 0),
(-1200.0, 1400.0, 35.2, 50.0, 0);