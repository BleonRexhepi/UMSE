-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 10, 2022 at 12:47 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `umse`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `umseFshije_kontakt` (IN `p_ID_Kontakti` INT(11))  DELETE
FROM
    umse_kontaktet
WHERE
    ID_Kontakti = p_ID_Kontakti$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `umseFshije_llojiskutereve_elektrik` (IN `p_ID_LlojiSkuteritElektrik` INT(11))  DELETE
FROM
    umse_llojeteskutereve_elektrik
WHERE
    ID_LlojiSkuteritElektrik = p_ID_LlojiSkuteritElektrik$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `umseFshije_perdoruesit` (IN `p_ID_p` INT(11))  DELETE
FROM
    umse_perdoruesit
WHERE
    ID_p = p_ID_p$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `umseFshije_skuterelektrik` (IN `p_ID_SkuteriElektrik` INT(11))  DELETE
FROM
    umse_skuteretelektrik
WHERE
    ID_SkuteriElektrik = p_ID_SkuteriElektrik$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `umseKontrollo_perdorues` (IN `p_user_check` VARCHAR(50))  SELECT
    Emri
FROM
    umse_perdoruesit
WHERE
    Emri = p_user_check$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `umseModifiko_llojiskutereve_elektrik` (IN `p_ID_LlojiSkuteritElektrik` INT(11), IN `p_Emri_Llojit_te_SkuteritElektrik` VARCHAR(200))  UPDATE
    umse_llojeteskutereve_elektrik
SET
    Emri_Llojit_te_SkuteritElektrik = p_Emri_Llojit_te_SkuteritElektrik
WHERE
    ID_LlojiSkuteritElektrik = p_ID_LlojiSkuteritElektrik$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `umseModifiko_perdoruesit` (IN `p_ID_p` INT(11), IN `p_Emri` VARCHAR(50), IN `p_Fjalekalimi` VARCHAR(50), IN `p_Email` VARCHAR(50))  UPDATE
    umse_perdoruesit
SET
    Emri = p_Emri,
    Fjalekalimi =MD5(p_Fjalekalimi),
    Email = p_Email
WHERE
    ID_p = p_ID_p$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `umseModifiko_skuterelektrik` (IN `p_ID_SkuteriElektrik` INT(11), IN `p_Emri_SkuteritElektrik` VARCHAR(1000), IN `p_Shpejtsia_SkuteritElektrik` VARCHAR(80), IN `p_Pershkrimi_SkuteritElektrik` VARCHAR(2000), IN `p_Foto_SkuteritElektrik` LONGBLOB, IN `p_Emri_FotoSkuteritElektrik` VARCHAR(50), IN `p_ID_LlojiSkuteritElektrik` INT(11))  UPDATE
    umse_skuteretelektrik
SET
    Emri_SkuteritElektrik = p_Emri_SkuteritElektrik,
    Shpejtsia_SkuteritElektrik = p_Shpejtsia_SkuteritElektrik,
    Pershkrimi_SkuteritElektrik = p_Pershkrimi_SkuteritElektrik,
    Foto_SkuteritElektrik = p_Foto_SkuteritElektrik,
    Emri_FotoSkuteritElektrik = p_Emri_FotoSkuteritElektrik,
    ID_LlojiSkuteritElektrik = p_ID_LlojiSkuteritElektrik
WHERE
    ID_SkuteriElektrik = p_ID_SkuteriElektrik$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `umseModifiko_tedhena` (IN `p_ID_tedhenat` INT(11), IN `p_Shenimi` VARCHAR(200), IN `p_Pershkrimi` VARCHAR(10000), IN `p_Fajlli` VARCHAR(255), IN `p_Pamja_Faqes` VARCHAR(50))  UPDATE
    umse_tedhenat
SET
    Shenimi = p_Shenimi,
    Pershkrimi = p_Pershkrimi,
    Fajlli = p_Fajlli,
    Pamja_Faqes = p_Pamja_Faqes
WHERE
    ID_tedhenat = p_ID_tedhenat$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `umseShto_kontakt` (IN `Subjekti` VARCHAR(100), IN `Mesazhi` VARCHAR(10000), IN `Email` VARCHAR(100))  INSERT INTO umse_kontaktet(Subjekti, Mesazhi, Email)
VALUES(Subjekti, Mesazhi, Email)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `umseShto_llojiskutereve_elektrik` (IN `Emri_Llojit_te_SkuteritElektrik` VARCHAR(200))  INSERT INTO umse_llojeteskutereve_elektrik(Emri_Llojit_te_SkuteritElektrik)
VALUES(Emri_Llojit_te_SkuteritElektrik)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `umseShto_perdorues` (IN `Emri` VARCHAR(50), IN `Fjalekalimi` VARCHAR(50), IN `Email` VARCHAR(50))  INSERT INTO umse_perdoruesit(Emri, Fjalekalimi, Email)
VALUES(Emri, Fjalekalimi, Email)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `umseShto_skuterelektrik` (IN `Emri_SkuteritElektrik` VARCHAR(1000), IN `Shpejtsia_SkuteritElektrik` VARCHAR(80), IN `Pershkrimi_SkuteritElektrik` VARCHAR(2000), IN `Foto_SkuteritElektrik` LONGBLOB, IN `Emri_FotoSkuteritElektrik` VARCHAR(50), IN `ID_LlojiSkuteritElektrik` INT(11))  INSERT INTO umse_skuteretelektrik(
    Emri_SkuteritElektrik,
    Shpejtsia_SkuteritElektrik,
    Pershkrimi_SkuteritElektrik,
    Foto_SkuteritElektrik,
    Emri_FotoSkuteritElektrik,
    ID_LlojiSkuteritElektrik
)
VALUES(
    Emri_SkuteritElektrik,
    Shpejtsia_SkuteritElektrik,
    Pershkrimi_SkuteritElektrik,
    Foto_SkuteritElektrik,
    Emri_FotoSkuteritElektrik,
    ID_LlojiSkuteritElektrik
)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `umseZgjedhID_llojiskutereve_elektrik` (IN `p_ID_LlojiSkuteritElektrik` INT(11))  SELECT
    *
FROM
    umse_llojeteskutereve_elektrik
WHERE
    ID_LlojiSkuteritElektrik = p_ID_LlojiSkuteritElektrik$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `umseZgjedhID_perdoruesit` (IN `p_ID_p` INT(11))  SELECT
    *
FROM
    umse_perdoruesit
WHERE
    ID_p = p_ID_p$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `umseZgjedhID_skuterelektrik` (IN `p_ID_SkuteriElektrik` INT(11))  SELECT
    *
FROM
    umse_skuteretelektrik
WHERE
    ID_SkuteriElektrik = p_ID_SkuteriElektrik$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `umseZgjedhID_tedhena` (IN `p_ID_tedhenat` INT(11))  SELECT
    *
FROM
    umse_tedhenat
WHERE
    ID_tedhenat = p_ID_tedhenat$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `umseZgjedhterm_kontakt` (IN `p_term` VARCHAR(50))  SELECT
    *
FROM
    umse_kontaktet
WHERE
    Subjekti LIKE CONCAT('%', p_term, '%') OR Mesazhi LIKE CONCAT('%', p_term, '%') OR Email LIKE CONCAT('%', p_term, '%')
ORDER BY
    ID_Kontakti DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `umseZgjedhterm_llojiskutereve_elektrik` (IN `p_term` VARCHAR(50))  SELECT
    *
FROM
    umse_llojeteskutereve_elektrik
WHERE
    Emri_Llojit_te_SkuteritElektrik LIKE CONCAT('%', p_term, '%')
ORDER BY
    ID_LlojiSkuteritElektrik DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `umseZgjedhterm_perdorues` (IN `p_term` VARCHAR(200))  SELECT
    *
FROM
    umse_perdoruesit
WHERE
    Emri LIKE CONCAT('%', p_term, '%') OR Fjalekalimi LIKE CONCAT('%', p_term, '%')
ORDER BY
    ID_p DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `umseZgjedhterm_skuterelektrik` (IN `p_term` VARCHAR(50))  SELECT
    sk.ID_SkuteriElektrik,
    sk.Emri_SkuteritElektrik,
    sk.Shpejtsia_SkuteritElektrik,
    sk.Pershkrimi_SkuteritElektrik,
    sk.Foto_SkuteritElektrik,
    sk.Emri_FotoSkuteritElektrik,
    ll.Emri_Llojit_te_SkuteritElektrik
FROM
    umse_skuteretelektrik sk
INNER JOIN umse_llojeteskutereve_elektrik ll ON
    ll.ID_LlojiSkuteritElektrik = sk.ID_LlojiSkuteritElektrik
WHERE
    sk.Emri_SkuteritElektrik LIKE CONCAT('%', p_term, '%') OR sk.Pershkrimi_SkuteritElektrik LIKE CONCAT('%', p_term, '%')$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `umseZgjedhterm_tedhena` (IN `p_term` VARCHAR(50))  SELECT
    *
FROM
    umse_tedhenat
WHERE
    Shenimi LIKE CONCAT('%', p_term, '%') OR Pershkrimi LIKE CONCAT('%', p_term, '%') OR Fajlli LIKE CONCAT('%', p_term, '%') OR Pamja_Faqes LIKE CONCAT('%', p_term, '%')
ORDER BY
    ID_tedhenat DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `umseZgjedh_llojiskutereve_elektrik` ()  SELECT
    *
FROM
    umse_llojeteskutereve_elektrik$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `umseZgjedh_perdorues` (IN `p_Emri` VARCHAR(50), IN `p_Fjalekalimi` VARCHAR(50))  SELECT
    ID_p
FROM
    umse_perdoruesit
WHERE
    Emri = p_Emri AND Fjalekalimi = p_Fjalekalimi$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `umseZgjedh_skuterelektrik_ballin` ()  SELECT
    ll.Emri_Llojit_te_SkuteritElektrik, sk.Emri_SkuteritElektrik, sk.Shpejtsia_SkuteritElektrik, sk.Pershkrimi_SkuteritElektrik, sk.Foto_SkuteritElektrik, sk.Emri_FotoSkuteritElektrik
FROM
    umse_skuteretelektrik sk
LEFT OUTER JOIN umse_llojeteskutereve_elektrik ll ON
    sk.ID_LlojiSkuteritElektrik = ll.ID_LlojiSkuteritElektrik
GROUP BY
    ll.Emri_Llojit_te_SkuteritElektrik, sk.Emri_SkuteritElektrik, sk.Shpejtsia_SkuteritElektrik, sk.Pershkrimi_SkuteritElektrik, sk.Foto_SkuteritElektrik, sk.Emri_FotoSkuteritElektrik
ORDER BY
    sk.ID_SkuteriElektrik
DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `umse_fillimi_faqes` ()  SELECT
    *
FROM
    umse_tedhenat
WHERE
    Pamja_faqes = 'fillimi_faqes'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `umse_funditedrejtatautoriale` ()  SELECT
    *
FROM
    umse_tedhenat
WHERE
    Pamja_faqes = 'funditedrejtatautoriale'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `umse_fundi_pershkrimi` ()  SELECT
    *
FROM
    umse_tedhenat
WHERE
    Pamja_faqes = 'fundi_pershkrimi'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `umse_fundi_rrjetetsociale` ()  SELECT
    *
FROM
    umse_tedhenat
WHERE
    Pamja_faqes = 'fundi_rrjetet_sociale'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `umse_fundi_tedhenat` ()  SELECT
    *
FROM
    umse_tedhenat
WHERE
    Pamja_faqes = 'fundi_tedhenat'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `umse_meny_administratorit` ()  SELECT
    *
FROM
    umse_tedhenat
WHERE
    Pamja_faqes = 'meny_administratorit'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `umse_meny_perdoruesit` ()  SELECT
    *
FROM
    umse_tedhenat
WHERE
    Pamja_faqes = 'meny_perdoruesit'$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `umse_kontaktet`
--

CREATE TABLE `umse_kontaktet` (
  `ID_Kontakti` int(11) NOT NULL,
  `Subjekti` varchar(100) NOT NULL,
  `Mesazhi` varchar(10000) NOT NULL,
  `Email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `umse_kontaktet`
--

INSERT INTO `umse_kontaktet` (`ID_Kontakti`, `Subjekti`, `Mesazhi`, `Email`) VALUES
(3, 'Pyetje rreth rimbushjes se skuterit', 'Pershendetje,\r\npo ju shkruaj per te ju pyetur se si mund ta rimbush perseri skuterin tim elektrik pasi qe nuk ka me bateri dhe un nuk di ta rimbush.', 'bleonrexhepi2@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `umse_llojeteskutereve_elektrik`
--

CREATE TABLE `umse_llojeteskutereve_elektrik` (
  `ID_LlojiSkuteritElektrik` int(11) NOT NULL,
  `Emri_Llojit_te_SkuteritElektrik` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `umse_llojeteskutereve_elektrik`
--

INSERT INTO `umse_llojeteskutereve_elektrik` (`ID_LlojiSkuteritElektrik`, `Emri_Llojit_te_SkuteritElektrik`) VALUES
(2, 'Trotinet Elektrik'),
(3, 'Skuter Vetbalancues'),
(5, 'Moped Elektrik');

-- --------------------------------------------------------

--
-- Table structure for table `umse_log_perdoruesit_paramodifikimit`
--

CREATE TABLE `umse_log_perdoruesit_paramodifikimit` (
  `ID_p` int(11) NOT NULL,
  `Emri` varchar(50) NOT NULL,
  `Fjalekalimi` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `n_Emri` varchar(50) NOT NULL,
  `n_Fjalekalimi` varchar(50) NOT NULL,
  `n_Email` varchar(50) NOT NULL,
  `Date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `umse_log_perdoruesit_paramodifikimit`
--

INSERT INTO `umse_log_perdoruesit_paramodifikimit` (`ID_p`, `Emri`, `Fjalekalimi`, `Email`, `n_Emri`, `n_Fjalekalimi`, `n_Email`, `Date`) VALUES
(1, 'Bleon', 'bleon', 'b@gmail.com', 'Bleon', 'bleoni', 'b@gmail.com', '2021-12-15 22:08:41'),
(4, 'test', '098f6bcd4621d373cade4e832627b4f6', 't@gmail.com', 'testi', '9627df7a4a5b849f67fce863e82adc71', 'te@gmail.com', '2021-12-17 23:14:47'),
(5, 'Bleon', 'bleon123', 'bleonrexhepi2@gmail.com', 'Bleoni', 'bleon123', 'bleonrexhepi2@gmail.com', '2022-01-03 01:06:04'),
(8, 'test', '098f6bcd4621d373cade4e832627b4f6', 't@gmail.com', 'testiiii', '098f6bcd4621d373cade4e832627b4f6', 't@gmail.com', '2022-01-03 21:50:53'),
(10, 'test2', '098f6bcd4621d373cade4e832627b4f6', 't2@gmail.com', 'test22', '098f6bcd4621d373cade4e832627b4f6', 't23@gmail.com', '2022-01-03 21:57:51'),
(10, 'test22', '098f6bcd4621d373cade4e832627b4f6', 't23@gmail.com', 'test2256', '098f6bcd4621d373cade4e832627b4f6', 't23@gmail.com7578', '2022-01-04 14:58:14'),
(11, 'lenovo', '9c7c99ad911624096e9bf20ad4c83462', 'lenovo@gmail.com', 'lenovo123', '1d0f6561c5136a87522231fedd0d08ee', 'lenovo@gmail.com', '2022-01-05 01:31:15'),
(12, 'lenovo', '9c7c99ad911624096e9bf20ad4c83462', 'lenovo@gmail.com', 'lenovoooooooooooooooooooo', '1d0f6561c5136a87522231fedd0d08ee', 'lenovo@gmail.commmmmmmmmmm', '2022-01-06 14:15:01'),
(17, 'lenovoidea', 'e389a212c2b3beb2a9a00ad2f13b8c2b', 'll@gmail.com', 'lenovoideapad', 'e389a212c2b3beb2a9a00ad2f13b8c2b', 'll@gmail.com', '2022-01-08 02:54:24'),
(18, 'iphone', '0b3f45b266a97d7029dde7c2ba372093', 'iphone@gmail.com', 'iphonex', 'iphonex', 'iphone@gmail.com', '2022-01-09 19:33:36'),
(19, 'iphone', '0b3f45b266a97d7029dde7c2ba372093', 'iphone@gmail.com', 'iphoneX', '63c9e8af485ed2e845d29c2874e584ea', 'iphonex@gmail.com', '2022-01-09 19:39:57');

-- --------------------------------------------------------

--
-- Table structure for table `umse_log_perdoruesit_pasfshirjes`
--

CREATE TABLE `umse_log_perdoruesit_pasfshirjes` (
  `ID_p` int(11) NOT NULL,
  `Emri` varchar(50) NOT NULL,
  `Fjalekalimi` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `umse_log_perdoruesit_pasfshirjes`
--

INSERT INTO `umse_log_perdoruesit_pasfshirjes` (`ID_p`, `Emri`, `Fjalekalimi`, `Email`, `Date`) VALUES
(1, 'Bleon', 'bleoni', 'b@gmail.com', '2021-12-30 00:04:17'),
(4, 'testi', '9627df7a4a5b849f67fce863e82adc71', 'te@gmail.com', '2021-12-17 23:18:51'),
(5, 'Bleoni', 'bleon123', 'bleonrexhepi2@gmail.com', '2022-01-03 21:51:34'),
(6, 'testi', '9627df7a4a5b849f67fce863e82adc71', 't@t.com', '2022-01-03 01:05:45'),
(7, 'test', '098f6bcd4621d373cade4e832627b4f6', 'test@gmail.com', '2022-01-03 21:18:58'),
(8, 'testiiii', '098f6bcd4621d373cade4e832627b4f6', 't@gmail.com', '2022-01-06 21:42:22'),
(15, 'br', 'dc634e2072827fe0b5be9a2063390544', 'br@gmail.com', '2022-01-08 03:11:16'),
(17, 'lenovoideapad', 'e389a212c2b3beb2a9a00ad2f13b8c2b', 'll@gmail.com', '2022-01-08 02:55:27'),
(18, 'iphonex', 'iphonex', 'iphone@gmail.com', '2022-01-09 19:35:20'),
(19, 'iphoneX', '63c9e8af485ed2e845d29c2874e584ea', 'iphonex@gmail.com', '2022-01-09 19:42:20');

-- --------------------------------------------------------

--
-- Table structure for table `umse_log_perdoruesit_passhtimit`
--

CREATE TABLE `umse_log_perdoruesit_passhtimit` (
  `ID_p` int(11) NOT NULL,
  `Emri` varchar(50) NOT NULL,
  `Fjalekalimi` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `umse_log_perdoruesit_passhtimit`
--

INSERT INTO `umse_log_perdoruesit_passhtimit` (`ID_p`, `Emri`, `Fjalekalimi`, `Email`, `Date`) VALUES
(1, 'Bleon', 'bleon', 'b@gmail.com', '2021-12-15 22:06:52'),
(4, 'test', '098f6bcd4621d373cade4e832627b4f6', 't@gmail.com', '2021-12-17 23:12:32'),
(5, 'Bleon', 'bleon123', 'bleonrexhepi2@gmail.com', '2021-12-30 00:04:42'),
(6, 'testi', '9627df7a4a5b849f67fce863e82adc71', 't@t.com', '2022-01-03 01:04:52'),
(10, 'test2', '098f6bcd4621d373cade4e832627b4f6', 't2@gmail.com', '2022-01-03 21:57:09'),
(11, 'lenovo', '9c7c99ad911624096e9bf20ad4c83462', 'lenovo@gmail.com', '2022-01-05 01:30:44'),
(14, 'lenovo', 'e389a212c2b3beb2a9a00ad2f13b8c2b', 'lenovo@gmail.com', '2022-01-07 23:01:17'),
(15, 'br', 'dc634e2072827fe0b5be9a2063390544', 'br@gmail.com', '2022-01-07 23:06:49'),
(17, 'lenovoidea', 'e389a212c2b3beb2a9a00ad2f13b8c2b', 'll@gmail.com', '2022-01-08 02:53:48'),
(20, 'Bleon', '4075e7ab3a25fd5ac73a2ae5a75cd501', 'bleonrexhepi2@gmail.com', '2022-01-09 22:07:35');

-- --------------------------------------------------------

--
-- Table structure for table `umse_perdoruesit`
--

CREATE TABLE `umse_perdoruesit` (
  `ID_p` int(11) NOT NULL,
  `Emri` varchar(50) NOT NULL,
  `Fjalekalimi` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `umse_perdoruesit`
--

INSERT INTO `umse_perdoruesit` (`ID_p`, `Emri`, `Fjalekalimi`, `Email`) VALUES
(13, 'test', 'fb469d7ef430b0baf0cab6c436e70375', 'test@gmail.com'),
(20, 'Bleon', '4075e7ab3a25fd5ac73a2ae5a75cd501', 'bleonrexhepi2@gmail.com');

--
-- Triggers `umse_perdoruesit`
--
DELIMITER $$
CREATE TRIGGER `umsePerdoruesit_pFshirjes` AFTER DELETE ON `umse_perdoruesit` FOR EACH ROW BEGIN
    INSERT INTO umse_log_perdoruesit_pasfshirjes
VALUES(
    OLD.ID_p,
    OLD.Emri,
    OLD.Fjalekalimi,
    OLD.Email,
    NOW()) ;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `umsePerdoruesit_pModifikimit` BEFORE UPDATE ON `umse_perdoruesit` FOR EACH ROW INSERT INTO umse_log_perdoruesit_paramodifikimit
VALUES(
    OLD.ID_p,
    OLD.Emri,
    OLD.Fjalekalimi,
    OLD.Email,
    NEW.Emri,
    NEW.Fjalekalimi,
    NEW.Email,
    NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `umsePerdoruesit_pShtimit` AFTER INSERT ON `umse_perdoruesit` FOR EACH ROW BEGIN
INSERT
INTO
  umse_log_perdoruesit_passhtimit
VALUES(
  NEW.ID_p,
  NEW.Emri,
  NEW.Fjalekalimi,
  NEW.Email,
  NOW()
) ;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `umse_skuteretelektrik`
--

CREATE TABLE `umse_skuteretelektrik` (
  `ID_SkuteriElektrik` int(11) NOT NULL,
  `Emri_SkuteritElektrik` varchar(1000) NOT NULL,
  `Shpejtsia_SkuteritElektrik` varchar(80) NOT NULL,
  `Pershkrimi_SkuteritElektrik` varchar(2000) NOT NULL,
  `Foto_SkuteritElektrik` longblob NOT NULL,
  `Emri_FotoSkuteritElektrik` varchar(50) NOT NULL,
  `ID_LlojiSkuteritElektrik` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `umse_skuteretelektrik`
--

INSERT INTO `umse_skuteretelektrik` (`ID_SkuteriElektrik`, `Emri_SkuteritElektrik`, `Shpejtsia_SkuteritElektrik`, `Pershkrimi_SkuteritElektrik`, `Foto_SkuteritElektrik`, `Emri_FotoSkuteritElektrik`, `ID_LlojiSkuteritElektrik`) VALUES
(4, 'Segway F-25', '8 - 60 kmh', 'Segway përmban përditësime thelbësore të cilësisë që ofrojnë qëndrueshmëri më të madhe, rezistenca të plotë ndaj ujit dhe një platformë vozitëse me stabilitet të plotë, gjithashtu sistem frenimi të dyfishtë për siguri dhe sistemi i palosjes me një klikim.', 0xffd8ffe000104a46494600010100000100010000ffe202284943435f50524f46494c450001010000021800000000043000006d6e74725247422058595a2000000000000000000000000061637370000000000000000000000000000000000000000000000000000000010000f6d6000100000000d32d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000964657363000000f0000000747258595a00000164000000146758595a00000178000000146258595a0000018c0000001472545243000001a00000002867545243000001a00000002862545243000001a00000002877747074000001c80000001463707274000001dc0000003c6d6c756300000000000000010000000c656e5553000000580000001c0073005200470042000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000058595a200000000000006fa2000038f50000039058595a2000000000000062990000b785000018da58595a2000000000000024a000000f840000b6cf706172610000000000040000000266660000f2a700000d59000013d000000a5b000000000000000058595a20000000000000f6d6000100000000d32d6d6c756300000000000000010000000c656e5553000000200000001c0047006f006f0067006c006500200049006e0063002e00200032003000310036ffdb004300030202020202030202020303030304060404040404080606050609080a0a090809090a0c0f0c0a0b0e0b09090d110d0e0f101011100a0c12131210130f101010ffdb00430103030304030408040408100b090b1010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010ffc000110801e801e803012200021101031101ffc4001e0001000202030101010000000000000000000109020803060704050affc4004e10010001030302040205060807110000000001020304050611071208132131416109142251811516327191a1233342435262b1c12453728283a2c2171825273445546364737592a3b2d2e1f0ffc4001801010101010100000000000000000000000001040203ffc400201101010001030403000000000000000000000102032131041291d1114262ffda000c03010002110311003f00b53000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000047300900000000000000000000000000000000000000000000000000000000000000000000000000000000000000113ecc26ed11576f7c73f7339f668c75b3a23e277f3df56d6f666811b874dcbcbbd976efe3eb36ad5fe2b9998a26dddaa9e388e2388998f406f3f30d54eb0f8fad81d2fea953d34d3340cbdcd7706f538baddcc0c8edbb857e67ed5aa6d4d13e6d54d13154fda88f5e227989e35f29b3e35b6c4c55a774bba8117289fd0c6cbe63f09a2ecc35ff0046eafefcd37c4eedcdc9b6fa719f3d4bd3f2f2e3274baf0e6f65ea3935d1762edbbf4dbe2e45716ee5de63de63899f4805d6515c554c4fafafdeca27956f6f7fa4d3abfb22ce5edddd1d138dafb9231a9bd8ff0096b132acda8899f4ae6dcd5df313c4f1edfb9cbd31fa57b3b3b132eff513a5d6f371ed576e8a7336e5f9f2edd5573f62b8bb33eb3c7a7da8e789058e8ae5d5be967c4b5ba723f236c2c7bda073118f6b2af554667a44774d55515556fd666a8e223d388f59e788d81dbfe3b3a65ac69f8b9f91a16b38f19366ddde289b35f6f34c4f1fa71f783664792ecbf131d27df3abe2e83a4eb3916350cdabcbc7b1978d347995ff00462a8e68e679f4f57acc7ac4024000000000000000000000000000000000000000000000000000000000000000000000000000001131ca404710ebd95b2b68cebbf9e74ed1d1af6e3b36abb76753af0ad7d7222638ec8bfdbe6444c7a7bfb3b122a8e601fcff00f5eb7a6f8ea3eecd7774ee9aa72b5bd4f3eb9cba7be698b1d93db166dc473c453c45b88fba16dde0ff00c34ed0e96f866d0f64eada060e4e6ee7c0b5ab6e4aa266b8c9cbbd6e9aa3edf3cc7954f65144d3c713477c7133cab97c59e3dce88f89fdf1671343af271afea95ea566d5163ba22d66445ffb31ede9372b88fd4b62f0e3a36e4dbbd0dd97a3eedc0b981aa636956a2f61ddb9df731699999b766b9fe95bb734513f3a641af1b53e8f9f0e9bbead471b7a699b8753ccdb3ac65e04d15eb97a9b376dccc5eb55cd144c713559bd67bf89889ae2a9f4e5e95aa780ef0e7a844461edad5349ed8e23f27eb3934447a71ed5d5543d3fa756e9bbacef8d4a8ab9b593b8eba699fbe6d6262d9abf6576aa8fc1de41e05d3df05fd1fe9beedc2de5a35edc3999da75cf371a8d43549bd66ddce388abb6298e6639e6399f78897be447111090000000000000000000000000000000000000000000000000000000000000000000000000000000000044fb2513ec0ad2fa4ef624d8eaa6d9ddd8d6bb28dcba1dfd3ebb91ff0049c5af98fc7b2fd1ff0091bb1d28ea9636bde1db6bf54b32aab22abfb771b2afd14cf35ddc98b714d76a3faf3762698f9cbc87e924da3f95ba1981bbec58eebfb4f5ec5cd9ae23d68b1779b173f0e6e5bfd90eb3e0073f51df1d3f9d93a85ca2345e9f6bb7f32ddaf3226726e644fd6312268f85bb55d77ae7afbdcf2a63f8b906db6c0d032b6ced2c0d2f50b9177509efcad42ec4fa5cccbd72abd915c7ca6edcb931f2e1d91111c240000000000000000000000000000000000000000000000000000000000000000000000000000000000000001e7bd7cd913d47e8cef3d936ed77dfd5746cab58b1ff00698a3beccfe1769a1a37f467ef98c3ea66b5b5b26ef9746e8dbd6f36dd154fbe4e15dedaa3f5f977f9ff00356495c476cf74731f72a7365cff00b83f8d2b781354e3e2e87bf2ee9f313e91181a84d56a8fc3b2fdb9fc2016c91ec9444709000000000000000000000000000000000000000000000000000000000000000000000000000000000000000044c72abdfa457695fdb7e2128dc9a6c576a7776ddb1976eec7a719f8754dbe7f5c516f19686d2afa4df6a7d63626ccea1dbb7cd5b7f5c9c1bf547c2c65daf7fd5e659b71faea806d5f4c378e3f503a75b677c634d336b5ed2b17508edf689bb6a9aa69fc26663f076a6b1fd1efbb7f2f7878c5d02f57dd7f6a6ad9ba3cc4fbc5bf33cfb5ff00a77e988fd4d9c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000001e37e2f765fe7ef86edfbb7ed5befc8a349b9a862c44733e7e24c645be3e7cd9e3f17b23e7ccc4c7cdc5bd85936e9b963228aaddda2af6aa8aa3898fd80af7fa3177b5346efddfb26edcfb1ae69587af63d3357f3b8f54d8bdc7eb8bb667fcd5882b1fa61b5707c3778b7d83a3e999593569f959997b6f22ac8ae267ccbb376c71cf11e9376dd8aa23feb23d566d44f75313f7c03200000000000000000000000000000000000000000000000000000000000000000000000000000000000000044fb2513ec0adffa40a7136a7513173f4ecfb76b5cb5958fb8f4db3473e6714531355d9fba3cec4b7c7df335ac2f6b6bf85bab6d693b9f02a89c6d5f06c67d9989e7ec5db715c7eea9a41f4a06cdaa99e9e752b1ac734e3e4e5e839f547c6ddfa22ed9e7e5136af47fa47b87810de13bb3c34ed9b17aecd795b72bc8dbf93ccf33138d7662d7edb33667f106c2800000000000000000000000000000000000000000000000000000000000000000000000000000000000000227d9289f60571fd275ad6ead5f57c7dbda7eaf931b776f62e1e7e75999a69b36f51bff0058f26226239999c7b37e78aa663d3d3899f5fa7e8dfeb36dfdbbad6bbd2adc19b771b2775e7e3e768d6aab554d3565c634fd62dccf1c513d96ad4c73eff07c5e39b72e9b676aeffc3d4ace3dc9dc7d40c0d2e9aee73cdab5a76956eeccd331ed3df7663f5555b59b646efc4d97bab666f4c0af129ccdb9ace36a1914d13317231fceb733e65144faf3479911357a73fac17731ec97158bd4645aa722d5515517239a663da63e12e500000000000000000000000000000000000000000000000000000000000000000000000000000000000001157e8cfea4a27d81ae7b27a57b13aa38dd61da5bfb6de1eb5837ba83997e2d6751373c9bbf55c59b776dcccf36e639e626998fdeacafccfd536f6a5ba366677d5e3374abf91a6e4dde38f3a6c5daa9ef8a7e3cf1e9ccc7a70b4ee9c6e0d3768f517aef6b5ac9a3130b4ad630b70e45dafd22de35fd2accd5739fbb9c5bbfb1595ae7502c7503ac5bb377d18718b6b5cd57232e2c73fc5d172a99889f9f1c73f305abf863de3f9f5d04d91afd7766bc8fc95670f266a9e666fe3c7917267f5d56e67f17a9350be8e3dd15e574ef746c6c9b933776deb7376dd33f0c7c9b71551c7f9f6eeb6f227904800000000000000000000000000000000000000000000000000000000000000000000000022678026621e65a87887e93e99d5bb7d12d43735bb1bb2bd3e7539c7bb4556ecd18fddc7adeaf8b7dd3fd0899abe5e8d58fa4a3c65eabd1ab1a6f463a699b146e9d771a73b54caa2f764e9f813331453331f6a9aeecc55edc55db4ff595e9670b726e1dbd87bd33edd8aed67dcae28cdc6c98bfdb77bea89b77a399aed5c9ec9988b9c7747ac720bfca2e517298ae8aa262639898f8c391567e0c7c5c6bbd33dc583d3edfdaa5ebfb5f3ee5163fc26b9aff0026d55fa537adccfb5be7f4e9f6e3d63d6279b49a2aa6ba62a8989898e7d019800227d92fcdd7f5cd336de8b9db8359caa71b034dc6b997937aaf6b76add335553fb22415ddf48cf51b55e99f51b52d0b6c665b9b5d42daba7d1af58b7cf9b4fd4b2efce371c7f8df3668e3df8b7c7c61ae5d42e9164745b736d2d9faac5fa75fbfb631758dc7d954c55f9473326fd7e4f3ef1166cc59b5c47c69aa7f94f60e8e6569fe2abc64e5f537a87aa69f87b6f6a64dbd67ead9d936e8a2abf44f6e9d89115cc77f6f97e6d7ff0073ebfa4e4f143ac68bbb7ae9b8f7be05dfae59c7cd9d1ec64db9eeb1555898b14f1157b4cc5cee99e3effd4972939592de1f8de1b7c416dee80f5af3f33331abab43d771a9c1d42cd9afccc8a7b27bad5e8899e6b9a6798e267daaad69db6f72695baf43c2dc3a1e5539383a858b7918f729f8d15c44c73f74fafac7c1435b3b60ef7ea8626e1dc3b570b43d5f53d2b53cbb57b47c7d4fb75a9b56f89f3e9c698efbb6f89fe6e667ecd5f67d1eade0cfc4c6add22ea5634f51355d5f0b6bddb945ac8fc9199cf955f3c7f8558b96ea8bb6e7e336fcbb91c7d899f69a8ba589e52f8b4bd4b0358c0c6d574bccb59785996a9bf8f7ecd7155176dd71cd35d331ef1313cf2fb40000000000000000000000000000000000000000000000000000000000000000000000635cf6d333f08864c6a8e6260147de2970f45ddfe2dfac5bc758c9b7385a6ea5f51c6c48bb36aac8bf896e2c5ca22aedaa3d26d55571c7acd54c7b4bcd76bea781b7f56ccc9c3fcab9ba3e7e35cb3319395455dbc574d55d37aae3b278a29ab89f48f329a2ba279a786c7f8d6e824f48ba91ba73f46cdd4b5dccddfaa5eddb6a8faa774c5dcfc9bb1363cba39ef8b7d9738aa639f596b4e16938da7d1e4e662c6244d5e55eb5729f2a39ae3d68aa388e79e3da7ee07eaeb39f66ee16999b8177baff003e5f6d3fa572898e63d3f6ade3c24f5d340de7d05db395bb374e9987aee978df93352b3999b6ed5c8aec4cd345c98aa7f956e2dd5cfce7ee53ae9bbbe744a29c1dbfb974fa2ce3f31479b8bcdca639f8cf33f1762c6eaff502c5314e36eed3eaa623d226d4f1ff00b2417911d4ee9c4cf1f9ff00b739ff00c52cff00f273d1d40d8973f8adeba0d7fe4ea7667fda51f5aeb7f52edffcff00a35ce3e15711fdb65cf4f5cfa91331dd56817a3dbf8cb71fec402f06deeedaf7b8f27726955f3eddb9b6a79fded26fa457c50edfd2367657487696b56f273322aa2bd7aee3dc8aa8b36a38aa8c6ee8fe5d53db55511ed11113fa5c344b53eb575233b12e635ec9d1b4ab75c715e5db9b75d74c7f56988f7fd730f1edcdb8e8d6e69d3f1a6ece9789335645db95f35655c99e78e7e35d53ef3f3907e3fe7dee8d2f332234ed5afe1dbbbfe137a2dfd9aaa998e62267dfdb86c8f40b52c9d7fa11b8b47cebb5decddbfab58d6e8aeb9e666de444d37bf7f0d5e8c2ccd5afc61d8c79bd979b7bcbb76eddb9aae5db95cfe85111eb33ebe910f67e975cdcb83859f4e83955d9c5c9c1f2752b715453e6dbf3299ecff579fc3e6cdd4e8dd6c676dde59679f4d3d36be3a36f7cdacb2f8f6f8f4dd26de16fcd46ed8cfc8c0d4ace54656264e35d9a2f59b91c4c5cb7547ac4c4faf31c4fa7a4bb4f5432b4edc189a7f50727ea9637255913a66ebb16e98b74e65de3bac6a96fb23f839bb47317223f9db555711c5de1d5f78dcb18dbbacea3839315d17ed51315c4713df1f173ee9d5addbc6b95e4daa6ac7d571670adf97cf34dcfb376d573cfdd5c554fa7c2a69bf9bb3c31f8fb2c2be8bceb8e5eb7a1eb7d09dc79d373276f533aa68d3555eb5625cb9c5fb51f2b776aa6a8e3d38bd3f086fd47b292fc03ef6bfb77c5d6c1b76ebeca35aface91914c4fa57e662dd98e7fd25ba67f5c2ed23d89c3889005000000000000000000000000000000000000000000000000000000000000047308eef903218f77c8e7de019226786155531fa3ebf8b82f5ecaa63f83c48b9f2f338fee069f7d23db12d64eccd0faab5e9b772f036fe44e06b7e444f996f0efd54cdac8f4989fe0b228a63de3d2fdc57b63efce9a681baf45d4375edcfcefdada763ea191a9d8c9b7eba9e6ddc1bb6b1a223ecf114deb913cc7ad3cccc7ac42e9373c6a9ace8f9da167ec4c6d5b0350c7b98b958b7f2a89b57ed571c55455131eb131331c7cd57dd64fa33fa9d56e2c9cde9161fd4f44bb72baece9faadf8bf7b1227f9ba6fd11cdca223d226a889e3d266b9e6643487666dbdcfd42dfbb7ba63b56bbf7752dc9a8e3e059b56ae4f6f9f76e713727ee8a79aaa99f8453ccfb2f723c13f857af071f0f27a25b66ef91668b537a8c59b35dde2223baa9b731cccf1cccb567c1c7861d9fe15f5aafa8bd44da9baf716faaed5cb367368d368fa969b6eb8e2e458a62b9ae6e551e9372af5e398888e6ae76f7fdf35d39b13dba859d770e63dfced2af471fb290752d43e8fcf08f9f13ff001496b1e67e38faa6751fbbcee1ab1e357c24f49ba33b5740bfd21d9d9f6b55d6f50bb8fc57a95cc8efae2d716ad536eeccfe95cb94c73f0e38f8b7771fc4cf462fcf6d5bc2dd99fbafd8b96ffb61e4bd5dddfd2feaaf5bfa43a5d1bb70efe99a1e4e7ebf9b768c98a6dc79116aab14d7cfdf7eddaf9cc4540e8fa77d131e1ff234ac2b9adebfbc69d5aac7b53a8558da8da8b15e4f6c79b55bb75d99eca66bee988f844c3f6342fa293c2fe97769bdab57bbf5c8a2a8aa9b797ab45aa223eee2c5bb7fdadb3c3de5b573623ea7b8b4fbdfe464d13fdefd1b5a8615e889b39766e47df4dc89fef0796f4bbc2a787be8ce47e50e9d74af45d33508f58cfb945795994ff937efcd57288f953310a7dead6d8d63a31d4edffd3eb35d7871a56b1998b115511ff23bb5f9962e4731f1b572d4c4ff00597b51728aa3de38682fd253e19f57dc78f67c42f4ff0049af333f49c3faa6e7c2c7b7dd772302df336f2a9a7deb9b5dd5535c47acdb989f6b60accc1d12bfac79d733afdd9a29e2d79931edff00db9f7967c556f49c08ab99b777cc98f94533fdf11fb5f25ccac4af1e2f63e45faad571cd14d11e644fea9e63f7f0ebbaaea5c5caf3326b9e623caa68efe66989f9c7bccfa7b7b44447c3990f77f01fa6646e1f195d34c4c5a6e4d381a864675c888e7cbb76316f5c9e7f1e23f15efc7a470acafa23bc386b5a7dbd57c4bef3c0b98d46a98b5e95b66d5ea389bb666b89c8cc8fead5d94dba27e311767da616671320cc473e9ca3bbe40c8473e9ca3bbe40c8444f29000000000000000000000000000000000000000000000000000018d51cb201871f2197104c7300c51c4fdecbb7e676fcc184f74239e5c9dbf33b201c6393b211c7cbfd5071574f747da8e5c1774fc3bf1db7b16c5c8feb5312fb38f9134f3f0fdc0ebf99b1f6967c4c666dbd3eef3ef1563d0e8b7fc30f43af6bb9fb927a7ba7d1a96a74dba326fd33739aa288888888e78a23d23f462399f59e5eb314447c227f04f6f1fc98fd80f1cbfe16ba4772a99c7dbf563d5f7d9c9b94ff007be48f0c3b4b16ae74dd5b5dc498f68b7aa5d888fdef6dece39f99d9ff00ee01e418bd14d574d8ff0082f7c6b74c47b79b9555cfed7d93b1fa9f8d13f52ded45711fe3ecf77edf57a9764ff469fd8cbb7fab1fb01a01d63fa31f4eea86b595b9b4bced336c6ab9d726f6557a45aaece3dfb93ef726c4ccdba2667d67cbec899f5e3d5f81d2efa2a340d99b831f5edf9878dd418c4b9e65ac1cfd527130e66279fe12cdbb3337239fe4d55f13f1898f458f767c80756d16372e2e259c2b9a0e060d9c7b716ad59c7bf1345ba22388a6988a622223da223ee7efda9ce98fe1ad514cfdd13cbea8a7ee4f6fcc1c51557ed3cb2fb7f267dbf33b7e60c639f8a53dbf33b7e6084d3e9e8988e0e20120000000000000000000000000000000000000000000000000000000000000008e212023883884808e20e212023883884808e20e21202388388480000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000fffd9, 'segway.jpg', 2);
INSERT INTO `umse_skuteretelektrik` (`ID_SkuteriElektrik`, `Emri_SkuteritElektrik`, `Shpejtsia_SkuteritElektrik`, `Pershkrimi_SkuteritElektrik`, `Foto_SkuteritElektrik`, `Emri_FotoSkuteritElektrik`, `ID_LlojiSkuteritElektrik`) VALUES
(5, 'Hoverboard Ultra', '6 - 8 kmh', 'Hoverboard është një transportues personal vetë-balancues i përbërë nga dy rrota të motorizuara të lidhura me një platformë sensitive mbi të cilën vozitësi vendos këmbët e tij. Vozitësi kontrollon shpejtësinë duke u përkulur përpara ose mbrapa, kurse drejtimin e udhëtimit duke lakuar platformën.', 0xffd8ffe000104a46494600010100000100010000ffe202284943435f50524f46494c450001010000021800000000043000006d6e74725247422058595a2000000000000000000000000061637370000000000000000000000000000000000000000000000000000000010000f6d6000100000000d32d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000964657363000000f0000000747258595a00000164000000146758595a00000178000000146258595a0000018c0000001472545243000001a00000002867545243000001a00000002862545243000001a00000002877747074000001c80000001463707274000001dc0000003c6d6c756300000000000000010000000c656e5553000000580000001c0073005200470042000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000058595a200000000000006fa2000038f50000039058595a2000000000000062990000b785000018da58595a2000000000000024a000000f840000b6cf706172610000000000040000000266660000f2a700000d59000013d000000a5b000000000000000058595a20000000000000f6d6000100000000d32d6d6c756300000000000000010000000c656e5553000000200000001c0047006f006f0067006c006500200049006e0063002e00200032003000310036ffdb004300030202020202030202020303030304060404040404080606050609080a0a090809090a0c0f0c0a0b0e0b09090d110d0e0f101011100a0c12131210130f101010ffdb00430103030304030408040408100b090b1010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010ffc000110801e801e803012200021101031101ffc4001e0001000007010101000000000000000000000304050607080902010affc4004c100001030302030505040608030607010001000203040511062107123108134151611422327181095291a115234262728216172433b1c1d1f05392e118254373a2f1343544638393b2d2ffc4001a010100030101010000000000000000000000010203040506ffc4002a11010100020104020201040203000000000001021103041221310541135122143261a171811591e1ffda000c03010002110311003f00ea9a222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022f991e6bea02222022f8bea022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222202222022220222853d4474f199657600fccf920f9513c14b0bea2a26645146399ef7b835ad1e649562dff005fea69a2747c3ed112de1fb86d5dc6abd82909f305cd74ae1ead8f94f8121566e3716d510670ce469e66b1db8fc3c4aa7c97489a77793f5c2d671efd8c33ac74776d0d765d1d171df46e81a77e40a7b1e9f7d64a07acf50fc93ead6b5615d53d8cbb65dc9cfad676c8bade66ddcd86a65a9a38c9f2c46f70c7d30b735976839b20efd762aa54f77825c35c704ec15bb2cf50dfd3973aef447da35c14efafd572eacbfdb699879aaf4cdedf501800d9ce877931e24f778f92b1b447da27da82c759fa5af7c53b6ba969a66c15169badb9b51238ef970680d971b6f878c7e4bb2305535c039ae0e1d42c1fc7eec65c06ed11453cdaa74d476bbfbd87babedadad82ad8ff0002fdb96519ea1e0e7cc755ea707c9e3319c7d471e3963ff125ff00dcf2e4e4e9b2cbcf1e5db7f7ff00c610e06fdab5c3cd652476ae306999b495573721b951f3d4d01df01ce18ef22076ebcc079ade1b0ea0b1eaab3d35ff004ddde8ee76dad8c4b4f574933658a561e85ae6920ae26768cecfbc71ec9d1c369bbd15beaf4bcf24b494faa2db445adab6483fb9a8e6e6eedf804869f5c39d8554ecfdc4de39766ab747ad34e6a2a2a5b24b132b5f66bad586d25d60247318a32e04bf7eb190e1919046c75e6f87c3a8c7f27c75b9c9e72f1ad39bff00213a6b31eb3585b758f9deff00d3b618fc57b5853b3676a9e1bf697d3cfadd2d5268af740c6fe94b254bc7b45293b730ff0089193d1e36f3c1d966b5f3f676dd3d411110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110439a66411ba590e1ad566deafe1ef7389c6321a3c829ad5977ee9c696376cc1ef7a92ac1acab7cce2e738e0f40ba7878f7e6a2a62b6f33c8e383d553a4af9ce4893ff652f23f03ae3738fcd412e27c574ea4f4aa6057d401812e7e8a6e8efb2d3cac7c8c0f6b4e48cec7d152912e93bd321d05ee96b40752c9c8ff00119ff10ab34f7139eee6f75dd33e07e4b13433cb4f20961796b9bd08575d9afecad029ea88649e07cfd563971fd9b5d5a934f5835a69faed2ba9ed74d73b4dce0753d5d254303e39633e041fa11e4402b8ff00db7bb15debb3d5e22d51a36a2bae3c38b84dddc06573a4759a579fee253d3bb2e3ee3f6ce794e5dbbbaef055163846e79c9e8ef02a1ea5d3f62d71a72e3a4754dba1b85aeed4cfa4aba599bccc96278c1041fc8f810085a74dd467d3672e3ebee7ed5e4e3c7966affd7f870f34fd5df7b3ddd6dbc48d1bc53a387575a9f04f454f42fefe1aaa5901e7648f69e520e0b5f1bc0f03e457643b2b7699d23da7786b06b0b1c91d2dde8f969af76a2f064a3a9c6fb7531bbab1de2323a8207213b50f65bbcf67ee31ff0042ea2b1bfd19bdcddfd82eb50488cd3b9d82c95c01c3e22795de60070eb8571708b8a36cec69c43b36b8d31ac1f7ca83526d9abac94839a0a9a1241124537c2f23396677e61be01217bff23d0e1f2dc17e43a4c31c31c7dcdbc6e9faabd0f2e3d27559dcf3cbccf1e3fd7d3b85b63a2f4a8ba4f5558b5c69ab76acd33708abad775a68eae96a23396c91bda083f81e8ab4be41ee88888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880a14f3329e19277fc2c6971fa2f4f7b23697bdc1ad1d49380b137137b46709343c53db6f1ab227d4332276d230cc2103af3b87badf9139538cdd1eef755254cef7bc925ce24aa3cdf0aa769de2970cb881a763d5ba4b5cd9abadb2b4bcc82ad8c7330483ced710e6e08f11f2c8c29f8aa29aba0efedd570d4c2ef86585e2461f91190577e366b515a9393391b6365e395d8ce3a2987d3ca36c9c74d941744f6f5dd5d086e706ec7e4bc77b923ddebb75510b7cf2bc18db918e9e483e095c5a1c303d4288c91cd21cd25ae69dbd0a8623c6074ff007ffbaf6063082efb45d8d6d2963f1df4433f3f555da2ab6cac68077f058f286a9f4952c95a7c77573d0567eb880701c799bbf459658a65d2c4ed6bd9f6dfda4383772d2b1b628751db41b858aadcd04b2a980e2327c1920cb1de5cc1dd5a17102e16ab850cd3d157d04d0d45348fa7a888b70627b496bda7d41042fd0ed1d512e6b86320efbf82e517da37c1eace1171ee9b5f69db7c9369ae2131d55253c519708ee0dc36a1800fbc0c720f32e78f059f7e58cb8cbe2a758df35987ec99ed1b3d5d2dcbb38eaaac2e92dcd7dcb4fcb23f3cd0977eba9bf95c43dbe8e78fd90ba5ab8b9d95fb30f6989f8aba4f8c5a07415659682d7728aa25abbf3bd8229e979b12b5ad70ef1fcd1970cb5846e176769a4ef616bf3938c15cf94d2519111541111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011439668a11995e1b9e9eaa87a9759e9ed2966a9bedfee705be8295bcd2d44efe56373b01e6493b00372761ba496fa1702852cf0c0c324d2b63681925ce00616ad710fb59ea296296938776082dd19f86eb7b638b837ce3a2696b9db78c92478f169e8b4d78a9da8752eb9bd49a574edeef9af2faee60ea78ea0456fa776402e90461b18683e183e45d9dd6938efd8e8a7117b56704b86ac91977d614b5d571bc4269adef6cce12977288dcfc88d8e276c39c0fa2c39a97b686b2bd77b4da0f49515a21f87db6e4e355237d5b1b0b199f52f7007c0ae74d6c761b26a2a6ba716352cfabf56c32b5f6ed2f6205d152cb9cb5ae0df11b6db631bf32a96b5b96bad4507b6f18359d270ef4d4bbc765a2979ebaa19f75dca7249f13d07dd579c78c19778abdafae13dcce9ff00e945fb5fea57c9cada1a29ff0054c7fdd2c81ad85b8f26b0b87ed1f158beefa3754710e07ea5e31ddabb4e5861c4c6cd1d44419cbd795e1b1f367f88b9de40268394c341253709b8653d86cd247cb26a7bac91c5348ddf2f6b656b8bc637cf4f40a46c94ba05facdc2a3566abe22df39f7346d79a5a4fe21190dc6475e6e5f4579342cad7d70d19ab628a83869a1ae94b4da7e2e592ba2a07184c7e0242e3cf81b905dd7754be1df193887c187cf3e93e2b5ced2dae2c91f4f4ef6f74ec6719848734f5f2598b5c41ad2a6e50d16a0e2869cd1f63a8c359040c0eaa9063e07194e338d8ef8f42b0feb2d3274edee6a76da7f4834e1f493cb0470f78d3f0bcbdb9047c9bbfa2945654d17db9fb4669ed494b779f54c3aa6cee939ab286eb0c419334f50d73236be23be4729036e846cb34d7fda69ec9143533f06dbdd86ff0069105d5ee3cdfb9faa381fc5f8ad25bd434935233f4ad43ed53346648a2a9e62f1fc3cbcdbf9e30bedbedb456fa763ad51cb50656eec2f7308df7e62e04fe0ddfcd4caaba71a7bb73f66fbf69e82f172bfdcecb56f858f96df556b9a492373bab5ae8da5aec79e42ca1c3ae26f0c38bb04f370e75b5b6f1252f2f7f4d1b8c5511730cb4ba19035e01c1c1c60e319d8ae3a89e6a574d1dfa6a384b8618c89ef6cacf4c125d9c7a28967868ad623bb5964a912ca492f6bcc73348e9973b047cc02a7be8ed9496aab8f23ba71c1c7452efa796338730ae48694e20f1674c5cff4ee98d6177b554bdc246cacad7bdcf39fda2f3cb26c31f0f8acb2feda3c7f869a19af7c4da261a03de08db6a81f254b87ec4a5ac1ee93b1e9d55a674745e385e5dbb4ecaaf4ae734348fd9d96a57053b7fd2714b50daf465c383b5cebad7ccd86492c7566a790120779dc399cc18339279ce079ade08748b23c9331e9b612f24fb4eb696a49ddc8d783f355b8e92db7314f257505354c948fef2074d135e62763ab723638524dd3d554eccb1cd7b4ee31b7e3eaa25b5ef827741202d7791595d653c264d2e3a9707b03bc97ab7bf064889e87987f9a95e726224792f542f22ada73f134b4ff00bfa2c72f49559111660888808888088880888808888088880be7aecbeab2b5e7193855c2f8449c40e2058ec45c32d8eb2b18c95df28f3cc7e8135b1799f41941e416b8df7ed00ecc963962886b0acb877df03e8adb348c3b81f1100788502dbf684f666afa396be6d4f73a1861617c8eaab64ade403cc373e636eabaf1f8feaf2c3f263c77b7fe195e6e397b7bbcb65bd3195f5620d07dad7b39712a68e93487172c155532ecca79aa3d9e571f20d9794e7d165d6b9af68735c08232083b10b96e371baca34977e9e9111424444404444044440444404444044440444404444052d5d58ca38b3d5eed98df32a655997dd496aa2ab7cf71b8c104719e5607bb7c0ea71d772ad8cdd1532f7c8eef2471738f525606ed2360d735f76b65e282dd5172b0dbe9439b4f4cc2f7c55a5efe795cd1b91ddf741aec1e53de79ac9a78a7a103fbb75fe369071931bf1f8e1572d3a86c57cffe5179a4aa70192d8e505d8f9755a7aa3977c49a5a0d4d769e9353ea3bebe99c397f42d218e8dae3d3925909e72d393b7ba06f9cab28e91bab2dd359acb594da5ec6e3fadb6694a77d65c6a074fd6d56035a7d77033d575db51e8ad27ac29c52eacd376bbcc206036ba919372fcb981c7d162bd47d8e38157e0f752e9c9ecd23c6336eaa7c6c1fc872dfc95e6528e6053d86e9a51e6dba72df6ce1ed3d4fbafaead78b85f6af3f763667949f2c81eaa337485b34dd47e97a5b3c735ca5239b506b6983e52e3e31530cb89f1030df9adeabc760aabb64321e1cf131d44482053d75186b5e3eeba5870ec787c24ac4974ec9fc78d172cd55068ab7dd26230dafb254b1f3919df2e95a25dc7863c94ee51afd74b7cf768cd5df692efaab970f74d789ff00455aa3c78b62d9ce6ede21e542b65e4dc289d6ca1bcd6d453c24b45b3455abd9e9587eebaa9e0e7f88722be6fdc30d456d97da353f0cb538aa88990c959a7e6b910478b1cf77203e4794782b4b515655d6c669ab6d7a8a78183022b99a8a585ad1fb3dd411f4f4cfd54f8fa1449a5a0b2d68aa16fd21a6a72e00565d6a5d76ba13e6d6b49c3bf9bc142bf5bee37be5b936bf881789a26b8b6431436ea3391f7246f4dbc72be5baed4d688a46699d3775b64927ba4daad14b48e7e7ce67cb2487a0dcb73bf4509da7b576a77b63a6e1c55dd5cec16baf35b575e39bcfb98e36c67f028318d743516fae751b59494e41de164eda9901f5eec3403fca529edd5f723dc454f70a92719646deec3b073bf4c8c8f5596eddd9938f1a8fbb8adba0af3146ecf2c16bb13a9626e7c39a5e5002ca9a1becf7ed2b750d8e616ad2d4ef20c95178ba99aa40fdc8e9db26fe85cd4de95d6daf14fa1a2b6c027bc3a92d6d734bf9279417bbe4d68cfe2150e1b838d4c54b6ea42fab99c1b0c14ec7492b9c7c0068c939f25d1ad13f65af0e6925656712b5fdf7534c5dde4905335b434e5de3d0bde7e7cc16d070cf809c1fe0fc41bc3cd0368b3ce5bc8fab8e00eaa90793a6766423d3385173d7a4e9cbae1d762aed1bc546c3531699934fdbe7c17d5deb34a394fed7767323bfe45b65c32fb303855618a0ace286a0b8eadae610e7d3c47d8e841f20c69323be65e33e416ea35b81b0c05e1f3d3c5f14993e402a6ed35a5b5a13861c3ce18dbbf45680d1b69b153b87be28a9591ba5f57b80e679f5712aea190013803cca9292bc9188e303c89eaa09a891c72e394d5a9549d331b8f7cbcaa65e25da3a863435ec3cb903c17b1507f680fa296babb9e84b80e8e07a74dd24d51129aa1f286b9ee241f5d94fd39c54447c9e15b16cbddaa4ad8ecdfa568bdbe6c98e8fda19df3801be199c9181e4af0a4b74a0b249cf2f290ec7539519dd0aa2222c4111101111011110111101111014bd55653d14465a890340e83c4fc82f171af8add4cea89773d1adf171f256755d6d456cee9ea1d927a347468f20af871f7237a53f5bd25ff59d3496ca3d6575d3b6f95a5921b47771d548d2371dfbdae31e7cd81ae1e0e18cad78bbfd9e7d9b6f15335cabadfa9a7ba5417492dc67d4151515123ce72f73a52e04e77ce16c917bb00648c239e5dd5744c24f46da15c49fb31eb8c1ed9c1fe2cd443534e0ba9e8350c42485c724f289a36e5993e2587d5691711f86dc4de1b6b565a3b40d96eb628a4c462a29e95869e7634639a174788a4c80370727f6b75dd0033d02a06bbd03a37893a6eaf486bdd3b4579b4d630b25a6aa6640c8c7331df131e3c1cd21c0ee085eb74bf2bd474d64df7633ceafaae4e6e970e5c6c9fc6dfb9edc26b8dff4f3e9eaf4e697b27b4533aa5b253dcaa18f8ea846dcedddb5e58dce77f8ba6c42d92ecfddaf7b49f67bb151dc2a24add43a17be6c0286ece749131d8f8209ce5d19c0243725bb13caa7bb42f64cd4dd92b50ff5a9c3cb552eadd0ce908732e34e2a5f6c71f85b50ceaf61e8251b6d87729209d6496f9a9f5d5c2a185ce10cd54faa1434c3929a1739c4911c43dd680090001b0d97b7cb7a2f99e0fcbcb6de7b358e38c924fd3cdc6f55d0f27e3e392714d5b965776feddd0ecf9da8b869da2b4e4776d2970f65b8c51b5f5d68aa21b5548e3f79bfb4dcf478cb4fa1d86650411905707f4e5878a1c19b7d938c7a6ee0fb2c82abbaa4aaa79d9de39e013c92460e4b1c1ae05ae1823390ba7dd8ff00b65e9bed156092d95cd8edbabed2c1fa4ed7cdb3dbd3da202777467c5bd5a763b104fc975df1bcff001f9cc39f1d5be5ea74bd6f4fd763793a6cbbb1975ff6da345e239192b0491b816bb7057b5c0ea111101117c240dca0fa8bcf78cfbedfc57835100eb3307f30411514b3aba8d837a98fe873fe0bc3aeb44d19efb3f26953aa2711534dea946cd63ddf4017975e8632d83f1729eda2a88a8171bbdd1d4720b53295b558fd599f99d1e7d7183f82c3baeefdda4a9584da2db45514c465cfb53985cdfe593121fe50526168cf553594b471996aea62858372e91e1a3f35665f78cdc38b138c555a9a95f20db11f33da0fab9a0e1698eafd4fc4da89dedd4acbcc526f96d63658cffeb584b88bc67a6e19d4d34d77a48ee9592832436e7b9dcb237a73bc8e8dcfe383b11957bc7db373cab95b25b3cba0fa8f899ae751db27a8e183f4f5cd8d079d9475fcd54d1d3e191ad683f320f92d45e2571d6ab4d574d63d534f77a3d424ed4325310f7fbd9240f888e5f21d7d1695dcbb557152975943ac74fde7fa3d3c150da88e0b50eea2680465841279da46c5a720e4e42e83f0bb8afc38edc7c3aa93251c365d75a723e4efa4603253178c32518ddf4d23872b999f70f4c0e52a663b9bbe15b2e78cb7c560c3c45e25df24c5ab4a555346e2489ee333606efd0f2eeff1fbaae7d2755c47a1b9535ea4d6d151d552ccd958da3849c11838e671dc1e9d375ac9c42e35f177865acef1a0754e9cb753dd2cd52fa69e3c3f191d1c0f360b5cd21c0f8b482b277646a9e3771978bfa6c5ced2e8749c558dacb84fec9c91cb0c5ef98dae7fc7cc5a1a7973804e70ba65c16cbb9d7387bc7431ba6f75e580b8791c6e3f15e8b9adeae0a8d53739233cae3b9193baa6cf777e7fbd3f45876db532ea2e932c6064bc7e2bcfb4d3ff00c56ab264bb381239cf4c755292de5edfdbc2b7e2a6d904d553e3799b8f9a86e7dbde08777241eb90163a7df9c07f7a72a0bb50cc01239bea70a6711b647eeacf9cf714b9ff00cb6ffa288d92df10cc7dcb71f7400b16bf5254b7f68fe2bdb2fd56e382ff00cd4fe236c98eaca2271f111fefc54464a1dd1ad683e672b1bc7729e41ce24272aa74d73a92d0d6ce40030a2f1e8ded7c17b1adf7a5007a284eac637fb967d4ab7e9ea2473dae73dc49c0dcfe4aa4d739db86ede656766928f2544b27c4f38f20a1267037f04512504c8faa637ce4a1200c92b4907a0ec6e1a01fc56a9fda25a96e766e14d8a82d570a9a4a8b85e4379e195cc1c8c85ee3cdca412d071b79e3a751b4aea88dbfb5f45cfbfb45b5c43a935cd838754356fee6cb43254d69864c16d45416f2c781be444c0edbc244d22d53becdad326edc74acbd5657cd515167b4cd3ba4963738ca5c5916ce1b340e6271ea70ba90b4cbecd4e1c4564e1d5e788b2d03629b51558a6a57b4fbaea587a968c6d991cecf9f28f2df73561c9779128888a891111011110111101111017c24004938017d549d4759ecb6e7301f7a63c837f0f15326ee85bb77b91afab7484fead9eec43d3cfe65531f54d1f0a852ca5cee50763f8a865a4f4ea7fdff00a2ebc64934ad46f6dc6e70a236ae22771d3aa94e47729ebfefff00650dc08ff15692517442f8a5609220dc1db61d153ae30bdc76cf301b7aaa7d1d6c948fc824b4f50aaf24d1554224610480ab7705af708286e549516db9d2c5574b551ba1a8a79a30f8e46118735cd3b107c97313b4ef013507647d78de2f7092903b475d27746c8e58bbf65a67792e103f9b7ee891fab73893b72924f5ea1dde20c93bd66db65dfeaad3d5da7f4f6b6d3971d23aa68595d6abb40ea6aba77f47b0f979104020f8100f82ebe97a8e4e97927370dd6518f3f4fc5d571de1e69bc6fb8e1eddf546a4d4f5afabadad9e69269df50e634f2c6247125c5ac6fbadebd0003c3a2baf4f57f15f84373b0718b4fd2d759a7a5a86cb435fdd3d91cfca7de613b0918e1eeb9a72083babf755e919bb20f196e162d51a5a8f54da6585f2daa4ab6f2b2aa99f9e47e7070f6e395e078838ea0ac57ab3899aaf56dba1b055dc64366a599f2d2d0071ee602e27e11e99c6fe0beb39387a0ebba2fea7a9cee5cd7d4fd5785867d6f4dd5ce9fa7e298f0cd6ef8ff5afb8edef65ced19a77b4170d28b5c59df1c354d3ecb79b68765f4358d0399b8ebca721cd778b48f107194f5271134468fa7f69d4daaadb6e61e9ed150d6177c813927d02e1af63ded1971eccfc5ca5bc5c5d39d2b7a2da3be53b771dc92792703c5d1b8e7ccb7980ea16f9f6cfe0847a9ed74fc78d07ad350505bdd4b1beed4fa728195b2d744fe5eeaa6203de070ec3b1904729c0c127e173e0bc7976e7355f478e5329b8d82bff006cae155a66753da68efd7c7b4e39a9284c711fff0024e6369fa6563ad4bdbf6d56863dff00a02d16e6b4120dcafb144efab5ad77e4568053683fd2dbb3857c53d46e2dcf7ba96fa2d701f5e4672bb1f42be49a22a2d1455975658b849a4a8ada5a2ae774335eeaa979b3cbde1773004e0fc40289c722cdafbc7da5ce74a69ed37ad16e98fc31454970b8bba7942f8c12a97ff6dce3bea01ed764b60f673d258743554309f5ef2aaac37f35ad365a8aebbc4efd0faa389daa6139db4cd9a1b1db8efd0cc5b8c7c882a0df2c10dbdadacbde9fd19a7631f14dabb524f77a971f58f9b973e814ea7e86c0cfdb478e94f512fe96e27e85b1363e5e48abedf4924af27f721a97381f4f553965ed93da7eb271359ea744ea1a2711fae9749d751c2067af7c676b4fd399603d35475551135fa7cea1b9c6e03964d3ba769ac5427c36a895a5cf1ead76543bbd4da29ee71db2bea2c6cb83ced47355d56a4b9b8ffe4348637a7c94c906dadbbb76f13a8a47457de12586fbdc006a069bbd974acf03fab901dfd32af8d35f685f67fb955b2dbac6aaf9a26bc9c3a3be5b9ec8da76dbbd67335697bebaf16ab7364afa7acb7d1c63dd96ff005f15aa9c7f0d2d380ff0e8edd43b55f20d5717b3525bdda9e28dc5bfd9e88525b223eb34997c87afed7f2a9d4fa1d51d2baf345ebaa06dcf466adb45f295c0112d056473800f9f29247d55743dc0e739f9ae408d21a260bb96e99ad9a835535dcfcba46691a69ff8dc1c0000f89e5f2c159934571d3b52f0baae8ad6cd6b69d714d2b49659b5039acad7b1a32e11cecc389001eb90a2c1d1ae72bdc72381f3580bb3e76b6d2dc73be5c743d6699ba695d5d6987bfa8b5d7e1ed92304073e291bb38024641008c8d967a6bcb0e5a9a130e829eb23115553c7346f1bb2468734fd0ac3fc62ec81c09e32d34aed4ba322a5b83a32c8ee56c7fb35545e39691963b7f07b5c3d1663a6dc354bdc6b8c2feeda1c40009c2a4f63915da27ecdee2770d23a9d4bc3899dadac108323e28a20cb8411f9ba21fde01e259bfeee32a4bb13f0a38ada3f88168e2bd2cccb2dae17ba1aba6ab0e325c28dc796688c431869192d73ba10d70ce175e6687bd8b9dae6e7ab4e55ab51a37445456495770b0520a873b2f9180b399de3cdca464fcd69a91158438cfc02e1d710f52dbf88577d1f05e2f56a8a3a032163dfed103bdfa695d1b4e247005cccb81f01e01657e12f0ce4d231497cb9d3b69eaa689b4d4b4a1a1a29a01b9d86c1ce38d8740d1e655724b8d159f535a85034454f3d249445ac181867bcc1f4f782ab565ea7c6238b1bfc4edd479be1295bd4dc9317077b876fa8f0540aaade5c92703c828d5f572ca4f7af380770adfaeab01c480738c80b6c65914a9b96bce36dbd548cb5adc9c92e215327ab91d92075f32a424ae7e7e107eb95792d36adfe906e3a05e1d5bcc3c3aaa11ac97c9a17d156fc74dfd14f6d46d56351939dd4782a08206723a2a1fb63cf800a6a9aa4c87d53b4dae4a694b5ed76762ab346f04e33b10ad6a2932f03ef2afd0cb8006771e4a2e1e0daeaa22d67249cbb61544d460eee030a85056470534935448d6c7134bdc49e800c95a71c33ed19afb8ebc697c16ea296d96db55c61642c844ec1ec4e7c87fb4b243cbde7771b5c0b40043c8df6c73d92e5aabcdd9b6ddeb8e2769be1fc14525e9f2192e337714d1c4ccb9eec13f2036ea7c7653edd5d6a96d5457996b3baa5b877629c904173a4f85be79ff42b1af13f4bd5f1064b7db9d4d2d25353570a996aa51eef2b01c7267a939fcbd554ef36910d7586024436cb4c2d7c3193e40729f5240ebe59f356e3c6e7f48bad2fcb854ba9a1755c73163a11ce473121e078107fc7cd1f7388341e7241dfe4b176b8e2be95d2d40eacd4ba8282d544d23be9eb2a1b1340ebca398fbce3e437eab5c3885f686682b719adda02867bf5696911d44c1d0d235de64e39dc0790033e7e2b4b8e38fb53cb613b45f19697857a245dea2a1f13eadfc94f1c4ec4b52f1bf237c87de778007cf079e7a5ed3acbb40f171cd024a9bfea8b935c242c2d6c3ce37dce7dc634127c434ecad8d53c48d7dc66d491dfb585d67afab958e8a08199eea9e2192238e31f003e20649f12485d2dec47d979dc22d3cdd75ac68447a9eeb035b0533998fd1f4e5a011bee247e0170f0000db759679cc6785e46c5682d196be1f68cb3e8ab303ec968a48e958e2d00c85a3779036cb8e49f9ab897c270beae3ddb76b08888088880888808888088880acdd635a5f58da76bbdd859ff00a8ee7f2c2bc9637bfd477f73a8767ff11c3e8365af0cfe5b126c1cfb788f20b5f38b5da06f32d7cfa4b85b3c14f1d34cea7afbebda24024190e8e99a767381c82f3903a007a8cafc51aeb952691a8b759267c571bab85243230e1d131c70f901f021b920f9e16a3f684bfc9d9cb455826d21a7edf595170ab7d10a8ac84be2a60c88bc358c071ccec1c13e0d72de4eef7e95be17d582e3a9da59555bac750d6549c12e92e120e63fc2086fd30b62b87316a0bd5bff00b654bea30d0419fe2ff987fd573634a76f3e2e69face7b85a74ddda99c473d3d55b5a011e408dc6de2b7b7b2cf6c8e19f1a9ff00d1a6da4e99d4ac88caea171e78650d1ef3a270ea0796011e58195395c64fe289bdf965cada0a8a190b278dcc70f02179a5aa75392093c87a8f2578dc99154c623a81cc0fbcd70ea3d41fa2b42ba91d4b263ab4f4701b10a31cb73553516be3ef21c8c6dbfcd59b710ca499cd1d0ee0792bb28a6d8d2bcf87b9ebe8ad2d551ba1aec8cf2bda0b72b4c3c5d21afddb038234bc6fe1754fb0536352e9e6bebed12346f2903f594e7f75ed071e4e0d3e79e7570774b70e2fb5b728788baae4b032929cbe9cf73cc1f3007dc23a93918e5183ea175cdf54c8ddb9faae6776cde1145c36e2b4b7fb0d3986c5ab03eba163461b4f539c54443d093ce0793f1e0bd6f8cf919f1bcff972c7ba6bd383e43a2cbafe0bc186770b7ee2c0e32711b4a6b2d3963b269bd0947669accc747515d14997566480096868c631e25c77ebb6fbdff66476898f5e687ade016b498545c34fc45f6d33bb98555b5f8698b07a98dc483e6c7b3ee9cf32aa5ad2c2cc125c0fd15c1c15e2ade3829c4fb0f122cec9247da2a9aea8a763b94d4d33b69a2cfef3091f3c15c9f2df2597ca75579ecd2ff1bf1fc7f19c13838f7af7e6efdb7878cfd9db4fe93d697ab65dee5ac75649138d7525ae6bc9631d4b238f206b7dc690305bb927dd3958f2c568d79a769e6770f7859a474051d4b436a2b2ed586699ec1d399ac1bfc8b885b99da8ecf72e2cf06acfc42e166afa7b54d1886abf49ba3e664b6d99b92707a105cc70f2f7b2775a92cb6d270ef4f4ade24eb2bdeb9a4a96973a0abb6b2aa9dde3ee8e47607965e70bcfd3bd25acf88dc3bba8b6d87526b8b95d6ecd2229a9749f7e193bbc418da5e703f8b3b7d146add0d2d9e3a7baf0f74c693b4412379e5bb5fd933eb201f78b246e41fe71eaa91a3b5f6a6aaae7dbb859d9f9b416599b8757c92476e2413f17316383da0741827d179d7fa2f4442ff6fe307116f15d072893f44fb737bb0eea40646c6f38f23ca0a0f97efd0bc91cda8f56ea5e23554b8028ac8f6c746493b34b217120787bcf3f25f68e835dd0dba49a3a7d35c25d3a4664918c64f5cf1fbc7dd05df339dfc55234eeb2b856c66c1d9d785b496ba190379eeb3c2c673e403973b38240fbee7118e8be6a2d23a2f4b3e3d43c7fe22cf7cb901cecb6c52b8c6df1c3183de3f3c342094a6b868baeba3e2d0da36efc49beb7dd7dceef2934d113e2723940f4e51f3550d4425b55332a38dfc4f8ad94e1b98f4e58008f2d1fb3eeee0786307f894852eb0e2671028596ce16d828387fa3db90dba5672c1967de681d49c7ec071cf5778a8b456ae0c70c257dcd9156f11f5793cfed158c2e677dd79835c4f8f89c9f54f3f42b3a5abf596a7a4345c2bd1f1e83d2c1a5f35eae8c025959e2f630ee4f8e4923d428f45adb4bd82eedd2fc39aa96fb7996563eef7f9dfdfbbbb63b2e6739dbde239435beeb41cf82b3350bf5ef14a774bc47d6547a76cb90e168a29f99ce6f93f94e09f99247a2cb3c16e11ea5d7349169ae0868c7456f90f7755a8ee119869626f473f9fac8ef46e493e4370f3f632bf661bed3eb4ed09687dbed4d7dc6c943532d7dc0370e8e94c6e6774e23a8748f6601f227c16fbac63c07e0068ee0269d9adb610fadbb5c9cd96eb76a803bfac90741fb91b7279583619277249391a5ad6464868c91e636446f4aad3e1b1924e0b5bd151ea6411d53a5970e7bf760f218eaa1c55ae64ae91cf3ef370727aaa7d555b6699d3b88381eeef9c28989bda71f52f901707100f503f054ca821f21e5e6760f41baf06b0bfdc070324ec773d5439ab391a0737281e00ad2628dadfd5534f4d74d3ae8b95ae3710d23a9c161055c55350cdf249f9ab22f9728ab356da69f9c165bd92564b83d091cacfcf27e8a95a8389f416ebb535923a7a8a89ea880e2c18646dfbc49ebf21e4b49c7e95daefafac6b41c380ebe8adaaeac602493f219548abd4fce4feb3af800a93537913bb2d936f32eff004e8b6d695dab32d53df9df03d54a4955033774a09f439548f680f397383cf4c9dcab1f892fb9c33da2a69647c4c8e433465871facc91ff004fa955caf6c4cf2c926b980e3981dfc075ff007fefcd7df6d18da271dbc480152609e4921648e3cae7b0170fa74519b3b81c82011b8f9ffbff0000a7df942a4d9e47b800c6019df2ef0fc14dd3779cd82ffa80a9504ed05b93e23032a7e1a966439aedc8cecada46d5fa7747137bc91d96b325c4f8296d15afa3d4b73b8d1456e7430d191ddc85d92f192324636e9d3d541a1bbd23aa1b4f2c46a0bc16f76dddce246361e3b9caab692e166a88db31b3591d4adaa90c924f58fee9be9b60bb1f20b3cac9fdd7c2d3cabb71ad82a2df3d1c9318db3c6e8c9db20118c8cf96563fb71e17707ed5552da696d361a49257d555ce7bb85af91c72f7bddb0c9c0fc00f0597eddc113248e97526a39aa18e6e3b9a46774013d4f39249fc96a471ff00ecaebf7132e93df74a7684bd4d339c5f0d06a663aa6088fdd63e323907f213f35cf973f1cbbc66d692a8bc4cfb423847a4c4b4d62ada9d4b5ac04363a01faae6f595db01f2cad53d79f68171b356d54edb032834fd1bfdd8a389a67998df591d804e3c9a15e574fb23fb57514ce6505c7445ca3ce03e3bac91e479e1f1057868bfb2038e35d335dacb881a42c74e7e314bdfd6cc3e439636e7d79bf154cb9ee5f6b76c8d2ebc6a3d53ad2ea6edad2fd5b73ac79e612d54a641f41d0020fecf97457ff087839c45e2ddf29ec7a1b4bd65de77380924863c323071ef4b27468fe22ba5bc2efb2b3811a2a486af585def5abe68f07b9a978a7a607aecc67bd8cf9b8adb7d21a1f47f0fecb1e9ed13a66db63b6c3bb69a8299b0b33e64347bc7cc9c92b3fc9a34d69eca3d85b4f7054d2eb3d7cfa5bdeac68e78636c61d4d6f273f093fde4836f7f0d03c06d95b6a88b2b95cbcd35a11114244444044440444404444044441f0f458c6acff6b99d8cbb9dc7f32b271e8b18556d5f337ce438fc4adb87dd42d1d52df6abb0f114b1089be85db93f90584bb4d70fbfac3e0c6a0b3c70096b6823175a21e22780176dea586467c9e5587a93b5c55e96ed4b7cd15a92b69ce8a1511db83bba603473f2b7331900e62de6761c1c4803718c6fb3d253452fbfcac7b64193bf335cd23f02082ba71fedd22b8b6f6e1ad2dc9cefd3ebf8accfd8e9b5bff68ed1029667b1eeab9cbf07731fb2ca5edf9119540e3f70e5fc2de2dea3d20c61142ca93576f76f834930ef2300fee7318cfac655fdd85ade2bbb4969d948da929ae139f4c524ad1f9b82a49e50eadd9ef6031b6dae94888ff7529c9ee8ff00fe7cc2a56acd556bd2f0be3bdcfc8411cac67bce3ea0796143239402e68dc6c562eed016faaacd2acd49461c6a2d2de4a8c67f594d9ea7d5a7c7c8fa2d3b26fc27e995a39a3a9863aaa595b231ed1247234e439a77042a5eaa89b5348cac60c161c3867a02b167668e2753eaab455e90abaa0eaeb4012d3876c64a671c1c0fdc7100fa3dab3056c425866a770da56923e6a7d5d23e98c2a652d713cd9586fb5270f22e257096e50c54cd9ae36206ed4200f79ee89a4c910f57c7ccd1fbdcab315e58e82672a1cb346e6ba29087070c381e841eaa32bb96264f0e5032df69bbda056d131d1b984b1c33bb4e7c73d7a8565dc2925a4a99237b4001d818e9e8b337133843af749f182f9a3b46e9abad7d15556fb5d2474948e95b24127bcdf780c00dc969dc6eddd661d09d803881c498e9e4d4578a1d35ccd0e99920f6899adcf40d61e5cfcdcb964cb6bed9bfecf7d796ce32f67ad49c07d57526592d30cd6c7b1cef7dd6eab63c46f6ff00038bdbe98679ac0efbe706fb3e57dc74ae97b4d6dc6fb41512d0d53237be6904d1bcb1ed73df868f79b8f7405b8dd9fbb19686eccf7d7eaab1ea0bc5deed71a0750cd354c82387bb2f63c8113463398dbf1138f05ad1da4b4f6b5a5e3eeb2b270fa9ec967a8b854515f22bb4b4adefb9a567348c712d773b5cf6bc9cadbb6a9bd2c58b517692e2455432e948adda52c8e279a5b8b39f99bead7b5ce77f2b47cc299bb69de0e70e616de389d5b6fbddef1cee643039a67763fe0879077fbc71e6aa941a37b40d54623d5baded3470bf1996d94a0bc8c74cb9a394fc97bd33d99ac95777150ea5ba6a5b8b8f310f0e9def713bfbad1e7f82b4e3bed3dd18f2e7c6fe26ebd60b3f0c74eb74eda71dd32a486c6f6c78f071c31831f777f254eb2f046da6a4dc353497bd557291dcd2ba941869cbbaef3cd891df3e46fa1f15bc9a33b216b0ad8a2755d05069ba3c7ff505af9b97f819923f9882b33695eccdc2dd30593ea0967bfd53370d9de59083e91b08e6f93891e8adac27f9479ae6c69becf9c47becd2db34d5b657c13d4be78e8db34b3f765d81cb88dae000000ebe0b3c70fbece4e255ec32a359ea5a5d3742705f0b073d4bbf95a4b71fc4f07d17402dcdb7da2985169eb252d0533061ad8a26c4c03d0342fb515407bd5b5b86f903ca14777d434c1bc3aec37d9e78712c571ba599faa2e5090e6cb7793bd883bcc4030c3fcc1cb3f413c74f03296d76f6c3046d0d63434471b1a3a003a018f25419b535b2972da66891de6d19fccaa6556aaac98f2c44463cfe23f9aaf6da6d784d50fc13555cd60f1118ff0032a9d5575b6b63eee8dce924ceee2ecf2ab424aa9ea0874d2b9e7c7272a6adf1b8b9c4ecdff15330a6d5d6caf700e2e3d3cd49d4383a4db1803aa8fde811e76cf4c2a6544927782081a5d248e0d681d492760b498cfb2d40b8de60b6c52544b9772b73868c93f20a87678f887acc366b5d826645cce20b888e300fc21cf76338ea4b73e432b3969fd1d6bb452305452435154f00cb2c8c0edfc9b9e802b85ad6b1a1ac686b46c001801619753278c6126fdb0ed8b80930865a9d49a81c6b6addcf38a46fba36c06873867006dd029baeecefa6aba515325e6e0266b3903f11e40f2d9ab2caf383e6b1fcfc9fb3b630b547664b4499ee75457349fbf1b5ca9951d9725eb4bac1a3d24a4ff472cf9cbeabd29fea393f676c6b94dd98753b4ff67d576e7f973c5237fc32bc4bd99f57d5c31c15ba8acf2c713cbd8c73647069f4f776dd6c8227f51c9fb3b635ea2ecdfab1bb3f53db31e913cff905187672d47cedcea6b772edcc7b97e47c967f453fd4727eced8c3343d9d296300dc353cf21db22280347af5255c36fe05e87a3e5354cadad2dff8b396b4fd1b859157c072ab79b3beea7b629168d29a6b4f92eb258a8a91ee1873e38807b87abba9fa955844596edf6911110111101111011110111101111011110111101111011110158553a52f15f5b3343453432bdc1d312090d2772d19dce3a2bf515a6571f43841da148febdf884c6348645a96e10b0139f7593b9837f9342daeec45da123bf5b61e0eeb2aff00fbc69233fa16a6677ff110b7ad3927f69a325be6d047800758fb4bdb5f6fed09c47a5702dc6a5ae937ff00ee485e3ffe963fb45c2e164b9535dad953252d5d1c8d9a09a23cae63da7208fc3f25d785d456fb6e3fda1fc3a3ecda6f8974906d148eb3d6bc0e81c0c9013f56c833e65a3c5587f67d5b3bde3a4d585bb52d92a9c0ff0013a36ff99593f55f68dd03c63ecada8ed7ac2e54545ab5b6f6c26dee3875456b1ed7433c0d3b905cd6b8e3e1f7874dccd7666b5e8cd1dc67d2f2d9a9d9451eb8e1d52d6411f785cd7d6c6e3ed21b9cee443cc479877c95a5f256e1cc795b807a6cb4df8bbdb362b3f1463d2563a3a4b8e90a279a2be38c7cefac0ef765eecf8060ce31f1107c30afaed99c7cfeacf4c374469bae116a4bf43cce7c6ef7e8e8c92d327987bc8735a7aece23700ae7348e7c8ef1cffd12e5b47d366ac9ac9bc0ded05475b156092cded4cfd6b5d96cd6ea80087fa8e47077f2ae89ce03e2e7639ae03de6b81c823cc15ca5bd07eb0e1269dd54c3cd59a7277e9faffbddd91de52b8f8eedef1a3ff2cae84f662d652eb8e07698afad9fbdaca0a516ba97b8e4b9d07eadae3e65cc0c24f992972fe499e933aca979277c8c1ee9f7bf1ffaab1259791db8eb9594359528e4781be3242c51747776f0003b3bcf1e2992654d53cd1f3f3601c6c7fdfd55e5a46e0da7b8c47386bc721faac6f4f54e8dc013b655cf66adee658e4077638103e4544a6f6cd57198cf6d6387c51bb981f2544acd0da0757bc55ea9d2d435d52d6b5ada92ce499ad1e0246e1d8dfa67c57a75d29d942ea77cc0bddf0341c9f99f20a3dbaaa3634c9291dd34071f92bd9e154b37843c1fa3706c9a77da834e4452d5d44accff000b9e411f30ae8b6c54365a714ba7ac7456ba70301b1c4d8c7e00655bd53aae869891490171f31ee854aa8d4f5f5392c9044df0e51bfe2ab31d8bde7ac60cc95b5c481be01e50a9736aab6536d4b1091de606df895673e69667734af73cf99395f5b1976e765a4c3e8dfe95bacd555f3e5b0b844d3e2372a9aea8a8a9399257c84fde3950d908f01f52a6db1b23d9c718d87aab76c87943653c848e63819c75e8a3b29d8ddcfbc7d57b049e8c23e7b2f401ea48551f58dc9000db2a7e8ce07d72a404a1b90cc93d0e145a79a40ef840e6f171e8adda8ee55890d05cef0df2ab7c3fb10b9dce4bf553730523cb6007a3a4fbdf4cfe3f256bb04973ab8ecf432b5f5533dace507e0cef923c0637599ad16ca7b3dba0b6d283ddc0c0dc9eae3e2e3ea4eeb9f9f3ec9dbfb4cf29e4445c4b88888088880888808888088880888808888088880888808888088880888808888088880888808888088883997db43b23f13efbc6ebeebad056565e2db7f6c35924714cc64d04c1818f05ae232096f3023ccad5abe70578b7a6dce37be1b6a381acddd20b74b2463f9d80b7f35da9d754479e9ae0c69c60c2f3e5e2dff3569364f74bc6d918383f92eae3fed56b977c2cd0fc28e24e9a3a02f7749348ebf86a9eeb7dc2ac9f63af6bb1cb4f303f0381040230771d770b6378e5d976ef6ee1b693b8f0b2e1729b5170f60105246c9009ea627ca247ba370c61ec792e68e9cb9037c2b97b72e87b45d784efe22c104505f749d6d1cd0548680f961927644f85c7c40ef03c0f02cdba959874cea3a9d43c37b26a9ab85f495b5d6482ba6a776ef89cf8b9ba7cc1c1c6eafed0e65f1ab87fc5dd3370a2d4bc5e86a0d76a10f7b2a279db2bde620d05ae2d2794805981e4b1bb460ee3c16c2689e11f173b56535ef5555ebd8eaa5b2d40a5819779e42247b87316b03411100de5e8ddc91f3566eb4ecd3c67d0bde4976d115b3d3c5f154d08f6a8b1e7cccc903e6026b425b83f2bae347abf45b8831ddad06b62679d5523bbd8c8f5e4338fe65b47d8175cd34b1ea3e1f49559790cbb52349ea368e503f188fe2b54f822f96dfc5ed354f5313d82a2bdb43331cd20f24d989c08f93d567861ad27e07718e92f150d9796d1729a8eb5a36269c9747283e7eee4e3cc04fb5a3a65aaa9c4949cc0138f74ac25a8018aa1cd1b004f559daa6a28ef5646d7d04f1cf4b55036a20958799af6380735c0f88208fc5610d5eceea778e5e99faecad9a27e96f32a5a5e1a71ebbaaf5aaa300027e1ff000567898324ddd8255c1699cb9cddf21d91d7c56716644b44fcc7727cd5dd4bcc69cb0e473b0edf456469e7779234924e07e6af664ac8a0ef657b58c6372e738e0003a9256d8d56fb503b891d905c1a32a33226b3a0c9f55e63ab82b41aaa391934327bd1bd8ef75cd3b820f92f4d0f072f933e8d1857914440d68f8881e9e6a30f203f150e32c1f08c7f8951323cd5f4223483ef39c7e402f6e9c306dd724052e5ed19cb80c75542d3facad3a966ae8ad7de39943235865701cb2839c39be9b14d4fb172fb4bb1bfd50d4e73925de5954f7d535b9cb80faa9792e3134125fb0fa2b69176ab9ac700394617a75c852d2cb5058643134b83075271d1532d10ddf5154fb2586dd35649e2583dd67a971d82cbda2f860db3965cf505436aab36736067f7311c823afc44119cf4f4f159f272e3c7098da91e0be86afb35049a9b524645d2e4e3377647f72d701f9e001e807a959457cd82fabcccb3b9ddd6b3c7811115522222022220222202222022220222202222022220222202222022220222202222022220222202222022220a66a1a0fd2368a8a76b72fe5e767f10dc2c535b72a2b55bea6e573ab869a9296374b34d2bb958c6377739c7c8059a5736bed1ae206b0b0eaea6e14d0892874dd6d2c7759248f2d35cf2f70eecbbee30b7e1e849693d0637e2cb5fc515887b4d76999f8b9a9a3b0d90d445a2ed756d7c7013c8eb839a779a41e00fbdc8d3d01c9c389c7abfeb1e28f1738a171e2cf082c178fd11a460a110d3c2e6b7d9a9299a0b5af6077bfcce12b8b5bcdb38ed80b5ea4397656f3fd9d0c0ed31ad5c5a0835b4ad208d88eedeb792236a7f0738a9a33863c589a8e3ada58348f14a8e9b5050cad78e5b7563dd2324a797ee7eb5920dfa34c7eb8dc9859bf3b5db1dc60ae4e71cb4a1d01c62d57a59b198e9e92e4f9298740209809a3c7a72c807d0adb2ec77da45fa8e960e14eb4ac06e54b1916aac91fbd5443ff05c4f57b4743e20798dd8ddcd0d96b9f0f3415f2f145aa6efa32cb5577b74a26a6af928a33511bc74224c736dd4027195a3fc56e1459eb7899aa259c3f925bb54cbcadd80e691ceff0035d00e7698b0df25aafc41a38ea35bdf653d4d6c9be3c72a64dd47d2f7eccb59574ba0ebf4d55d497dbb4f068a67caf24c50b83896927f65a41c7903f4529acfb8ad79a8b7cd1d442f196c913839a411e614df0968c53e81d7933be075be407ffd321ff35c9de285eef36fb9c2282eb57034303b10d43998f9807042af25f162717442acb69a4e79e68e319d8bde1b8fc579feb3387ba759dedef5ad9a91b112e21d56c7380fe16924f8f82e58b6ef7395fde5557564ce713f14ae71f0f32aab07b6d5b5f113253c460cb9db64ee7607c091d72b1dd5eba13ac7b78f0af4253c91e93b75c755d7359906167b35333afc4f9007751e0ddd604aded8fc5de396a786c970ac86c960712efd176ecb5b261c31dec84f349f22437d16bede590c16d920a5a56173636e4b48c86efbbbebf5249f2556e04533aab5c50c007bcfcee07ef354cb6f84575d78772bbfa15642e76fec518e9e415cc266e3de2ad0b05c6dd67b4d8ec553591c75535246c8a227de716b013b78743d55624ab8e319748338f03f55e8492c6197b559d3c7e7e38509f5ac68f3541a8bcc716f918f371c2f16c8351ea8a914ba76cf595ef247f74cc31bea5c7007d484dcc66ed444fde64a9b859ee14d492723cd3bb25a7700edfe6acfd0d4eed336931d43436a6a9c0b8677007c23fe8b3469eecf3a86b9ad9b555ea3a08de3dea7a4fd6498f22e3b03f2caca9a5b85ba2749384f6cb4365aac60d4d49ef653f53b0fa00b9f3ea709ebcaf31b5822c1a175f6ab7b5d6fb3be9699e77a9abfd5300f300fbcefa0592f4ff002cd4c1b36a6b9cf72946098e32628ff001f88fe216590034602fab9b2ea73cbfc2fdb1236bb4db6cd46ca0b55143494f18c3638981a3e7b753eaa797938caf4b0ded61111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111016b7f6e2e007f5d9c2596bec949cfaa34a97dc2da583df9e2e53df537a8734070f1e6637cce764114cbdb763f3ee721c43816b81c1046083e4479adf8fb37a9dc7466b29f1b3ae54ec1b75fd4bbfd55addbe7b2755687d4359c68e1fda5ced337593bdbbd2d3c7916eaa7101d2e0748a471c9f06b89e808c5e7f6747343c34d512f2ecfbd307e1037fd575e194cd5ac6df68ae89141adf4c71029220d8eed6f7daaacb46ce9a9de5f1b8fa964ae6fca20b53adf70acb5d6c171a0a9969ea69a46cb0cb1b8b5d1bda721c08e8411d5749fb7168e1aa780975bac3097d4699a986f0dc0cb842d7724df411bdce3fc0b9a046091e49f7a2ba5fd97bb405371974a3edf78998cd4d668582bd9b37da19d054347a918701d091d010ad4d42f15d7bb8d70c9efeae570dbae5c5619ec4da7ee74370d53c497734541416e36b8c9d84f51339aee51e7cad664ff0013566cf66121c06e727f12b4c679da2af3b4b869eecedaf75138f26686af909db24441837f9bf0b90bc539bbdbeb236776f31b0168fda1ebea3fd1758fb5a5da1e177658874917b457ea1a8a6a173738392e35131f900c0d3fc41722b5b553eab51ca464f760101ede9ead23c3a7d72b3e422814fcc1f83165db9c75d956d91575436485cf7d3c3c8c04b464b8927201f0f5f2d953a89923a7c36307900c786fd7638f92aa081d290dae9b10be4e58e11d1df3c6e47a2cb15d337210bedb3c76d8e0381c85ec76d803a67c4efe67af55907b20e9aa8d47c50a30c8f31d335b197b861bcef70c0cfc838aaa7675ecf97eed33c43a7e1c69eac6db9aea496beb2a6585c590411e012e0ddfe27c6d1e65c174e3801f674e89e10d3b64beea69aeb53d4b28e1f67667c72e25ce77cf62a66531cb7922b1cd359eb86b6a8b9d748fa87452725346cf79c70395ad6b47801e5e2b2e698e12f11b55be3964b53acd46f2099eb8723f97d233ef7e202d8cd3ba17496938c334fd86928dc060c8d666477cde72e3f8ab815b3eaedfecf0af67dd632d37c02d0d64736aae70cd7aab6e087d63bf56d3e918f77fe6e65916928a928206d350d2c54f137e1644c0d68fa05308b9ae5965ed69241111424444404444044440444404444044440444404444044440444404444044440444404444044440444404444044440444404444044440444412971b7d0dde82a2d773a48aaa92ae27433c32b4399231c30e6907a820ad66a7b370ff00b315d67d1f35b20d3b61d497296b2db730e90d1be47e00a79a47e443280395a0bb95c06460e5a36915b3c40e1fe92e28e92afd11ad6d10dcad3716012c320e8e69cb1ed3d5ae6b80208e842be19f65da2cdb1aea0b55b352d92e5a7ee908a8a1bad1cb455319e8f8a5616387d5ae2b99ba73b24717ee5aaea34bdd6d325aa86db3186aaf75ace5a6ee9a71deb0eddee5a39835be7824755b41ab9fc47ec91713a7788157a86f7c357964566d576d6b65a9a0046d05542e387069d81c838031cd9e5158b34a38bac6cda438c369d4903b07d9fda3ba9da3f7e120381fa2edc64e49b8adb27849d1d0e9ad1da62dfc3ed1c1c2d16ccb9d33b1cf5531f8a5791b124ffbd95f3c29d1f25f6f4cbad545ff0077dbdfcee246d248376b07e44fa7cd4d69fe06490482ab565d99dd30f318e0e6dfcf2f7018fa67e8b1cf696ed77a2f851a4e7e1ff09ae34b5da92761a712d13c4905b1a73cf23a4070e97c1ad19c1c9711800e9758cd4aaeab027da05c68a3d65c4a1a3ad15827b6e8f8a4a799f19cb5d5ae3faec63af272b5bf30e0b41eae57d554cb55cc30f793ee9cb4e49e99dc7c95dfaaeef2d4192958f74b3cceccce27724eff0010dc3b38393d72acd91919218d6398f20171380493f25c9c97caf13147cd1c61f2c823249cfbbb03e1fe4aa567a77d4d5c2da5a77d64ee7362190e26424e0b5b8df7f003c54bda2d372bf5ca92cf66b4cf5d5d532362a682189d24b23cf40c63725df25d65ec1df67f9e183a878c5c66a5126aa3cb3daeccff007996cf16cb2f819f73803666db93d33de96654ec13d989dc00e193af3a9edcc87596a96b2a2e5968e7a58064c54d9f0c73173bf78fa05b4888b3b760888a01111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111048dd6d36cbe5baa2d179b75357d0d5c662a8a6a989b2452b08c16b9ae0411e85694719fecc9d2b7aa89b50f03752bb4a5c798cacb75539f251977932419922ff00d40792de545332b8fa469c49e2c705bb5bf0dbbdb3ebad39ae6e16e63b9193d256cf70a1940ceed735c401d36700771b6c71852b34ef11e4718e93416a166491936b98bbf0e5dbc3f31eabf43e4070c38020f815e3b883af731ffca169f97235a7e7af4e766ded03ad6a194da5f83bab2be479c32516e96360f9b9e0068ebd4e16cef07bec90e336ab7c571e2e6a4b6e8da07105f490b856d748dce483c8446cf997388f25d7a0d6b461ad007a05e952e76a583fb3f763ce07766fa713e85d30d9ef6f6724f7bb81efeb1fb6e1ae3b460f9300cf8e56704455dda0888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088883ffd9, 'hoverboard.jpg', 3);
INSERT INTO `umse_skuteretelektrik` (`ID_SkuteriElektrik`, `Emri_SkuteritElektrik`, `Shpejtsia_SkuteritElektrik`, `Pershkrimi_SkuteritElektrik`, `Foto_SkuteritElektrik`, `Emri_FotoSkuteritElektrik`, `ID_LlojiSkuteritElektrik`) VALUES
(10, 'BMW Concept CE-02', '10 - 90 kmh', 'BMW Concept CE 02 përmban përmasa të reja dhe forma moderne të mobilitetit në një mjedis urban. Me dimensionet kompakte dhe përmasat rinore, ky skuter gjithashtu është atraktiv dhe i përshtatshëm për grupmosha të reja. Dizajni dhe struktura ofron një dinamikë më sportive të vozitjes.', 0xffd8ffe000104a46494600010100000100010000ffe202284943435f50524f46494c450001010000021800000000043000006d6e74725247422058595a2000000000000000000000000061637370000000000000000000000000000000000000000000000000000000010000f6d6000100000000d32d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000964657363000000f0000000747258595a00000164000000146758595a00000178000000146258595a0000018c0000001472545243000001a00000002867545243000001a00000002862545243000001a00000002877747074000001c80000001463707274000001dc0000003c6d6c756300000000000000010000000c656e5553000000580000001c0073005200470042000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000058595a200000000000006fa2000038f50000039058595a2000000000000062990000b785000018da58595a2000000000000024a000000f840000b6cf706172610000000000040000000266660000f2a700000d59000013d000000a5b000000000000000058595a20000000000000f6d6000100000000d32d6d6c756300000000000000010000000c656e5553000000200000001c0047006f006f0067006c006500200049006e0063002e00200032003000310036ffdb004300030202020202030202020303030304060404040404080606050609080a0a090809090a0c0f0c0a0b0e0b09090d110d0e0f101011100a0c12131210130f101010ffdb00430103030304030408040408100b090b1010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010ffc000110801e801e803012200021101031101ffc4001e0001000105010101010000000000000000000804050607090302010affc40045100001030303020403050604040309000000010203040511060721123108134151226171091432819115234252a1c1337282b1162462a2d1e1f0181926347392c2d2f1ffc400190101000301010000000000000000000000000102030405ffc4002c110101000202020201030303050000000000010211032112310441220513513281a1066171142342b1c1ffda000c03010002110311003f00ea98000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000059357deebac167757dbedf2d64a8f6b7a238d5ead45ce5ca89ce38fea05ec1ab28b7a6057f955b4d1a393f85731bb3f99935bb72b4ed6b516591d0aaf7cfc49faa13a46e32d0623a9b74f47693b5cd79bbd73db470222c9232357632b84faf2a8639b77e27760f752575268add2b0d656b1eb1ba864aa6c1528e45c2a795261cbf9228f1b26f46e6f4da20fc45472239aa8a8bd95080be256fd4fb8bbecdb56ce7888b8d9353db2465156db21b8c90c4d9a3e11b131b86bd72e5eaefca7c8e7f91f238fe2e1e7c9751b7170e7cf978e13b4fb05ab4ad3de2934cda6935056255dd21a2863ada844c79b3a3111effcdd95fccba9b4bb9b65e80012000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002c3ad2c72de34ddce0b5db2d75575752ca9429708f3025474af96af54457237ab19c73820f5d293c6868595e9a8fc3b5bb5242c5cfdf7485e5188e4ffe84ae577e48d27f812eaecbdb941bff00e207505ff42b76f350d8359eda5c6a2b217cd597db3cbe42f42f52356467289d488b946af62226adda1d774f73a2bd5d2d51d5da6ae46a45a8ad32a4f45cae7adee6615abee8f4453fa0dbcd92cda8add3da2ff6aa4b8d0d4b5593535542d96391abe8e6b91514841bc9f6785fa935651dff00c2aeb6a9d0b15caa247dda825ab7fdc21f832d746c4cbb0aee15bf122678c21ace4966b252e1f71a03697c68efe787bdb39292bf42535eedaea947415d2d5beaa82247a3915d14b1c8ff002d88ad6fee9551397611bd8db5e08fc29d26bad7370f149b81a82d57d757dda7ba5ad96b957c95aa7c8e7bdf2355a8e6f4aaa74b17f32386f0f841f173b7970aaafba693a7b8db6a2397ef774d2e8e7c137c2bccd4f1b517954ce563eebdcd83f65d6f0ddf436ead66ccea09aa62b76a28de90c33a2b522ae8915515a9d93a9a8e6ae3d5133d8cb3b2dd4f4d25ea6bdbabe0008000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e42f8c4a7bcf872f1aedd6da5590434f73a8a4d454f14accc5e6397a65edcb515ec7e5539f894ebd1ce9fb5e342f9d68d09b914f0af553d45459ea2444f47a79b122afb65b2fea4513876d772a9f5ddb626d7db26b3de5206cd350ccbd48f8d5131340fed2c2b94c3d3df0a88bc19a91d7c2c5d2937a3c33687bdb6b5f477ab2d2251415f02a2cb4d3c1f07afe26b9ad6f53178722e17d153675c7756d7a374b5eef1b86f86d757a66864aeb846d7659342c455f3a055e5ed76384ee8bf0af3dd06780e7be91fb5727d4d76af921d8daca8b150754d354d25c7aa78a991c888f562b3a55794e3a9095bb2fe2a76437e68e29740eb5a392b9ed473ed954e486b235f5458ddcbb1eedca16d588dcadb6018eddb5ee98b3dc96cd3dc6392e0d6a3df4b1391d2b5abd9553d09c71cb3bac66cb94c7babe55d47dd2966aa58a497c98dd274469973b099c227aaa9a2766fc62685de3d692681a1d25aaacb7763647225c6851b0af47e24eb455c2f1d950bdef5f881d15a076b7526a266aea5b55c69edb3adbdf570bf1f7ae85489b8e9f89dd58f84d2bf67c55eecebbb356ee66e35b6deca0ab6ba2b755b6148aa6a1fd5f1b95ade3a3ba22fbe4e5e7cb9f8f930c70c772fbb6eb5fdb5dff0086dc53872c32b9e5dfd75eff00bfd265800e86400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001a4fc65ed6aeeef874d5fa5e9a9bcfb853d22dca81a89977de29ff78d44f5caa355bf99bb0fc544722b5c88a8bc2a281ca5fb3e7c5fe9bd99d3b7bdbdd7693a51cb5295944f672b14b846c8c56fb70d5e39efc70485dd3ddeda3f115a16eba2754d7524b0d4d14d25bae340f5496295133d2a8aa8aad77e154f5c7be1521a7da37e1dac5b1bba91ea0d09a92dd05b7574b2d7bece92a2545ba5ca2bd5189cf94e55556af185ca7a211d74eeb7bd582359ad29595af864472caf62a31aecf09c7bfcd7918e3afcb68b5976a9b5ddf69d685fa26e355151d3abe2a98dcde247aaff008a9e92b1c8984f6c2229adeb6beb2d17d75cecd533d04c8f6cd1c94ef58dd1b953396aa76fc94de9a976f77f350cd60d5bbaf6bacd35a72a9aea9a4748c8e357d3aab5647430653ad551cd5545f4543794b55b14ba0a9ac9b93b6f49a8f4f44c8a1b66a0b44694d5b045d48989ba396c889df396b953ba2aaa1a79cea553c7c7b615b05f6966fd6dec6cd37abea21d656c6c4e640fb8e7ef502a37e1fdeb797a71fc595f99877fed01b957fd7b53a9e9aef51fb62e750ea8748d555c39cee11a9edd911bf44303dc1d056dd15a96b5b60b6d5416d95fe65bd6a5fe63df4ce4cb17ab099e31d8983f674785f76acd4b1ef1eb2a272daac92f55be095bf0cf589f85cb9ee91a73fe654f636f2bf1e5f1f7596bf7ef7ea21fef6dc7c4858afb5b61dd96ea9b6dbee533ab3c9b935cd4a87b7e26c899f85c88aa9f85784527c7d91fbb34b79d0da9f6cae37689d5d415c973a58a49511ef8e54e993a1abcaa23d99554f579277c40786fb5f885bfe91a7d612d2c9a56c12cf555b44ac779f532b9a8d635af454e96f7cfbf6c7aa419f111e0c359f858d5b1ef1787ca3b8dc74fd2ccdac46b26ff009ab3ca8f4cb515bf149139309dbb651739396ef2bbae8935d475441ae760b772937a36ced1acdb4e9495f340d6dc6895df15354a27c6d545e5133ca653b1b1824000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000023af8a8f12979db3652ed96d058a5d4db9fa8598a0a0a78fcc6d044e5c7de67f46a22f64761171cf06d1deddd6b1ec9ed7dff0072afee4582cf4ae9238b3859e75e238d3e6e72a27eaa450fb37f4c6e36b6b96b7f14bb955ce967d7b3a41410c8dcaa4313ddf1b557f0b115558d44f46a914635b43f6695f35a6a593757c5aeafa8d417ab8bd2a67b5453b9cdcaff0004b2e72a89c7c2cc227ccdb9bebe11b6874d7877d5d63d13a3a8e8dfe7c57663dac4eb8dd1cad5544777c233ad3f3525896ad576a86fba62ed66a84cc75d45353b93e4e62a7f71a82097da3564a9aef0d9b590d9ea2086aa9eb29a163a59123458d689c8a9d4bc2728def8ec425d87d55a93456b8b2e9ad654132daab6e74f155d2d5b3aa3746f91a8f4e785456e73dd0ea8ebbda0a3df1d90d2169bb55b60fbbd347235922274f99e5f4e17e69c90ff0072bc31eacdb9b6c0f9295d514f43323a2a84cbd8e8f3c22afa2b57b2fb70352e3d7b37abe99b6ff785a96b773b4fe92d274923347d6451dc1b52ac74c96b8564464ac57a265224ea47222aae32be88b89e1a3b4a69fdb4d1145a6f4ed3362b7daa97a636b532afc2655cbeeae5e7f33f742363934d53b5cd47b5636a72dee8ac6aaa73e9955429e3b951b2f91e808e472cf4ed657742a2f147d4bd1cf6e1ede8c7b27cc795b374d49e99351b656d2c5e7ae6456a2bff00ccbdcfda9a6a7aca79292ae08e68666ab248e46a39af6af0a8a8bdd0f5048d1fa97636bf43ea96ee96c1c54f6cbc3d591de6c524aaca1bcd322fe1c67114cd4cab5e898f45ee6ef455544554c2aa76f63f4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003b185eb8dded07a028a6a9be5f69fce8915529a37a3a472fb63d3f3126d16ebbacd01cf1dd2fb44ef1556cbc596c3047a7ae0deb8e8648dfd4ae5ea4463fcd7261328aaaadc6785e7b1a1375fc6b6f1ee0e8e86cf0eacbb5a9d0caae9eb6db22a4150d6fc2bd4acc3d1b95ca678536fd9be3bdb931f9bc7967e1abff003f4903f6b26bb965b3e87d9fa3ae6c4dbd572d7d6a7988dc318e6c71f57a2265ee5caff292fb69af1b57a3f6f2d5a334c6afb14947a56d54d04e94f5b1bd216f968bd6ec2f1d5cbbe7938413565df556b7b6505cb534f73a8a89e28d6b2aa57499caf52aaabb2bc657837dc9a725db1a2adb7bb595ea0a2b94b156cf50fb5fde28df2a22227ef215f363e9c6394c630524dc754bdedd46d49e2bf6b2c75b0dbe8ae4cb84b24a91aaa4ec85a9f3457aa757e5fa975a9f115b65fb2a7a99ef0ea55e856c7f7889c91bdca9844f31a8ac4e7dd4e31d642afb9c52bea16a524918f74ab9557e7b3b9e7b73c9b6f45aeb2a1bf5bacd6abc5453daee13752b5ce55a7e85f8957a57289c2af0263bba4debb749f47eaab645b51609aaab991a7e144cf18573b0a9ee8545e2e74b5f659e35923a9a4958ad7b78722a2fba11caf5a82a3c8a3b559ead8b6eb6a23e68e3727184e1309f2cfea59d7702f76a96375149240d6e5dd2bf85c89e8a853fe9adfcb68bcbd693876eaaa19f4fc11c4f91559146e56b9530dea6e531843cf4b6a0b5ea7d53a82aadb0b1e9697c76a7d4a272e918ae748ccfb22b9bfa9aa34def3693d19b7d3d5dc2b163d432d146a94aaab996548d7a51ad4cf4a2222aaf1e9ee6c7d90d3b5ba776eede9768122b95c95f71ae4c61526957ab0bf344e96ffa4ac967556defd33d001600000000000000000000000000000000000000000000000000000000000000000000000000000000005935aeabb7687d2b72d577555fbb5b60599c89ddcbd9ad4f9aaaa27e643bbf78c7b8432ba4aebfcd698aa72f85ce8da8c46aaf09d9550e7e6f95c7c194c32bdd7bbfa57fa77e77eb1c59f3fc7c7f0c7ab6f537fc26f83985abbc7c6adb24eb1d1df66ba44abf0c94750d55c67d51513058a8bc7d6b7ba51d4d4a5e27a5929dbd490d5d6796f93dfa15385fa2aa29a63cb8e536f2be47c6cfe36770cbbb3f875681c86a8fb427725b3ba28aa6b55b9e1ff7c5c2a7ea7b52fda01ae2a9ce4b9dcae54fc7c0b1552bb3f5f89305e5c7f973eaff000eaeea4d57a6b475ae5bd6a9be515ae8a14cbe6aa99236fd133dd7e49c91fb5078edda989676692924ba32072b16aa5458a17393f9117e277d7088722776f7fb78b73f5056575d2f75d5349e73d292396afadb1c59c3708ae544e39e3d4c72d37fd44c89b4efaaf2d31f13a595309fd4df2fd9c30def77fc3838b93e5f2f3d99498e13fbdbff00c9fe7fe5d16dc8f1d3a96fee968ad1714a281d94c43f071f5ee479d5fbc567bb493a57dcaa67a8765af6accab872b7ff00d88d371d4da8e47ad3dae35639570b55239a8bcff2267e1faf72bad72d169c625754225eaeb265fd2e911618dcabddcb9cb94cbf7b53523b7f6bbdd67ceb4cb798dd74bbd4b282db9cacd50bcb93d9a9dd54afb6585efe98f495baaa96dd2353cf9e763556a30b94544722f4ff004303d3fa8ebb506a9a697584ec8e95aab9595c89144df66b53b7625f688d51b49a9e9a4b6de37034f5969618d5cc59ea5ad7c8e48fa5ad4fd0a61e52ed19f1e3975a447da4d09ab37537b68f4b688b7beaae1255c92315984489ad5f89ee5ec8d4eeaa76434c784cd1349a36828b58b9afba43031d5b554923e28dcf44f8970e55e3dffb1cc0f035be1a2bc33eeaea2d67b8568aeb8b2a2dd2d1d13adac64af595656aaaa22b9111ae46f7c9baf7c3ed1bd7fbad6daad2da074f45a4ecf5b12c134d35479d592c6ee1c88a888d622a2e1719f5e4da5cb38ace3c70cbcb7edaa374ad36ab36ea5fad7a75f1d5daa86ed2474932391cd92149151ab945e53a718c1b8f4f434b7065a74fc34eb0c90fef5cf6e151cd722351be8b8f83fa984685d92d65ae2df15d69e929608169609124a97ab1d237a53e344c2aaa65179c6326dbb568caeb1ea5a3a07450be7a7cd3be54cf4b646b9786aaa226792dc7ab5ae52d4addbbd8fd335da5a3a9ae6239f50d6b91cc5ce7098e7e5f231dbb787e5a8ac7d4c74ff798692a15cad6b5115cdef8c7a9b3f6f2cdaa68749c4efbf35af737adac7a673c7f42f54bab1d6db63e7bb514dd5139fd6f63729c2fbf627cb297a46ba414d7b6fb93f73a19eae855b4b4d50c6a31eef2dce46aa274a7af2b8e71e9f3527de835bebb4bd1bf50ca92553988e47613aba1513a7ab1c2afcc837ba3758ef3ad24b852a2c68e9d55ae73515139f754ee4f1d2f3fde74ddaea1551564a385dc7cd884734d58ae0ba000c5700000000000000000000000000000000000000000000000000000000000000000000000000000000682f1bd71d456bd85b95669ed3d5b7748aaa092b62a44cbd94cd55739ea9dd5a8a8dce0e466bcf1156abfc31d33b4b4ac589ad8f2af6aaaa22631dbdcef7491c72c6e8a5635ec7a2b5cd72651517ba2a1137767ece2d8ed7377abd51a5ec54365b9d63dd2cf03a0eba595eee5551a8a8b1f3cfc3c7c8e6e4f8bc7c9c939729bb1effc0ff52fea3fa6fc2cfe07c6cf5c79db6cd4fbd4bffa8e3cd46e8dadcf558f4fa631dd5c89fd8f3a4d7d0dd2b60b6d069cf32a2a646c5131ae4cbdeab844edeea4e7dd3f0291ededaeb6e376db8b73a8e162afed0a5fdec4dcf195fe26f38ee89f5356ec47873a1877a74fbe55a59196d992e8e46d32ab55225ca22af52a7e2e92d6e384d48f1bcb3e5cb76ad707853dfb7e3ab4150355dce3eff1f0bc7c8d7efd01ae1376e0d956e98864d533f4afddd93b1cc62399d7973d386a2370ab9ec7589ce82929e4acaa95ac86062c923debd28c6b532aaaabd938ee46df093a3135a6e7ebdf11b718d8f96ff739adb63573578a58ddd2b227f99ad6267e4bee5265a89cf1d5d468aa7f043bff0052f46a69db1a757f35c5309ff611ab59de61d11aa6e9a46e94114d5b66aa928ea169e547c4b246e545e97613a9328bc9db2d57778349e95bb5db2e5750d14b33de9dfe16aae13e79438757cd3ced4fac6a97eeb25556d64ef95d1c7d4f91ef7bd570889caaf72dc7773f2572c75e9e09afad6f7a225b15a8abd9550ad8754dba54ea5a3e9f54e10bc53eccdd98c4f37445e18aa9eb493267fed3ea6db296dd0f9f5560ada7893bba68e4627eaa85ff001fa526d6c4bddb3d614763d30853d76a5a2a567536dfd6ef44e1132a85ee5d14da5e97555ba4a762a2af54ee7b531efca165bbcba59ac82dba66864aeba4abd324d23b2c8fb655ad4ec89ee4cd42ed6dbadcf5431b4a957125be199aad89a8dc2aa77e5df9fd7b194e9ffbbc55164aba9474b4eeab63666b9797275a6557fa964a0a94b9c6eb4dce772f43b312a6172a99c2e4adaa8ea6d164896691a92c6eeb673dfe35c2ff00435c6dd6aab7f9753f74b7eb6fb68ea20b74aadaeaa96820892d946e4458598eee5ecce15309dfd4bb6d1eeae85dc4d397faca4a5ff9c92a6295d4d3afef20ea777454ee88abdd3f32015ceb68750d819b95787be8ae37b646d5a673bae47b91bd0ae4cf28d5e9ca1bebc396fc69ed0760a88aaf4151d7d3d34490d44cb3a3667f5bf0abd48de153ea5b0c7190b6fd27469fde0fd8b143a7ae51b3cc8da9d0f72a351c994edf445e4cfe1d65a5a4b34ab5155146a8c5f36372270aa8bdd0d05a46efb79b99637df6c52aba5b74a95290d4a6256c7d2bd4d72765ec9ca179b3df74ec5255cb69993aeb5112646a3d7afbf7ca613ba969e3922f5519375f5151546a9a9fb9cad913ef18e957ab78cf1f2c7d09ebb19707dcb6a74ed448aaae6d2244aaab9fc0aadeff0091176f3b19b7179a9748965ae8e695f947a56489877c91555113e5d8cd9de21ac1e19d74d6da6a4b3d65c6dd5d46daaa6b8533da8e891f22f531ec72f3d39ee8bdbd08e6ca5ca68c26a25403ca9aa21aba78aaa9de8f8a663646393d5aa99453d4cd20000000000000000000000000000000000000000000000000000000000000000000000000046cf135e3a7693c3b452595d5f1dff55aa2a36d5452b5de42ff0034eece19fe5cf528124cfcca2f6538f7aafed1cdd3d7d53342cd5157618674548e2a063236c68bf34557e53dd54b7e9bf131baf6fabfbddbb5e5e2557fc4eabacbbcce455ff223ba7f54fc8cef245a63b76541cd6daafb45b5558eeb15ab706e94579a77b91be6a3da8efa7088a8bf3e7e84ebda3debd0dbd1647de34857b95f03d63a8a5993a6689c8bea9ead5f47270a5e5955d28fc47d05cee5b25ab69ed35494f336def95ce5e331b30e7a7e6d45229784ed17531e9993575fa9dd1ddaf92b9a9d7239fe5c0c5546e3a978ea545771c2f0488f199ac25d25e1f751b28dcdfbfdf522b251b5570ab254bd18b8f7c355cbf918ae8aa07e95d3b6db4311aafa1a18a9ba979c2a311aab9fc94c7964b635e2b62eda8edf66adb3d6698aca44a98abe0753d5b17b794f4c39aaa9ca65154b5682d2160d1768a2d39a62deca2b65aa354a785aaaef2f2beebcae55cbdcaa6a2b3be55ce5555555e557dff33d9b7aa0b3c4e756332b2aa22613d13b994efa6b6c9ed896fcdee3b26d85f2aa57a355d4b237a7b6530b9ffd7cc877f6726dac7aa373f50ee9dca9592d2d8d9f77a47bd329f789784727a70c6bb9ff00a8d87e3fb762a6976f2dfa474cc13b2b350cff00756bd88aae46653a91bc72e54c27e6661e0eab34ded278479b51d45644faab636bae17772b518e4aa6e53ca722e30a888d6a27aafd4d263a8c6e5e5974aad55e21b5edd3c5350ec96ddb6de96aa79628ae72cb4a92bd15a9d73aa3bf870df87ea5d7c696ef691dbad1b6db55de3b7d53eaae10d55550bdcd47c9042ef31115bece7b58d5f92b8861b71e21687672a7586f25ea992af575ff00ad96964bd98b2bd5d2cca8bcaa261ad4f7e48d9aab596e1efd6b275def1535b71aab9d4f4451b32f96a1cabc318df54f4f6442d8cfbaae596ba8c9b78f7e75d6fcea97dcaeb5aada56bbca8208d3a618199c2318d4fa76eea4a6da6f0db6cda5da0bceebeae81eda8a1b73ab9ae7b13cd59511162637a915132f56a617be792f9e1bbc1ee96da4b1b37777e6a2869a4a06254434752e4fbbd0719457e7fc497e9f44311f12fe2a2a371a27691d3948b6fd2b048d7c14af4c4d5ae6fe1927fe48d170ad6775e154d263e5ddf4cb2cfc3afb445afa2bb57ddea2bd948c86674ce74cc45c232472e5f84ec89955c217296282fb7ca2b155c8e9248a347488d5ce1a9caa7e88bfa9ed5925351d34b71aac7c2d57b9dd5cb97fbe554a4d9595b73d5d77ada96a3a57dba77317db96e7fa650b5cb7dc5b1c7c758b62dcab65b858ee33ccab8a6861589be8c6b5e8d46a7b261c5d76eae4e934d6a16b31d3051325efce7cf8d157fee2c144e74b475ad5f89ab4cfc2670994e738f5eddbe85af485f9d6da3bbc0ce1b574be42a27afef637ff00f816bfd0b4baa963b2da82a29df4b1c556e8dcf5e523761555511133ec9ca27d5510df7437cd53647bdd4cfabb7c8ecb551cdee99e17dbf5342785ca4b6dd7eeee9e047d6bef766a685cbe913aad924889f5f290ea5d450db5697a9f1c327185ea634d38b9fc66ac65c9c3e5772b91b3f8d2dfb83505d281751d14d0d1542b1b1555ba27b9aad7ab719c22ff000a7a99d694bd6b0f1390daaebb816685eca1aa4b5d1dc291ee86172aaa392372aaab5abec47af1116892c3e233732d90d3be2a7fdb13cec46b17a511ee6c9c7a7f1973d92f10345a7769ae5b1d5b14f25ceebaaa1afa6971d294f0471395cb9f5557a31113eaa5796cfea89c26a78bb6961a27dbac9416f91a8d753534512a22e70ad6a277f5ec57989ed45d66bd6dbe9cb9544ce9659adf0f5bdcb957391a88aaabefc196194bb9b5c00120000000000000000000000000000000000000000000000000000000000000000001103ed12f15b26c4edda686d175ed66b4d5913e285ec77c74148bf0be7f939796b7e795f416e86a9f1e7f68355697adadd95d89ba33f6b46ae82f57d85d9fba2f674302f6ebf473bd3b273ca7322b6aa9e4ab7dcf525d9167a87ac9249349d523dcabcb97395552cf7cbebe815e8c916a2bea155ee73955ca8abcab9557d73ee5059b4dd5de6a52a6b5ce91ce5e5ce5c94b512b35b5d3e98bf49f77b46a285954e5c46c99bd28e5f64554effa974a07d55aea25b5dce9d5b243c3a3911170bc617e69ea8a78dbf475b20a7596a299d37422b9118899554e7844f52bae5511ea0b2525e9282e10cd6ca96d0cb254b158e922545562aaff0016151c99f995bab1a4ebb62bab6aa9151cb04291235ebd3d31ae3eb9c7d4db1e153c4e6aeda5d6347510dda4fbbc72b515cf72bb11e70ad727ab17b2e7b1a9afd34f246e6b2955c8ccfc4d722ff428f6b3495f75cee359f48e98a6596b6ed54c81ad56aaa35aabf13dd8f46a6557e846a5c768b7b771b732ebb77bf9b7da2b57d55d268e2b65ca2bcb69593b5b179ac639aad9b28bd4d4572e318553e2d576b4defcf75bae94b33e2e7a1aecb9deebd8d476bdb4adb2e9cb36874b84896ab252b29fce7f2b22a2fc4e544eee55552e2dd3b6fb05e20a7b25c6be0b8c4d6d43166622453b72bd51a2fbe11571f34296f95dd5e753a6d46ba3573e247223d99456bb8542d7a8e149a81b2393fc37765e385554ff00c0c5af577afb7eb2a0991f2241551b5af6aff126708bfa2a27e466d590c95946f8a26ab9ef67c089ce57b91e3e37a4dbe534d4f75d2547ac7515a66968e9a59ec150b50c4a9622a65cc5f899945e51cd6918fc6aeb276cfea8bee95d355b1c361d751417ab95b9cd5455a863d7a9acf4e97bd1ae763d97dc9836ea7aab66af8fef31c91b2ba91cd6b1e8a89d51b9173fa3ce6bf8f9de4b6eb1dfb86d96d821a8a2d19d34ab2b513334a8bd52373ec8ee3f2349bb9694924c76d634fb65b9fb8d0566b7bdda6a20b65247e635268dcc6bd15c8d8d8c4f6572b5a8744f65bc3be81f0a1b733eedee141fb52ff0d331d34a9122ac4f7aa236969dabc372e72373ebfd08d943e39347ea5a4d2da61db655145434378a3aeb9bdb58c73aa5b0bba98c4ca226164e955eae30d24cdfbc6bed26bbb5ae9dd5bb477ab9db3cd6bfcb4969a462b9ab96bb0927a2f28698e19e53d32cb970c7ab748d5be9be5b8dbc9724aa92dd54db552c8a943414cc73e9a970bf89ca898966f772f0df44f53473992acef754753a5cfc7e6655517e793a3ba7bc606c6e8ed152e99d21a16ff658a969e6fb8d225bdae679aecaa655af5e15cbdd7273bb5d5f2375d6e3769e36c6fcba59dac4c22c8bcbf8ff00364b65865676a71e585cb58dddfe5af3702f29d71d9e07fc2dc3e6c7bfa27f72edb0d3aa6ada88ba55166b74edfc91b935b5755c95f552d5bd70e95dd4bea677b3b50fa3d56d96377c72d25431bf2558d70a47a8d25de4dad617a2beaa348a37abe96689a8e4cf2ad5e513dfd8c2ecefe9755313298ca617dcc8b6d6b2692655a96acfd2ea985c8ee3a939e7ba73c98ad13bcaafad8f1dbaf1f2ee5ecbe1b37de9b474bf890b8ece56527fc3b474f53728e6a6ad6baa1156389d1aaab515a8bf17755c650dcfa33ed1ddc6afba56d5eb9bb3248aa958d8a2851638a08f397231a8bc39c9c752e5532409d4b5cf92f9533752e58fe94fa222227fb1e54d7c958a8df2d8a8a9ebff00f44d488dedd91b478d0d95d4d6b96f959a6adf3dda38160a463d8c7c6c7b95188e765395ecaaab9c22606e7e9bf0e174d3f6eada0d3366bddf6a2548a1ae4a66a54c7239155f375b30a8d6f2a899c7644392163d4b3c12a4b4956f85ebf89117194f6536a58b726f6ca78e6a3b95432587e2747d6bdd3b2a725b1f1bd52dbae9d94d8ede9db2a3d356dd14fbdb6dd2d22a534095b2b53ad55df0b7ab84caaae1326f76b9ae4473551515328a9ea708ed5bbd72755c579b955b58f8d7a594ad4ea45763195fe672f3f24fea741bc20f8b24bd4d41a0b59d5a363ad448edf349267c993d22555f45f4f634e6e1c709bc1971f2dcaeb24d7001cedc00000000000000000000000000000000000000000000000000000000000000016ed477fb5e94b05c7535f2a9b4d6fb552cb59532bbb3238daae72fe887003c48ef6dd779f73751ee9df1ef46d6543994303973f77a66fc3144dff4e338f5cafa9d42fb51f7724d0fb1d4ba02db56b157eb7acfbac9d2b87251c587cbf92af437fd4719efa8b70b8d3d9e35c451224b27f6cffebd4a65ddd156fb2dba4ad9a4ba5c1b9593e2e7d8cd28acf79aca76cb0d653daa91ff00e1c93fe37e3d5ade38fa9454715251c12d754b1169685a8e747dbcd7afe167f7fa16ca34a9d55745a8bc572a672ac89ab8e967a2227a220d586b4cfac34577b4dc7f66df6fd12c556d55a4a9e8fddabf19e972ff000e53ea5eeaee5355695bc5b6a5aa92d3ac6f727cdb2b7b2fd0c46787ff0082aae38526f2e8aaf10f9afea726153945f44e7b15315c2492df56ea855eb9a8a149339e5dd4d6e4cbc2cbbb5a6d63ba25546b236389268d7bf4afc4dfcbd50995f6506d151ea4d65ab374ae54ad7b6d10b6d942ae4e593cbcc8a9f34674a7fa9486f515e8d9e4a772e3e157a757194caf0747becd0aca4b3ec4575441849ae17ea9f315179ea46b1a99fa260be53f1d298fb497aaf26a2ef52e8e34f229dfd11a7baa7ae0a6bad24151252caf818e92199ae8dee6e7a15728b8fcb8fcca7b4dce8eaaa6ba8a3a96baa29a755958deedca653bfe445cdd4f135bf7a4b56d6d05b36bedc96ea49dde47de2a15649634fe25c2a22e513d0cb19b6f96a44aad696ca37545a63918c59a0a38f289df9c63fd8d4fe247c44d0f87fd2d415b44c86aafd707f450d2bd7288d4c75c8e4ef84ff7239537da1b3b7524b5bb83a2e7899d48d7fdc666bdb1f4a2a61115578fcc8ebbebbaafdf3d795babe3bfd22c0e448a8a8a695627414e9d99f1a222b97bae17ba9af8db7b61bd4e928f5378c8d6153b3d51ba1a92dd496fabaa496d9a7218dbf14b2c98f327ff00233a538f74f99ce6d5b529515d2cce9a49e7ac77de2795fcb9ef72aaa9b8e81dafa5d2946d96ed6eb9d3c50bd9496fea4a8929a26aaaaaab538673cf3ec6b1bc69c75555c51f9c8b274a23394e9545e7194f535c232b757fd969d371f4bfad13b19ad3d4398c4c395bfea31a7d05cac8e5a775374bfd7f893f542ef4b4b72a8f2a2865a77ba454454445ca14df6b4b325e9b719d8a8ad9e4444e787aa18e6b6bbb9f4aca46bd7ae5f8e45ce7289db3f9999c5b5db81352fdee0b6798d56f53719ec61f77d07aaa86774b79b4d435caa8aae562f4f1ede84fdafa9aea309a78d647a22aae3e7ea67db6dfb9d5342e46fe2eb67e4ac542d34ba715cec44de954e73ee64da46dceb7dfe87cd77c4f9d8c6ae3b752e3fb9a59a9b652f6caf403e56de258191e5d157c88d4f5e51a592ae2929354dd291edc39933d8a9f3ca9905aa93f656a2ab48ea1565755abd5cc6aa61dec9fd392cf77473f53555548e73a495eae7b9cecab97955e4b6ffeda7ff36a9bc2a3ee550d5eef9578fccf08a18fab088993daeb4f33afd2c1d0a8e74abd29f55e0f8a8a596972ae556aa7a2998f4644e62a74b9cde3289f3321d3d779125472c9f1c6a99cff001218ed2d5a39c8c93f0af29ee856c7ff002d56c91ce4e977c2b84f45098d96fae5a67b27a56f5be54f819ee8a9ebec9c99dedb6b4934d563eaab6a66925e1fd51bba5cd7272d466178545edf335c595cb3d0f9aabd6f8bf7784efeaa89f42a6db3c90dda0aaa84e9489c9d11a2f08bfccbeea6be76e3a45c26f6ee77856ddab86e9ed8504ba95d126a1b6c51c370463b3e665bf049f9a70bf3453731cdbf015bb8949b894fa7e7a96a53dca26513d33c798e6f547f9e5113fd47490c65dae00090000000000000000000000000000000000000000000000000000000000001c7ff00b517701faa7c45b74bc33669749dae1a3444765be6c89e6bd71e8bf1a27fa5084b6a859336e5777e3f7b3fdde3e33f0a71c7e86dff00147a9aa751efdee25faa64ea7c97fac897fcb1c8e627e88c43525a1d8d2f47e8af7be4763d54cb7f6b45f6a2cc951a7a9d2456223dceaa7f0b972af0dfe9fee7e59b465a6eab4f5376aaa9a786ba7928e3740e46a356385647bdee5ecd6a2b38f5ea5f63e6e935c644a2a0a6722455140c56aaa71d48deff00aa14b49a7f512c1069f66a39a0a5bcc98a981b9c391bcf527d1179fae05bfee695ba52e3f7cd14ca1959f0fdefca62b973e6373eff0022aae313a27d5cec44f2565643c72996a2bf1faa27f42cd74aba2b65ce974ed8d5569ad68b95f57c8bdd57e65df52493d928292d953d08f8d893cef6ae7324e8d7e1df36b7cb454f457388da3cbe98ddde6a79686545765cdf64c2b549abf658ebb8aa68756edfea08e48edd47594f7186bd115638a4953cbf2ddfcbd5d08a9f3206ea2a958ddd71bb0ae4c3d13d53d0927f67e6f63342eb4a8db5bbb28dfa7757cb8bc47352b5ce9628e3556a248aa8adc2e5531eabdc9cfbc2a31cbc7274f358d0e91b6dde7d530bd8c736358dd33de8c6aa70abfedf5c2aa11d779b5ec1a966a6d2345665929a677f8d2c0a88d4ecafcaa70bcf1ea5c37568f42d9af765bb681bade2b28a695734f5358b3431c89956b51172be89c397f3f78c965d6d73d6dac6eb69d417bb8d0cb2d4488e56e7ad646b9a8d667d113e2e131fa219e18c936d32cbcae951bd7b17a0749e86aabfdb344d2d44b04cb0d55653b9f2b15644556e13ab3d489caaa270a45bbbed7d6329e8ae3a7e4a867ed07aa53d348c7396454c2e1aa899c73ea9f99d44d4f5db7d6dd0b49b6da9a8246d556c70cae826a454f353adbd5322ff0017b7527b9063556a3a9b76e4ea3b9d8a0a9fbedb2aa5a6a383a157cb891fd2c46b5786261133fe6f7542fc77dda8b35d341dde4bc58a14b6ddf4fd45beb6057316746ac5d499f6c73f5c9698af5726bdb2255be47a2e7a9cb954c7ae7b937b5669c6eb5d41416fbd5e2db6357dae9aa648ea68df3b6591eb8923556a2f4f08bf34303d59e17ac75b4b5535975169ea7a86b9ae8a54a891898caf535d1ab79ca6318445ca16c793f96770697b2ebcb6dd2e546dd576d64b033a639a48e3cb9ec4e1178c2e7e8bfa999bb6f6d976dc2b4e9cd1da820aca2bb4ac7c1223dec7c2d5e1dd68f46b9aade7ba6153b2a995693b3e86f0f32ffc65514f47a96f946dcc2eac81ae81927a7971bf872a7f33b09edc978b57885a2dcdd4eb5db81b714d795f29636450c11744499e5d86a35cd54cf7455c17c71f2c99f26538e76e8b7845f06966dbfabb86e16a8aa75ce3bd40d8e86d13e65a5a68f8cbfa5f9caae13194e13ea48eaed93da2b935595bb6fa7656af0a9fb3e34cfe8873ab67bc68eaada6a7aaa164f52ba4e8e46416eb45d65755cd02f4fe047ff88d6b9d9e9cb9513e7c1d2ed13abed5ae74c5bb53da2a21921afa764cad8e447f96e5445562aa7aa2f1f91a67c578ef6cfe37cac3e44be3ee3516a4f041e14ef332ddae9b496981d06657be9a4969db84e57a918e4454e3b2a1c64dd8b8e9993777555eb4552369ac34b75a975b62c274a42c72a4784444446ae11538eca763bc77eeebb68fc376a3ba5bead22b95eda966a2722f28e99151ee4fa468ff00a707111cdeab64d24ee572c8c72bdcbcaa70659574e98345a9754555f56aa96aa696aa6995d86ff12e7fd8cca9af52dcab5edb83123ac8b895bdba953d50a6d0d6fa26453dc1f1a2ccaff2f3ec9df82cdaaeb26b7ea79a681f8e94639131f2e7fb8995bd235aed475af476ac8fd9676a7ea7a6a7891b339708982d72d746b7b65c1e998d92b645c7b64abbb5e92fee58a968ba5e9cf523b1c7aa6304e93f4b1e70ff009979855b556d7b9cbf145c7ccb23db2c4e5648ce97b73c2f72eb667ffcb55b1df123a1cfe64ab1b0f48d5a2c333e55463151abcf6eddc56d72c953ff002503d551d849246f4b5133e99e54fcd24e6c74aab244e932d63708bc0bafde166c318c81aee739ea72a67f441beb4b242f862bccba475d58eae1a97b5d35ca96a7cdcf79992265bf47333c7fd2a76f5172993827b4f5ca970a381ae5eba7969aa60722afe26cbff8a7e677aa25cc6c5f76a14c7ec7d800b8000000000000000000000000000000000000000000000000000000000000fe7777915f53b83acea15d9966bddc1ca9ce7999e615a6ff00e634ed1653389648ff00a27fe66d1df6b34f62de1d7169a98d1ae82ff5e985e38fbc3f1faa2a1adb4cd2c94ab72b2aa2aba9dedada745e15d1af0efd3261bd4ed32fd2fba6356daedf4eb64bcbe0a6aba3cc70c93b53966728ad55e338e30a51ea5dc4a0a1a75a0b04ccacac735cc6d43589885aaa99c3913e5e857d5691b6ea585afa9853ce44e1e8bc9f7a6f66df5d728e0a58bcc4476557288d6b71cab95784444caaaf64c09af69fcb4c736fecae74afd4172a596a69691ed9a7445fc6aaec3599f7739513f5f61a96f095b5b50b512a48f7b9ce917d1d239555ca9f2e71f921956babf5aecd47169dd352b5d474ce546d4357ff009b9bb3a6ff002272d667be5cef5e35357d62c73b97a95de6e32ef9a17ded9dbda92ba77492f90e77523786e7baa15961a9adb4574575a1a9753d442a9e53dabcb73945c7cfd305adaab34ed7e573d689c19a68eb553cd7ca6aaafa596a2929a46cb3b23445556e7b2678cae09f43a11e12fc396a7df1b240ed41aaee76974348daaa89e16b5ed6c8e76626ab5dc671caa276f91212ebe0aaaf6f69aebaff004f414fab35047124cb46da78e15ad733d7a64cb124c679454cf62c7e1dfc4ac7a776fe874c6d27873d71a82e933125aba97c4c82092654c22acdca74a22221b215be3d7723a97ccd19b676f9d55a8d56ad756c6cf45454556648f09f6b21651d5ea3dc6d5b7cde0dc8b854e94a358a3b450515e6a594b22639953ca554ece46a708bea7a545a76f61b8d56bfa1aaa3a9ada7a74a4aa75bab59d7568fc35ad73155515cab8e71e99cf04a9d3ff667eddd5dd2a3516eaebbd41abaeb5d32d45548af6d3b2595cb972ae32ee573ea6d89fc17787b8f4dad82c9a0686d92b5cc921af899d5531c8c5cb5dd6ecaaa67ba2f0a5f1927b45dfb402d39476bd61728e96bf40ea3b4c8c815167a99e1a98570be9e53bab9f927a763e755686d3d63ea929750cd1caeca361645248ae5fe5446b728bf25268d0f83bafa6d40caa7eaba7651c6a8e49a0815950aa9d91533d3fee6ceadf0eba06e7131b718a69a66a222cc9d2d7aae3be510defed4ea76c24e5bddf6e395e360b76b576a2abaab9691b83ec5736b2381b1f9725444e444e972c6d72aa65739eea99e50b85a765352ea0b9d0e99fbe7df6b63e958e2a7b6f975e8d8daa8adf3224ea7391a8aabd48eed953b33a2367f45e827ba7b451be6a85ca24d52ef31ed4f64f6213fda27b5da8767f5b68ef18bb5714b1c9a72e917edca289552272b970932b53b2489989ffe66afaa996566377834f0f29f9f6847ab7c1e6bf8ef6ca98e86fd6ea499ebe636a28eb247f7f8519985aaab8f99b3d3536f3783cd2b0d4d8ef377b157d7d23dd6f8f50d439895689c3a5f2dff0007c3c619df943af1b7bad2c3b99a1ac5af74f4ac9edb7da186ba9dc985c23da8bd2bf345ca2fcd148d1e36361b6bbc60db20dbca7dd1b6d9758e8ca87cf0b164639bd52b13304cdce53386af1ca7b291bbeed5a638e3fd31c82aadd8dcfdc2b04b4fac7595daeb46b5f2d743475554f7c114d267a9d1b1570cfc4a8889c221e7784652e9f995adfc68c677f555caff00b29936e86d4dc765f594bb6b7ba6863aeb6792d996197cc63dcad472b91d84ca2e73d8c575748896b85aabcad437b7d14cefe5634fadd7ee9fa26dbad4b56b23523957cc7678e9c77e7fa9aeb54dde1b9df26aba75ea626236afa2a27afe7c9b928e9590e8c6bdc8d54a8639bfa21adae3a461aa72c94ef8d1739e5b8ff6e14bdc7c2a92cca6e310931d68de95c74a7e982ffa2e961a9b9b124f85338faae4a3bbd927b64891b97adcadeace3fd8f5d35d504a950aaa88cf89553e8479227b57ee6d351c1aa674a28d8c8d5a8ec27a2fb18ed14ef8d9231b9457b51bcfd4be3f4f6aad53515f73a5b5d44ac818b34aaa98546237ab845e557a79c27a16db253acd5f1311b873151dca7b2f1fd49b77369f55b26caf751d135b4d0ac92b95785e1308898555fae4a1aef3aaaaf3593f99f1265adf85bf24f9fe65d5b22d0dbda8c8dcfe13ab944e79e3dcc7da9356d6f4543ba2355f8911739faa955acd36e6cb4b3dc77074cd151c38a496ba0b7c92638573e46f4a27bf3c67e677ed8986353d9110e22f833d230eb6df5d11a7a999f052dca3af931c74b69b12393fed4fd4ede138fba0002c80000000000000000000000000000000000000000000000000000000000007197ed1bdb5a9d23e242f95f1d374526a364578a756a7e3ea6f4c98f9a3d8efd48d74296e9a68a69ea1286a61ca4152ad5c617ba3bd30bea8a75efed10f0f371de0dac66b2d1f40b53aa747b64a88218db97d4d2af32c69eea9847227c9c9dd4e3b54dfed94d512d3dc6df345511e592f92e4445f7456afaf0619e377a5a566f6696c96bea75df535a646a2f531b4dd5248e5f646264f0d59b9f3c167a8b4d047fb3ad757c4ad5c2555627a31ca9f823f556a2f3c673d8d7d57af2829634fd8f6dc499c2493bb8f7ec9dff330bb95eaa2e13bea2b2774922e15ab9e3e981a56e7b545def32573e4a87bb0e5fc2d44e1b8ec858ea657542a26573e9cf63e2599555e88aaa8e5eafcfd50f7a3a691f2265b97395319fec85ef4cf5dabed36d92a67a6a782274b3492358c635155cf72ae11a889dd55550edd7808f069a7b6936ae9b51ee3e92a0abd5f7f736ba66d653b657d146a9fbb893a93e176395f9ae3d08f1f66d780eaca8b8506feeeed9e4869a9d527b05b6a99874cff004a891abd9a9fc28bdfb9d4e444444444c2276264fbabc8f3a7a6a6a489b0d2d3c70c6c4c35ac6a35113e4887a805d20000000018dee3e84b26e7683beedfea28524b7dfa865a2991533d3d6d5447a7cdab8727cd10c900101fecd9dc1bce83d43aebc1d6bf9dccbc68ab84f5369491553cca6ebc4ad667f85155b237fe99157d0f2db3f065b874fe22f586a7dc2a486bac570bd4b58b5524cad5a8a77b9ee63e354fe2f8911c9c2b7a7e68a5a7ed0ad1ba9362b79b4578ccdb67a51cd154476abfc8d87adb9c2b639246f1d48e8d5d1ae7f95bcf284d7d1165a0d57a62dbaa2ebaa2ab53b2ef49156473b9fe5d33992351cd5644cc35130beb95f7552b6797549d38f9e38768a9b68b7deb6cd457a92eb455f4f0dce9679aa3cd9918e57355b23b95572398e4f9a6148f5ad95ccb4b1f1b1309337945f92a7f7278fdabba12cfa6b703475facd67a5a18aeb6c9e299d04691a4b2c32370aec775e97a27e4430a391cfa38aaa0a786a5f4cad99b148c47b5ee6f76aa2f7cff00731cb2fdbca58d24f3c6c592c5a8ff00685960b54ab9746fc2277efc1556fd2b7fb8ac8fa5b748b1c0e46492c8891c6c55e1115efc227a7afa927f6f6934955bad37b82d36bfb9ccf8e457b2918f6b5b94eaca351178e728bff567f8b3b9b7cb42db77877a3fe1cd8cb169ff00234fe9cfbc544b2cad6534b23b08b231a8b85546b5115157be33d8d792f9ddd578f188b7a47c1cebad7702daeb562b7ea1739d251596ae374535746cc2ca91498e957235cd774f194722a2afa498f0f1e0b76dea740d2556b8dbfa8b55fd751cd61ae754d4753a932d77913c6b8fc6d95234efd2e4ca617248cdbdb46acaddbdd1175b1694a775ff004be958568d92391d1ad532a1b1cb0a4a9fcd1b5f854f64326dcdd6db69a7369ae4fdded716fa26be6a2827fd955292d452d744b1e7a5ad5eb57364c39dc651179226321506b7bb6d74ded36c9daad77782d753ac6d3553cadbbc32e27a9b54c892c2f913bbb3d1d395edd2a88a401b1d2a2d5cf5b322aa48e739dc2fd71f9ffe04d5f17be2b76cf77b4ac1a5b426dcc94355079742ebb55f4ba59e8e157794c8d1172cce7a9cabcfa10f524fba40ad456ae395e3d49bd2b7baf5b85ea06c6ac4a8cfbb5c98e7e8a51504b5534cd7c49d28f7359e62a7099544ca7ea5054d6493cc9d512a2faf28a886496ba45a9a2e8a589d24cb23191c6d4cab9dd4984fae702769dba25f654eda7df757dff5fd4d27ee2c14edb7d24ae4cf54b32239ea9f3c2222afcd4e9c9a4fc1f6d126ce6c6d86c3574cd8aeb5d1257dc571f179d2267a557d7a5309f91bb0b4f45bb0004a0000000000000000000000000000000000000000000000000000000000001f8a88a9854e14e78f8d7fb331bb8d72b8ee8ec37dda8af956ab3dc2c522a470d5c9ce5f0bbb46f5cf2d5f857d31ebd0f0459b1fcce6e7ed1ee86d05d1964dcad1576d3f52e5ea8d2ae9dcd6489cf2c7fe177e4a60cbd4f727745edc9fd366e6ed06da6f258d34e6e768db76a0b7b5e92b22aa8d5558f4ca7535c8a8e6af2bd950d15ffbb3fc1eb6eedbbc1b68f85d1c8d919032be5f29aa8a8a9c2aaafa7b91a478c712f6b360b76f776eb15b76ff0040de2f0e978f361a67242df9ba554e96fea7527c207d96162dbbaca1dc1df89a9af77a815b3d359634eaa4a57a72d59157fc5727b7e145f73a0368b159ac14715bec96ba6a1a685a8c8e28224635a89d91110af1e3fca63e228a38636c30c6d631888d6b5a984444f4443ec02c0000000000000000309de9daeb26f46d76a3db3d411b5d4b7da1929daf54cac32e331ca9f36bd1ae4fa118becd9dcdbec3a5f51f868dc173a2d53b635d2d2471cabf1be8fad5131ee8d7e5117d9cd269901fc5e5aaafc31f89ed0fe2fb4e41232c97c99960d5d0c4986bf2986c8ec7aba34ffee89a45ebb193fda9fb7726a6d88a1d6f494eb24da4ae4c966544caa534c9e5bd57e48ee85fc8e51586ba3a799609b3e5cdcb553d1dff0099fd046a8d3da6376b6f6e1a72e1e5d758f545b1d0ab9ab947c3333e17b57dd328e45f744381fbc7b6d7ed92dcdbe6d86ab85f1d4daaa1d1c12b9aa8da9a755cc72b57f95cdc2fcbb19f263e516c72f1ed45735d516d8df3e8fbd5552b5ee73a4a48e556b5cf54e5cd45e32bfee669e1fbc5bebcd8ebfb6a2b74c515f99e43e91d4f7485ce558dd8f9f38c719cf735bc35d5d1c7f0b52a235c71d5f1a7e7d97f33c65bccb2e2375256391173d3e4b97f4f433c7ce4d55edc7dc6fdd47e2cb792f1155d2db758dfad14b70ac5b87dd6099228e09173c46adf898d445ec8a88699d43a9ae55f515175be5caa2b6b2ae674b2be47ac924b23bbb95572ae72afa9679eb6b64c66158329f8ea1719ff004e73fae0b0dcae70d3bf31c8e924ce1d2b97fa353f853e65b1954b92a2b2ae45cc93aa79afe131da26ff002fd7dcb1d455d4655ab51d48beed43c2b2b9d2af2f5caaaae54a68fcd9ddd092b91117ba2a1a296eee95d431bdf224d2c89d39fe5c67e89ea4e1fb367c38cdbbfaea1d717eb7aa69bd2f50952f57b32ca9ab472ac71f2985e9c2397db8f7238f87bd8ed4dbdbaf6d9a3349504934f53222d4542b55594f0a2fc723d7d11133f55c21de6d99da3d25b25a02dba0b47db62a4a5a38d1655622e6699797c8e55caaaabb2bdf8ec24bb4cea337631b1b118c4446b530889e887d005c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c4f74f6c749ef0e86b96df6b5a06d5daae6d6a48d544cb1cd7239af6fb2a2a22996002d3a4f4cdaf4669ab6e94b246b1d05aa9a3a4a76af76c6c4c2271f2422efda03e0e59e23f44b755e8ba58a3d79a7a272d22f0dfda14e9cba99cbfcd9e58abeb94ecb9497008d7d0fe682e8fd4ba42ed5363bc51d55bae3432ba0a9a7a88d59244f6af2d56ae173f53cbfe38ba74233ce6a22a633d099fd4eec789df02bb2de2729e5b95f2dcb63d55e5ab61bf5b9a8d9957184499bda66f6efcfb2a1cb0f10ff0066cf883d9099d72b3daa4d6b6273fa595965a77cb3372bc7990222b917b76ca15ee22eefa464acbed5563d167a9748e44e1557842dd355c92672b9f4c2f732ba8d8dde98191cb53b4fac1ad9f3d2ab62aa545c2e17f80d9fb73e03fc52ee33a17dab6a6e5454932a74d5dd3a69a3445f55472f57fda378c46b2684631d2e111158d44ec8a6e9f0ede18b71f7f356c5a7749d92a25a36f96eaaae95aada7a762e72e73b1dfd9132ab8275ec47d9054b6daaa6be6f6ead6d5ab11ae75aeda8ad6756796ba55e553089d913bf73a23a176f7476dad829b4c689b0525aadf4ac4647153c68d4c27bfba892d5b5aed817872f0cbb79e1c34b7ec6d2342afafab46bebeba6547cd3498edd584c3532b84f4370005fd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffd9, 'bmwconcept.jpg', 5);

-- --------------------------------------------------------

--
-- Table structure for table `umse_tedhenat`
--

CREATE TABLE `umse_tedhenat` (
  `ID_tedhenat` int(11) NOT NULL,
  `Shenimi` varchar(200) NOT NULL,
  `Pershkrimi` varchar(10000) NOT NULL,
  `Fajlli` varchar(255) NOT NULL,
  `Pamja_faqes` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `umse_tedhenat`
--

INSERT INTO `umse_tedhenat` (`ID_tedhenat`, `Shenimi`, `Pershkrimi`, `Fajlli`, `Pamja_faqes`) VALUES
(4, ' Menyt tek administratori', '<li><a href=\"ballina.php\">Ballina</a></li>							<li><a href=\"fshij_kontakt.php\">Kontaktet</a></li>							<li><a href=\"perdoruesit.php\">Perdoruesit</a></li>							<li><a href=\"ckycu.php\">Ckycu</a></li>			', '', 'meny_administratorit'),
(7, 'Menyt tek perdoruesi', '<li><a href=\"index.php\">Ballina</a></li>\r\n<li><a href=\"shto_kontakt.php\">Kontakti</a></li>\r\n', '', 'meny_perdoruesit'),
(8, 'Rreth UMSE', '<p>Uebaplikacioni per menaxhimin e skutereve elektrik eshte nje uebaplikacion i cili mundeson te shihni disa nga skuteret elektrik me te perdorur ne baze te llojit te tyre</p>', '', 'fundi_pershkrimi'),
(9, 'Te dhenat', '<dt>Adresa</dt>\r\n<dd>142 Hysen Terpeza &bull; Arberi, Gjilan 60000 &bull; Kosove</dd>\r\n<dt>Numri</dt>\r\n<dd>+383 44 845 172</dd>\r\n<dt>Email</dt>\r\n<dd>bleonrexhepi2@gmail.com</a></dd>', '', 'fundi_tedhenat'),
(10, 'Rrjetet Sociale', '<li><a href=\"https://www.facebook.com/bleoni.r\" class=\"icon brands fa-facebook-f alt\"><span class=\"label\">Facebook</span></a></li>\r\n<li><a href=\"https://www.instagram.com/bleonnrexhepi/\" class=\"icon brands fa-instagram alt\"><span class=\"label\">Instagram</span></a></li>\r\n<li><a href=\"https://github.com/BleonRexhepi\" class=\"icon brands fa-github alt\"><span class=\"label\">GitHub</span></a></li>', '', 'fundi_rrjetet_sociale'),
(11, 'Te drejtat e autorit', '&copy; Untitled. Te gjitha te drejtat e rezervuara. Meritat: <a href=\"https://html5up.net\">HTML5 UP</a>. Fotoja segway.jpg nga <a href=\"https://www.target.com/p/segway-f25-electric-kick-scooter-gray/-/A-82400915\">Target</a>. Fotoja hoverboard.jpg nga <a href=\"https://smartbalanceshops.com/en/home/59-hoverboard-regular-white-pearl-6426601000371.html\">Smart Balance</a>. Fotoja bmwconcept.jpg nga <a href=\"https://www.rushlane.com/new-bmw-electric-moped-90-kms-range-debut-12411471.html\">Rushlane</a>.', '', 'funditedrejtatautoriale'),
(12, 'Uebaplikacioni per Menaxhimin e Skutereve Elektrik (UMSE)', '', 'images/umse_logo.svg', 'fillimi_faqes');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `umse_kontaktet`
--
ALTER TABLE `umse_kontaktet`
  ADD PRIMARY KEY (`ID_Kontakti`);

--
-- Indexes for table `umse_llojeteskutereve_elektrik`
--
ALTER TABLE `umse_llojeteskutereve_elektrik`
  ADD PRIMARY KEY (`ID_LlojiSkuteritElektrik`);

--
-- Indexes for table `umse_perdoruesit`
--
ALTER TABLE `umse_perdoruesit`
  ADD PRIMARY KEY (`ID_p`);

--
-- Indexes for table `umse_skuteretelektrik`
--
ALTER TABLE `umse_skuteretelektrik`
  ADD PRIMARY KEY (`ID_SkuteriElektrik`),
  ADD KEY `FK_SkuteretLlojet_ID_LlojiSkuteritElektrik` (`ID_LlojiSkuteritElektrik`);

--
-- Indexes for table `umse_tedhenat`
--
ALTER TABLE `umse_tedhenat`
  ADD PRIMARY KEY (`ID_tedhenat`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `umse_kontaktet`
--
ALTER TABLE `umse_kontaktet`
  MODIFY `ID_Kontakti` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `umse_llojeteskutereve_elektrik`
--
ALTER TABLE `umse_llojeteskutereve_elektrik`
  MODIFY `ID_LlojiSkuteritElektrik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `umse_perdoruesit`
--
ALTER TABLE `umse_perdoruesit`
  MODIFY `ID_p` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `umse_skuteretelektrik`
--
ALTER TABLE `umse_skuteretelektrik`
  MODIFY `ID_SkuteriElektrik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `umse_tedhenat`
--
ALTER TABLE `umse_tedhenat`
  MODIFY `ID_tedhenat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `umse_skuteretelektrik`
--
ALTER TABLE `umse_skuteretelektrik`
  ADD CONSTRAINT `FK_SkuteretLlojet_ID_LlojiSkuteritElektrik` FOREIGN KEY (`ID_LlojiSkuteritElektrik`) REFERENCES `umse_llojeteskutereve_elektrik` (`ID_LlojiSkuteritElektrik`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
