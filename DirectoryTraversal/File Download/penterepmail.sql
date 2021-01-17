-- phpMyAdmin SQL Dump
-- version 2.11.3deb1ubuntu1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 10, 2020 at 12:14 PM
-- Server version: 5.0.96
-- PHP Version: 5.2.4-2ubuntu5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `penterepmail`
--

-- --------------------------------------------------------

--
-- Table structure for table `adrbook`
--

CREATE TABLE IF NOT EXISTS `adrbook` (
  `idadrbook` int(11) NOT NULL auto_increment,
  `iduser` int(11) NOT NULL,
  `email` varchar(70) NOT NULL,
  `name` varchar(70) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY  (`idadrbook`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=130 ;

--
-- Dumping data for table `adrbook`
--

INSERT INTO `adrbook` (`idadrbook`, `iduser`, `email`, `name`, `description`) VALUES
(46, 13, 'roman', 'Roman Kummel', ''),
(32, 15, 'smolicek', 'Smolicek Pacholicek', ''),
(29, 1, 'jana', 'jana', 'test'),
(53, 13, 'admin', 'Administrator', 'Moje pozamka'),
(87, 42, 'tester@penterepmail.loc', 'tester', ''),
(115, 28, 'penterest@penterepmail.loc', 'Penterest', ''),
(129, 28, 'roman@penterepmail.loc', 'Roman Kümmel', '');

-- --------------------------------------------------------

--
-- Table structure for table `eshop_goods`
--

CREATE TABLE IF NOT EXISTS `eshop_goods` (
  `idgoods` int(11) NOT NULL auto_increment,
  `title` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(30) NOT NULL,
  `lang` varchar(10) NOT NULL,
  `urlname` varchar(50) NOT NULL,
  PRIMARY KEY  (`idgoods`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `eshop_goods`
--

INSERT INTO `eshop_goods` (`idgoods`, `title`, `price`, `description`, `image`, `lang`, `urlname`) VALUES
(1, 'Penterep hrneček', 5.00, 'Čtení nových e-mailových zpráv si nejlépe vychutnáte při šálku dobré kávy, která nejlépe chutná z našeho Penterep hrnečku.', 'cup', 'cs', 'hrnecek'),
(2, 'Penterep tričko', 15.00, 'Dejte svému okolí vědět, že svou elektronickou poštu svěřujete odborníkům, kteří jsou schopni se nejlépe postarat o její bezpečí.', 'tshirt', 'cs', 'tricko'),
(3, 'Penterep cup', 5.00, 'foo', 'cup', 'en', 'cup'),
(4, 'Penterep T-shirt', 15.00, '', 'tshirt', 'en', 't-shirt');

-- --------------------------------------------------------

--
-- Table structure for table `eshop_hdok`
--

CREATE TABLE IF NOT EXISTS `eshop_hdok` (
  `idhdok` int(10) unsigned NOT NULL auto_increment,
  `status` int(11) NOT NULL default '0',
  `date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `name` varchar(50) default NULL,
  `street` varchar(100) default NULL,
  `city` varchar(50) default NULL,
  `state` int(10) unsigned default NULL,
  `email` varchar(100) NOT NULL,
  `transport` int(10) unsigned default NULL,
  PRIMARY KEY  (`idhdok`),
  KEY `state` (`state`,`transport`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=172 ;

--
-- Dumping data for table `eshop_hdok`
--

INSERT INTO `eshop_hdok` (`idhdok`, `status`, `date`, `name`, `street`, `city`, `state`, `email`, `transport`) VALUES
(1, 1, '2020-02-06 21:42:40', 'j', 'j', 'k', 0, 'l@s', 1),
(2, 1, '2020-02-06 21:49:49', 'j', 'j', 'k', 1, 'l@s', 1),
(3, 1, '2020-02-06 22:14:22', 'j', 'j', 'k', 1, 'l@s', 1),
(4, 1, '2020-02-06 22:14:57', 'j', 'j', 'k', 1, 'l@s', 1),
(5, 1, '2020-02-06 22:15:33', 'j', 'j', 'k', 1, 'l@s', 1),
(6, 1, '2020-02-06 22:20:45', 'j', 'j', 'k', 1, 'l@s', 1),
(7, 1, '2020-02-06 22:58:19', 'j', 'j', 'k', 1, 'l@s', 1),
(8, 1, '2020-02-06 22:58:34', 'j', 'j', 'k', 1, 'l@s', 1),
(9, 1, '2020-02-06 22:58:36', 'j', 'j', 'k', 1, 'l@s', 1),
(10, 1, '2020-02-06 23:50:10', 'j', 'j', 'k', 1, 'l@s', 1),
(11, 1, '2020-02-06 23:52:11', 'j', 'j', 'k', 1, 'l@s', 1),
(12, 1, '2020-02-06 23:53:59', 'j', 'j', 'k', 1, 'l@s', 1),
(13, 1, '2020-02-06 23:54:01', 'j', 'j', 'k', 1, 'l@s', 1),
(14, 1, '2020-02-06 23:55:22', 'j', 'j', 'k', 1, 'l@s', 1),
(15, 1, '2020-02-06 23:58:51', 'j', 'j', 'k', 1, 'l@s', 1),
(16, 1, '2020-02-06 23:59:37', 'j', 'j', 'k', 1, 'l@s', 1),
(17, 1, '2020-02-07 00:00:28', 'j', 'j', 'k', 1, 'l@s', 1),
(18, 1, '2020-02-07 00:01:34', 'j', 'j', 'k', 1, 'l@s', 1),
(19, 1, '2020-02-07 00:01:36', 'j', 'j', 'k', 1, 'l@s', 1),
(20, 1, '2020-02-07 00:04:31', 'j', 'j', 'k', 1, 'l@s', 1),
(21, 1, '2020-02-07 00:11:36', 'j', 'j', 'k', 1, 'l@s', 1),
(22, 1, '2020-02-07 00:20:32', 'j', 'j', 'k', 1, 'l@s', 1),
(23, 1, '2020-02-07 00:21:06', 'j', 'j', 'k', 1, 'l@s', 1),
(24, 1, '2020-02-07 00:22:18', 'j', 'j', 'k', 1, 'l@s', 1),
(25, 1, '2020-02-07 00:22:21', 'j', 'j', 'k', 1, 'l@s', 1),
(26, 1, '2020-02-07 00:22:38', 'j', 'j', 'k', 1, 'l@s', 1),
(27, 1, '2020-02-07 00:23:38', 'j', 'j', 'k', 1, 'l@s', 1),
(28, 1, '2020-02-07 00:23:40', 'j', 'j', 'k', 1, 'l@s', 1),
(29, 1, '2020-02-07 00:24:24', 'j', 'j', 'k', 1, 'l@s', 1),
(30, 1, '2020-02-07 00:25:11', 'j', 'j', 'k', 1, 'l@s', 1),
(31, 1, '2020-02-07 00:25:13', 'j', 'j', 'k', 1, 'l@s', 1),
(32, 1, '2020-02-07 00:25:39', 'j', 'j', 'k', 1, 'l@s', 1),
(33, 1, '2020-02-07 00:29:20', 'j', 'j', 'k', 1, 'l@s', 1),
(34, 1, '2020-02-07 00:29:40', 'j', 'j', 'k', 1, 'l@s', 1),
(35, 1, '2020-02-07 00:29:58', 'j', 'j', 'k', 1, 'l@s', 1),
(36, 1, '2020-02-07 00:30:41', 'j', 'j', 'k', 1, 'l@s', 1),
(37, 1, '2020-02-07 00:30:45', 'j', 'j', 'k', 1, 'l@s', 1),
(38, 1, '2020-02-07 00:31:11', 'j', 'j', 'k', 1, 'l@s', 1),
(39, 1, '2020-02-07 00:31:13', 'j', 'j', 'k', 1, 'l@s', 1),
(40, 1, '2020-02-07 00:32:58', 'j', 'j', 'k', 1, 'l@s', 1),
(41, 1, '2020-02-07 00:34:12', 'j', 'j', 'k', 1, 'l@s', 1),
(42, 1, '2020-02-07 00:36:54', 'j', 'j', 'k', 1, 'l@s', 1),
(43, 1, '2020-02-07 00:38:02', 'j', 'j', 'k', 1, 'l@s', 1),
(44, 1, '2020-02-07 00:38:05', 'j', 'j', 'k', 1, 'l@s', 1),
(45, 1, '2020-02-07 00:38:53', 'j', 'j', 'k', 1, 'l@s', 1),
(46, 1, '2020-02-07 00:43:02', 'j', 'j', 'k', 1, 'l@s', 1),
(47, 1, '2020-02-07 00:46:52', 'j', 'j', 'k', 1, 'l@s', 1),
(48, 1, '2020-02-07 00:47:31', 'j', 'j', 'k', 1, 'l@s', 1),
(49, 1, '2020-02-07 00:48:24', 'j', 'j', 'k', 1, 'l@s', 1),
(50, 1, '2020-02-07 00:48:31', 'j', 'j', 'k', 1, 'l@s', 1),
(51, 1, '2020-02-07 00:54:49', 'j', 'j', 'k', 1, 'l@s', 1),
(52, 1, '2020-02-07 00:56:43', 'j', 'j', 'k', 1, 'l@s', 1),
(53, 1, '2020-02-07 00:57:50', 'j', 'j', 'k', 1, 'l@s', 1),
(54, 1, '2020-02-07 00:57:54', 'j', 'j', 'k', 1, 'l@s', 1),
(55, 1, '2020-02-07 00:58:18', 'j', 'j', 'k', 1, 'l@s', 1),
(56, 1, '2020-02-07 00:59:14', 'j', 'j', 'k', 1, 'l@s', 1),
(57, 1, '2020-02-07 01:01:06', 'j', 'j', 'k', 1, 'l@s', 1),
(58, 1, '2020-02-07 01:02:22', 'j', 'j', 'k', 1, 'l@s', 1),
(59, 1, '2020-02-07 01:02:24', 'j', 'j', 'k', 1, 'l@s', 1),
(60, 1, '2020-02-07 01:02:51', 'j', 'j', 'k', 1, 'l@s', 1),
(61, 1, '2020-02-07 01:03:07', 'j', 'j', 'k', 1, 'l@s', 1),
(62, 1, '2020-02-07 01:03:22', 'j', 'j', 'k', 1, 'l@s', 1),
(63, 1, '2020-02-07 01:03:49', 'j', 'j', 'k', 1, 'l@s', 1),
(64, 1, '2020-02-07 01:05:30', 'j', 'j', 'k', 1, 'l@s', 1),
(65, 1, '2020-02-07 01:06:17', 'j', 'j', 'k', 1, 'l@s', 1),
(66, 1, '2020-02-07 01:06:45', 'j', 'j', 'k', 1, 'l@s', 1),
(67, 1, '2020-02-07 01:06:48', 'j', 'j', 'k', 1, 'l@s', 1),
(68, 1, '2020-02-07 01:07:21', 'j', 'j', 'k', 1, 'l@s', 1),
(69, 1, '2020-02-07 01:08:36', 'j', 'j', 'k', 1, 'l@s', 1),
(70, 1, '2020-02-07 01:09:10', 'j', 'j', 'k', 1, 'l@s', 1),
(71, 1, '2020-02-07 01:10:33', 'j', 'j', 'k', 1, 'l@s', 1),
(72, 1, '2020-02-07 01:10:52', 'j', 'j', 'k', 1, 'l@s', 1),
(73, 1, '2020-02-07 01:11:16', 'j', 'j', 'k', 1, 'l@s', 1),
(74, 1, '2020-02-07 01:12:10', 'j', 'j', 'k', 1, 'l@s', 1),
(75, 1, '2020-02-07 01:17:56', 'j', '<hr>', '<img src="http://www.penterepmail.loc/favicon.ic">', 1, 'l@s', 1),
(76, 1, '2020-02-07 01:18:12', 'j', '<hr>', '<img src="http://www.penterepmail.loc/favicon.ic">', 1, 'l@s', 1),
(77, 1, '2020-02-07 01:18:30', 'j', '<hr>', '<img src="//www.penterepmail.loc/favicon.ic">', 1, 'l@s', 1),
(78, 1, '2020-02-07 01:18:36', 'j', '<hr>', '<img src="//www.penterepmail.loc/favicon.ico">', 1, 'l@s', 1),
(79, 1, '2020-02-07 01:18:38', 'j', '<hr>', '<img src="//www.penterepmail.loc/favicon.ico">', 1, 'l@s', 1),
(80, 1, '2020-02-07 01:20:41', 'j', '<img src="http://www.penterepmail.loc/favicon.ico">', '<hr>', 1, 'l@s', 1),
(81, 1, '2020-02-07 01:20:44', 'j', '<img src="http://www.penterepmail.loc/favicon.ico">', '<hr>', 1, 'l@s', 1),
(82, 1, '2020-02-07 01:22:02', 'j', '<img src="http://www.penterepmail.loc/images/eshop/cup.png">', '<hr>', 1, 'l@s', 1),
(83, 1, '2020-02-07 01:22:04', 'j', '<img src="http://www.penterepmail.loc/images/eshop/cup.png">', '<hr>', 1, 'l@s', 1),
(84, 1, '2020-02-07 01:24:11', 'j', '<img src="file://tpm/cup.png">', '<hr>', 1, 'l@s', 1),
(85, 1, '2020-02-07 01:24:13', 'j', '<img src="file://tpm/cup.png">', '<hr>', 1, 'l@s', 1),
(86, 1, '2020-02-07 01:55:39', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.cz', 1),
(87, 1, '2020-02-07 01:55:45', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.cz', 1),
(88, 1, '2020-02-07 01:57:52', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.cz', 1),
(89, 1, '2020-02-07 01:57:58', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.cz', 1),
(90, 1, '2020-02-07 01:58:03', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.cz', 1),
(91, 1, '2020-02-07 01:59:23', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.cz', 1),
(92, 1, '2020-02-07 01:59:25', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.cz', 1),
(93, 1, '2020-02-07 02:00:30', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.cz', 1),
(94, 1, '2020-02-07 02:00:33', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.cz', 1),
(95, 1, '2020-02-07 02:01:44', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.cz', 1),
(96, 1, '2020-02-07 02:02:38', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.cz', 1),
(97, 1, '2020-02-07 02:02:49', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.cz', 1),
(98, 1, '2020-02-07 02:04:22', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(99, 1, '2020-02-07 02:04:23', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(100, 1, '2020-02-07 02:07:10', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(101, 1, '2020-02-07 02:08:18', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(102, 1, '2020-02-07 02:09:06', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(103, 1, '2020-02-07 02:12:05', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(104, 1, '2020-02-07 02:12:36', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.cz', 1),
(105, 1, '2020-02-07 02:12:38', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.cz', 1),
(106, 1, '2020-02-07 02:13:41', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.cz', 1),
(107, 1, '2020-02-07 02:13:43', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.cz', 1),
(108, 1, '2020-02-07 02:15:14', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.cz', 1),
(109, 1, '2020-02-07 02:17:09', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.cz', 1),
(110, 1, '2020-02-07 02:17:16', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(111, 1, '2020-02-07 02:17:19', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(112, 1, '2020-02-07 02:23:12', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(113, 1, '2020-02-07 02:23:16', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(114, 1, '2020-02-07 02:23:19', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(115, 1, '2020-02-07 02:25:29', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(116, 1, '2020-02-07 02:25:35', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(117, 1, '2020-02-07 02:25:37', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(118, 1, '2020-02-07 02:31:25', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(119, 1, '2020-02-07 02:31:27', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(120, 1, '2020-02-07 02:32:01', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(121, 1, '2020-02-07 02:32:45', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(122, 1, '2020-02-07 02:32:46', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(123, 1, '2020-02-07 02:32:48', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(124, 1, '2020-02-07 02:33:07', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(125, 1, '2020-02-07 02:33:54', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(126, 1, '2020-02-07 02:34:30', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(127, 1, '2020-02-07 02:34:54', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(128, 1, '2020-02-07 02:34:56', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(129, 1, '2020-02-07 02:35:30', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(130, 1, '2020-02-07 02:35:36', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(131, 1, '2020-02-07 02:36:09', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(132, 1, '2020-02-07 02:38:31', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(133, 1, '2020-02-07 02:43:15', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(134, 1, '2020-02-07 02:44:10', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(135, 1, '2020-02-07 02:44:11', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(136, 1, '2020-02-07 02:45:13', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(137, 1, '2020-02-07 02:45:16', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(138, 1, '2020-02-07 02:51:09', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(139, 1, '2020-02-07 02:51:10', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(140, 1, '2020-02-07 02:51:32', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(141, 1, '2020-02-07 02:51:33', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(142, 1, '2020-02-07 02:55:47', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(143, 1, '2020-02-07 02:57:04', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(144, 1, '2020-02-07 02:59:10', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(145, 1, '2020-02-07 03:00:17', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(146, 1, '2020-02-07 03:00:42', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(147, 1, '2020-02-07 03:00:45', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(148, 1, '2020-02-07 03:00:47', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(149, 1, '2020-02-07 03:01:42', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(150, 1, '2020-02-07 03:05:38', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(151, 1, '2020-02-07 03:06:03', 'j', 'test<hr>', '<hr>', 1, 'penterest@penterepmail.loc', 1),
(152, 1, '2020-02-07 03:12:53', 'j', 'test', 'test', 1, 'penterest@penterepmail.loc', 1),
(153, 1, '2020-02-07 03:13:17', 'j', 'test', 'test', 1, 'penterest@penterepmail.loc', 1),
(154, 1, '2020-02-07 03:17:58', 'j', 'test', 'test', 1, 'penterest@penterepmail.loc', 1),
(155, 1, '2020-02-07 03:18:15', 'j', 'test', 'test', 1, 'penterest@penterepmail.loc', 1),
(156, 1, '2020-02-07 03:21:46', 'j', 'test', 'test', 1, 'penterest@penterepmail.loc', 1),
(157, 1, '2020-02-07 03:21:48', 'j', 'test', 'test', 1, 'penterest@penterepmail.loc', 1),
(158, 1, '2020-02-07 03:21:59', 'j', 'test', 'test', 1, 'penterest@penterepmail.loc', 1),
(159, 1, '2020-02-07 03:22:35', 'j', 'test', 'test', 1, 'penterest@penterepmail.loc', 1),
(160, 1, '2020-02-07 03:22:42', 'j', 'test', 'test', 1, 'penterest@penterepmail.loc', 1),
(161, 1, '2020-02-07 03:23:13', 'j', 'test', 'test', 1, 'penterest@penterepmail.loc', 1),
(162, 1, '2020-02-07 03:23:17', 'j', 'test', 'test', 1, 'penterest@penterepmail.loc', 1),
(163, 1, '2020-02-07 03:23:19', 'j', 'test', 'test', 1, 'penterest@penterepmail.loc', 1),
(164, 1, '2020-02-07 03:23:23', 'j', 'test', 'test', 1, 'penterest@penterepmail.loc', 1),
(165, 1, '2020-02-07 03:59:25', 'j', 'test', 'test', 1, 'penterest@penterepmail.loc', 1),
(166, 1, '2020-02-07 04:00:49', 'j', 'test', 'test', 1, 'penterest@penterepmail.loc', 1),
(167, 1, '2020-02-07 04:02:07', 'j', 'test', 'test', 1, 'penterest@penterepmail.loc', 1),
(168, 1, '2020-02-07 04:02:44', 'j', 'test', 'test', 1, 'penterest@penterepmail.loc', 1),
(169, 1, '2020-02-07 04:04:53', 'j', 'test', 'test', 1, 'penterest@penterepmail.loc', 1),
(170, 1, '2020-02-07 04:06:07', 'j', 'test', 'test', 1, 'penterest@penterepmail.loc', 1),
(171, 1, '2020-02-07 04:08:08', 'j', 'test', 'test', 1, 'penterest@penterepmail.loc', 1);

-- --------------------------------------------------------

--
-- Table structure for table `eshop_sdok`
--

CREATE TABLE IF NOT EXISTS `eshop_sdok` (
  `idsdok` int(11) NOT NULL auto_increment,
  `idhdok` int(10) unsigned NOT NULL,
  `idgoods` int(11) NOT NULL,
  `amount` float NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY  (`idsdok`),
  KEY `idgoods` (`idgoods`),
  KEY `idhdok` (`idhdok`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=236 ;

--
-- Dumping data for table `eshop_sdok`
--

INSERT INTO `eshop_sdok` (`idsdok`, `idhdok`, `idgoods`, `amount`, `price`) VALUES
(62, 5, 1, 1, 99.00),
(63, 6, 1, 1, 99.00),
(64, 7, 1, 1, 99.00),
(65, 8, 1, 1, 99.00),
(66, 9, 1, 1, 99.00),
(67, 10, 1, 1, 99.00),
(68, 11, 1, 1, 99.00),
(69, 12, 1, 1, 99.00),
(70, 13, 1, 1, 99.00),
(71, 14, 1, 1, 99.00),
(72, 15, 1, 1, 99.00),
(73, 16, 1, 1, 99.00),
(74, 17, 1, 1, 99.00),
(75, 18, 1, 1, 99.00),
(76, 19, 1, 1, 99.00),
(77, 20, 1, 1, 99.00),
(78, 21, 1, 1, 99.00),
(79, 22, 1, 1, 99.00),
(80, 23, 1, 1, 99.00),
(81, 24, 1, 1, 99.00),
(82, 25, 1, 1, 99.00),
(83, 26, 1, 1, 99.00),
(84, 27, 1, 1, 99.00),
(85, 28, 1, 1, 99.00),
(86, 29, 1, 1, 99.00),
(87, 30, 1, 1, 99.00),
(88, 31, 1, 1, 99.00),
(89, 32, 1, 1, 99.00),
(90, 33, 1, 1, 99.00),
(91, 34, 1, 1, 99.00),
(92, 35, 1, 1, 99.00),
(93, 36, 1, 1, 99.00),
(94, 37, 1, 1, 99.00),
(95, 38, 1, 1, 99.00),
(96, 39, 1, 1, 99.00),
(97, 40, 1, 1, 99.00),
(98, 41, 1, 1, 99.00),
(99, 42, 1, 1, 99.00),
(100, 43, 1, 1, 99.00),
(101, 44, 1, 1, 99.00),
(102, 45, 1, 1, 99.00),
(103, 46, 1, 1, 99.00),
(104, 47, 1, 1, 99.00),
(105, 48, 1, 1, 99.00),
(106, 49, 1, 1, 99.00),
(107, 50, 1, 1, 99.00),
(108, 51, 1, 1, 99.00),
(109, 52, 1, 1, 99.00),
(110, 53, 1, 1, 99.00),
(111, 54, 1, 1, 99.00),
(112, 55, 1, 1, 99.00),
(113, 56, 1, 1, 99.00),
(114, 57, 1, 1, 99.00),
(115, 58, 1, 1, 99.00),
(116, 59, 1, 1, 99.00),
(117, 60, 1, 1, 99.00),
(118, 61, 1, 1, 99.00),
(119, 62, 1, 1, 99.00),
(120, 63, 1, 1, 99.00),
(121, 64, 1, 1, 99.00),
(122, 65, 1, 1, 99.00),
(123, 66, 1, 1, 99.00),
(124, 67, 1, 1, 99.00),
(125, 68, 1, 1, 99.00),
(126, 69, 1, 1, 99.00),
(127, 70, 1, 1, 99.00),
(128, 71, 1, 1, 99.00),
(129, 72, 1, 1, 99.00),
(130, 73, 1, 1, 99.00),
(131, 74, 1, 1, 99.00),
(132, 75, 1, 1, 99.00),
(133, 76, 1, 1, 99.00),
(134, 77, 1, 1, 99.00),
(135, 78, 1, 1, 99.00),
(136, 79, 1, 1, 99.00),
(137, 80, 1, 1, 99.00),
(138, 81, 1, 1, 99.00),
(139, 82, 1, 1, 99.00),
(140, 83, 1, 1, 99.00),
(141, 84, 1, 1, 99.00),
(142, 85, 1, 1, 99.00),
(143, 86, 1, 1, 99.00),
(144, 87, 1, 1, 99.00),
(145, 88, 1, 1, 99.00),
(146, 89, 1, 1, 99.00),
(147, 90, 1, 1, 99.00),
(148, 91, 1, 1, 99.00),
(149, 92, 1, 1, 99.00),
(150, 93, 1, 1, 99.00),
(151, 94, 1, 1, 99.00),
(152, 95, 1, 1, 99.00),
(153, 96, 1, 1, 99.00),
(154, 97, 1, 1, 99.00),
(155, 98, 1, 1, 99.00),
(156, 99, 1, 1, 99.00),
(157, 100, 1, 1, 99.00),
(158, 101, 1, 1, 99.00),
(159, 102, 1, 1, 99.00),
(160, 103, 1, 1, 99.00),
(161, 104, 1, 1, 99.00),
(162, 105, 1, 1, 99.00),
(163, 106, 1, 1, 99.00),
(164, 107, 1, 1, 99.00),
(165, 108, 1, 1, 99.00),
(166, 109, 1, 1, 99.00),
(167, 110, 1, 1, 99.00),
(168, 111, 1, 1, 99.00),
(169, 112, 1, 1, 99.00),
(170, 113, 1, 1, 99.00),
(171, 114, 1, 1, 99.00),
(172, 115, 1, 1, 99.00),
(173, 116, 1, 1, 99.00),
(174, 117, 1, 1, 99.00),
(175, 118, 1, 1, 99.00),
(176, 119, 1, 1, 99.00),
(177, 120, 1, 1, 99.00),
(178, 121, 1, 1, 99.00),
(179, 122, 1, 1, 99.00),
(180, 123, 1, 1, 99.00),
(181, 124, 1, 1, 99.00),
(182, 125, 1, 1, 99.00),
(183, 126, 1, 1, 99.00),
(184, 127, 1, 1, 99.00),
(185, 128, 1, 1, 99.00),
(186, 129, 1, 1, 99.00),
(187, 130, 1, 1, 99.00),
(188, 131, 1, 1, 99.00),
(189, 132, 1, 1, 99.00),
(190, 133, 1, 1, 99.00),
(191, 134, 1, 1, 99.00),
(192, 135, 1, 1, 99.00),
(193, 136, 1, 1, 99.00),
(194, 137, 1, 1, 99.00),
(195, 138, 1, 1, 99.00),
(196, 139, 1, 1, 99.00),
(197, 140, 1, 1, 99.00),
(198, 141, 1, 1, 99.00),
(199, 142, 1, 1, 99.00),
(200, 143, 1, 1, 99.00),
(201, 144, 1, 1, 99.00),
(202, 145, 1, 1, 99.00),
(203, 146, 1, 1, 99.00),
(204, 147, 1, 1, 99.00),
(205, 148, 1, 1, 99.00),
(206, 149, 1, 1, 99.00),
(207, 150, 1, 1, 99.00),
(208, 151, 1, 1, 99.00),
(209, 152, 1, 1, 99.00),
(210, 152, 4, 1, 15.00),
(211, 153, 1, 1, 99.00),
(212, 153, 4, 1, 15.00),
(213, 154, 1, 1, 99.00),
(214, 154, 4, 1, 15.00),
(215, 155, 1, 1, 99.00),
(216, 155, 4, 1, 15.00),
(217, 156, 1, 1, 99.00),
(218, 156, 4, 1, 15.00),
(219, 157, 1, 1, 99.00),
(220, 157, 4, 1, 15.00),
(221, 158, 1, 1, 99.00),
(222, 158, 4, 1, 15.00),
(223, 159, 1, 1, 99.00),
(224, 159, 4, 1, 15.00),
(225, 160, 1, 1, 99.00),
(226, 160, 4, 1, 15.00),
(227, 161, 1, 1, 99.00),
(228, 161, 4, 1, 15.00),
(229, 165, 2, 1, 15.00),
(230, 166, 1, 1, 5.00),
(231, 167, 2, 1, 15.00),
(232, 168, 2, 1, 15.00),
(233, 169, 2, 1, 15.00),
(234, 170, 2, 1, 15.00),
(235, 171, 2, 1, 15.00);

-- --------------------------------------------------------

--
-- Table structure for table `flashgames`
--

CREATE TABLE IF NOT EXISTS `flashgames` (
  `idflashgames` int(10) unsigned NOT NULL auto_increment,
  `idgame` int(10) unsigned NOT NULL,
  `name` text NOT NULL,
  `score` bigint(20) unsigned NOT NULL,
  `datum` text NOT NULL,
  PRIMARY KEY  (`idflashgames`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `flashgames`
--

INSERT INTO `flashgames` (`idflashgames`, `idgame`, `name`, `score`, `datum`) VALUES
(1, 1, 'Anonymous', 10, '10.6.2014 17:26'),
(15, 1, 'Roman', 99999999, '27.5.2015 9:27'),
(5, 1, 'test', 1, '12.6.2014 20:22');

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE IF NOT EXISTS `log` (
  `idlog` int(11) NOT NULL auto_increment,
  `datetime` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `ip` varchar(100) NOT NULL,
  `useragent` text NOT NULL,
  `referer` text NOT NULL,
  PRIMARY KEY  (`idlog`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14168 ;

--
-- Dumping data for table `log`
--


-- --------------------------------------------------------

--
-- Table structure for table `pins`
--

CREATE TABLE IF NOT EXISTS `pins` (
  `idpin` int(11) NOT NULL auto_increment,
  `login` varchar(20) NOT NULL,
  `pin` varchar(100) NOT NULL,
  PRIMARY KEY  (`idpin`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `pins`
--

INSERT INTO `pins` (`idpin`, `login`, `pin`) VALUES
(1, 'roman', '4827'),
(2, 'roman', 'cm9tYW4xNTc5NjE1MjQw'),
(3, 'roman', 'cm9tYW4xNTc5NjE1OTk4'),
(4, 'roman', '97df5fa177f4f8e4361304cf5dcacbf5'),
(5, 'novy7', '2614'),
(6, 'novy7', '3679'),
(7, 'novy7', '212ab20dbdf4191cbcdcf015511783f4'),
(8, 'novy7', '459a4ddcb586f24efd9395aa7662bc7c'),
(9, 'novy7', '148510031349642de5ca0c544f31b2ef'),
(10, 'roman', '6148'),
(11, 'roman', '3962'),
(12, 'roman', '5566'),
(13, 'penterest', '2673');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE IF NOT EXISTS `services` (
  `id` int(11) NOT NULL auto_increment,
  `page` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `page`) VALUES
(1, '/external/service1.html'),
(2, '/external/service2.html'),
(3, '/external/service3.html');

-- --------------------------------------------------------

--
-- Table structure for table `statistics`
--

CREATE TABLE IF NOT EXISTS `statistics` (
  `idstatistics` int(11) NOT NULL auto_increment,
  `url` text NOT NULL,
  `visitors` int(11) NOT NULL default '0',
  PRIMARY KEY  (`idstatistics`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `statistics`
--

INSERT INTO `statistics` (`idstatistics`, `url`, `visitors`) VALUES
(1, '/inc/help.php', 2315),
(2, '/inc/nastaveni.php', 3156),
(3, '/inc/resend.php', 2829),
(4, '/inc/kontakt.php', 2009),
(5, '/inc/admin.php', 3214),
(6, '/inc/newmessage.php', 3391),
(7, '/inc/slozka.php', 2997),
(8, '/inc/soutez.php', 2837);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE IF NOT EXISTS `tickets` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `value` char(6) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL,
  `ip` varchar(79) NOT NULL,
  `iduser` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `value` (`value`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12144 ;

--
-- Dumping data for table `tickets`
--


-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` text NOT NULL,
  `login` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `isadmin` tinyint(1) unsigned NOT NULL default '0',
  `isbaned` tinyint(4) NOT NULL default '0',
  `secondmail` text,
  `www` varchar(70) default NULL,
  `remail` text,
  `about` text,
  `image` text,
  `phone` varchar(20) default NULL,
  `question` int(11) default NULL,
  `answer` varchar(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=65 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `login`, `password`, `isadmin`, `isbaned`, `secondmail`, `www`, `remail`, `about`, `image`, `phone`, `question`, `answer`) VALUES
(1, 'Karel Drsňák', 'karel', 'heslo', 0, 0, '', NULL, '', NULL, 'karel.jpg', '', NULL, NULL),
(2, 'Jana Nádherná', 'jana', 'heslo', 0, 0, NULL, NULL, 'attacker@attacker.cz', NULL, 'jana.jpg', '', NULL, NULL),
(13, 'Roman Kümmel', 'roman', 'eb43', 0, 0, 'r.kummel@hacker-consulting.cz', NULL, '', NULL, 'karel.jpg', '', NULL, NULL),
(14, 'Smolíček Pacholíček', 'Smolicek', 'heslo', 0, 0, '', NULL, '', NULL, 'smolicek.png', '', NULL, NULL),
(15, 'Jezinky', 'jezinky', 'heslo', 0, 0, NULL, NULL, 'jezinky44@seznam.cz', NULL, 'jezinky.jpg', '', NULL, NULL),
(18, 'Utocnik', 'utocnik', 'heslo', 0, 0, NULL, NULL, '', NULL, '', '', NULL, NULL),
(21, 'Uživatel', 'uzivatel', 'heslo', 0, 0, NULL, NULL, '', NULL, '', '', NULL, NULL),
(12, 'Administrator', 'admin', 'heslo', 1, 0, '', NULL, 'attacker@attacker.cz', NULL, '', '', NULL, NULL),
(23, 'test', 'test', 'heslo', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 'test1', 'test1', 'heslo', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 'test2', 'test2', 'heslo', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 'test3', 'test3', 'heslo', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 'test4', 'test4', 'heslo', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 'Penterest', 'penterest', 'heslo', 1, 1, 'roman@vumail.loc', 'http://www.necfo.cz', NULL, 'Něco o mně!', 'image.w1456.jpg', NULL, 1, 'red'),
(29, 'root', 'root', 'bug', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 'romanabc', 'romanabc', 'aaaaa', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 'roman3', 'roman3', 'test123', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 'roman4', 'roman4', 'heslo123', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 'roman5', 'roman5', 'heslo123', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, 'petr', 'petr', 'heslo', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 'jirka', 'jirka', 'jirka', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 'blabla', 'blabla', 'blabla', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, 'foo', 'foo', 'foofoo', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 'no', 'no', 'nonono', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, 'nevim', 'nevim', 'nevim', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 'neznam', 'neznam', 'neznam', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 'foo2', 'foo2', 'foofoo', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 'Tester s češtinou', 'tester', 'tester', 0, 0, '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(43, 'novy', 'novy', 'heslo', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 'novy2', 'novy2', 'heslo', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, 'novy3', 'novy3', 'heslo', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, 'novy4', 'novy4', 'heslo', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(47, 'Nový 5', 'novy5', 'heslo', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, 'Nový 6', 'novy6', 'heslo', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(49, 'nový 7', 'novy7', 'f1595', 0, 0, 'novy6@penterepmail.loc', '', NULL, NULL, NULL, NULL, NULL, NULL),
(50, 'fooo', 'fooo && ls', 'fooooo', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(51, 'foooo', 'fooo && ls > test.tx', 'foooo', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(52, 'fooooo', 'fooo && ls > /var/ww', 'foooo', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(53, 'foooooo', 'fooo; ls > /var/www/', 'foooo', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(54, 'fooooooo', 'fooo; ls > /var/www/', 'foooo', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(55, 'foooooooo', 'fooo; ls > /var/www/', 'foooo', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(56, 'fooooooooo', 'fooo', 'foooo', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(57, 'fooooooosoo', 'fooo; ls > test.txt', 'foooo', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(58, 'foooofooooo', 'foofoooo', 'foooo', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(59, 'pretypovani', 'pretypovani', '0x1234Ab', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(60, 'pokus', 'pokus', 'pokus ;foo$', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(61, 'testte', 'testte', 'testte', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(62, 'fooq', 'fooq', 'foofoo', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(63, 'rrr', 'rrr', 'rrrrr', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(64, 'dhsjkh', 'cdsjnjkj', 'jdhjkshj', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `eshop_sdok`
--
ALTER TABLE `eshop_sdok`
  ADD CONSTRAINT `eshop_sdok_ibfk_1` FOREIGN KEY (`idgoods`) REFERENCES `eshop_goods` (`idgoods`) ON DELETE CASCADE ON UPDATE CASCADE;
