ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password'

create database portonave;

CREATE TABLE `users` (
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `profile` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` tinyint NOT NULL,
  `id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `dtCreation` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `suppliers` (
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cnpj` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` tinyint NOT NULL,
  `id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `dtCreation` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `equipments` (
  `type` int  NOT NULL,
  `patrimony` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `serialNumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cost` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `data` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `localCode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `lowDate` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `status` tinyint NOT NULL,
  `id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `dtCreation` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sectors` (
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `dtCreation` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `statusOs` (
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `dtCreation` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- BellaRosa24.Clientes definition

CREATE TABLE `os` (
  `id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `statusOsId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `equipmentId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `sectorId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `failure` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `internalCall` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `isAntenna` tinyint DEFAULT NULL,
  `isBattery` tinyint DEFAULT NULL,
  `isCover` tinyint DEFAULT NULL,
  `isCapa` tinyint DEFAULT NULL,
  `numberOs` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `numberNF` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `data` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `sdcv` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `observation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dtCreation` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_os_statusOsId` (`statusOsId`),
  CONSTRAINT `FK_os_statusOs_statusOsId` FOREIGN KEY (`statusOsId`) REFERENCES `statusOs` (`id`),
  UNIQUE KEY `IX_os_equipmentId` (`equipmentId`),
  CONSTRAINT `FK_os_equipment_equipmentId` FOREIGN KEY (`equipmentId`) REFERENCES `equipments` (`id`),
  UNIQUE KEY `IX_os_sectorId` (`sectorId`),
  CONSTRAINT `FK_os_sector_sectorId` FOREIGN KEY (`sectorId`) REFERENCES `sectors` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


script criação de sectors

use portonave;

INSERT INTO portonave.sectors
(id,description, dtCreation)
VALUES('12de2201-9f5b-4523-a3b4-ccd78cd8b67d', 'ARMAZEM', CURRENT_TIMESTAMP(6));

INSERT INTO portonave.sectors
(id,description, dtCreation)
VALUES('d526c7c7-4b20-4b4b-886e-5bbf3fc89e51', 'GERENCIA DE MANUTENCAO', CURRENT_TIMESTAMP(6));

INSERT INTO portonave.sectors
(id,description, dtCreation)
VALUES('493cd0d3-f452-4331-9364-d288e8cfb329', 'GESTAO AMBIENTAL', CURRENT_TIMESTAMP(6));

INSERT INTO portonave.sectors
(id, description, dtCreation)
VALUES('8ec9a336-6462-491e-8857-da288ea46515', 'ICEPORT - OPERACAO', CURRENT_TIMESTAMP(6));

INSERT INTO portonave.sectors
(id, description, dtCreation)
VALUES('c3dee592-23fe-4ee6-9b6e-c95342163ee0', 'ITENS DE RATEIO - ICEPORT', CURRENT_TIMESTAMP(6));

INSERT INTO portonave.sectors
(id, description, dtCreation)
VALUES('5cfc766b-45c8-4b4b-ad25-8ae227661f8c', 'MANUTENCAO', CURRENT_TIMESTAMP(6));

INSERT INTO portonave.sectors
(id, description, dtCreation)
VALUES('7ecf3c4f-c38d-41d0-8204-3398e628bb9e', 'MANUTENCAO CIVIL', CURRENT_TIMESTAMP(6));

INSERT INTO portonave.sectors
(id, description, dtCreation)
VALUES('a436523d-e6ff-4ef5-8a77-afb7f0ed451d', 'MANUTENCAO ELETRICA', CURRENT_TIMESTAMP(6));

INSERT INTO portonave.sectors
(id, description, dtCreation)
VALUES('ca8f8cb3-2736-4332-a03b-90512d9739d2', 'MANUTENCAO MECANICA', CURRENT_TIMESTAMP(6));

INSERT INTO portonave.sectors
(id, description, dtCreation)
VALUES('55622ba4-2fe1-42d5-92ce-1b5766caa174', 'MANUTENCAO PREDIAL', CURRENT_TIMESTAMP(6));

INSERT INTO portonave.sectors
(id, description, dtCreation)
VALUES('b6d93933-a316-4556-a03d-d24ccccf29bc', 'MONITORAMENTO', CURRENT_TIMESTAMP(6));

INSERT INTO portonave.sectors
(id, description, dtCreation)
VALUES('754822de-9c54-4645-abab-d22bbbcccb6a', 'OPERACAO - VISTORIA', CURRENT_TIMESTAMP(6));

INSERT INTO portonave.sectors
(id, description, dtCreation)
VALUES('8242b184-0df6-4869-b122-73a76f27183e', 'OPERACAO DE EQUIPAMENTOS', CURRENT_TIMESTAMP(6));

INSERT INTO portonave.sectors
(id, description, dtCreation)
VALUES('bfd70124-7ef0-4084-a4cc-131047f3db03', 'OPERACAO DE GATES', CURRENT_TIMESTAMP(6));

INSERT INTO portonave.sectors
(id, description, dtCreation)
VALUES('4934b444-7890-4344-8bac-36c9679c655c', 'OPERACAO PÁTIO', CURRENT_TIMESTAMP(6));

INSERT INTO portonave.sectors
(id, description, dtCreation)
VALUES('3749fd58-cc3b-4de0-9981-9f382114e142', 'OPERACAO PORTUARIA', CURRENT_TIMESTAMP(6));

INSERT INTO portonave.sectors
(id, description, dtCreation)
VALUES('9aa0f4fe-643b-4b48-962b-f5ab307c2fd1', 'PLANEJAMENTO PORTUARIO', CURRENT_TIMESTAMP(6));

INSERT INTO portonave.sectors
(id, description, dtCreation)
VALUES('93ebfa74-cf95-45ed-89a4-bce237195d83', 'RECEPCAO E PORTARIA', CURRENT_TIMESTAMP(6));

INSERT INTO portonave.sectors
(id, description, dtCreation)
VALUES('cacf2528-21f3-4c7d-83c7-af8c26298b8e', 'REEFERS', CURRENT_TIMESTAMP(6));

INSERT INTO portonave.sectors
(id, description, dtCreation)
VALUES('e9512b62-4b98-4240-8473-d4990e28f014', 'SEGURANCA', CURRENT_TIMESTAMP(6));

INSERT INTO portonave.sectors
(id, description, dtCreation)
VALUES('d0476040-7574-4627-9f33-d6bbb8880dbd', 'SEGURANCA PORTUARIA', CURRENT_TIMESTAMP(6));

INSERT INTO portonave.sectors
(id, description, dtCreation)
VALUES('ba5b4315-8a8d-46d6-a585-91029773c4b1', 'TECNOLOGIA DA INFORMACAO', CURRENT_TIMESTAMP(6));


script criação de status statusOs

INSERT INTO portonave.statusos
(description, id, dtCreation)
VALUES('ENTREGUE AO SOLICITANTE', '12b08d50-446d-4e4b-a908-b8a5d661e0d7', CURRENT_TIMESTAMP(6));

INSERT INTO portonave.statusos
(description, id, dtCreation)
VALUES('EQUIPAMENTO BAIXADO', '5f464e3a-7d38-4f23-9902-f23863553d20', CURRENT_TIMESTAMP(6));

INSERT INTO portonave.statusos
(description, id, dtCreation)
VALUES('ENVIADO AO FORNECEDOR', 'cd0ec225-8eaf-4f86-b3b7-a6c0cf98164c', CURRENT_TIMESTAMP(6));

INSERT INTO portonave.statusos
(description, id, dtCreation)
VALUES('EQUIPAMENTO EM GARANTIA', '2892800b-a7d6-44ec-a5ed-d5a9353a41a1', CURRENT_TIMESTAMP(6));

INSERT INTO portonave.statusos
(description, id, dtCreation)
VALUES('ORDEM DE SERVIÇO APROVADA', 'dac325ea-0435-41b3-a221-6f4ec21d6f1d', CURRENT_TIMESTAMP(6));

INSERT INTO portonave.statusos
(description, id, dtCreation)
VALUES('ORDEM DE SERVIÇO REPROVADA', 'c7e168bb-3a2e-4598-a157-11575c2ab0f0', CURRENT_TIMESTAMP(6));

INSERT INTO portonave.statusos
(description, id, dtCreation)
VALUES('RECEBIDO DO FORNECEDOR', '515ea3bd-4fff-4e65-a91d-35d3384409eb', CURRENT_TIMESTAMP(6));