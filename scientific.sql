-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 21, 2015 at 01:18 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `scientific`
--

-- --------------------------------------------------------

--
-- Table structure for table `publication`
--

CREATE TABLE IF NOT EXISTS `publication` (
  `reference` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(50) NOT NULL,
  `description` varchar(300) NOT NULL,
  `datePublication` varchar(30) NOT NULL,
  `fichier` varchar(100) NOT NULL,
  `estValider` tinyint(1) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`reference`),
  KEY `reference` (`reference`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `publication`
--

INSERT INTO `publication` (`reference`, `titre`, `description`, `datePublication`, `fichier`, `estValider`, `id_user`) VALUES
(3, 'Titre', 'aaa', '2015-01-20', 'TueJan20192814WET2015_1421782094242.JPG', 1, 1),
(4, 'new recherche', 'bla bla', '2015-01-20', 'TueJan20210554WET2015_1421787954832.gif', 0, 1),
(5, 'element library for prototyping', 'element library for prototyping', '2015-01-20', 'TueJan20220452WET2015_1421791492232.pdf', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rechercheur`
--

CREATE TABLE IF NOT EXISTS `rechercheur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `rechercheur`
--

INSERT INTO `rechercheur` (`id`, `login`, `password`) VALUES
(1, 'adam', 'adam');

-- --------------------------------------------------------

--
-- Table structure for table `reponse`
--

CREATE TABLE IF NOT EXISTS `reponse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Avis` int(11) NOT NULL,
  `dateReponse` varchar(30) NOT NULL,
  `idPublication` int(11) NOT NULL,
  `IdEditeur` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Editeur` (`IdEditeur`),
  KEY `idPublication` (`idPublication`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `reponse`
--

INSERT INTO `reponse` (`id`, `Avis`, `dateReponse`, `idPublication`, `IdEditeur`) VALUES
(2, 5, '2015-01-20', 3, 1),
(3, 5, '2015-01-20', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `reviewer`
--

CREATE TABLE IF NOT EXISTS `reviewer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `reviewer`
--

INSERT INTO `reviewer` (`id`, `login`, `password`) VALUES
(1, 'rev', 'rev');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `publication`
--
ALTER TABLE `publication`
  ADD CONSTRAINT `id_user` FOREIGN KEY (`id_user`) REFERENCES `rechercheur` (`id`);

--
-- Constraints for table `reponse`
--
ALTER TABLE `reponse`
  ADD CONSTRAINT `reponse_ibfk_2` FOREIGN KEY (`IdEditeur`) REFERENCES `reviewer` (`id`),
  ADD CONSTRAINT `reponse_ibfk_1` FOREIGN KEY (`idPublication`) REFERENCES `publication` (`reference`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
