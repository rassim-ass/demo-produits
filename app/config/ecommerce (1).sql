-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 19 Avril 2016 à 09:15
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `ecommerce`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE IF NOT EXISTS `categorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Contenu de la table `categorie`
--

INSERT INTO `categorie` (`id`, `titre`, `description`) VALUES
(1, 'Smartphone', 'Synergistically administrate next-generation channels and customized channels.'),
(2, 'Tablette', 'Authoritatively extend mission-critical human capital after end-to-ticesend best prac.'),
(3, 'Laptop', 'Interactively evolve timely e-tailers without high standards in best practices.');

-- --------------------------------------------------------

--
-- Structure de la table `fos_user`
--

CREATE TABLE IF NOT EXISTS `fos_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `image`
--

CREATE TABLE IF NOT EXISTS `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Contenu de la table `image`
--

INSERT INTO `image` (`id`, `titre`, `description`, `path`) VALUES
(1, 'Smartphone1', 'Appropriately recaptiualize economically sound technology', 'http://boulanger.scene7.com/is/image/Boulanger/bfr_overlay?layer=comp&$t1=&$product_id=Boulanger/6943279407504_h_f_l_0&wid=400&hei=400'),
(2, 'Smartphone2', 'Dynamically brand technically sound action items whereas reliable', 'http://cdn.pastemagazine.com/www/articles/Mozilla%20Firefox%20phone.jpg'),
(3, 'Smartphone3', 'Professionally deliver premier niches before enterprise-wide models.', 'http://media.ldlc.com/ld/products/00/01/67/96/LD0001679631_2.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE IF NOT EXISTS `produit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vignette` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `titre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `prix` double NOT NULL,
  `poids` double NOT NULL,
  `etat` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Contenu de la table `produit`
--

INSERT INTO `produit` (`id`, `vignette`, `date`, `titre`, `description`, `prix`, `poids`, `etat`) VALUES
(1, 'http://media.ldlc.com/ld/products/00/03/23/96/LD0003239679_1.jpg', '2016-04-17 17:29:00', 'Acer Liquid Z630 Duo Argent', 'Amusez-vous plus que jamais avec le Acer Liquid Z630 Duo. Ce téléphone puissant et fluide est équipé d''une batterie longue durée, d''un écran IPS 5.5" à résolution HD et d''un processeur ARM Cortex-A53 Quad-Core cadencé à 1.3 GHz.', 200, 100, 1),
(2, 'http://media.ldlc.com/ld/products/00/03/36/03/LD0003360391_1.jpg', '2016-04-17 19:15:00', 'Alcatel One Touch Go Play Bleu', 'Assertively exploit tactical convergence after resource sucking architectures.', 200, 100, 1);

-- --------------------------------------------------------

--
-- Structure de la table `produit_categorie`
--

CREATE TABLE IF NOT EXISTS `produit_categorie` (
  `produit_id` int(11) NOT NULL,
  `categorie_id` int(11) NOT NULL,
  PRIMARY KEY (`produit_id`,`categorie_id`),
  KEY `IDX_CDEA88D8F347EFB` (`produit_id`),
  KEY `IDX_CDEA88D8BCF5E72D` (`categorie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `produit_categorie`
--

INSERT INTO `produit_categorie` (`produit_id`, `categorie_id`) VALUES
(1, 1),
(2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `produit_image`
--

CREATE TABLE IF NOT EXISTS `produit_image` (
  `produit_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  PRIMARY KEY (`produit_id`,`image_id`),
  KEY `IDX_F5A163CBF347EFB` (`produit_id`),
  KEY `IDX_F5A163CB3DA5256D` (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `produit_image`
--

INSERT INTO `produit_image` (`produit_id`, `image_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `produit_tag`
--

CREATE TABLE IF NOT EXISTS `produit_tag` (
  `produit_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`produit_id`,`tag_id`),
  KEY `IDX_423DC0FAF347EFB` (`produit_id`),
  KEY `IDX_423DC0FABAD26311` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `produit_tag`
--

INSERT INTO `produit_tag` (`produit_id`, `tag_id`) VALUES
(1, 1),
(2, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `tag`
--

CREATE TABLE IF NOT EXISTS `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Contenu de la table `tag`
--

INSERT INTO `tag` (`id`, `nom`) VALUES
(1, '4G'),
(2, 'Écran géant'),
(3, 'Photo');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `produit_categorie`
--
ALTER TABLE `produit_categorie`
  ADD CONSTRAINT `FK_CDEA88D8BCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_CDEA88D8F347EFB` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `produit_image`
--
ALTER TABLE `produit_image`
  ADD CONSTRAINT `FK_F5A163CB3DA5256D` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_F5A163CBF347EFB` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `produit_tag`
--
ALTER TABLE `produit_tag`
  ADD CONSTRAINT `FK_423DC0FABAD26311` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_423DC0FAF347EFB` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
