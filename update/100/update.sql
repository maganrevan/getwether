/*CREATE TABLE IF NOT EXISTS tMetaData (
ID int(11) unsigned NOT NULL auto_increment,
cMonitoringVersion int(11) unsigned NOT NULL,
PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS tPlugin (
  kPlugin int(11) unsigned NOT NULL auto_increment,
  fkUser int(11) NOT NULL,
  cPluginID text NOT NULL,
  cPluginName text NOT NULL,
   PRIMARY KEY (kPlugin)
);

CREATE TABLE IF NOT EXISTS tGruppe (
  kGruppenID int(11) unsigned NOT NULL auto_increment,
  cName text NOT NULL,
  PRIMARY KEY (kGruppenID)
);

CREATE TABLE IF NOT EXISTS tShop (
  kShopID int(11) unsigned NOT NULL auto_increment,
  cVerzeichnisUser text NOT NULL,
  cVerzeichnisPass text NOT NULL,
  cURL text NOT NULL,
  cHTTPS tinyint(1) NOT NULL,
  fkUser int(11) NOT NULL,
  cAPIKey text NOT NULL,
  PRIMARY KEY (kShopID)
);

CREATE TABLE IF NOT EXISTS tUser (
  kUserID int(11) unsigned NOT NULL auto_increment,
  cVorname text NOT NULL,
  cNachname text NOT NULL,
  fkGruppe int(11) NOT NULL,
  cLogin text NOT NULL,
  cPasswort text NOT NULL,
  PRIMARY KEY (kUserID)
);

INSERT INTO tGruppe (kGruppenID, cName) VALUES
(1, 'Administrator'),
(2, 'Projektmanager'),
(3, 'Entwickler'),
(4, 'Praktikanten'),
(5, 'Auszubildende');

INSERT INTO tUser (kUserID, cVorname, cNachname, fkGruppe, cLogin, cPasswort) VALUES
(1, 'Magnus', 'Kruschwitz', 1, 'magnus.kruschwitz', '76cebc5ca7eea590c93c149daf1cf68327a9002a5236bf724248845ba27630f60acf4c1ac0c605562649c154e2d16d0e08f4b492398bc4ab6cd6e2868c79dc81'),
(3, 'Hakki', 'Stehler', 3, 'hakki.stehler', '76cebc5ca7eea590c93c149daf1cf68327a9002a5236bf724248845ba27630f60acf4c1ac0c605562649c154e2d16d0e08f4b492398bc4ab6cd6e2868c79dc81'),
(4, 'Christian', 'Berkner', 3, 'christian.berkner', '8d847e01d22baa969f71fa362b4de21c9e13c7882bcea13ba5c6a8ae0d71fc8c9700c82e0087a65c8b37bd29f536747f28c9672bec1cae7762d2c9f36b6013f2'),
(5, 'Alexander', 'Hubert', 3, 'alexander.hubert', '260625496f9b26488b51f9fd2639c00713024ae154a2b8d6f3c800ef917504ad6ba33813769da29b3d0c54085f0b0cc24250829fe540b58f40e7b42960fe65ab');


INSERT INTO tMetaData (ID, cMonitoringVersion) VALUES (NULL, '100');
*/