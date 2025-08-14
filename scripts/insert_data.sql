CREATE TABLE data (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

INSERT INTO data (ID, first_name, last_name) VALUES
  (1, 'Yonatan', 'Rozenfeld'),
  (2, 'Issac', 'Tonic'),
  (3, 'Moti', 'Wolff'),
  (4, 'Daniel', 'Fisher'),
  (5, 'Chaim', 'Slezenger')
  (6, 'Aaron', 'Frenkel')

ON DUPLICATE KEY UPDATE
  first_name = VALUES(first_name),
  last_name  = VALUES(last_name);
