

DROP TABLE IF EXISTS `is_tagged`;
CREATE TABLE IF NOT EXISTS `is_tagged` (
  `idTask` int NOT NULL,
  `idTag` tinyint NOT NULL,
  KEY `idTask` (`idTask`),
  KEY `idTag` (`idTag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `is_tagged` (`idTask`, `idTag`) VALUES
(1, 1),
(1, 3),
(2, 4),
(3, 2),
(4, 4),
(5, 4);



DROP TABLE IF EXISTS `priorities`;
CREATE TABLE IF NOT EXISTS `priorities` (
  `idPriority` tinyint NOT NULL,
  `priority` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idPriority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



INSERT INTO `priorities` (`idPriority`, `priority`) VALUES
(1, 'VERY HIGH'),
(2, 'High'),
(3, 'Medium'),
(4, 'Low'),
(5, 'very low');



DROP TABLE IF EXISTS `statuses`;
CREATE TABLE IF NOT EXISTS `statuses` (
  `idStatus` tinyint NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



INSERT INTO `statuses` (`idStatus`, `status`) VALUES
(1, 'Not started :)'),
(2, 'Working in it ...'),
(3, 'Finished (Finally)'),
(4, 'Canceled X_X');



DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `tag` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idTag` tinyint NOT NULL,
  PRIMARY KEY (`idTag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



INSERT INTO `tags` (`tag`, `idTag`) VALUES
('Urgent', 1),
('Home', 2),
('Work', 3),
('Other', 4);


DROP TABLE IF EXISTS `tasks`;
CREATE TABLE IF NOT EXISTS `tasks` (
  `idTask` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dueDate` date NOT NULL,
  `idStatus` tinyint NOT NULL,
  `idPriority` tinyint NOT NULL,
  `idType` tinyint NOT NULL,
  PRIMARY KEY (`idTask`),
  KEY `idStatus` (`idStatus`),
  KEY `idPriority` (`idPriority`),
  KEY `idType` (`idType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `tasks` (`idTask`, `name`, `description`, `dueDate`, `idStatus`, `idPriority`, `idType`) VALUES
(1, 'Build Iron Farm', 'Gather villagers and lava buckets to automate iron production in the new chunk.', '2026-05-6', 2, 1, 3),
(2, 'Master Dante SSS Combo', 'Practice the Balrog to Cavaliere switch in the Void until consistent.', '2026-05-15', 1, 3, 1),
(3, 'Automatic Sorting System', 'Fix the redstone repeaters in the storage room basement.', '2026-05-12', 3, 2, 2),
(4, 'Analyze Vergil Backstory', 'Read the Visions of V manga chapters for a deeper understanding of the family tree.', '2026-05-20', 2, 4, 3),
(5, 'Find Ancient Debris', 'Mine at Y-level 15 in the Nether to upgrade the diamond chestplate.', '2026-05-25', 1, 5, 5);



DROP TABLE IF EXISTS `types`;
CREATE TABLE IF NOT EXISTS `types` (
  `idType` tinyint NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



INSERT INTO `types` (`idType`, `type`) VALUES
(1, 'Own personal stuff'),
(2, 'Buying things'),
(3, 'Study and work'),
(4, 'Preparing meal'),
(5, 'Other things');


ALTER TABLE `is_tagged`
  ADD CONSTRAINT `is_tagged_ibfk_1` FOREIGN KEY (`idTask`) REFERENCES `tasks` (`idTask`),
  ADD CONSTRAINT `is_tagged_ibfk_2` FOREIGN KEY (`idTag`) REFERENCES `tags` (`idTag`);


ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`idStatus`) REFERENCES `statuses` (`idStatus`),
  ADD CONSTRAINT `tasks_ibfk_2` FOREIGN KEY (`idPriority`) REFERENCES `priorities` (`idPriority`),
  ADD CONSTRAINT `tasks_ibfk_3` FOREIGN KEY (`idType`) REFERENCES `types` (`idType`);


