-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Generation Time: Jun 15, 2022 at 05:37 AM
-- Server version: 5.7.38
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `globalsight`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(40) NOT NULL,
  `DISPLAY_NAME` varchar(40) NOT NULL,
  `COMPANY_ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(4000) DEFAULT NULL,
  `IS_ACTIVE` char(1) NOT NULL,
  `USE_TYPE` varchar(20) NOT NULL,
  `TYPE` varchar(20) NOT NULL,
  `IS_EDITABLE` char(1) DEFAULT NULL,
  `QA_CHECKS` char(1) DEFAULT 'N',
  `RUN_DITA_QA_CHECKS` char(1) DEFAULT 'N',
  `AUTO_COMPLETE_ACTIVITY` char(1) NOT NULL DEFAULT 'N',
  `COMPLETE_TYPE` int(11) DEFAULT '-1',
  `AFTER_JOB_CREATION` varchar(40) DEFAULT NULL,
  `AFTER_JOB_DISPATCH` varchar(40) DEFAULT NULL,
  `AFTER_ACTIVITY_START` varchar(40) DEFAULT NULL,
  `COMPLETE_SCHEDULE` varchar(10000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `adding_source_page`
--

CREATE TABLE `adding_source_page` (
  `ID` bigint(20) NOT NULL,
  `JOB_ID` bigint(20) NOT NULL,
  `L10N_PROFILE_ID` bigint(20) NOT NULL,
  `DATA_SOURCE` varchar(100) NOT NULL,
  `EXTERNAL_PAGE_ID` varchar(750) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `amount_of_work`
--

CREATE TABLE `amount_of_work` (
  `ID` bigint(20) NOT NULL,
  `UOW` char(1) NOT NULL,
  `ESTIMATED_AMOUNT` float NOT NULL,
  `ACTUAL_AMOUNT` float DEFAULT NULL,
  `TASK_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `attribute`
--

CREATE TABLE `attribute` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(40) NOT NULL,
  `DISPLAY_NAME` varchar(40) NOT NULL,
  `DESCRIPTION` varchar(4000) DEFAULT NULL,
  `COMPANY_ID` bigint(20) NOT NULL,
  `VISIBLE` char(1) NOT NULL,
  `EDITABLE` char(1) NOT NULL,
  `REQUIRED` char(1) NOT NULL,
  `CONDITION_ID` bigint(20) NOT NULL,
  `TYPE` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `attribute`
--

INSERT INTO `attribute` (`ID`, `NAME`, `DISPLAY_NAME`, `DESCRIPTION`, `COMPANY_ID`, `VISIBLE`, `EDITABLE`, `REQUIRED`, `CONDITION_ID`, `TYPE`) VALUES
(1000, 'protect_international_cost_center', 'international (non-US) cost center', 'submitter\'s cost center is an international (non-US) cost center or not', 1, 'Y', 'Y', 'Y', 1000, 'choice list'),
(1001, 'protect_cost_center', 'cost center', 'The cost center', 1, 'Y', 'Y', 'N', 1000, 'text');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_clone`
--

CREATE TABLE `attribute_clone` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(40) NOT NULL,
  `DISPLAY_NAME` varchar(40) NOT NULL,
  `DESCRIPTION` varchar(4000) DEFAULT NULL,
  `COMPANY_ID` bigint(20) NOT NULL,
  `VISIBLE` char(1) NOT NULL,
  `EDITABLE` char(1) NOT NULL,
  `REQUIRED` char(1) NOT NULL,
  `CONDITION_ID` bigint(20) NOT NULL,
  `TYPE` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_condition_date`
--

CREATE TABLE `attribute_condition_date` (
  `ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_condition_file`
--

CREATE TABLE `attribute_condition_file` (
  `ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_condition_float`
--

CREATE TABLE `attribute_condition_float` (
  `ID` bigint(20) NOT NULL,
  `MAX` double DEFAULT NULL,
  `MIN` double DEFAULT NULL,
  `DEFINITION` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_condition_int`
--

CREATE TABLE `attribute_condition_int` (
  `ID` bigint(20) NOT NULL,
  `MAX` bigint(20) DEFAULT NULL,
  `MIN` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_condition_list`
--

CREATE TABLE `attribute_condition_list` (
  `ID` bigint(20) NOT NULL,
  `MULTIPLE` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `attribute_condition_list`
--

INSERT INTO `attribute_condition_list` (`ID`, `MULTIPLE`) VALUES
(1000, 'n');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_condition_text`
--

CREATE TABLE `attribute_condition_text` (
  `ID` bigint(20) NOT NULL,
  `LENGTH` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `attribute_condition_text`
--

INSERT INTO `attribute_condition_text` (`ID`, `LENGTH`) VALUES
(1000, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `attribute_set`
--

CREATE TABLE `attribute_set` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(40) DEFAULT NULL,
  `DESCRIPTION` varchar(4000) DEFAULT NULL,
  `COMPANY_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_set_attribute`
--

CREATE TABLE `attribute_set_attribute` (
  `ATTRIBUTE_ID` bigint(20) NOT NULL,
  `SET_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `base_filter`
--

CREATE TABLE `base_filter` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `FILTER_NAME` varchar(255) NOT NULL,
  `FILTER_DESCRIPTION` varchar(4000) DEFAULT NULL,
  `COMPANY_ID` bigint(20) UNSIGNED NOT NULL,
  `CONFIG_XML` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `base_filter_mapping`
--

CREATE TABLE `base_filter_mapping` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `base_filter_id` bigint(20) NOT NULL,
  `filter_table_name` varchar(60) NOT NULL,
  `filter_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calendar`
--

CREATE TABLE `calendar` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(40) NOT NULL,
  `HOURS_PER_DAY` int(2) NOT NULL,
  `TIME_ZONE` varchar(100) NOT NULL,
  `LAST_UPDATED_BY` varchar(80) NOT NULL,
  `COMPANY_ID` bigint(20) NOT NULL,
  `LAST_UPDATED_TIME` datetime NOT NULL,
  `IS_DEFAULT` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `calendar`
--

INSERT INTO `calendar` (`ID`, `NAME`, `HOURS_PER_DAY`, `TIME_ZONE`, `LAST_UPDATED_BY`, `COMPANY_ID`, `LAST_UPDATED_TIME`, `IS_DEFAULT`) VALUES
(1, 'Base Calendar', 8, 'GMT-8:00', 'system', 1, '2022-06-15 05:34:38', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `calendar_holiday`
--

CREATE TABLE `calendar_holiday` (
  `CALENDAR_ID` bigint(20) NOT NULL,
  `HOLIDAY_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `calendar_holiday`
--

INSERT INTO `calendar_holiday` (`CALENDAR_ID`, `HOLIDAY_ID`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `calendar_working_day`
--

CREATE TABLE `calendar_working_day` (
  `ID` bigint(20) NOT NULL,
  `CALENDAR_ID` bigint(20) NOT NULL,
  `WORKING_DAY` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `calendar_working_day`
--

INSERT INTO `calendar_working_day` (`ID`, `CALENDAR_ID`, `WORKING_DAY`) VALUES
(1, 1, 2),
(2, 1, 3),
(3, 1, 4),
(4, 1, 5),
(5, 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `calendar_working_hour`
--

CREATE TABLE `calendar_working_hour` (
  `ID` bigint(20) NOT NULL,
  `CALENDAR_WORKING_DAY_ID` bigint(20) NOT NULL,
  `ORDER_NUM` int(1) NOT NULL,
  `START_HOUR` int(2) NOT NULL,
  `START_MINUTE` int(2) NOT NULL,
  `END_HOUR` int(2) NOT NULL,
  `END_MINUTE` int(2) NOT NULL,
  `DURATION_EXPRESSION` varchar(100) NOT NULL,
  `START_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `calendar_working_hour`
--

INSERT INTO `calendar_working_hour` (`ID`, `CALENDAR_WORKING_DAY_ID`, `ORDER_NUM`, `START_HOUR`, `START_MINUTE`, `END_HOUR`, `END_MINUTE`, `DURATION_EXPRESSION`, `START_DATE`) VALUES
(1, 1, 1, 8, 0, 12, 0, '+4H+0m', '2003-10-27 08:00:00'),
(2, 1, 2, 13, 0, 17, 0, '+4H+0m', '2003-10-27 13:00:00'),
(3, 2, 1, 8, 0, 12, 0, '+4H+0m', '2003-10-28 08:00:00'),
(4, 2, 2, 13, 0, 17, 0, '+4H+0m', '2003-10-28 13:00:00'),
(5, 3, 1, 8, 0, 12, 0, '+4H+0m', '2003-10-29 08:00:00'),
(6, 3, 2, 13, 0, 17, 0, '+4H+0m', '2003-10-29 13:00:00'),
(7, 4, 1, 8, 0, 12, 0, '+4H+0m', '2003-10-30 08:00:00'),
(8, 4, 2, 13, 0, 17, 0, '+4H+0m', '2003-10-30 13:00:00'),
(9, 5, 1, 8, 0, 12, 0, '+4H+0m', '2003-10-31 08:00:00'),
(10, 5, 2, 13, 0, 17, 0, '+4H+0m', '2003-10-31 13:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(200) NOT NULL,
  `MEMO` varchar(200) DEFAULT NULL,
  `TYPE` int(11) DEFAULT '0',
  `COMPANY_ID` bigint(20) NOT NULL,
  `IS_AVAILABLE` char(1) NOT NULL DEFAULT 'Y',
  `IS_ACTIVE` char(1) NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `category_post_review`
--

CREATE TABLE `category_post_review` (
  `ID` bigint(20) NOT NULL,
  `CATEGORY_NAME` varchar(200) DEFAULT NULL,
  `CATEGORY_TYPE` varchar(20) DEFAULT NULL,
  `IS_ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `COMPANY_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `category_scorecard`
--

CREATE TABLE `category_scorecard` (
  `ID` bigint(20) NOT NULL,
  `SCORECARD_CATEGORY` varchar(200) DEFAULT NULL,
  `IS_ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `COMPANY_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `category_segment_comment`
--

CREATE TABLE `category_segment_comment` (
  `ID` bigint(20) NOT NULL,
  `CATEGORY` varchar(200) DEFAULT NULL,
  `COMPANY_ID` bigint(20) NOT NULL,
  `IS_ACTIVE` char(1) NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `code_set`
--

CREATE TABLE `code_set` (
  `CODE_SET` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `code_set`
--

INSERT INTO `code_set` (`CODE_SET`) VALUES
('ASCII'),
('Big5'),
('EUC-CN'),
('EUC-JP'),
('EUC-KR'),
('EUC-TW'),
('GB2312'),
('ISO-2022-CN'),
('ISO-2022-JP'),
('ISO-2022-KR'),
('ISO-8859-1'),
('ISO-8859-15'),
('ISO-8859-2'),
('ISO-8859-3'),
('ISO-8859-4'),
('ISO-8859-5'),
('ISO-8859-6'),
('ISO-8859-7'),
('ISO-8859-8'),
('ISO-8859-9'),
('Johab'),
('KOI8-R'),
('MacArabic'),
('MacCentralEurope'),
('MacCroatian'),
('MacCyrillic'),
('MacGreek'),
('MacHebrew'),
('MacIceland'),
('MacRoman'),
('MacThai'),
('MacTurkish'),
('MacUkraine'),
('Shift_JIS'),
('TIS-620'),
('UTF-16BE'),
('UTF-16LE'),
('UTF-8'),
('Windows-1250'),
('Windows-1251'),
('Windows-1252'),
('Windows-1253'),
('Windows-1254'),
('Windows-1255'),
('Windows-1256'),
('Windows-1257'),
('Windows-1258'),
('Windows-874'),
('Windows-932'),
('Windows-936'),
('Windows-949'),
('Windows-950');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `ID` bigint(20) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `CREATOR_USER_ID` varchar(80) NOT NULL,
  `COMMENT_TEXT` varchar(4000) DEFAULT NULL,
  `COMMENT_OBJECT_ID` bigint(20) NOT NULL,
  `COMMENT_OBJECT_TYPE` char(1) NOT NULL DEFAULT 'T'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(40) NOT NULL,
  `DESCRIPTION` varchar(4000) DEFAULT NULL,
  `IS_ACTIVE` char(1) NOT NULL,
  `ENABLE_IP_FILTER` char(1) DEFAULT 'Y',
  `ENABLE_TM_ACCESS_CONTROL` char(1) DEFAULT 'N',
  `ENABLE_PERPLEXITY` char(1) DEFAULT 'N',
  `ENABLE_TB_ACCESS_CONTROL` char(1) DEFAULT 'N',
  `ENABLE_QA_CHECKS` char(1) DEFAULT 'N',
  `ENABLE_SSO_LOGIN` char(1) NOT NULL DEFAULT 'N',
  `SSO_IDP_URL` varchar(256) DEFAULT NULL,
  `SSO_LOGIN_URL` varchar(256) DEFAULT NULL,
  `SSO_LOGOUT_URL` varchar(256) DEFAULT NULL,
  `SSO_WS_ENDPOINT` varchar(256) DEFAULT NULL,
  `TM_VERSION` smallint(6) NOT NULL DEFAULT '3',
  `SESSION_TIME` varchar(10) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `STATE` varchar(40) DEFAULT NULL,
  `BIG_DATA_STORE_LEVEL` smallint(1) DEFAULT '1',
  `ENABLE_DITA_CHECKS` char(1) DEFAULT 'N',
  `ENABLE_WORKFLOW_STATE_POSTS` char(1) DEFAULT 'N',
  `ENABLE_BLANK_TM_SEARCH` char(1) DEFAULT 'N',
  `MIGRATE_PROCESSING` int(11) DEFAULT '0',
  `DISABLE_UPLOAD_FILE_TYPES` varchar(400) DEFAULT NULL,
  `ENABLE_STRONG_PASSWORD` char(1) DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`ID`, `NAME`, `DESCRIPTION`, `IS_ACTIVE`, `ENABLE_IP_FILTER`, `ENABLE_TM_ACCESS_CONTROL`, `ENABLE_PERPLEXITY`, `ENABLE_TB_ACCESS_CONTROL`, `ENABLE_QA_CHECKS`, `ENABLE_SSO_LOGIN`, `SSO_IDP_URL`, `SSO_LOGIN_URL`, `SSO_LOGOUT_URL`, `SSO_WS_ENDPOINT`, `TM_VERSION`, `SESSION_TIME`, `EMAIL`, `STATE`, `BIG_DATA_STORE_LEVEL`, `ENABLE_DITA_CHECKS`, `ENABLE_WORKFLOW_STATE_POSTS`, `ENABLE_BLANK_TM_SEARCH`, `MIGRATE_PROCESSING`, `DISABLE_UPLOAD_FILE_TYPES`, `ENABLE_STRONG_PASSWORD`) VALUES
(1, 'Welocalize', 'Super company', 'Y', 'Y', 'N', 'N', 'N', 'N', 'N', '', '', '', '', 3, NULL, 'WelocalizeAdmin@domain.com', NULL, 1, 'N', 'N', 'N', 0, NULL, 'N');

-- --------------------------------------------------------

--
-- Table structure for table `connector_blaise`
--

CREATE TABLE `connector_blaise` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(300) NOT NULL,
  `DESCRIPTION` varchar(300) DEFAULT NULL,
  `URL` varchar(300) NOT NULL,
  `USER_NAME` varchar(300) NOT NULL,
  `PASSWORD` varchar(300) NOT NULL,
  `CLIENT_CORE_VERSION` varchar(30) NOT NULL,
  `CLIENT_CORE_REVISION` smallint(6) DEFAULT '0',
  `WORKFLOW_ID` varchar(30) DEFAULT 'TRANSLATION',
  `IS_ACTIVE` char(1) NOT NULL,
  `COMPANY_ID` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `connector_blaise_job`
--

CREATE TABLE `connector_blaise_job` (
  `ID` bigint(20) NOT NULL,
  `BLAISE_CONNECTOR_ID` bigint(20) DEFAULT NULL,
  `BLAISE_ENTRY_ID` bigint(20) DEFAULT NULL,
  `JOB_ID` bigint(20) DEFAULT NULL,
  `UPLOAD_XLF_STATE` varchar(20) DEFAULT NULL,
  `COMPLETE_STATE` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `connector_coti_document`
--

CREATE TABLE `connector_coti_document` (
  `ID` bigint(20) NOT NULL,
  `PROJECT_ID` bigint(20) NOT NULL,
  `IS_TRANSLATION` char(1) NOT NULL DEFAULT 'Y',
  `IS_EXTERNAL` char(1) NOT NULL DEFAULT 'Y',
  `FILE_REF` varchar(200) NOT NULL,
  `ENCODING` varchar(40) DEFAULT NULL,
  `MIME_TYPE` varchar(80) DEFAULT NULL,
  `FILE_TYPE` varchar(40) DEFAULT NULL,
  `CREATION_DATE` varchar(40) DEFAULT NULL,
  `DESCRIPTION` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `connector_coti_package`
--

CREATE TABLE `connector_coti_package` (
  `ID` bigint(20) NOT NULL,
  `FILE_NAME` varchar(200) DEFAULT NULL,
  `COTI_PROJECT_NAME` varchar(200) DEFAULT NULL,
  `COTI_PROJECT_TIMESTAMP` varchar(40) DEFAULT NULL,
  `CREATION_DATE` datetime NOT NULL,
  `COMPANY_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `connector_coti_project`
--

CREATE TABLE `connector_coti_project` (
  `ID` bigint(20) NOT NULL,
  `COTI_PROJECT_ID` varchar(100) DEFAULT NULL,
  `COTI_PROJECT_NAME` varchar(200) DEFAULT NULL,
  `SOURCE_LANG` varchar(40) DEFAULT NULL,
  `TARGET_LANG` varchar(40) DEFAULT NULL,
  `DIR_NAME` varchar(200) NOT NULL,
  `PACKAGE_ID` bigint(20) NOT NULL,
  `GLOBALSIGHT_JOB_ID` bigint(20) DEFAULT NULL,
  `STATUS` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `connector_eloqua`
--

CREATE TABLE `connector_eloqua` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(300) NOT NULL,
  `COMPANY_ID` bigint(20) UNSIGNED NOT NULL,
  `COMPANY` varchar(300) NOT NULL,
  `USER_NAME` varchar(300) NOT NULL,
  `PASSWORD` varchar(300) NOT NULL,
  `DESCRIPTION` varchar(4000) DEFAULT NULL,
  `URL` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `connector_git`
--

CREATE TABLE `connector_git` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(300) NOT NULL,
  `DESCRIPTION` varchar(4000) DEFAULT NULL,
  `URL` varchar(300) NOT NULL,
  `USER_NAME` varchar(300) NOT NULL,
  `PASSWORD` varchar(300) NOT NULL,
  `EMAIL` varchar(300) NOT NULL,
  `PRIVATE_KEY_FILE` varchar(300) NOT NULL,
  `BRANCH` varchar(100) DEFAULT 'master',
  `IS_ACTIVE` char(1) NOT NULL,
  `COMPANY_ID` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `connector_git_cache_file`
--

CREATE TABLE `connector_git_cache_file` (
  `ID` bigint(20) NOT NULL,
  `FILE_PATH` varchar(300) NOT NULL,
  `GIT_CONNECTOR_ID` bigint(20) DEFAULT NULL,
  `SRC_FILE_PATH` varchar(300) NOT NULL,
  `DST_FILE_PATH` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `connector_git_file_mapping`
--

CREATE TABLE `connector_git_file_mapping` (
  `ID` bigint(20) NOT NULL,
  `SOURCE_LOCALE` varchar(30) NOT NULL,
  `SOURCE_MAPPING_PATH` varchar(300) NOT NULL,
  `TARGET_LOCALE` varchar(30) NOT NULL,
  `TARGET_MAPPING_PATH` varchar(300) NOT NULL,
  `GIT_CONNECTOR_ID` bigint(20) DEFAULT NULL,
  `PARENT_ID` bigint(20) DEFAULT NULL,
  `IS_ACTIVE` char(1) NOT NULL,
  `COMPANY_ID` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `connector_git_job`
--

CREATE TABLE `connector_git_job` (
  `ID` bigint(20) NOT NULL,
  `GIT_CONNECTOR_ID` bigint(20) DEFAULT NULL,
  `JOB_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `container_role`
--

CREATE TABLE `container_role` (
  `id` bigint(20) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `STATE` bigint(20) DEFAULT NULL,
  `ACTIVITY_ID` bigint(20) DEFAULT NULL,
  `SOURCE_LOCALE` varchar(100) DEFAULT NULL,
  `TARGET_LOCALE` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `container_role_rate`
--

CREATE TABLE `container_role_rate` (
  `ROLE_ID` bigint(20) NOT NULL,
  `RATE_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `container_role_user_ids`
--

CREATE TABLE `container_role_user_ids` (
  `ROLE_ID` bigint(20) NOT NULL,
  `USER_ID` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cost`
--

CREATE TABLE `cost` (
  `ID` bigint(20) NOT NULL,
  `COSTABLE_OBJECT_ID` int(11) NOT NULL,
  `COSTABLE_OBJECT_TYPE` char(1) DEFAULT NULL,
  `RATE_TYPE` char(1) DEFAULT NULL,
  `ESTIMATED_COST` float NOT NULL,
  `NO_USE_ESTIMATED_COST` float NOT NULL,
  `DEFAULT_CONTEXT_ESTIMATED_COST` float NOT NULL,
  `ACTUAL_COST` float DEFAULT NULL,
  `FINAL_COST` float DEFAULT NULL,
  `OVERRIDE_COST` float DEFAULT NULL,
  `CURRENCY_CONVERSION_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cost_by_word_count`
--

CREATE TABLE `cost_by_word_count` (
  `ID` bigint(20) NOT NULL,
  `COST_ID` bigint(20) NOT NULL,
  `REPETITION_COST` float NOT NULL,
  `EXACT_CONTEXT_COST` float NOT NULL,
  `EXACT_SEGMENT_TM_COST` float NOT NULL,
  `FUZZY_LOW_COST` float NOT NULL,
  `FUZZY_MED_COST` float NOT NULL,
  `FUZZY_MED_HI_COST` float NOT NULL,
  `FUZZY_HI_COST` float NOT NULL,
  `NO_MATCH_COST` float NOT NULL,
  `IN_CONTEXT_COST` float NOT NULL,
  `NO_USE_IN_CONTEXT_COST` float NOT NULL,
  `NO_USE_EXACT_COST` float NOT NULL,
  `DEFAULT_CONTEXT_EXACT_COST` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `ISO_COUNTRY_CODE` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`ISO_COUNTRY_CODE`) VALUES
('AE'),
('AL'),
('AR'),
('AT'),
('AU'),
('AZ'),
('BE'),
('BG'),
('BH'),
('BN'),
('BO'),
('BR'),
('BY'),
('CA'),
('CH'),
('CL'),
('CN'),
('CO'),
('CR'),
('CZ'),
('DE'),
('DK'),
('DO'),
('DZ'),
('EC'),
('EE'),
('EG'),
('EI'),
('EM'),
('ES'),
('FI'),
('FR'),
('GB'),
('GR'),
('GT'),
('HK'),
('HN'),
('HR'),
('HU'),
('ID'),
('IE'),
('IL'),
('IN'),
('IQ'),
('IS'),
('IT'),
('JO'),
('JP'),
('KR'),
('KW'),
('LB'),
('LT'),
('LV'),
('LY'),
('MA'),
('MK'),
('MT'),
('MX'),
('NI'),
('NL'),
('NO'),
('NZ'),
('OM'),
('PA'),
('PE'),
('PL'),
('PR'),
('PT'),
('PY'),
('QA'),
('RO'),
('RU'),
('SA'),
('SD'),
('SE'),
('SI'),
('SK'),
('SV'),
('SY'),
('TH'),
('TN'),
('TR'),
('TW'),
('UA'),
('US'),
('UY'),
('VE'),
('VN'),
('YE'),
('YU'),
('ZA');

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(40) NOT NULL,
  `ISO_CURRENCY_CODE` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`ID`, `NAME`, `ISO_CURRENCY_CODE`) VALUES
(1, 'Andorran Peseta', 'ADP'),
(2, 'Uae Dirham', 'AED'),
(3, 'Afghan Afghani', 'AFA'),
(4, 'Albanian Lek', 'ALL'),
(5, 'Armenian Dram', 'AMD'),
(6, 'Netherlands Antillean Guilder', 'ANG'),
(7, 'Angolan Kwanza', 'AOA'),
(8, 'Argentine Peso', 'ARS'),
(9, 'Austrian Schilling', 'ATS'),
(10, 'Australian Dollar', 'AUD'),
(11, 'Aruban Guilder', 'AWG'),
(12, 'Azerbaijani Manat', 'AZM'),
(13, 'Bosnia-Herzegovina Convertible Marks', 'BAM'),
(14, 'Barbados Dollar', 'BBD'),
(15, 'Bangladeshi Taka', 'BDT'),
(16, 'Belgian Franc', 'BEF'),
(17, 'Bulgarian Lev', 'BGL'),
(18, 'Bulgarian Lev', 'BGN'),
(19, 'Bahraini Dinar', 'BHD'),
(20, 'Burundi Franc', 'BIF'),
(21, 'Bermuda Dollar', 'BMD'),
(22, 'Brunei Dollar', 'BND'),
(23, 'Bolivian Boliviano', 'BOB'),
(24, 'Brazilian Real', 'BRL'),
(25, 'Bahaman Dollar', 'BSD'),
(26, 'Bhutanese Ngultrum', 'BTN'),
(27, 'Botswanan Pula', 'BWP'),
(28, 'Belarus Rouble', 'BYR'),
(29, 'Belize Dollar', 'BZD'),
(30, 'Canadian Dollar', 'CAD'),
(31, 'Franc Congolais', 'CDF'),
(32, 'Swiss Franc', 'CHF'),
(33, 'Chilean Peso', 'CLP'),
(34, 'Chinese Renminbi-Yuan', 'CNY'),
(35, 'Columbian Peso', 'COP'),
(36, 'Costa Rican Colon', 'CRC'),
(37, 'Cuban Peso', 'CUP'),
(38, 'Cape Verde Escudo', 'CVE'),
(39, 'Cyprus Pound', 'CYP'),
(40, 'Czech Koruna', 'CZK'),
(41, 'German Mark', 'DEM'),
(42, 'Dijibouti Franc', 'DJF'),
(43, 'Danish Krone', 'DKK'),
(44, 'Dominican Peso', 'DOP'),
(45, 'Algerian Dinar', 'DZD'),
(46, 'Estonian Kroon', 'EEK'),
(47, 'Egyptian Pound', 'EGP'),
(48, 'Eriterean Nakfa', 'ERN'),
(49, 'Spanish Peseta', 'ESP'),
(50, 'Ethiopian Birr', 'ETB'),
(51, 'Euro', 'EUR'),
(52, 'Finnish Markka', 'FIM'),
(53, 'Fiji Dollar', 'FJD'),
(54, 'Falkland Islands Pound', 'FKP'),
(55, 'French Franc', 'FRF'),
(56, 'Pound Sterling', 'GBP'),
(57, 'Georgian Lari', 'GEL'),
(58, 'Ghanaian Cedi', 'GHC'),
(59, 'Gibraltar Pound', 'GIP'),
(60, 'Gambian Dalasi', 'GMD'),
(61, 'Guinean Franc', 'GNF'),
(62, 'Greek Drachma', 'GRD'),
(63, 'Guatemalan Quetzal', 'GTQ'),
(64, 'Guinea-Bissau Peso', 'GWP'),
(65, 'Guyanese Dollar', 'GYD'),
(66, 'Hong Kong Dollar', 'HKD'),
(67, 'Honduran Lempira', 'HNL'),
(68, 'Croatian Kuna', 'HRK'),
(69, 'Haitian Gourde', 'HTG'),
(70, 'Hungarian Forint', 'HUF'),
(71, 'Indonesian Rupiah', 'IDR'),
(72, 'Irish Punt', 'IEP'),
(73, 'Israeli New Shekel', 'ILS'),
(74, 'Indian Rupee', 'INR'),
(75, 'Iraqi Dinar', 'IQD'),
(76, 'Iranian Rial', 'IRR'),
(77, 'Icelandic Krona', 'ISK'),
(78, 'Italian Lira', 'ITL'),
(79, 'Jamaican Dollar', 'JMD'),
(80, 'Jordanian Dinar', 'JOD'),
(81, 'Japanese Yen', 'JPY'),
(82, 'Kenyan Shilling', 'KES'),
(83, 'Kyrgyz Som', 'KGS'),
(84, 'Cambodian Riel', 'KHR'),
(85, 'Comorian Franc', 'KMF'),
(86, 'North Korean Won', 'KPW'),
(87, 'South Korean Won', 'KRW'),
(88, 'Kuwaiti Dinar', 'KWD'),
(89, 'Cayman Islands Dollar', 'KYD'),
(90, 'Kazakh Tenge', 'KZT'),
(91, 'Laotian Kip', 'LAK'),
(92, 'Lebanese Pound', 'LBP'),
(93, 'Sri Lankan Rupee', 'LKR'),
(94, 'Liberian Dollar', 'LRD'),
(95, 'Lesotho Loti', 'LSL'),
(96, 'Lithuanian Litas', 'LTL'),
(97, 'Luxembourg Franc', 'LUF'),
(98, 'Latvian Lat', 'LVL'),
(99, 'Libyan Dinar', 'LYD'),
(100, 'Moroccan Dirham', 'MAD'),
(101, 'Moldovan Leu', 'MDL'),
(102, 'Malagasy Franc', 'MGF'),
(103, 'Macedonian Denar', 'MKD'),
(104, 'Burmese Kyat', 'MMK'),
(105, 'Mongolian Tugrik', 'MNT'),
(106, 'Macanese Pataca', 'MOP'),
(107, 'Mauritanian Ouguiya', 'MRO'),
(108, 'Maltese Lira', 'MTL'),
(109, 'Mauritian Rupee', 'MUR'),
(110, 'Maldives Rufiyaa', 'MVR'),
(111, 'Malawian Kwacha', 'MWK'),
(112, 'Mexican Peso', 'MXN'),
(113, 'Malaysian Ringgit', 'MYR'),
(114, 'Mozambican Metical', 'MZM'),
(115, 'Namibia Dollar', 'NAD'),
(116, 'Nigerian Naira', 'NGN'),
(117, 'Nicaraguan Cordoba', 'NIO'),
(118, 'Dutch Guilder', 'NLG'),
(119, 'Norwegian Krone', 'NOK'),
(120, 'Nepalese Rupee', 'NPR'),
(121, 'New Zealand Dollar', 'NZD'),
(122, 'Omani Rial', 'OMR'),
(123, 'Panamanian Balboa', 'PAB'),
(124, 'Peruvian New Sol', 'PEN'),
(125, 'Papua New Guinean Kina', 'PGK'),
(126, 'Philippine Peso', 'PHP'),
(127, 'Pakistani Rupee', 'PKR'),
(128, 'Polish Zloty', 'PLN'),
(129, 'Portuguese Escudo', 'PTE'),
(130, 'Paraguayan Guarani', 'PYG'),
(131, 'Qatari Riyal', 'QAR'),
(132, 'Romanian Leu', 'ROL'),
(133, 'Russian New Rouble', 'RUB'),
(134, 'Russian Ruble', 'RUR'),
(135, 'Rwandese Franc', 'RWF'),
(136, 'Saudi Riyal', 'SAR'),
(137, 'Solomon Islands Dollar', 'SBD'),
(138, 'Seychelles Rupee', 'SCR'),
(139, 'Sudanese Dinar', 'SDD'),
(140, 'Swedish Krona', 'SEK'),
(141, 'Singaporean Dollar', 'SGD'),
(142, 'Saint Helena Pound', 'SHP'),
(143, 'Slovenian Tolar', 'SIT'),
(144, 'Slovakian Koruna', 'SKK'),
(145, 'Sierra Leonean Leone', 'SLL'),
(146, 'Somali Shilling', 'SOS'),
(147, 'Surinam Guilder', 'SRG'),
(148, 'Sao Tomean Dobra', 'STD'),
(149, 'Salvadorian Colon', 'SVC'),
(150, 'Syrian Pound', 'SYP'),
(151, 'Swazi Lilangeni', 'SZL'),
(152, 'Thai Baht', 'THB'),
(153, 'Tajikstan Somoni', 'TJS'),
(154, 'Turmken Manat', 'TMM'),
(155, 'Tunisian Dinar', 'TND'),
(156, 'Tongan Paanga', 'TOP'),
(157, 'Timor Escudo', 'TPE'),
(158, 'Turkish Lira', 'TRL'),
(159, 'Trinidad And Tobago Dollar', 'TTD'),
(160, 'New Taiwan Dollar', 'TWD'),
(161, 'Tansanian Shilling', 'TZS'),
(162, 'Ukrainian Hryvnia', 'UAH'),
(163, 'Ugandan Shilling', 'UGX'),
(164, 'US Dollar', 'USD'),
(165, 'Uruguayan Peso', 'UYU'),
(166, 'Uzbek Sum', 'UZS'),
(167, 'Venezuelan Bolivar', 'VEB'),
(168, 'Vietnamese Dong', 'VND'),
(169, 'Vanuatuan Vatu', 'VUV'),
(170, 'Samoa Tala', 'WST'),
(171, 'Cfa Franc Beac', 'XAF'),
(172, 'Eastern Caribbean Dollar', 'XCD'),
(173, 'Cfa Franc Bceao', 'XOF'),
(174, 'French Pacific Island Franc', 'XPF'),
(175, 'Yemeni Rial', 'YER'),
(176, 'Yugoslavian Dinar', 'YUM'),
(177, 'South African Rand', 'ZAR'),
(178, 'Zambian Kwacha', 'ZMK'),
(179, 'Zimbabwe Dollar', 'ZWD');

-- --------------------------------------------------------

--
-- Table structure for table `currency_conversion`
--

CREATE TABLE `currency_conversion` (
  `ID` bigint(20) NOT NULL,
  `CURRENCY_ID` bigint(20) NOT NULL,
  `CONVERSION_FACTOR` float NOT NULL,
  `COMPANY_ID` bigint(20) NOT NULL,
  `IS_ACTIVE` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `currency_conversion`
--

INSERT INTO `currency_conversion` (`ID`, `CURRENCY_ID`, `CONVERSION_FACTOR`, `COMPANY_ID`, `IS_ACTIVE`) VALUES
(1000, 164, 1, 1, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `custom_field`
--

CREATE TABLE `custom_field` (
  `ID` bigint(20) NOT NULL,
  `FIELD_KEY` varchar(201) NOT NULL,
  `FIELD_VALUE` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `custom_form`
--

CREATE TABLE `custom_form` (
  `ID` bigint(20) NOT NULL,
  `PAGE_NAME` varchar(30) NOT NULL,
  `MODIFIER_USER_ID` varchar(80) NOT NULL,
  `MODIFIED_DATE` datetime NOT NULL,
  `FORM_XML` text,
  `LOCALE_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cvs_file_profile`
--

CREATE TABLE `cvs_file_profile` (
  `ID` bigint(20) NOT NULL,
  `PROJECT_ID` bigint(20) NOT NULL,
  `MODULE_ID` bigint(20) NOT NULL,
  `FILE_PATH` varchar(1000) DEFAULT NULL,
  `FILE_EXT` varchar(100) DEFAULT NULL,
  `FILE_PROFILE_ID` bigint(20) NOT NULL,
  `SOURCE_LOCALE` varchar(40) DEFAULT NULL,
  `COMPANY_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cvs_module`
--

CREATE TABLE `cvs_module` (
  `ID` bigint(20) NOT NULL,
  `SERVER` bigint(20) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `MODULENAME` varchar(2000) NOT NULL,
  `REALPATH` varchar(2000) DEFAULT NULL,
  `BRANCH` varchar(100) DEFAULT 'HEAD',
  `LAST_CHECKOUT` varchar(50) DEFAULT NULL,
  `ISACTIVE` char(1) NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cvs_repository`
--

CREATE TABLE `cvs_repository` (
  `ID` bigint(20) NOT NULL,
  `SERVER` bigint(20) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `REPOSITORY` varchar(100) NOT NULL,
  `FOLDERNAME` varchar(100) NOT NULL,
  `LOGINUSER` varchar(100) NOT NULL,
  `LOGINPWD` varchar(32) NOT NULL,
  `CVSROOTENV` varchar(1000) NOT NULL,
  `ISACTIVE` char(1) NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cvs_server`
--

CREATE TABLE `cvs_server` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(200) NOT NULL,
  `HOSTIP` varchar(100) NOT NULL,
  `HOSTPORT` int(11) DEFAULT '2401',
  `PROTOCOL` int(11) NOT NULL DEFAULT '0',
  `SANDBOX` varchar(100) NOT NULL,
  `COMPANYID` bigint(20) NOT NULL,
  `REPOSITORY` varchar(200) NOT NULL,
  `LOGINUSER` varchar(100) NOT NULL,
  `LOGINPWD` varchar(32) NOT NULL,
  `CVSROOTENV` varchar(1000) NOT NULL,
  `ISACTIVE` char(1) NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cvs_server_user`
--

CREATE TABLE `cvs_server_user` (
  `ID` bigint(20) NOT NULL,
  `SERVER` bigint(20) NOT NULL,
  `USERNAME` varchar(200) NOT NULL,
  `LOGINNAME` varchar(200) NOT NULL,
  `PASSWORD` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cvs_source_files`
--

CREATE TABLE `cvs_source_files` (
  `ID` bigint(20) NOT NULL,
  `JOB_NAME` varchar(100) NOT NULL,
  `FILENAME` varchar(2000) NOT NULL,
  `STATUS` int(11) NOT NULL DEFAULT '0',
  `JOB_ID` bigint(20) DEFAULT NULL,
  `MODULE_ID` bigint(20) NOT NULL,
  `JOB_NOTES` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `delayed_import_request`
--

CREATE TABLE `delayed_import_request` (
  `ID` bigint(20) NOT NULL,
  `GXML` text,
  `EXTERNAL_PAGE_ID` varchar(750) NOT NULL,
  `PREVIOUS_PAGE_ID` bigint(20) NOT NULL,
  `DATA_SOURCE_TYPE` varchar(20) DEFAULT NULL,
  `ORIGINAL_ENCODING` varchar(30) DEFAULT NULL,
  `REIMPORT_TIME` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exportbatch_workflow`
--

CREATE TABLE `exportbatch_workflow` (
  `EXPORT_BATCH_ID` bigint(20) NOT NULL,
  `WORKFLOW_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exporting_page`
--

CREATE TABLE `exporting_page` (
  `ID` bigint(20) NOT NULL,
  `PAGE_ID` int(11) NOT NULL,
  `PAGE_TYPE` varchar(20) NOT NULL,
  `EXPORT_BATCH_ID` bigint(20) NOT NULL,
  `STATE` varchar(20) NOT NULL,
  `ERROR_MESSAGE` text,
  `END_TIME` bigint(20) DEFAULT NULL,
  `EXPORT_PATH` varchar(4000) DEFAULT NULL,
  `IS_COMPONENT_PAGE` char(1) NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `export_batch_event`
--

CREATE TABLE `export_batch_event` (
  `ID` bigint(20) NOT NULL,
  `JOB_ID` bigint(20) NOT NULL,
  `TASK_ID` bigint(20) DEFAULT NULL,
  `RESPONSIBLE_USER_ID` varchar(80) NOT NULL,
  `EXPORT_TYPE` varchar(20) NOT NULL,
  `START_TIME` bigint(20) NOT NULL,
  `END_TIME` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `export_location`
--

CREATE TABLE `export_location` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(40) NOT NULL,
  `DESCRIPTION` varchar(4000) DEFAULT NULL,
  `LOCATION` varchar(4000) DEFAULT NULL,
  `COMPANY_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `export_location`
--

INSERT INTO `export_location` (`ID`, `NAME`, `DESCRIPTION`, `LOCATION`, `COMPANY_ID`) VALUES
(1, 'CXE Docs Dir', 'The CXE Document Dir', '/home/jboss/globalsight/docs', 1);

-- --------------------------------------------------------

--
-- Table structure for table `extension`
--

CREATE TABLE `extension` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(40) NOT NULL,
  `COMPANY_ID` bigint(20) NOT NULL,
  `IS_ACTIVE` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `extension`
--

INSERT INTO `extension` (`ID`, `NAME`, `COMPANY_ID`, `IS_ACTIVE`) VALUES
(1, 'htm', 1, 'Y'),
(2, 'html', 1, 'Y'),
(6, 'txt', 1, 'Y'),
(8, 'js', 1, 'Y'),
(9, 'properties', 1, 'Y'),
(13, 'jsp', 1, 'Y'),
(14, 'xml', 1, 'Y'),
(15, 'doc', 1, 'Y'),
(16, 'xls', 1, 'Y'),
(17, 'ppt', 1, 'Y'),
(18, 'fm', 1, 'Y'),
(21, 'java', 1, 'Y'),
(23, 'indd', 1, 'Y'),
(25, 'rtf', 1, 'Y'),
(26, 'docx', 1, 'Y'),
(27, 'pptx', 1, 'Y'),
(28, 'xlsx', 1, 'Y'),
(29, 'inx', 1, 'Y'),
(30, 'xlf', 1, 'Y'),
(31, 'xliff', 1, 'Y'),
(32, 'odt', 1, 'Y'),
(33, 'ods', 1, 'Y'),
(34, 'odp', 1, 'Y'),
(35, 'po', 1, 'Y'),
(36, 'rc', 1, 'Y'),
(37, 'resx', 1, 'Y'),
(38, 'idml', 1, 'Y'),
(39, 'xlz', 1, 'Y'),
(40, 'mif', 1, 'Y'),
(41, 'lpu', 1, 'Y'),
(42, 'exe', 1, 'Y'),
(43, 'dll', 1, 'Y'),
(44, 'json', 1, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `file_profile`
--

CREATE TABLE `file_profile` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(60) NOT NULL,
  `DESCRIPTION` varchar(4000) DEFAULT NULL,
  `KNOWN_FORMAT_TYPE_ID` bigint(20) NOT NULL,
  `CODE_SET` varchar(30) DEFAULT NULL,
  `XML_DTD_ID` bigint(20) DEFAULT NULL,
  `L10N_PROFILE_ID` bigint(20) NOT NULL,
  `DEFAULT_EXPORT_STF` char(1) NOT NULL,
  `TIMESTAMP` datetime NOT NULL,
  `IS_ACTIVE` char(1) NOT NULL,
  `FILTER_ID` int(11) DEFAULT '-2',
  `FILTER_TABLE_NAME` varchar(45) DEFAULT NULL,
  `QA_FILTER_ID` bigint(20) DEFAULT NULL,
  `COMPANYID` bigint(20) NOT NULL,
  `SCRIPT_ON_IMPORT` varchar(400) DEFAULT NULL,
  `SCRIPT_ON_EXPORT` varchar(400) DEFAULT NULL,
  `NEW_ID` bigint(20) DEFAULT NULL,
  `TERMINOLOGY_APPROVAL` int(1) DEFAULT '0',
  `XLF_SOURCE_AS_UNTRANSLATED_TARGET` int(1) DEFAULT '0',
  `REFERENCE_FP` bigint(20) DEFAULT '0',
  `BOM_TYPE` smallint(6) DEFAULT '0',
  `EOL_ENCODING` smallint(6) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `file_profile_extension`
--

CREATE TABLE `file_profile_extension` (
  `FILE_PROFILE_ID` bigint(20) NOT NULL,
  `EXTENSION_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `file_value_item`
--

CREATE TABLE `file_value_item` (
  `ID` bigint(20) NOT NULL,
  `PATH` varchar(300) DEFAULT NULL,
  `JOB_ATTRIBUTE_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `filter_configuration`
--

CREATE TABLE `filter_configuration` (
  `ID` int(10) UNSIGNED NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `KNOWN_FORMAT_ID` varchar(250) NOT NULL,
  `FILTER_TABLE_NAME` varchar(60) NOT NULL,
  `FILTER_DESCRIPTION` varchar(4000) DEFAULT NULL,
  `COMPANY_ID` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `filter_configuration`
--

INSERT INTO `filter_configuration` (`ID`, `NAME`, `KNOWN_FORMAT_ID`, `FILTER_TABLE_NAME`, `FILTER_DESCRIPTION`, `COMPANY_ID`) VALUES
(1, 'Java Properties Filter', '|4|10|11|', 'java_properties_filter', 'The filter for java properties files.', 1),
(2, 'Java Script Filter', '|5|', 'java_script_filter', 'The filter for java script files.', 1),
(3, 'MS Office Doc Filter', '|14|33|', 'ms_office_doc_filter', 'The filter for MS office doc files.', 1),
(4, 'XML Filter', '|7|15|16|17|25|45|', 'xml_rule_filter', 'The filter for XML files.', 1),
(5, 'MS Office Excel Filter', '|19|34|', 'ms_office_excel_filter', 'The filter for MS excel files.', 1),
(6, 'HTML Filter', '|1|', 'html_filter', 'The filter for HTML files.', 1),
(7, 'JSP Filter', '|13|', 'jsp_filter', 'The filter for JSP files.', 1),
(8, 'InDesign Filter', '|31|36|37|38|40|52|', 'indd_filter', 'The filter for InDesign files.', 1),
(9, 'OpenOffice Filter', '|41|', 'openoffice_filter', 'The filter for OpenOffice files.', 1),
(10, 'MS Office PowerPoint Filter', '|20|35|', 'ms_office_ppt_filter', 'The filter for MS PowerPoint files.', 1),
(11, 'MS Office 2010 Filter', '|43|', 'office2010_filter', 'The filter for MS Office 2010 files.', 1),
(12, 'Portable Object Filter', '|42|', 'po_filter', 'The filter for Portable Object files.', 1),
(13, 'Base Text Filter', '|0|', 'base_filter', 'The filter to handle extracted text.', 1),
(14, 'Plain Text Filter', '|6|', 'plain_text_filter', 'The filter for Plain Text files.', 1),
(15, 'QA Filter', '|0|', 'qa_filter', 'The filter to handle QA checks.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `filter_json`
--

CREATE TABLE `filter_json` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `FILTER_NAME` varchar(255) NOT NULL,
  `FILTER_DESCRIPTION` varchar(400) DEFAULT NULL,
  `ENABLE_SID_SUPPORT` char(1) NOT NULL,
  `ELEMENT_POST_FILTER_ID` bigint(20) DEFAULT NULL,
  `ELEMENT_POST_FILTER_TABLE_NAME` varchar(100) DEFAULT NULL,
  `BASE_FILTER_ID` bigint(20) DEFAULT NULL,
  `COMPANY_ID` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `flux_gs_map`
--

CREATE TABLE `flux_gs_map` (
  `ID` varchar(128) NOT NULL,
  `EVENT_TYPE` int(2) NOT NULL,
  `DOMAIN_OBJ_ID` int(11) NOT NULL,
  `DOMAIN_OBJ_TYPE` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `flux_gs_map_event_type`
--

CREATE TABLE `flux_gs_map_event_type` (
  `ID` int(2) NOT NULL,
  `NAME` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `flux_gs_map_object_type`
--

CREATE TABLE `flux_gs_map_object_type` (
  `ID` int(2) NOT NULL,
  `NAME` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `frame_maker_filter`
--

CREATE TABLE `frame_maker_filter` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `FILTER_NAME` varchar(255) NOT NULL,
  `FILTER_DESCRIPTION` varchar(2000) DEFAULT NULL,
  `COMPANY_ID` bigint(20) UNSIGNED NOT NULL,
  `TRANSLATE_FOOT_NOTE` char(1) NOT NULL DEFAULT 'Y',
  `TRANSLATE_LEFT_MASTER_PAGE` char(1) NOT NULL DEFAULT 'N',
  `TRANSLATE_RIGHT_MASTER_PAGE` char(1) NOT NULL DEFAULT 'N',
  `TRANSLATE_OTHER_MASTER_PAGE` char(1) NOT NULL DEFAULT 'N',
  `IS_TOC_TRANSLATE` char(1) NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `holiday`
--

CREATE TABLE `holiday` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(40) NOT NULL,
  `DESCRIPTION` varchar(4000) DEFAULT NULL,
  `TIME_EXPRESSION` varchar(100) NOT NULL,
  `COMPANY_ID` bigint(20) NOT NULL,
  `MONTH` int(2) NOT NULL,
  `DAY_OF_MONTH` int(2) DEFAULT NULL,
  `WEEK_OF_MONTH` char(1) DEFAULT NULL,
  `DAY_OF_WEEK` int(1) DEFAULT NULL,
  `ENDING_YEAR` int(4) DEFAULT NULL,
  `IS_ABSOLUTE` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `holiday`
--

INSERT INTO `holiday` (`ID`, `NAME`, `DESCRIPTION`, `TIME_EXPRESSION`, `COMPANY_ID`, `MONTH`, `DAY_OF_MONTH`, `WEEK_OF_MONTH`, `DAY_OF_WEEK`, `ENDING_YEAR`, `IS_ABSOLUTE`) VALUES
(1, 'Christmas Day', '', '0 0 0 0 25 11', 1, 11, 25, NULL, NULL, NULL, 'Y'),
(2, 'New Year\'s Day', '', '0 0 0 0 1 0', 1, 0, 1, NULL, NULL, NULL, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `html_filter`
--

CREATE TABLE `html_filter` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `FILTER_NAME` varchar(255) NOT NULL,
  `FILTER_DESCRIPTION` varchar(4000) DEFAULT NULL,
  `EMBEDDABLE_TAGS` varchar(4000) NOT NULL,
  `PLACEHOLD_TRIMMING` varchar(255) NOT NULL,
  `COMPANY_ID` bigint(20) NOT NULL,
  `DEFAULT_EMBEDDABLE_TAGS` varchar(4000) NOT NULL,
  `CONVERT_HTML_ENTRY` char(1) NOT NULL DEFAULT 'N',
  `IGNORE_INVALIDE_HTML_TAGS` char(1) NOT NULL DEFAULT 'N',
  `ADD_RTL_DIRECTIONALITY` char(1) NOT NULL DEFAULT 'N',
  `WHITESPACE_PRESERVE` char(1) NOT NULL DEFAULT 'N',
  `JS_FUNCTION_FILTER` varchar(1000) NOT NULL,
  `DEFAULT_PAIRED_TAGS` varchar(2000) NOT NULL,
  `PAIRED_TAGS` varchar(2000) NOT NULL,
  `DEFAULT_UNPAIRED_TAGS` varchar(2000) NOT NULL,
  `UNPAIRED_TAGS` varchar(2000) NOT NULL,
  `DEFAULT_SWITCH_TAG_MAPS` text NOT NULL,
  `SWITCH_TAG_MAPS` text NOT NULL,
  `DEFAULT_WHITE_PRESERVING_TAGS` text NOT NULL,
  `DEFAULT_INTERNAL_TAGS` text NOT NULL,
  `INTERNAL_TAGS` text NOT NULL,
  `WHITE_PRESERVING_TAGS` text NOT NULL,
  `DEFAULT_NON_TRANSLATABLE_META_ATTRIBUTES` text NOT NULL,
  `NON_TRANSLATABLE_META_ATTRIBUTES` text NOT NULL,
  `DEFAULT_TRANSLATABLE_ATTRIBUTES` text NOT NULL,
  `TRANSLATABLE_ATTRIBUTES` text NOT NULL,
  `DEFAULT_LOCALIZABLE_ATTRIBUTE_MAPS` text NOT NULL,
  `LOCALIZABLE_ATTRIBUTE_MAPS` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `image_replace_file_map`
--

CREATE TABLE `image_replace_file_map` (
  `ID` bigint(20) NOT NULL,
  `STATE` varchar(20) NOT NULL,
  `TARGET_PAGE_ID` bigint(20) NOT NULL,
  `TUV_ID` bigint(20) NOT NULL,
  `SUB_ID` int(11) DEFAULT NULL,
  `TEMP_SOURCE_NAME` varchar(128) DEFAULT NULL,
  `REAL_SOURCE_NAME` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `indd_filter`
--

CREATE TABLE `indd_filter` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `FILTER_NAME` varchar(255) NOT NULL,
  `FILTER_DESCRIPTION` varchar(4000) DEFAULT NULL,
  `COMPANY_ID` bigint(20) UNSIGNED NOT NULL,
  `TRANSLATE_HIDDEN_LAYER` char(1) NOT NULL DEFAULT 'N',
  `TRANSLATE_MASTER_LAYER` char(1) NOT NULL DEFAULT 'Y',
  `TRANSLATE_FILE_INFO` char(1) NOT NULL DEFAULT 'N',
  `TRANSLATE_HYPERLINKS` char(1) NOT NULL DEFAULT 'N',
  `TRANSLATE_HIDDEN_CONDTEXT` char(1) NOT NULL DEFAULT 'Y',
  `SKIP_TRACKING_KERNING` char(1) NOT NULL DEFAULT 'N',
  `EXTRACT_LINE_BREAK` char(1) NOT NULL DEFAULT 'N',
  `REPLACE_NONBREAKING_SPACE` char(1) NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `indd_tu_mapping`
--

CREATE TABLE `indd_tu_mapping` (
  `ID` bigint(20) NOT NULL,
  `JOB_ID` bigint(20) NOT NULL,
  `SOURCE_PAGE_ID` bigint(20) NOT NULL,
  `TU_ID` bigint(20) NOT NULL,
  `COMPANY_ID` bigint(20) NOT NULL,
  `PAGE_NUM` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ip_tm_index`
--

CREATE TABLE `ip_tm_index` (
  `TOKEN` varchar(300) NOT NULL,
  `SRC_ID` bigint(20) DEFAULT NULL,
  `JOB_ID` bigint(20) DEFAULT NULL,
  `POPULATION_TM_ID` int(11) DEFAULT NULL,
  `LOCALE_ID` bigint(20) DEFAULT NULL,
  `REPETITION` int(11) DEFAULT NULL,
  `TOTAL_TOKEN_COUNT` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ip_tm_src_l`
--

CREATE TABLE `ip_tm_src_l` (
  `ID` bigint(20) NOT NULL,
  `JOB_ID` bigint(20) DEFAULT NULL,
  `POPULATION_TM_ID` int(11) DEFAULT NULL,
  `LOCALE_ID` bigint(20) DEFAULT NULL,
  `TYPE` varchar(50) NOT NULL,
  `SEGMENT_STRING` text,
  `SEGMENT_CLOB` mediumtext,
  `EXACT_MATCH_KEY` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ip_tm_src_t`
--

CREATE TABLE `ip_tm_src_t` (
  `ID` bigint(20) NOT NULL,
  `JOB_ID` bigint(20) DEFAULT NULL,
  `POPULATION_TM_ID` int(11) DEFAULT NULL,
  `LOCALE_ID` bigint(20) DEFAULT NULL,
  `TYPE` varchar(50) NOT NULL,
  `SEGMENT_STRING` text,
  `SEGMENT_CLOB` mediumtext,
  `EXACT_MATCH_KEY` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ip_tm_trg_l`
--

CREATE TABLE `ip_tm_trg_l` (
  `ID` bigint(20) NOT NULL,
  `SRC_ID` bigint(20) DEFAULT NULL,
  `TU_ID` bigint(20) DEFAULT NULL,
  `LOCALE_ID` bigint(20) DEFAULT NULL,
  `SEGMENT_STRING` text,
  `SEGMENT_CLOB` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ip_tm_trg_t`
--

CREATE TABLE `ip_tm_trg_t` (
  `ID` bigint(20) NOT NULL,
  `SRC_ID` bigint(20) DEFAULT NULL,
  `TU_ID` bigint(20) DEFAULT NULL,
  `LOCALE_ID` bigint(20) DEFAULT NULL,
  `SEGMENT_STRING` text,
  `SEGMENT_CLOB` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `issue`
--

CREATE TABLE `issue` (
  `ID` bigint(20) NOT NULL,
  `ISSUE_OBJECT_ID` bigint(20) NOT NULL,
  `ISSUE_OBJECT_TYPE` char(1) NOT NULL DEFAULT 'S',
  `CREATE_DATE` datetime NOT NULL,
  `CREATOR_USER_ID` varchar(80) NOT NULL,
  `TITLE` varchar(200) NOT NULL,
  `PRIORITY` char(1) NOT NULL,
  `STATUS` varchar(20) NOT NULL DEFAULT 'OPEN',
  `LOGICAL_KEY` varchar(200) DEFAULT NULL,
  `TARGET_PAGE_ID` bigint(20) DEFAULT '0',
  `SHARE` char(1) NOT NULL,
  `OVERWRITE` char(1) NOT NULL,
  `CATEGORY` varchar(100) NOT NULL DEFAULT 'TYPE01',
  `SEVERITY` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `issue_history`
--

CREATE TABLE `issue_history` (
  `ID` bigint(20) NOT NULL,
  `ISSUE_ID` bigint(20) DEFAULT NULL,
  `REPORTED_DATE` datetime NOT NULL,
  `REPORTED_BY` varchar(80) NOT NULL,
  `DESCRIPTION` varchar(4000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `java_properties_filter`
--

CREATE TABLE `java_properties_filter` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `FILTER_NAME` varchar(255) NOT NULL,
  `FILTER_DESCRIPTION` varchar(4000) DEFAULT NULL,
  `ENABLE_SID_SUPPORT` char(1) NOT NULL DEFAULT 'N',
  `ENABLE_UNICODE_ESCAPE` char(1) NOT NULL DEFAULT 'N',
  `ENABLE_TRIM_SEGMENT` char(1) NOT NULL DEFAULT 'N',
  `SECOND_FILTER_ID` bigint(11) DEFAULT '-2',
  `SECOND_FILTER_TABLE_NAME` varchar(45) DEFAULT NULL,
  `INTERNAL_TEXTS` text NOT NULL,
  `COMPANY_ID` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `java_properties_filter`
--

INSERT INTO `java_properties_filter` (`ID`, `FILTER_NAME`, `FILTER_DESCRIPTION`, `ENABLE_SID_SUPPORT`, `ENABLE_UNICODE_ESCAPE`, `ENABLE_TRIM_SEGMENT`, `SECOND_FILTER_ID`, `SECOND_FILTER_TABLE_NAME`, `INTERNAL_TEXTS`, `COMPANY_ID`) VALUES
(1, 'Java Properties filter (Default)', 'The default java properties filters', 'N', 'N', 'N', -2, NULL, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?><propertiesInternalText><items><content>\\{[^{]*?\\}</content><isRegex>true</isRegex></items></propertiesInternalText>', 1);

-- --------------------------------------------------------

--
-- Table structure for table `java_script_filter`
--

CREATE TABLE `java_script_filter` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `FILTER_NAME` varchar(255) NOT NULL,
  `FILTER_DESCRIPTION` varchar(4000) DEFAULT NULL,
  `JS_FUNCTION_FILTER` varchar(1000) NOT NULL,
  `COMPANY_ID` bigint(20) UNSIGNED NOT NULL,
  `ENABLE_UNICODE_ESCAPE` char(1) NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `java_script_filter`
--

INSERT INTO `java_script_filter` (`ID`, `FILTER_NAME`, `FILTER_DESCRIPTION`, `JS_FUNCTION_FILTER`, `COMPANY_ID`, `ENABLE_UNICODE_ESCAPE`) VALUES
(1, 'Java Script Filter(Default)', 'The default java script filter', 'l10n', 1, 'N');

-- --------------------------------------------------------

--
-- Table structure for table `jbpm_action`
--

CREATE TABLE `jbpm_action` (
  `ID_` bigint(20) NOT NULL,
  `class` char(1) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `ISPROPAGATIONALLOWED_` bit(1) DEFAULT NULL,
  `ACTIONEXPRESSION_` varchar(255) DEFAULT NULL,
  `ISASYNC_` bit(1) DEFAULT NULL,
  `REFERENCEDACTION_` bigint(20) DEFAULT NULL,
  `ACTIONDELEGATION_` bigint(20) DEFAULT NULL,
  `EVENT_` bigint(20) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `TIMERNAME_` varchar(255) DEFAULT NULL,
  `DUEDATE_` varchar(255) DEFAULT NULL,
  `REPEAT_` varchar(255) DEFAULT NULL,
  `TRANSITIONNAME_` varchar(255) DEFAULT NULL,
  `TIMERACTION_` bigint(20) DEFAULT NULL,
  `EXPRESSION_` text,
  `EVENTINDEX_` int(11) DEFAULT NULL,
  `EXCEPTIONHANDLER_` bigint(20) DEFAULT NULL,
  `EXCEPTIONHANDLERINDEX_` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jbpm_bytearray`
--

CREATE TABLE `jbpm_bytearray` (
  `ID_` bigint(20) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `FILEDEFINITION_` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jbpm_byteblock`
--

CREATE TABLE `jbpm_byteblock` (
  `PROCESSFILE_` bigint(20) NOT NULL,
  `BYTES_` blob,
  `INDEX_` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jbpm_comment`
--

CREATE TABLE `jbpm_comment` (
  `ID_` bigint(20) NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `ACTORID_` varchar(255) DEFAULT NULL,
  `TIME_` datetime DEFAULT NULL,
  `MESSAGE_` text,
  `TOKEN_` bigint(20) DEFAULT NULL,
  `TASKINSTANCE_` bigint(20) DEFAULT NULL,
  `TOKENINDEX_` int(11) DEFAULT NULL,
  `TASKINSTANCEINDEX_` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jbpm_decisionconditions`
--

CREATE TABLE `jbpm_decisionconditions` (
  `DECISION_` bigint(20) NOT NULL,
  `TRANSITIONNAME_` varchar(255) DEFAULT NULL,
  `EXPRESSION_` varchar(255) DEFAULT NULL,
  `INDEX_` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jbpm_delegation`
--

CREATE TABLE `jbpm_delegation` (
  `ID_` bigint(20) NOT NULL,
  `CLASSNAME_` text,
  `CONFIGURATION_` text,
  `CONFIGTYPE_` varchar(255) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jbpm_event`
--

CREATE TABLE `jbpm_event` (
  `ID_` bigint(20) NOT NULL,
  `EVENTTYPE_` varchar(255) DEFAULT NULL,
  `TYPE_` char(1) DEFAULT NULL,
  `GRAPHELEMENT_` bigint(20) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `NODE_` bigint(20) DEFAULT NULL,
  `TRANSITION_` bigint(20) DEFAULT NULL,
  `TASK_` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jbpm_exceptionhandler`
--

CREATE TABLE `jbpm_exceptionhandler` (
  `ID_` bigint(20) NOT NULL,
  `EXCEPTIONCLASSNAME_` text,
  `TYPE_` char(1) DEFAULT NULL,
  `GRAPHELEMENT_` bigint(20) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `GRAPHELEMENTINDEX_` int(11) DEFAULT NULL,
  `NODE_` bigint(20) DEFAULT NULL,
  `TRANSITION_` bigint(20) DEFAULT NULL,
  `TASK_` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jbpm_gs_variable`
--

CREATE TABLE `jbpm_gs_variable` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(244) NOT NULL,
  `VALUE` varchar(244) NOT NULL,
  `CATEGORY` varchar(22) DEFAULT NULL,
  `TASKINSTANCE_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jbpm_id_group`
--

CREATE TABLE `jbpm_id_group` (
  `ID_` bigint(20) NOT NULL,
  `CLASS_` char(1) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `TYPE_` varchar(255) DEFAULT NULL,
  `PARENT_` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jbpm_id_membership`
--

CREATE TABLE `jbpm_id_membership` (
  `ID_` bigint(20) NOT NULL,
  `CLASS_` char(1) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `ROLE_` varchar(255) DEFAULT NULL,
  `USER_` bigint(20) DEFAULT NULL,
  `GROUP_` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jbpm_id_permissions`
--

CREATE TABLE `jbpm_id_permissions` (
  `ENTITY_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `ACTION_` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jbpm_id_user`
--

CREATE TABLE `jbpm_id_user` (
  `ID_` bigint(20) NOT NULL,
  `CLASS_` char(1) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `EMAIL_` varchar(255) DEFAULT NULL,
  `PASSWORD_` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jbpm_log`
--

CREATE TABLE `jbpm_log` (
  `ID_` bigint(20) NOT NULL,
  `CLASS_` char(1) NOT NULL,
  `INDEX_` int(11) DEFAULT NULL,
  `DATE_` datetime DEFAULT NULL,
  `TOKEN_` bigint(20) DEFAULT NULL,
  `PARENT_` bigint(20) DEFAULT NULL,
  `MESSAGE_` text,
  `EXCEPTION_` text,
  `ACTION_` bigint(20) DEFAULT NULL,
  `NODE_` bigint(20) DEFAULT NULL,
  `ENTER_` datetime DEFAULT NULL,
  `LEAVE_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `NEWLONGVALUE_` bigint(20) DEFAULT NULL,
  `TRANSITION_` bigint(20) DEFAULT NULL,
  `CHILD_` bigint(20) DEFAULT NULL,
  `SOURCENODE_` bigint(20) DEFAULT NULL,
  `DESTINATIONNODE_` bigint(20) DEFAULT NULL,
  `VARIABLEINSTANCE_` bigint(20) DEFAULT NULL,
  `OLDBYTEARRAY_` bigint(20) DEFAULT NULL,
  `NEWBYTEARRAY_` bigint(20) DEFAULT NULL,
  `OLDDATEVALUE_` datetime DEFAULT NULL,
  `NEWDATEVALUE_` datetime DEFAULT NULL,
  `OLDDOUBLEVALUE_` double DEFAULT NULL,
  `NEWDOUBLEVALUE_` double DEFAULT NULL,
  `OLDLONGIDCLASS_` varchar(255) DEFAULT NULL,
  `OLDLONGIDVALUE_` bigint(20) DEFAULT NULL,
  `NEWLONGIDCLASS_` varchar(255) DEFAULT NULL,
  `NEWLONGIDVALUE_` bigint(20) DEFAULT NULL,
  `OLDSTRINGIDCLASS_` varchar(255) DEFAULT NULL,
  `OLDSTRINGIDVALUE_` varchar(255) DEFAULT NULL,
  `NEWSTRINGIDCLASS_` varchar(255) DEFAULT NULL,
  `NEWSTRINGIDVALUE_` varchar(255) DEFAULT NULL,
  `OLDLONGVALUE_` bigint(20) DEFAULT NULL,
  `OLDSTRINGVALUE_` text,
  `NEWSTRINGVALUE_` text,
  `TASKINSTANCE_` bigint(20) DEFAULT NULL,
  `TASKACTORID_` varchar(255) DEFAULT NULL,
  `TASKOLDACTORID_` varchar(255) DEFAULT NULL,
  `SWIMLANEINSTANCE_` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jbpm_message`
--

CREATE TABLE `jbpm_message` (
  `ID_` bigint(20) NOT NULL,
  `CLASS_` char(1) NOT NULL,
  `DESTINATION_` varchar(255) DEFAULT NULL,
  `EXCEPTION_` text,
  `ISSUSPENDED_` bit(1) DEFAULT NULL,
  `TOKEN_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(255) DEFAULT NULL,
  `ACTION_` bigint(20) DEFAULT NULL,
  `NODE_` bigint(20) DEFAULT NULL,
  `TRANSITIONNAME_` varchar(255) DEFAULT NULL,
  `TASKINSTANCE_` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jbpm_moduledefinition`
--

CREATE TABLE `jbpm_moduledefinition` (
  `ID_` bigint(20) NOT NULL,
  `CLASS_` char(1) NOT NULL,
  `NAME_` text,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `STARTTASK_` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jbpm_moduleinstance`
--

CREATE TABLE `jbpm_moduleinstance` (
  `ID_` bigint(20) NOT NULL,
  `CLASS_` char(1) NOT NULL,
  `PROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  `TASKMGMTDEFINITION_` bigint(20) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jbpm_node`
--

CREATE TABLE `jbpm_node` (
  `ID_` bigint(20) NOT NULL,
  `CLASS_` char(1) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `ISASYNC_` bit(1) DEFAULT NULL,
  `ACTION_` bigint(20) DEFAULT NULL,
  `SUPERSTATE_` bigint(20) DEFAULT NULL,
  `SUBPROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `DECISIONEXPRESSION_` varchar(255) DEFAULT NULL,
  `DECISIONDELEGATION` bigint(20) DEFAULT NULL,
  `SIGNAL_` int(11) DEFAULT NULL,
  `CREATETASKS_` bit(1) DEFAULT NULL,
  `ENDTASKS_` bit(1) DEFAULT NULL,
  `NODECOLLECTIONINDEX_` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jbpm_pooledactor`
--

CREATE TABLE `jbpm_pooledactor` (
  `ID_` bigint(20) NOT NULL,
  `ACTORID_` varchar(255) DEFAULT NULL,
  `SWIMLANEINSTANCE_` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jbpm_processdefinition`
--

CREATE TABLE `jbpm_processdefinition` (
  `ID_` bigint(20) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `ISTERMINATIONIMPLICIT_` bit(1) DEFAULT NULL,
  `STARTSTATE_` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jbpm_processinstance`
--

CREATE TABLE `jbpm_processinstance` (
  `ID_` bigint(20) NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `START_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `ISSUSPENDED_` bit(1) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `ROOTTOKEN_` bigint(20) DEFAULT NULL,
  `SUPERPROCESSTOKEN_` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jbpm_runtimeaction`
--

CREATE TABLE `jbpm_runtimeaction` (
  `ID_` bigint(20) NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `EVENTTYPE_` varchar(255) DEFAULT NULL,
  `TYPE_` char(1) DEFAULT NULL,
  `GRAPHELEMENT_` bigint(20) DEFAULT NULL,
  `PROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  `ACTION_` bigint(20) DEFAULT NULL,
  `PROCESSINSTANCEINDEX_` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jbpm_swimlane`
--

CREATE TABLE `jbpm_swimlane` (
  `ID_` bigint(20) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `ACTORIDEXPRESSION_` varchar(255) DEFAULT NULL,
  `POOLEDACTORSEXPRESSION_` varchar(255) DEFAULT NULL,
  `ASSIGNMENTDELEGATION_` bigint(20) DEFAULT NULL,
  `TASKMGMTDEFINITION_` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jbpm_swimlaneinstance`
--

CREATE TABLE `jbpm_swimlaneinstance` (
  `ID_` bigint(20) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `ACTORID_` varchar(255) DEFAULT NULL,
  `SWIMLANE_` bigint(20) DEFAULT NULL,
  `TASKMGMTINSTANCE_` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jbpm_task`
--

CREATE TABLE `jbpm_task` (
  `ID_` bigint(20) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `DESCRIPTION_` text,
  `ISBLOCKING_` bit(1) DEFAULT NULL,
  `ISSIGNALLING_` bit(1) DEFAULT NULL,
  `DUEDATE_` varchar(255) DEFAULT NULL,
  `ACTORIDEXPRESSION_` varchar(255) DEFAULT NULL,
  `POOLEDACTORSEXPRESSION_` varchar(255) DEFAULT NULL,
  `TASKMGMTDEFINITION_` bigint(20) DEFAULT NULL,
  `TASKNODE_` bigint(20) DEFAULT NULL,
  `STARTSTATE_` bigint(20) DEFAULT NULL,
  `ASSIGNMENTDELEGATION_` bigint(20) DEFAULT NULL,
  `SWIMLANE_` bigint(20) DEFAULT NULL,
  `TASKCONTROLLER_` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jbpm_taskactorpool`
--

CREATE TABLE `jbpm_taskactorpool` (
  `TASKINSTANCE_` bigint(20) NOT NULL,
  `POOLEDACTOR_` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jbpm_taskcontroller`
--

CREATE TABLE `jbpm_taskcontroller` (
  `ID_` bigint(20) NOT NULL,
  `TASKCONTROLLERDELEGATION_` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jbpm_taskinstance`
--

CREATE TABLE `jbpm_taskinstance` (
  `ID_` bigint(20) NOT NULL,
  `CLASS_` char(1) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `DESCRIPTION_` text,
  `ACTORID_` varchar(255) DEFAULT NULL,
  `CREATE_` datetime DEFAULT NULL,
  `START_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `DUEDATE_` datetime DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `ISCANCELLED_` bit(1) DEFAULT NULL,
  `ISSUSPENDED_` bit(1) DEFAULT NULL,
  `ISOPEN_` bit(1) DEFAULT NULL,
  `ISSIGNALLING_` bit(1) DEFAULT NULL,
  `ISBLOCKING_` bit(1) DEFAULT NULL,
  `TASK_` bigint(20) DEFAULT NULL,
  `TOKEN_` bigint(20) DEFAULT NULL,
  `SWIMLANINSTANCE_` bigint(20) DEFAULT NULL,
  `TASKMGMTINSTANCE_` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jbpm_timer`
--

CREATE TABLE `jbpm_timer` (
  `ID_` bigint(20) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `DUEDATE_` datetime DEFAULT NULL,
  `REPEAT_` varchar(255) DEFAULT NULL,
  `TRANSITIONNAME_` varchar(255) DEFAULT NULL,
  `EXCEPTION_` text,
  `ISSUSPENDED_` bit(1) DEFAULT NULL,
  `ACTION_` bigint(20) DEFAULT NULL,
  `TOKEN_` bigint(20) DEFAULT NULL,
  `PROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  `TASKINSTANCE_` bigint(20) DEFAULT NULL,
  `GRAPHELEMENTTYPE_` varchar(255) DEFAULT NULL,
  `GRAPHELEMENT_` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jbpm_token`
--

CREATE TABLE `jbpm_token` (
  `ID_` bigint(20) NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `START_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `NODEENTER_` datetime DEFAULT NULL,
  `NEXTLOGINDEX_` int(11) DEFAULT NULL,
  `ISABLETOREACTIVATEPARENT_` bit(1) DEFAULT NULL,
  `ISTERMINATIONIMPLICIT_` bit(1) DEFAULT NULL,
  `ISSUSPENDED_` bit(1) DEFAULT NULL,
  `NODE_` bigint(20) DEFAULT NULL,
  `PROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  `PARENT_` bigint(20) DEFAULT NULL,
  `SUBPROCESSINSTANCE_` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jbpm_tokenvariablemap`
--

CREATE TABLE `jbpm_tokenvariablemap` (
  `ID_` bigint(20) NOT NULL,
  `TOKEN_` bigint(20) DEFAULT NULL,
  `CONTEXTINSTANCE_` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jbpm_transition`
--

CREATE TABLE `jbpm_transition` (
  `ID_` bigint(20) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `FROM_` bigint(20) DEFAULT NULL,
  `TO_` bigint(20) DEFAULT NULL,
  `FROMINDEX_` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jbpm_variableaccess`
--

CREATE TABLE `jbpm_variableaccess` (
  `ID_` bigint(20) NOT NULL,
  `VARIABLENAME_` varchar(255) DEFAULT NULL,
  `ACCESS_` varchar(255) DEFAULT NULL,
  `MAPPEDNAME_` varchar(255) DEFAULT NULL,
  `PROCESSSTATE_` bigint(20) DEFAULT NULL,
  `TASKCONTROLLER_` bigint(20) DEFAULT NULL,
  `INDEX_` int(11) DEFAULT NULL,
  `SCRIPT_` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jbpm_variableinstance`
--

CREATE TABLE `jbpm_variableinstance` (
  `ID_` bigint(20) NOT NULL,
  `CLASS_` char(1) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `CONVERTER_` char(1) DEFAULT NULL,
  `TOKEN_` bigint(20) DEFAULT NULL,
  `TOKENVARIABLEMAP_` bigint(20) DEFAULT NULL,
  `PROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  `BYTEARRAYVALUE_` bigint(20) DEFAULT NULL,
  `DATEVALUE_` datetime DEFAULT NULL,
  `DOUBLEVALUE_` double DEFAULT NULL,
  `LONGIDCLASS_` varchar(255) DEFAULT NULL,
  `LONGVALUE_` bigint(20) DEFAULT NULL,
  `STRINGIDCLASS_` varchar(255) DEFAULT NULL,
  `STRINGVALUE_` varchar(255) DEFAULT NULL,
  `TASKINSTANCE_` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(320) NOT NULL,
  `STATE` varchar(40) DEFAULT NULL,
  `ORIGINAL_STATE` varchar(40) DEFAULT NULL,
  `SOURCE_LOCALE_ID` bigint(20) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `PRIORITY` int(3) NOT NULL,
  `IS_WORDCOUNT_REACHED` char(1) NOT NULL,
  `TIMESTAMP` datetime NOT NULL,
  `PAGE_COUNT` int(10) NOT NULL,
  `LEVERAGE_MATCH_THRESHOLD` int(11) DEFAULT '75',
  `OVERRIDEN_WORD_COUNT` int(10) DEFAULT NULL,
  `QUOTE_DATE` varchar(320) DEFAULT NULL,
  `QUOTE_PO_NUMBER` varchar(320) DEFAULT NULL,
  `QUOTE_APPROVED_DATE` varchar(320) DEFAULT NULL,
  `COMPANY_ID` bigint(20) NOT NULL,
  `L10N_PROFILE_ID` bigint(20) DEFAULT '-1',
  `AUTHORISER_USER_ID` varchar(80) DEFAULT NULL,
  `CREATE_USER_ID` varchar(80) DEFAULT NULL,
  `UUID` varchar(320) DEFAULT NULL,
  `LEVERAGE_OPTION` varchar(45) NOT NULL DEFAULT 'in-context',
  `START_DATE` datetime DEFAULT NULL,
  `COMPLETED_DATE` datetime DEFAULT NULL,
  `TU_TABLE` varchar(128) DEFAULT NULL,
  `TU_ARCHIVE_TABLE` varchar(128) DEFAULT NULL,
  `TUV_TABLE` varchar(128) DEFAULT NULL,
  `TUV_ARCHIVE_TABLE` varchar(128) DEFAULT NULL,
  `LM_TABLE` varchar(128) DEFAULT NULL,
  `LM_ARCHIVE_TABLE` varchar(128) DEFAULT NULL,
  `LM_EXT_TABLE` varchar(128) DEFAULT NULL,
  `LM_EXT_ARCHIVE_TABLE` varchar(128) DEFAULT NULL,
  `IS_MIGRATED` char(1) DEFAULT 'N',
  `IS_ALL_REQUEST_GENERATED` char(1) DEFAULT 'N',
  `JOB_TYPE` varchar(30) DEFAULT NULL,
  `GROUP_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `job_attribute`
--

CREATE TABLE `job_attribute` (
  `ID` bigint(20) NOT NULL,
  `INTEGER_VALUE` int(11) DEFAULT NULL,
  `FLOAT_VALUE` double DEFAULT NULL,
  `STRING_VALUE` varchar(4000) DEFAULT NULL,
  `DATE_VALUE` datetime DEFAULT NULL,
  `JOB_ID` bigint(20) NOT NULL,
  `ATTRIBUTE_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `job_attribute_select_option`
--

CREATE TABLE `job_attribute_select_option` (
  `JOB_ATTRIBUTE_ID` bigint(20) NOT NULL,
  `SELECT_OPTION_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `job_group`
--

CREATE TABLE `job_group` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(320) NOT NULL,
  `PROJECT_ID` bigint(20) NOT NULL,
  `SOURCE_LOCALE_ID` bigint(20) NOT NULL,
  `COMPANY_ID` bigint(20) NOT NULL,
  `TIMESTAMP` datetime NOT NULL,
  `CREATE_USER_ID` varchar(300) DEFAULT NULL,
  `STRING_COLUM1` varchar(320) DEFAULT NULL,
  `STRING_COLUM2` varchar(320) DEFAULT NULL,
  `LONG_COLUM1` bigint(20) DEFAULT NULL,
  `LONG_COLUM2` bigint(20) DEFAULT NULL,
  `DATE_COLUM1` datetime DEFAULT NULL,
  `DATE_COLUM2` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jsp_filter`
--

CREATE TABLE `jsp_filter` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `FILTER_NAME` varchar(255) NOT NULL,
  `FILTER_DESCRIPTION` varchar(2000) DEFAULT NULL,
  `COMPANY_ID` bigint(20) UNSIGNED NOT NULL,
  `IS_ADDITIONAL_HEAD_ADDED` char(1) NOT NULL DEFAULT 'N',
  `IS_ESCAPE_ENTITY` char(1) NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `known_format_type`
--

CREATE TABLE `known_format_type` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(60) NOT NULL,
  `DESCRIPTION` varchar(4000) DEFAULT NULL,
  `FORMAT_TYPE` varchar(127) NOT NULL,
  `PRE_EXTRACT_EVENT` varchar(127) DEFAULT NULL,
  `PRE_MERGE_EVENT` varchar(127) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `known_format_type`
--

INSERT INTO `known_format_type` (`ID`, `NAME`, `DESCRIPTION`, `FORMAT_TYPE`, `PRE_EXTRACT_EVENT`, `PRE_MERGE_EVENT`) VALUES
(1, 'HTML', 'Hyper-Text Markup Language', 'html', 'HTML_IMPORTED_EVENT', 'HTML_LOCALIZED_EVENT'),
(4, 'JavaProperties', 'Java Properties', 'javaprop', 'HTML_IMPORTED_EVENT', 'HTML_LOCALIZED_EVENT'),
(5, 'Javascript', 'Javascript', 'javascript', 'HTML_IMPORTED_EVENT', 'HTML_LOCALIZED_EVENT'),
(6, 'PlainText', 'Plain Text', 'plaintext', 'HTML_IMPORTED_EVENT', 'HTML_LOCALIZED_EVENT'),
(7, 'XML', 'Extensible Markup Language', 'xml', 'XML_IMPORTED_EVENT', 'XML_LOCALIZED_EVENT'),
(10, 'JavaProperties (HTML)', 'Java Properties(HTML)', 'javaprop-html', 'HTML_IMPORTED_EVENT', 'HTML_LOCALIZED_EVENT'),
(11, 'JavaProperties (Msg)', 'Java Properties(Msg)', 'javaprop-msg', 'HTML_IMPORTED_EVENT', 'HTML_LOCALIZED_EVENT'),
(13, 'JSP', 'Java Server Pages', 'jsp', 'HTML_IMPORTED_EVENT', 'HTML_LOCALIZED_EVENT'),
(14, 'Word2007', 'Microsoft Word 2007', 'word-html', 'MSOFFICE_IMPORTED_EVENT', 'HTML_LOCALIZED_EVENT'),
(19, 'Excel2007', 'Microsoft Excel 2007', 'excel-html', 'MSOFFICE_IMPORTED_EVENT', 'HTML_LOCALIZED_EVENT'),
(20, 'PowerPoint2007', 'Microsoft PowerPoint 2007', 'powerpoint-html', 'MSOFFICE_IMPORTED_EVENT', 'HTML_LOCALIZED_EVENT'),
(21, 'Java', 'Java Files', 'java', 'HTML_IMPORTED_EVENT', 'HTML_LOCALIZED_EVENT'),
(23, 'Un-extracted', 'Content that should not be extracted.', 'unextracted', 'UNEXTRACTED_IMPORTED_EVENT', 'UNEXTRACTED_LOCALIZED_EVENT'),
(26, 'RTF', 'Rich Text Format', 'rtf', 'MSOFFICE_IMPORTED_EVENT', 'HTML_LOCALIZED_EVENT'),
(31, 'INDD (CS2)', 'InDesign INDD', 'indd', 'ADOBE_IMPORTED_EVENT', 'XML_LOCALIZED_EVENT'),
(32, 'Illustrator', 'Illustrator AI', 'illustrator', 'ADOBE_IMPORTED_EVENT', 'XML_LOCALIZED_EVENT'),
(33, 'Word2003', 'Microsoft Word 2003', 'word-html', 'MSOFFICE_IMPORTED_EVENT', 'HTML_LOCALIZED_EVENT'),
(34, 'Excel2003', 'Microsoft Excel 2003', 'excel-html', 'MSOFFICE_IMPORTED_EVENT', 'HTML_LOCALIZED_EVENT'),
(35, 'PowerPoint2003', 'Microsoft PowerPoint 2003', 'powerpoint-html', 'MSOFFICE_IMPORTED_EVENT', 'HTML_LOCALIZED_EVENT'),
(36, 'INDD (CS3)', 'InDesign INDD CS3', 'indd_cs3', 'ADOBE_IMPORTED_EVENT', 'XML_LOCALIZED_EVENT'),
(37, 'INX (CS2)', 'InDesign CS2 INX', 'inx', 'ADOBE_IMPORTED_EVENT', 'XML_LOCALIZED_EVENT'),
(38, 'INX (CS3)', 'InDesign CS3 INX', 'inx_cs3', 'ADOBE_IMPORTED_EVENT', 'XML_LOCALIZED_EVENT'),
(39, 'Xliff', 'Xliff file', 'xlf', 'XML_IMPORTED_EVENT', 'XML_LOCALIZED_EVENT'),
(40, 'INDD (CS4)', 'InDesign INDD CS4', 'indd_cs4', 'ADOBE_IMPORTED_EVENT', 'XML_LOCALIZED_EVENT'),
(41, 'OpenOffice document', 'OpenOffice document(odt, ods, odp)', 'openoffice-xml', 'OPENOFFICE_IMPORTED_EVENT', 'XML_LOCALIZED_EVENT'),
(42, 'Portable Object', 'Portable Object File', 'po', 'HTML_IMPORTED_EVENT', 'HTML_LOCALIZED_EVENT'),
(43, 'Office 2010 Extractor v1.0', 'Microsoft Office 2010 document', 'office-xml', 'MSOFFICE_IMPORTED_EVENT', 'XML_LOCALIZED_EVENT'),
(44, 'Resource Compiler', 'Resource Compiler', 'rc', 'HTML_IMPORTED_EVENT', 'HTML_LOCALIZED_EVENT'),
(45, 'RESX', 'resx', 'xml', 'XML_IMPORTED_EVENT', 'XML_LOCALIZED_EVENT'),
(46, 'InDesign Markup (IDML)', 'idml', 'xml', 'IDML_IMPORTED_EVENT', 'XML_LOCALIZED_EVENT'),
(47, 'INDD (CS5)', 'InDesign INDD CS5', 'indd_cs5', 'ADOBE_IMPORTED_EVENT', 'XML_LOCALIZED_EVENT'),
(48, 'XLZ', 'XLZ File', 'xlz', 'XML_IMPORTED_EVENT', 'XML_LOCALIZED_EVENT'),
(49, 'MIF 9', 'Adobe Framemaker9', 'mif', 'MIF_IMPORTED_EVENT', 'MIF_LOCALIZED_EVENT'),
(50, 'FrameMaker9', 'Adobe Framemaker 9', 'mif', 'FRAME_IMPORTED_EVENT', 'MIF_LOCALIZED_EVENT'),
(51, 'Passolo 2011', 'Passolo 2011', 'passolo', 'PASSOLO_IMPORTED_EVENT', 'XML_LOCALIZED_EVENT'),
(52, 'INDD (CS5.5)', 'InDesign INDD CS5.5', 'indd_cs5.5', 'ADOBE_IMPORTED_EVENT', 'XML_LOCALIZED_EVENT'),
(53, 'Windows Portable Executable', 'Windows Portable Executable', 'windows_pe', 'WINPE_IMPORTED_EVENT', 'XML_LOCALIZED_EVENT'),
(54, 'Office 2010 Extractor v2.0', 'Microsoft Office 2010 document', 'office-xml', 'MSOFFICE_IMPORTED_EVENT', 'XML_LOCALIZED_EVENT'),
(55, 'AuthorIT XML', 'AuthorIT XML', 'authorIT-xml', 'XML_IMPORTED_EVENT', 'XML_LOCALIZED_EVENT'),
(56, 'Xliff2.0', 'Xliff document 2.0', 'xlf2.0', 'XML_IMPORTED_EVENT', 'XML_LOCALIZED_EVENT'),
(57, 'JSON', 'JavaScript Object Notation', 'json', 'JSON_IMPORTED_EVENT', 'JSON_LOCALIZED_EVENT');

-- --------------------------------------------------------

--
-- Table structure for table `l10n_profile`
--

CREATE TABLE `l10n_profile` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(60) NOT NULL,
  `DESCRIPTION` varchar(4000) DEFAULT NULL,
  `PRIORITY` int(3) NOT NULL,
  `SOURCE_LOCALE_ID` bigint(20) NOT NULL,
  `PROJECT_ID` bigint(20) NOT NULL,
  `IS_AUTO_DISPATCH` char(1) NOT NULL,
  `USE_MT_ON_JOB_CREATION` char(1) NOT NULL DEFAULT 'Y',
  `TIMESTAMP` datetime NOT NULL,
  `DISPATCH_CONDITION` int(1) NOT NULL,
  `DISPATCH_WORD_COUNT` int(10) DEFAULT NULL,
  `DISPATCH_INTERVAL` int(10) DEFAULT NULL,
  `DISPATCH_TIME_UNIT` int(1) DEFAULT NULL,
  `DISPATCH_ABSOLUTE_DAYS` varchar(20) DEFAULT NULL,
  `DISPATCH_TIMER_TYPE` char(1) DEFAULT NULL,
  `DISPATCH_START_TIME` datetime DEFAULT NULL,
  `IS_SCRIPT_RUN_AT_JOB_CREATION` char(1) NOT NULL,
  `JOB_CREATION_SCRIPT_NAME` varchar(2000) DEFAULT NULL,
  `TM_CHOICE` int(1) NOT NULL,
  `IS_EXACT_MATCH_EDIT` char(1) DEFAULT 'N',
  `TM_EDIT_TYPE` int(1) DEFAULT '2',
  `JOB_EXCLUDE_TU_TYPES` varchar(2000) DEFAULT NULL,
  `WF_STATE_POST_ID` bigint(20) DEFAULT '-1',
  `IS_ACTIVE` char(1) NOT NULL,
  `COMPANYID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `l10n_profile_tm_profile`
--

CREATE TABLE `l10n_profile_tm_profile` (
  `L10N_PROFILE_ID` bigint(20) NOT NULL,
  `TM_PROFILE_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `l10n_profile_version`
--

CREATE TABLE `l10n_profile_version` (
  `VERSION_SEQ` bigint(20) NOT NULL,
  `ORIGINAL_PROFILE_SEQ` bigint(20) NOT NULL,
  `MODIFIED_PROFILE_SEQ` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `l10n_profile_wftemplate_info`
--

CREATE TABLE `l10n_profile_wftemplate_info` (
  `L10N_PROFILE_ID` bigint(20) NOT NULL,
  `WF_TEMPLATE_ID` bigint(20) NOT NULL,
  `IS_ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `MT_PROFILE_ID` bigint(20) DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `ISO_LANG_CODE` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`ISO_LANG_CODE`) VALUES
('ar'),
('az'),
('be'),
('bg'),
('ca'),
('cs'),
('da'),
('de'),
('el'),
('en'),
('es'),
('et'),
('fi'),
('fr'),
('he'),
('hi'),
('hr'),
('hu'),
('id'),
('is'),
('it'),
('ja'),
('ko'),
('lt'),
('lv'),
('mk'),
('ms'),
('mt'),
('nl'),
('no'),
('pl'),
('pt'),
('ro'),
('ru'),
('sh'),
('sk'),
('sl'),
('sq'),
('sr'),
('sv'),
('th'),
('tr'),
('uk'),
('vi'),
('zh');

-- --------------------------------------------------------

--
-- Table structure for table `leverage_group`
--

CREATE TABLE `leverage_group` (
  `ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `leverage_group`
--

INSERT INTO `leverage_group` (`ID`) VALUES
(1000);

-- --------------------------------------------------------

--
-- Table structure for table `leverage_locales`
--

CREATE TABLE `leverage_locales` (
  `WORKFLOW_INFO_ID` bigint(20) NOT NULL,
  `LOCALE_ID` bigint(20) NOT NULL,
  `IS_ACTIVE` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `leverage_match_1`
--

CREATE TABLE `leverage_match_1` (
  `SOURCE_PAGE_ID` int(11) DEFAULT NULL,
  `ORIGINAL_SOURCE_TUV_ID` bigint(20) NOT NULL,
  `SUB_ID` varchar(40) NOT NULL,
  `MATCHED_TEXT_STRING` text,
  `MATCHED_TEXT_CLOB` mediumtext,
  `TARGET_LOCALE_ID` bigint(20) NOT NULL,
  `MATCH_TYPE` varchar(80) DEFAULT NULL,
  `ORDER_NUM` smallint(6) NOT NULL,
  `SCORE_NUM` decimal(8,4) DEFAULT '0.0000',
  `MATCHED_TUV_ID` int(11) DEFAULT NULL,
  `MATCHED_TABLE_TYPE` smallint(6) DEFAULT '0',
  `PROJECT_TM_INDEX` int(4) DEFAULT '-1',
  `TM_ID` bigint(20) DEFAULT '0',
  `TM_PROFILE_ID` bigint(20) DEFAULT '0',
  `MT_NAME` varchar(40) DEFAULT NULL,
  `MATCHED_ORIGINAL_SOURCE` mediumtext,
  `JOB_DATA_TU_ID` bigint(20) DEFAULT '-1',
  `SID` varchar(255) DEFAULT NULL,
  `CREATION_USER` varchar(80) DEFAULT NULL,
  `CREATION_DATE` datetime DEFAULT NULL,
  `MODIFY_USER` varchar(80) DEFAULT NULL,
  `MODIFY_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `leverage_match_attr_1`
--

CREATE TABLE `leverage_match_attr_1` (
  `ID` bigint(20) NOT NULL,
  `SOURCE_PAGE_ID` int(11) DEFAULT NULL,
  `ORIGINAL_SOURCE_TUV_ID` bigint(20) DEFAULT NULL,
  `SUB_ID` varchar(40) DEFAULT NULL,
  `TARGET_LOCALE_ID` bigint(20) DEFAULT NULL,
  `ORDER_NUM` smallint(6) DEFAULT NULL,
  `NAME` varchar(100) NOT NULL,
  `VARCHAR_VALUE` varchar(512) DEFAULT NULL,
  `TEXT_VALUE` text,
  `LONG_VALUE` bigint(20) DEFAULT NULL,
  `DATE_VALUE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `locale`
--

CREATE TABLE `locale` (
  `ID` bigint(20) NOT NULL,
  `ISO_LANG_CODE` varchar(3) NOT NULL,
  `ISO_COUNTRY_CODE` varchar(3) DEFAULT NULL,
  `IS_UI_LOCALE` char(1) NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `locale`
--

INSERT INTO `locale` (`ID`, `ISO_LANG_CODE`, `ISO_COUNTRY_CODE`, `IS_UI_LOCALE`) VALUES
(1, 'ar', 'AE', 'N'),
(2, 'ar', 'BH', 'N'),
(3, 'ar', 'DZ', 'N'),
(4, 'ar', 'EG', 'N'),
(5, 'ar', 'IQ', 'N'),
(6, 'ar', 'JO', 'N'),
(7, 'ar', 'KW', 'N'),
(8, 'ar', 'LB', 'N'),
(9, 'ar', 'LY', 'N'),
(10, 'ar', 'MA', 'N'),
(11, 'ar', 'OM', 'N'),
(12, 'ar', 'QA', 'N'),
(13, 'ar', 'SA', 'N'),
(14, 'ar', 'SD', 'N'),
(15, 'ar', 'SY', 'N'),
(16, 'ar', 'TN', 'N'),
(17, 'ar', 'YE', 'N'),
(18, 'be', 'BY', 'N'),
(19, 'bg', 'BG', 'N'),
(20, 'ca', 'ES', 'N'),
(21, 'cs', 'CZ', 'N'),
(22, 'da', 'DK', 'N'),
(23, 'de', 'AT', 'N'),
(24, 'de', 'CH', 'N'),
(25, 'de', 'DE', 'N'),
(26, 'el', 'GR', 'N'),
(27, 'en', 'AU', 'N'),
(28, 'en', 'CA', 'N'),
(29, 'en', 'GB', 'N'),
(30, 'en', 'IE', 'N'),
(31, 'en', 'NZ', 'N'),
(32, 'en', 'US', 'Y'),
(33, 'en', 'ZA', 'N'),
(34, 'es', 'AR', 'N'),
(35, 'es', 'BO', 'N'),
(36, 'es', 'CL', 'N'),
(37, 'es', 'CO', 'N'),
(38, 'es', 'CR', 'N'),
(39, 'es', 'DO', 'N'),
(40, 'es', 'EC', 'N'),
(41, 'es', 'ES', 'N'),
(42, 'es', 'GT', 'N'),
(43, 'es', 'HN', 'N'),
(44, 'es', 'MX', 'N'),
(45, 'es', 'NI', 'N'),
(46, 'es', 'PA', 'N'),
(47, 'es', 'PE', 'N'),
(48, 'es', 'PR', 'N'),
(49, 'es', 'PY', 'N'),
(50, 'es', 'SV', 'N'),
(51, 'es', 'UY', 'N'),
(52, 'es', 'VE', 'N'),
(53, 'et', 'EE', 'N'),
(54, 'fi', 'FI', 'N'),
(55, 'fr', 'CA', 'N'),
(56, 'fr', 'CH', 'N'),
(57, 'fr', 'FR', 'N'),
(58, 'he', 'IL', 'N'),
(59, 'hr', 'HR', 'N'),
(60, 'hu', 'HU', 'N'),
(61, 'id', 'ID', 'N'),
(62, 'is', 'IS', 'N'),
(63, 'it', 'CH', 'N'),
(64, 'it', 'IT', 'N'),
(65, 'ja', 'JP', 'N'),
(66, 'ko', 'KR', 'N'),
(67, 'lt', 'LT', 'N'),
(68, 'lv', 'LV', 'N'),
(69, 'mk', 'MK', 'N'),
(70, 'nl', 'BE', 'N'),
(71, 'nl', 'NL', 'N'),
(72, 'no', 'NO', 'N'),
(73, 'pl', 'PL', 'N'),
(74, 'pt', 'BR', 'N'),
(75, 'pt', 'PT', 'N'),
(76, 'ro', 'RO', 'N'),
(77, 'ru', 'RU', 'N'),
(78, 'sh', 'YU', 'N'),
(79, 'sk', 'SK', 'N'),
(80, 'sl', 'SI', 'N'),
(81, 'sq', 'AL', 'N'),
(82, 'sr', 'YU', 'N'),
(83, 'sv', 'SE', 'N'),
(84, 'th', 'TH', 'N'),
(85, 'tr', 'TR', 'N'),
(86, 'uk', 'UA', 'N'),
(87, 'zh', 'CN', 'N'),
(88, 'zh', 'TW', 'N'),
(89, 'zh', 'HK', 'N'),
(90, 'es', 'EI', 'N'),
(91, 'az', 'AZ', 'N'),
(92, 'ms', 'BN', 'N'),
(93, 'hi', 'IN', 'N'),
(96, 'es', 'EM', 'N'),
(97, 'vi', 'VN', 'N'),
(98, 'mt', 'MT', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `locale_codeset`
--

CREATE TABLE `locale_codeset` (
  `LOCALE_ID` bigint(20) NOT NULL,
  `CODE_SET` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `locale_codeset`
--

INSERT INTO `locale_codeset` (`LOCALE_ID`, `CODE_SET`) VALUES
(88, 'Big5'),
(87, 'EUC-CN'),
(65, 'EUC-JP'),
(66, 'EUC-KR'),
(88, 'EUC-TW'),
(87, 'GB2312'),
(87, 'ISO-2022-CN'),
(88, 'ISO-2022-CN'),
(65, 'ISO-2022-JP'),
(66, 'ISO-2022-KR'),
(20, 'ISO-8859-1'),
(22, 'ISO-8859-1'),
(23, 'ISO-8859-1'),
(24, 'ISO-8859-1'),
(25, 'ISO-8859-1'),
(27, 'ISO-8859-1'),
(28, 'ISO-8859-1'),
(29, 'ISO-8859-1'),
(30, 'ISO-8859-1'),
(31, 'ISO-8859-1'),
(32, 'ISO-8859-1'),
(33, 'ISO-8859-1'),
(34, 'ISO-8859-1'),
(35, 'ISO-8859-1'),
(36, 'ISO-8859-1'),
(37, 'ISO-8859-1'),
(38, 'ISO-8859-1'),
(39, 'ISO-8859-1'),
(40, 'ISO-8859-1'),
(41, 'ISO-8859-1'),
(42, 'ISO-8859-1'),
(43, 'ISO-8859-1'),
(44, 'ISO-8859-1'),
(45, 'ISO-8859-1'),
(46, 'ISO-8859-1'),
(47, 'ISO-8859-1'),
(48, 'ISO-8859-1'),
(49, 'ISO-8859-1'),
(50, 'ISO-8859-1'),
(51, 'ISO-8859-1'),
(52, 'ISO-8859-1'),
(54, 'ISO-8859-1'),
(55, 'ISO-8859-1'),
(56, 'ISO-8859-1'),
(57, 'ISO-8859-1'),
(62, 'ISO-8859-1'),
(63, 'ISO-8859-1'),
(64, 'ISO-8859-1'),
(70, 'ISO-8859-1'),
(71, 'ISO-8859-1'),
(72, 'ISO-8859-1'),
(74, 'ISO-8859-1'),
(75, 'ISO-8859-1'),
(81, 'ISO-8859-1'),
(83, 'ISO-8859-1'),
(20, 'ISO-8859-15'),
(22, 'ISO-8859-15'),
(23, 'ISO-8859-15'),
(24, 'ISO-8859-15'),
(25, 'ISO-8859-15'),
(27, 'ISO-8859-15'),
(28, 'ISO-8859-15'),
(29, 'ISO-8859-15'),
(30, 'ISO-8859-15'),
(31, 'ISO-8859-15'),
(32, 'ISO-8859-15'),
(33, 'ISO-8859-15'),
(34, 'ISO-8859-15'),
(35, 'ISO-8859-15'),
(36, 'ISO-8859-15'),
(37, 'ISO-8859-15'),
(38, 'ISO-8859-15'),
(39, 'ISO-8859-15'),
(40, 'ISO-8859-15'),
(41, 'ISO-8859-15'),
(42, 'ISO-8859-15'),
(43, 'ISO-8859-15'),
(44, 'ISO-8859-15'),
(45, 'ISO-8859-15'),
(46, 'ISO-8859-15'),
(47, 'ISO-8859-15'),
(48, 'ISO-8859-15'),
(49, 'ISO-8859-15'),
(50, 'ISO-8859-15'),
(51, 'ISO-8859-15'),
(52, 'ISO-8859-15'),
(54, 'ISO-8859-15'),
(55, 'ISO-8859-15'),
(56, 'ISO-8859-15'),
(57, 'ISO-8859-15'),
(62, 'ISO-8859-15'),
(63, 'ISO-8859-15'),
(64, 'ISO-8859-15'),
(70, 'ISO-8859-15'),
(71, 'ISO-8859-15'),
(72, 'ISO-8859-15'),
(74, 'ISO-8859-15'),
(75, 'ISO-8859-15'),
(81, 'ISO-8859-15'),
(83, 'ISO-8859-15'),
(21, 'ISO-8859-2'),
(59, 'ISO-8859-2'),
(60, 'ISO-8859-2'),
(73, 'ISO-8859-2'),
(76, 'ISO-8859-2'),
(78, 'ISO-8859-2'),
(79, 'ISO-8859-2'),
(80, 'ISO-8859-2'),
(53, 'ISO-8859-4'),
(67, 'ISO-8859-4'),
(68, 'ISO-8859-4'),
(18, 'ISO-8859-5'),
(19, 'ISO-8859-5'),
(69, 'ISO-8859-5'),
(77, 'ISO-8859-5'),
(82, 'ISO-8859-5'),
(86, 'ISO-8859-5'),
(1, 'ISO-8859-6'),
(2, 'ISO-8859-6'),
(3, 'ISO-8859-6'),
(4, 'ISO-8859-6'),
(5, 'ISO-8859-6'),
(6, 'ISO-8859-6'),
(7, 'ISO-8859-6'),
(8, 'ISO-8859-6'),
(9, 'ISO-8859-6'),
(10, 'ISO-8859-6'),
(11, 'ISO-8859-6'),
(12, 'ISO-8859-6'),
(13, 'ISO-8859-6'),
(14, 'ISO-8859-6'),
(15, 'ISO-8859-6'),
(16, 'ISO-8859-6'),
(17, 'ISO-8859-6'),
(26, 'ISO-8859-7'),
(58, 'ISO-8859-8'),
(85, 'ISO-8859-9'),
(66, 'Johab'),
(77, 'KOI8-R'),
(1, 'MacArabic'),
(2, 'MacArabic'),
(3, 'MacArabic'),
(4, 'MacArabic'),
(5, 'MacArabic'),
(6, 'MacArabic'),
(7, 'MacArabic'),
(8, 'MacArabic'),
(9, 'MacArabic'),
(10, 'MacArabic'),
(11, 'MacArabic'),
(12, 'MacArabic'),
(13, 'MacArabic'),
(14, 'MacArabic'),
(15, 'MacArabic'),
(16, 'MacArabic'),
(17, 'MacArabic'),
(21, 'MacCentralEurope'),
(60, 'MacCentralEurope'),
(73, 'MacCentralEurope'),
(79, 'MacCentralEurope'),
(80, 'MacCentralEurope'),
(59, 'MacCroatian'),
(78, 'MacCroatian'),
(18, 'MacCyrillic'),
(19, 'MacCyrillic'),
(77, 'MacCyrillic'),
(82, 'MacCyrillic'),
(26, 'MacGreek'),
(58, 'MacHebrew'),
(62, 'MacIceland'),
(20, 'MacRoman'),
(22, 'MacRoman'),
(23, 'MacRoman'),
(24, 'MacRoman'),
(25, 'MacRoman'),
(27, 'MacRoman'),
(28, 'MacRoman'),
(29, 'MacRoman'),
(30, 'MacRoman'),
(31, 'MacRoman'),
(32, 'MacRoman'),
(33, 'MacRoman'),
(34, 'MacRoman'),
(35, 'MacRoman'),
(36, 'MacRoman'),
(37, 'MacRoman'),
(38, 'MacRoman'),
(39, 'MacRoman'),
(40, 'MacRoman'),
(41, 'MacRoman'),
(42, 'MacRoman'),
(43, 'MacRoman'),
(44, 'MacRoman'),
(45, 'MacRoman'),
(46, 'MacRoman'),
(47, 'MacRoman'),
(48, 'MacRoman'),
(49, 'MacRoman'),
(50, 'MacRoman'),
(51, 'MacRoman'),
(52, 'MacRoman'),
(54, 'MacRoman'),
(55, 'MacRoman'),
(56, 'MacRoman'),
(57, 'MacRoman'),
(63, 'MacRoman'),
(64, 'MacRoman'),
(70, 'MacRoman'),
(71, 'MacRoman'),
(72, 'MacRoman'),
(74, 'MacRoman'),
(75, 'MacRoman'),
(76, 'MacRoman'),
(83, 'MacRoman'),
(84, 'MacThai'),
(85, 'MacTurkish'),
(86, 'MacUkraine'),
(65, 'Shift_JIS'),
(84, 'TIS-620'),
(1, 'UTF-16BE'),
(2, 'UTF-16BE'),
(3, 'UTF-16BE'),
(4, 'UTF-16BE'),
(5, 'UTF-16BE'),
(6, 'UTF-16BE'),
(7, 'UTF-16BE'),
(8, 'UTF-16BE'),
(9, 'UTF-16BE'),
(10, 'UTF-16BE'),
(11, 'UTF-16BE'),
(12, 'UTF-16BE'),
(13, 'UTF-16BE'),
(14, 'UTF-16BE'),
(15, 'UTF-16BE'),
(16, 'UTF-16BE'),
(17, 'UTF-16BE'),
(18, 'UTF-16BE'),
(19, 'UTF-16BE'),
(20, 'UTF-16BE'),
(21, 'UTF-16BE'),
(22, 'UTF-16BE'),
(23, 'UTF-16BE'),
(24, 'UTF-16BE'),
(25, 'UTF-16BE'),
(26, 'UTF-16BE'),
(27, 'UTF-16BE'),
(28, 'UTF-16BE'),
(29, 'UTF-16BE'),
(30, 'UTF-16BE'),
(31, 'UTF-16BE'),
(32, 'UTF-16BE'),
(33, 'UTF-16BE'),
(34, 'UTF-16BE'),
(35, 'UTF-16BE'),
(36, 'UTF-16BE'),
(37, 'UTF-16BE'),
(38, 'UTF-16BE'),
(39, 'UTF-16BE'),
(40, 'UTF-16BE'),
(41, 'UTF-16BE'),
(42, 'UTF-16BE'),
(43, 'UTF-16BE'),
(44, 'UTF-16BE'),
(45, 'UTF-16BE'),
(46, 'UTF-16BE'),
(47, 'UTF-16BE'),
(48, 'UTF-16BE'),
(49, 'UTF-16BE'),
(50, 'UTF-16BE'),
(51, 'UTF-16BE'),
(52, 'UTF-16BE'),
(53, 'UTF-16BE'),
(54, 'UTF-16BE'),
(55, 'UTF-16BE'),
(56, 'UTF-16BE'),
(57, 'UTF-16BE'),
(58, 'UTF-16BE'),
(59, 'UTF-16BE'),
(60, 'UTF-16BE'),
(61, 'UTF-16BE'),
(62, 'UTF-16BE'),
(63, 'UTF-16BE'),
(64, 'UTF-16BE'),
(65, 'UTF-16BE'),
(66, 'UTF-16BE'),
(67, 'UTF-16BE'),
(68, 'UTF-16BE'),
(69, 'UTF-16BE'),
(70, 'UTF-16BE'),
(71, 'UTF-16BE'),
(72, 'UTF-16BE'),
(73, 'UTF-16BE'),
(74, 'UTF-16BE'),
(75, 'UTF-16BE'),
(76, 'UTF-16BE'),
(77, 'UTF-16BE'),
(78, 'UTF-16BE'),
(79, 'UTF-16BE'),
(80, 'UTF-16BE'),
(81, 'UTF-16BE'),
(82, 'UTF-16BE'),
(83, 'UTF-16BE'),
(84, 'UTF-16BE'),
(85, 'UTF-16BE'),
(86, 'UTF-16BE'),
(87, 'UTF-16BE'),
(88, 'UTF-16BE'),
(89, 'UTF-16BE'),
(90, 'UTF-16BE'),
(91, 'UTF-16BE'),
(92, 'UTF-16BE'),
(93, 'UTF-16BE'),
(96, 'UTF-16BE'),
(97, 'UTF-16BE'),
(1, 'UTF-16LE'),
(2, 'UTF-16LE'),
(3, 'UTF-16LE'),
(4, 'UTF-16LE'),
(5, 'UTF-16LE'),
(6, 'UTF-16LE'),
(7, 'UTF-16LE'),
(8, 'UTF-16LE'),
(9, 'UTF-16LE'),
(10, 'UTF-16LE'),
(11, 'UTF-16LE'),
(12, 'UTF-16LE'),
(13, 'UTF-16LE'),
(14, 'UTF-16LE'),
(15, 'UTF-16LE'),
(16, 'UTF-16LE'),
(17, 'UTF-16LE'),
(18, 'UTF-16LE'),
(19, 'UTF-16LE'),
(20, 'UTF-16LE'),
(21, 'UTF-16LE'),
(22, 'UTF-16LE'),
(23, 'UTF-16LE'),
(24, 'UTF-16LE'),
(25, 'UTF-16LE'),
(26, 'UTF-16LE'),
(27, 'UTF-16LE'),
(28, 'UTF-16LE'),
(29, 'UTF-16LE'),
(30, 'UTF-16LE'),
(31, 'UTF-16LE'),
(32, 'UTF-16LE'),
(33, 'UTF-16LE'),
(34, 'UTF-16LE'),
(35, 'UTF-16LE'),
(36, 'UTF-16LE'),
(37, 'UTF-16LE'),
(38, 'UTF-16LE'),
(39, 'UTF-16LE'),
(40, 'UTF-16LE'),
(41, 'UTF-16LE'),
(42, 'UTF-16LE'),
(43, 'UTF-16LE'),
(44, 'UTF-16LE'),
(45, 'UTF-16LE'),
(46, 'UTF-16LE'),
(47, 'UTF-16LE'),
(48, 'UTF-16LE'),
(49, 'UTF-16LE'),
(50, 'UTF-16LE'),
(51, 'UTF-16LE'),
(52, 'UTF-16LE'),
(53, 'UTF-16LE'),
(54, 'UTF-16LE'),
(55, 'UTF-16LE'),
(56, 'UTF-16LE'),
(57, 'UTF-16LE'),
(58, 'UTF-16LE'),
(59, 'UTF-16LE'),
(60, 'UTF-16LE'),
(61, 'UTF-16LE'),
(62, 'UTF-16LE'),
(63, 'UTF-16LE'),
(64, 'UTF-16LE'),
(65, 'UTF-16LE'),
(66, 'UTF-16LE'),
(67, 'UTF-16LE'),
(68, 'UTF-16LE'),
(69, 'UTF-16LE'),
(70, 'UTF-16LE'),
(71, 'UTF-16LE'),
(72, 'UTF-16LE'),
(73, 'UTF-16LE'),
(74, 'UTF-16LE'),
(75, 'UTF-16LE'),
(76, 'UTF-16LE'),
(77, 'UTF-16LE'),
(78, 'UTF-16LE'),
(79, 'UTF-16LE'),
(80, 'UTF-16LE'),
(81, 'UTF-16LE'),
(82, 'UTF-16LE'),
(83, 'UTF-16LE'),
(84, 'UTF-16LE'),
(85, 'UTF-16LE'),
(86, 'UTF-16LE'),
(87, 'UTF-16LE'),
(88, 'UTF-16LE'),
(89, 'UTF-16LE'),
(90, 'UTF-16LE'),
(91, 'UTF-16LE'),
(92, 'UTF-16LE'),
(93, 'UTF-16LE'),
(96, 'UTF-16LE'),
(97, 'UTF-16LE'),
(1, 'UTF-8'),
(2, 'UTF-8'),
(3, 'UTF-8'),
(4, 'UTF-8'),
(5, 'UTF-8'),
(6, 'UTF-8'),
(7, 'UTF-8'),
(8, 'UTF-8'),
(9, 'UTF-8'),
(10, 'UTF-8'),
(11, 'UTF-8'),
(12, 'UTF-8'),
(13, 'UTF-8'),
(14, 'UTF-8'),
(15, 'UTF-8'),
(16, 'UTF-8'),
(17, 'UTF-8'),
(18, 'UTF-8'),
(19, 'UTF-8'),
(20, 'UTF-8'),
(21, 'UTF-8'),
(22, 'UTF-8'),
(23, 'UTF-8'),
(24, 'UTF-8'),
(25, 'UTF-8'),
(26, 'UTF-8'),
(27, 'UTF-8'),
(28, 'UTF-8'),
(29, 'UTF-8'),
(30, 'UTF-8'),
(31, 'UTF-8'),
(32, 'UTF-8'),
(33, 'UTF-8'),
(34, 'UTF-8'),
(35, 'UTF-8'),
(36, 'UTF-8'),
(37, 'UTF-8'),
(38, 'UTF-8'),
(39, 'UTF-8'),
(40, 'UTF-8'),
(41, 'UTF-8'),
(42, 'UTF-8'),
(43, 'UTF-8'),
(44, 'UTF-8'),
(45, 'UTF-8'),
(46, 'UTF-8'),
(47, 'UTF-8'),
(48, 'UTF-8'),
(49, 'UTF-8'),
(50, 'UTF-8'),
(51, 'UTF-8'),
(52, 'UTF-8'),
(53, 'UTF-8'),
(54, 'UTF-8'),
(55, 'UTF-8'),
(56, 'UTF-8'),
(57, 'UTF-8'),
(58, 'UTF-8'),
(59, 'UTF-8'),
(60, 'UTF-8'),
(61, 'UTF-8'),
(62, 'UTF-8'),
(63, 'UTF-8'),
(64, 'UTF-8'),
(65, 'UTF-8'),
(66, 'UTF-8'),
(67, 'UTF-8'),
(68, 'UTF-8'),
(69, 'UTF-8'),
(70, 'UTF-8'),
(71, 'UTF-8'),
(72, 'UTF-8'),
(73, 'UTF-8'),
(74, 'UTF-8'),
(75, 'UTF-8'),
(76, 'UTF-8'),
(77, 'UTF-8'),
(78, 'UTF-8'),
(79, 'UTF-8'),
(80, 'UTF-8'),
(81, 'UTF-8'),
(82, 'UTF-8'),
(83, 'UTF-8'),
(84, 'UTF-8'),
(85, 'UTF-8'),
(86, 'UTF-8'),
(87, 'UTF-8'),
(88, 'UTF-8'),
(89, 'UTF-8'),
(90, 'UTF-8'),
(91, 'UTF-8'),
(92, 'UTF-8'),
(93, 'UTF-8'),
(96, 'UTF-8'),
(97, 'UTF-8'),
(21, 'Windows-1250'),
(59, 'Windows-1250'),
(60, 'Windows-1250'),
(73, 'Windows-1250'),
(76, 'Windows-1250'),
(78, 'Windows-1250'),
(79, 'Windows-1250'),
(80, 'Windows-1250'),
(18, 'Windows-1251'),
(19, 'Windows-1251'),
(77, 'Windows-1251'),
(82, 'Windows-1251'),
(86, 'Windows-1251'),
(20, 'Windows-1252'),
(22, 'Windows-1252'),
(23, 'Windows-1252'),
(24, 'Windows-1252'),
(25, 'Windows-1252'),
(27, 'Windows-1252'),
(28, 'Windows-1252'),
(29, 'Windows-1252'),
(30, 'Windows-1252'),
(31, 'Windows-1252'),
(32, 'Windows-1252'),
(33, 'Windows-1252'),
(34, 'Windows-1252'),
(35, 'Windows-1252'),
(36, 'Windows-1252'),
(37, 'Windows-1252'),
(38, 'Windows-1252'),
(39, 'Windows-1252'),
(40, 'Windows-1252'),
(41, 'Windows-1252'),
(42, 'Windows-1252'),
(43, 'Windows-1252'),
(44, 'Windows-1252'),
(45, 'Windows-1252'),
(46, 'Windows-1252'),
(47, 'Windows-1252'),
(48, 'Windows-1252'),
(49, 'Windows-1252'),
(50, 'Windows-1252'),
(51, 'Windows-1252'),
(52, 'Windows-1252'),
(54, 'Windows-1252'),
(55, 'Windows-1252'),
(56, 'Windows-1252'),
(57, 'Windows-1252'),
(62, 'Windows-1252'),
(63, 'Windows-1252'),
(64, 'Windows-1252'),
(70, 'Windows-1252'),
(71, 'Windows-1252'),
(72, 'Windows-1252'),
(74, 'Windows-1252'),
(75, 'Windows-1252'),
(81, 'Windows-1252'),
(83, 'Windows-1252'),
(26, 'Windows-1253'),
(85, 'Windows-1254'),
(58, 'Windows-1255'),
(1, 'Windows-1256'),
(2, 'Windows-1256'),
(3, 'Windows-1256'),
(4, 'Windows-1256'),
(5, 'Windows-1256'),
(6, 'Windows-1256'),
(7, 'Windows-1256'),
(8, 'Windows-1256'),
(9, 'Windows-1256'),
(10, 'Windows-1256'),
(11, 'Windows-1256'),
(12, 'Windows-1256'),
(13, 'Windows-1256'),
(14, 'Windows-1256'),
(15, 'Windows-1256'),
(16, 'Windows-1256'),
(17, 'Windows-1256'),
(53, 'Windows-1257'),
(67, 'Windows-1257'),
(68, 'Windows-1257'),
(89, 'Windows-1258'),
(84, 'Windows-874'),
(65, 'Windows-932'),
(87, 'Windows-936'),
(66, 'Windows-949'),
(88, 'Windows-950');

-- --------------------------------------------------------

--
-- Table structure for table `locale_pair`
--

CREATE TABLE `locale_pair` (
  `ID` bigint(20) NOT NULL,
  `SOURCE_LOCALE_ID` bigint(20) DEFAULT NULL,
  `TARGET_LOCALE_ID` bigint(20) DEFAULT NULL,
  `COMPANY_ID` bigint(20) NOT NULL,
  `IS_ACTIVE` char(1) NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `login_attempt`
--

CREATE TABLE `login_attempt` (
  `ID` bigint(20) NOT NULL,
  `IP` varchar(50) NOT NULL,
  `BLOCK_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `COUNT` int(11) NOT NULL DEFAULT '10'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `login_attempt_config`
--

CREATE TABLE `login_attempt_config` (
  `ID` bigint(20) NOT NULL,
  `ENABLE` char(1) NOT NULL DEFAULT 'N',
  `BLOCK_TIME` bigint(20) NOT NULL DEFAULT '60',
  `MAX_TIME` int(11) NOT NULL DEFAULT '10',
  `EXEMPT_IPS` varchar(4000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login_attempt_config`
--

INSERT INTO `login_attempt_config` (`ID`, `ENABLE`, `BLOCK_TIME`, `MAX_TIME`, `EXEMPT_IPS`) VALUES
(1000, 'N', 60, 10, '');

-- --------------------------------------------------------

--
-- Table structure for table `module_mapping`
--

CREATE TABLE `module_mapping` (
  `ID` bigint(20) NOT NULL,
  `SOURCE_LOCALE` varchar(40) NOT NULL,
  `SOURCE_lOCALE_LONG` varchar(100) DEFAULT NULL,
  `SOURCE_MODULE` varchar(200) NOT NULL,
  `TARGET_LOCALE` varchar(40) NOT NULL,
  `TARGET_LOCALE_LONG` varchar(100) DEFAULT NULL,
  `TARGET_MODULE` varchar(200) NOT NULL,
  `COMPANY_ID` bigint(20) NOT NULL,
  `MODULE_ID` bigint(20) DEFAULT NULL,
  `IS_ACTIVE` char(1) DEFAULT 'Y',
  `SUB_FOLDER_MAPPED` char(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `module_mapping_di`
--

CREATE TABLE `module_mapping_di` (
  `ID` bigint(20) NOT NULL,
  `SOURCE_LOCALE` varchar(40) NOT NULL,
  `SOURCE_lOCALE_LONG` varchar(100) DEFAULT NULL,
  `SOURCE_MODULE` varchar(200) NOT NULL,
  `TARGET_LOCALE` varchar(40) NOT NULL,
  `TARGET_LOCALE_LONG` varchar(100) DEFAULT NULL,
  `TARGET_MODULE` varchar(200) NOT NULL,
  `USER_ID` varchar(200) NOT NULL,
  `IS_ACTIVE` char(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `module_rename`
--

CREATE TABLE `module_rename` (
  `ID` bigint(20) NOT NULL,
  `SOURCE_NAME` varchar(40) NOT NULL,
  `TARGET_NAME` varchar(40) NOT NULL,
  `MODULE_MAPPING_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `module_rename_di`
--

CREATE TABLE `module_rename_di` (
  `ID` bigint(20) NOT NULL,
  `SOURCE_NAME` varchar(40) NOT NULL,
  `TARGET_NAME` varchar(40) NOT NULL,
  `MODULE_MAPPING_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ms_office_doc_filter`
--

CREATE TABLE `ms_office_doc_filter` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `FILTER_NAME` varchar(255) NOT NULL,
  `FILTER_DESCRIPTION` varchar(4000) DEFAULT NULL,
  `UNEXTRACTABLE_WORD_PARAGRAPH_STYLES` varchar(4000) NOT NULL,
  `UNEXTRACTABLE_WORD_CHARACTER_STYLES` varchar(4000) NOT NULL,
  `INTERNAL_TEXT_CHARACTER_STYLES` varchar(4000) NOT NULL,
  `IS_HEADER_TRANSLATE` char(1) NOT NULL,
  `IS_ALT_TRANSLATE` char(1) NOT NULL DEFAULT 'N',
  `IS_TOC_TRANSLATE` char(1) NOT NULL DEFAULT 'N',
  `COMPANY_ID` bigint(20) UNSIGNED NOT NULL,
  `CONTENT_POST_FILTER_ID` bigint(20) NOT NULL,
  `CONTENT_POST_FILTER_TABLE_NAME` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ms_office_doc_filter`
--

INSERT INTO `ms_office_doc_filter` (`ID`, `FILTER_NAME`, `FILTER_DESCRIPTION`, `UNEXTRACTABLE_WORD_PARAGRAPH_STYLES`, `UNEXTRACTABLE_WORD_CHARACTER_STYLES`, `INTERNAL_TEXT_CHARACTER_STYLES`, `IS_HEADER_TRANSLATE`, `IS_ALT_TRANSLATE`, `IS_TOC_TRANSLATE`, `COMPANY_ID`, `CONTENT_POST_FILTER_ID`, `CONTENT_POST_FILTER_TABLE_NAME`) VALUES
(1, 'MS Office Doc Filter(Default)', 'The default MS Office Doc Filtersds', 'DONOTTRANSLATE_para,tw4winExternal,tw4winInternal', 'DONOTTRANSLATE_char,tw4winInternal,tw4winExternal', '', 'Y', 'N', 'N', 1, -2, '');

-- --------------------------------------------------------

--
-- Table structure for table `ms_office_excel_filter`
--

CREATE TABLE `ms_office_excel_filter` (
  `ID` bigint(20) NOT NULL,
  `FILTER_NAME` varchar(255) NOT NULL,
  `FILTER_DESCRIPTION` varchar(1000) NOT NULL,
  `COMPANY_ID` bigint(20) NOT NULL,
  `IS_ALT_TRANSLATE` char(1) NOT NULL DEFAULT 'N',
  `IS_TAB_NAMES_TRANSLATE` char(1) NOT NULL DEFAULT 'N',
  `CONTENT_POST_FILTER_ID` bigint(20) NOT NULL,
  `CONTENT_POST_FILTER_TABLE_NAME` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ms_office_ppt_filter`
--

CREATE TABLE `ms_office_ppt_filter` (
  `ID` bigint(20) NOT NULL,
  `FILTER_NAME` varchar(255) NOT NULL,
  `FILTER_DESCRIPTION` varchar(1000) NOT NULL,
  `IS_ALT_TRANSLATE` char(1) NOT NULL DEFAULT 'N',
  `IS_NOTES_TRANSLATE` char(1) NOT NULL DEFAULT 'N',
  `COMPANY_ID` bigint(20) NOT NULL,
  `CONTENT_POST_FILTER_ID` bigint(20) NOT NULL,
  `CONTENT_POST_FILTER_TABLE_NAME` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mt_profile`
--

CREATE TABLE `mt_profile` (
  `ID` bigint(20) NOT NULL,
  `MT_PROFILE_NAME` varchar(60) DEFAULT NULL,
  `MT_ENGINE` varchar(60) DEFAULT NULL,
  `DESCRIPTION` varchar(200) DEFAULT NULL,
  `MT_THRESHOLD` bigint(20) DEFAULT '0',
  `URL` varchar(100) DEFAULT NULL,
  `PORT` int(11) DEFAULT NULL,
  `USERNAME` varchar(100) DEFAULT NULL,
  `PASSWORD` varchar(100) DEFAULT NULL,
  `CATEGORY` varchar(128) DEFAULT NULL,
  `ACCOUNTINFO` varchar(100) DEFAULT NULL,
  `COMPANY_ID` bigint(20) DEFAULT NULL,
  `TIMESTAMP` timestamp NULL DEFAULT NULL,
  `INCLUDE_MT_IDENTIFIERS` char(1) DEFAULT 'N',
  `LOG_DEBUG_INFO` char(1) DEFAULT 'N',
  `IGNORE_TM_MATCHES` char(1) DEFAULT 'N',
  `MS_TRANS_TYPE` char(1) DEFAULT '2',
  `MS_MAX_LENGTH` bigint(20) DEFAULT '1000',
  `MT_IDENTIFIER_LEADING` varchar(20) DEFAULT NULL,
  `MT_IDENTIFIER_TRAILING` varchar(20) DEFAULT NULL,
  `IS_ACTIVE` char(1) DEFAULT NULL,
  `EXTENT_JSON_INFO` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mt_profile_extent_info`
--

CREATE TABLE `mt_profile_extent_info` (
  `ID` bigint(20) NOT NULL,
  `MT_PROFILE_ID` bigint(20) DEFAULT NULL,
  `LANGUAGE_PAIR_CODE` bigint(20) DEFAULT NULL,
  `LANGUAGE_PAIR_NAME` varchar(100) DEFAULT NULL,
  `DOMAIN_CODE` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `office2010_filter`
--

CREATE TABLE `office2010_filter` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `FILTER_NAME` varchar(255) NOT NULL,
  `FILTER_DESCRIPTION` varchar(4000) DEFAULT NULL,
  `UNEXTRACTABLE_WORD_PARAGRAPH_STYLES` varchar(4000) NOT NULL,
  `UNEXTRACTABLE_WORD_CHARACTER_STYLES` varchar(4000) NOT NULL,
  `UNEXTRACTABLE_EXCEL_CELL_STYLES` varchar(4000) NOT NULL,
  `INTERNAL_TEXT_CHARACTER_STYLES` varchar(4000) NOT NULL,
  `EXCEL_INTERNAL_TEXT_STYLES` varchar(1000) NOT NULL,
  `IS_HEADER_TRANSLATE` char(1) NOT NULL,
  `IS_FOOTENDNOTE_TRANSLATE` char(1) NOT NULL DEFAULT 'N',
  `IS_MASTER_TRANSLATE` char(1) NOT NULL,
  `IS_FILEINFO_TRANSLATE` char(1) NOT NULL,
  `IS_NOTES_TRANSLATE` char(1) NOT NULL DEFAULT 'N',
  `IS_PPTLAYOUT_TRANSLATE` char(1) NOT NULL DEFAULT 'N',
  `IS_NOTEMASTER_TRANSLATE` char(1) NOT NULL DEFAULT 'N',
  `IS_HANDOUTMASTER_TRANSLATE` char(1) NOT NULL DEFAULT 'N',
  `IS_EXCEL_TAB_NAMES_TRANSLATE` char(1) NOT NULL DEFAULT 'N',
  `IS_TOOLTIPS_TRANSLATE` char(1) NOT NULL DEFAULT 'N',
  `IS_HIDDENTEXT_TRANSLATE` char(1) NOT NULL DEFAULT 'N',
  `IS_URL_TRANSLATE` char(1) NOT NULL DEFAULT 'N',
  `IS_TOC_TRANSLATE` char(1) NOT NULL DEFAULT 'N',
  `IS_COMMENT_TRANSLATE` char(1) NOT NULL DEFAULT 'N',
  `EXCEL_ORDER` char(1) NOT NULL DEFAULT 'n',
  `COMPANY_ID` bigint(20) UNSIGNED NOT NULL,
  `XML_FILTER_ID` bigint(20) NOT NULL,
  `CONTENT_POST_FILTER_ID` bigint(20) NOT NULL,
  `CONTENT_POST_FILTER_TABLE_NAME` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `openoffice_filter`
--

CREATE TABLE `openoffice_filter` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `FILTER_NAME` varchar(255) NOT NULL,
  `FILTER_DESCRIPTION` varchar(4000) DEFAULT NULL,
  `UNEXTRACTABLE_WORD_PARAGRAPH_STYLES` varchar(4000) NOT NULL,
  `UNEXTRACTABLE_WORD_CHARACTER_STYLES` varchar(4000) NOT NULL,
  `IS_HEADER_TRANSLATE` char(1) NOT NULL,
  `IS_FILEINFO_TRANSLATE` char(1) NOT NULL,
  `COMPANY_ID` bigint(20) UNSIGNED NOT NULL,
  `XML_FILTER_ID` bigint(20) NOT NULL,
  `SECOND_FILTER_ID` bigint(20) NOT NULL,
  `SECOND_FILTER_TABLE_NAME` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `page_tm`
--

CREATE TABLE `page_tm` (
  `ID` bigint(20) NOT NULL,
  `PAGE_NAME` varchar(4000) NOT NULL,
  `SOURCE_LOCALE_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `page_tm_tuv_l`
--

CREATE TABLE `page_tm_tuv_l` (
  `ID` bigint(20) NOT NULL,
  `TU_ID` bigint(20) DEFAULT NULL,
  `SEGMENT_STRING` text,
  `SEGMENT_CLOB` mediumtext,
  `EXACT_MATCH_KEY` bigint(20) DEFAULT NULL,
  `LOCALE_ID` bigint(20) DEFAULT NULL,
  `CREATION_DATE` datetime NOT NULL,
  `CREATION_USER` varchar(80) DEFAULT NULL,
  `MODIFY_DATE` datetime NOT NULL,
  `MODIFY_USER` varchar(80) DEFAULT NULL,
  `UPDATED_BY_PROJECT` varchar(40) DEFAULT NULL,
  `SID` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `page_tm_tuv_t`
--

CREATE TABLE `page_tm_tuv_t` (
  `ID` bigint(20) NOT NULL,
  `TU_ID` bigint(20) DEFAULT NULL,
  `SEGMENT_STRING` text,
  `SEGMENT_CLOB` mediumtext,
  `EXACT_MATCH_KEY` bigint(20) DEFAULT NULL,
  `LOCALE_ID` bigint(20) DEFAULT NULL,
  `CREATION_DATE` datetime NOT NULL,
  `CREATION_USER` varchar(80) DEFAULT NULL,
  `MODIFY_DATE` datetime NOT NULL,
  `MODIFY_USER` varchar(80) DEFAULT NULL,
  `UPDATED_BY_PROJECT` varchar(40) DEFAULT NULL,
  `SID` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `page_tm_tu_l`
--

CREATE TABLE `page_tm_tu_l` (
  `ID` bigint(20) NOT NULL,
  `TM_ID` bigint(20) DEFAULT NULL,
  `FORMAT` varchar(20) DEFAULT NULL,
  `TYPE` varchar(50) NOT NULL,
  `SOURCE_TM_NAME` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `page_tm_tu_t`
--

CREATE TABLE `page_tm_tu_t` (
  `ID` bigint(20) NOT NULL,
  `TM_ID` bigint(20) DEFAULT NULL,
  `FORMAT` varchar(20) DEFAULT NULL,
  `TYPE` varchar(50) NOT NULL,
  `SOURCE_TM_NAME` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`ID`, `NAME`) VALUES
(427, 'account.notification.editEmailTemplate'),
(199, 'account.notification.general'),
(376, 'account.notification.noMatchesInJobEmail'),
(377, 'account.notification.repetitionsInJobEmail'),
(197, 'account.notification.system'),
(198, 'account.notification.wfmgmt'),
(164, 'activities.accept'),
(254, 'activities.accept.all'),
(362, 'activities.batch.complete.activity'),
(363, 'activities.batch.complete.workflow'),
(387, 'activities.change.own.email'),
(274, 'activities.change.own.password'),
(273, 'activities.comments.download'),
(173, 'activities.comments.edit'),
(261, 'activities.comments.jobComments'),
(195, 'activities.comments.new'),
(172, 'activities.comments.view'),
(225, 'activities.detailStatistics'),
(253, 'activities.download'),
(283, 'activities.download.all'),
(386, 'activities.download.combined'),
(165, 'activities.export'),
(409, 'activities.export.download'),
(166, 'activities.export.inprogress'),
(171, 'activities.files.edit'),
(170, 'activities.files.view'),
(327, 'activities.jobcomments.download'),
(325, 'activities.jobcomments.edit'),
(326, 'activities.jobcomments.new'),
(324, 'activities.jobcomments.view'),
(366, 'activities.offlineUpload'),
(370, 'activities.offlineUpload.fromAnyActivity'),
(246, 'activities.rejectAfterAccepting'),
(245, 'activities.rejectBeforeAccepting'),
(169, 'activities.searchreplace'),
(313, 'activities.secondaryTargetFile'),
(226, 'activities.summaryStatistics'),
(374, 'activities.tb.search'),
(373, 'activities.tm.search'),
(364, 'activities.updateLeverage'),
(168, 'activities.upload.supportfiles'),
(163, 'activities.view'),
(167, 'activities.workoffline'),
(361, 'activity.dashboard.view'),
(8, 'activityTypes.edit'),
(9, 'activityTypes.new'),
(7, 'activityTypes.remove'),
(6, 'activityTypes.view'),
(356, 'admin.setDefaultRoles'),
(317, 'attribute.edit'),
(315, 'attribute.new'),
(316, 'attribute.remove'),
(314, 'attribute.view'),
(320, 'attributeGroup.edit'),
(318, 'attributeGroup.new'),
(319, 'attributeGroup.remove'),
(323, 'attributeGroup.view'),
(426, 'base.text.filter.escaping'),
(425, 'base.text.filter.internal.text'),
(424, 'base.text.filter.view'),
(423, 'blaiseConnector'),
(15, 'calendar.administer'),
(207, 'comment.access.editallcomments'),
(201, 'comment.access.restricted'),
(232, 'company.edit'),
(384, 'company.migrate'),
(233, 'company.new'),
(234, 'company.remove'),
(231, 'company.view'),
(431, 'configExportAndImport'),
(402, 'coti.job'),
(367, 'createjob'),
(393, 'createJobNoApplet'),
(11, 'currency.edit'),
(12, 'currency.new'),
(10, 'currency.view'),
(188, 'customer.upload'),
(368, 'customer.upload.via.webservice'),
(300, 'cvs.admin'),
(352, 'cvs.file.profiles'),
(354, 'cvs.file.profiles.edit'),
(353, 'cvs.file.profiles.new'),
(355, 'cvs.file.profiles.remove'),
(348, 'cvs.module.mapping'),
(350, 'cvs.module.mapping.edit'),
(349, 'cvs.module.mapping.new'),
(351, 'cvs.module.mapping.remove'),
(343, 'cvs.modules'),
(347, 'cvs.modules.checkout'),
(345, 'cvs.modules.edit'),
(344, 'cvs.modules.new'),
(346, 'cvs.modules.remove'),
(301, 'cvs.operate'),
(339, 'cvs.servers'),
(341, 'cvs.servers.edit'),
(340, 'cvs.servers.new'),
(342, 'cvs.servers.remove'),
(287, 'desktopicon.connect.cvs'),
(403, 'editScorecard'),
(407, 'eloqua'),
(119, 'exportloc.default'),
(120, 'exportloc.edit'),
(121, 'exportloc.new'),
(118, 'exportloc.remove'),
(117, 'exportloc.view'),
(94, 'fileextention.new'),
(284, 'fileextention.remove'),
(93, 'fileextention.view'),
(91, 'fileprofiles.edit'),
(92, 'fileprofiles.new'),
(90, 'fileprofiles.remove'),
(208, 'fileprofiles.seeAll'),
(89, 'fileprofiles.view'),
(292, 'filter.configuration'),
(294, 'filter.configuration.add.filter'),
(295, 'filter.configuration.edit.filter'),
(395, 'filter.configuration.export.filters'),
(396, 'filter.configuration.import.filters'),
(293, 'filter.configuration.remove.filters'),
(419, 'gitConnector'),
(31, 'holiday.edit'),
(32, 'holiday.new'),
(30, 'holiday.remove'),
(29, 'holiday.view'),
(104, 'import'),
(322, 'job.attribute.edit'),
(321, 'job.attribute.view'),
(392, 'job.changename'),
(143, 'job.comments.edit'),
(196, 'job.comments.new'),
(142, 'job.comments.view'),
(145, 'job.costing.edit'),
(239, 'job.costing.expense.view'),
(248, 'job.costing.reedit'),
(146, 'job.costing.report'),
(240, 'job.costing.revenue.view'),
(144, 'job.costing.view'),
(286, 'job.files.download'),
(148, 'job.files.edit'),
(147, 'job.files.view'),
(250, 'job.quote.approve'),
(251, 'job.quote.ponumber.edit'),
(252, 'job.quote.ponumber.view'),
(237, 'job.quote.send'),
(238, 'job.quote.status.view'),
(236, 'job.quote.view'),
(203, 'job.source.wordcount.total'),
(157, 'job.workflows.add'),
(154, 'job.workflows.archive'),
(155, 'job.workflows.details'),
(223, 'job.workflows.detailStatistics'),
(150, 'job.workflows.discard'),
(159, 'job.workflows.dispatch'),
(158, 'job.workflows.edit'),
(162, 'job.workflows.editexportloc'),
(160, 'job.workflows.estcompdate'),
(222, 'job.workflows.estreviewstart'),
(156, 'job.workflows.export'),
(411, 'job.workflows.export.download'),
(161, 'job.workflows.plannedcompdate'),
(306, 'job.workflows.priority'),
(153, 'job.workflows.ratevendor'),
(205, 'job.workflows.reassign'),
(271, 'job.workflows.skip'),
(224, 'job.workflows.summaryStatistics'),
(422, 'job.workflows.translated.text'),
(149, 'job.workflows.view'),
(151, 'job.workflows.viewerror'),
(152, 'job.workflows.wordcount'),
(415, 'jobs.addjobtogroup'),
(138, 'jobs.archive'),
(130, 'jobs.changewfm'),
(204, 'jobs.clearerrors'),
(136, 'jobs.details'),
(131, 'jobs.discard'),
(132, 'jobs.dispatch'),
(139, 'jobs.download'),
(242, 'jobs.estimatedcompdate'),
(243, 'jobs.estimatedtranslatecompdate'),
(134, 'jobs.export'),
(410, 'jobs.export.download'),
(133, 'jobs.exportsource'),
(412, 'jobs.group'),
(140, 'jobs.makeready'),
(413, 'jobs.newgroup'),
(141, 'jobs.plannedcompdate'),
(394, 'jobs.recreate'),
(135, 'jobs.reexport'),
(414, 'jobs.removegroup'),
(416, 'jobs.removejobfromgroup'),
(129, 'jobs.searchreplace'),
(369, 'jobs.updateLeverage'),
(365, 'jobs.updateWordCounts'),
(128, 'jobs.view'),
(137, 'jobs.viewerror'),
(127, 'jobscope.all'),
(360, 'jobscope.myProjects'),
(272, 'locale.new'),
(398, 'localePairs.export'),
(399, 'localePairs.import'),
(5, 'localePairs.new'),
(4, 'localePairs.remove'),
(3, 'localePairs.view'),
(80, 'locprofiles.details'),
(81, 'locprofiles.duplicate'),
(82, 'locprofiles.edit'),
(83, 'locprofiles.new'),
(79, 'locprofiles.remove'),
(429, 'locprofiles.report'),
(78, 'locprofiles.view'),
(1, 'logs.view'),
(390, 'mtp.edit'),
(400, 'mtp.export'),
(401, 'mtp.import'),
(389, 'mtp.new'),
(391, 'mtp.remove'),
(388, 'mtp.view'),
(406, 'operationLog.view'),
(194, 'permgroups.details'),
(35, 'permgroups.edit'),
(36, 'permgroups.new'),
(34, 'permgroups.remove'),
(33, 'permgroups.view'),
(70, 'projects.edit'),
(71, 'projects.edit.pm'),
(69, 'projects.export'),
(190, 'projects.getall'),
(192, 'projects.getbelong'),
(191, 'projects.getmanage'),
(68, 'projects.import'),
(13, 'projects.manage'),
(14, 'projects.manage.workflows'),
(72, 'projects.new'),
(290, 'projects.remove'),
(67, 'projects.view'),
(434, 'ps.edit'),
(433, 'ps.new'),
(435, 'ps.remove'),
(432, 'ps.view'),
(18, 'rates.edit'),
(19, 'rates.new'),
(17, 'rates.view'),
(436, 'remoteServices'),
(215, 'reports.avg_per_comp'),
(269, 'reports.character.count'),
(229, 'reports.comment'),
(257, 'reports.comments.analysis'),
(210, 'reports.custom'),
(193, 'reports.custom.external'),
(235, 'reports.customize'),
(219, 'reports.dell.act_dur'),
(291, 'reports.dell.file_list'),
(218, 'reports.dell.job_status'),
(220, 'reports.dell.online_jobs'),
(247, 'reports.dell.online_jobs.id'),
(227, 'reports.dell.online_jobs.recalculate'),
(408, 'reports.dell.online_jobs_for_ip_translator'),
(221, 'reports.dell.online_review_status'),
(230, 'reports.dell.reviewer.vendor_po'),
(228, 'reports.dell.vendor_po'),
(262, 'reports.implemented.comments.check'),
(330, 'reports.jobAttribute'),
(211, 'reports.job_cost'),
(214, 'reports.job_details'),
(259, 'reports.language.sign.off'),
(397, 'reports.language.sign.off.simple'),
(174, 'reports.main'),
(216, 'reports.missing_terms'),
(428, 'reports.MT.post.edit.distance'),
(418, 'reports.post.review.qa'),
(241, 'reports.reviewer.lisa_qa'),
(404, 'reports.scorecard'),
(244, 'reports.sla'),
(385, 'reports.summary'),
(217, 'reports.term_audit'),
(212, 'reports.tm'),
(260, 'reports.translation.progress'),
(258, 'reports.translations.edit'),
(420, 'reports.translations.verification'),
(213, 'reports.wf_status'),
(209, 'reports.word_count'),
(430, 'restart.system'),
(329, 'rss.job'),
(328, 'rss.reader'),
(268, 'segmentationrule.duplicate'),
(265, 'segmentationrule.edit'),
(266, 'segmentationrule.export'),
(264, 'segmentationrule.new'),
(267, 'segmentationrule.remove'),
(263, 'segmentationrule.view'),
(280, 'service.tb.createEntries'),
(281, 'service.tb.editEntries'),
(282, 'service.tb.getAllTermbases'),
(279, 'service.tb.searchEntries'),
(278, 'service.tm.getAllTMProfiles'),
(101, 'sgmlrule.create'),
(103, 'sgmlrule.edit'),
(102, 'sgmlrule.remove'),
(100, 'sgmlrule.upload'),
(99, 'sgmlrule.view'),
(2, 'shutdown.system'),
(357, 'sourceFiles.add'),
(358, 'sourceFiles.delete'),
(359, 'sourceFiles.edit'),
(200, 'sourcepage.edit'),
(87, 'supportfiles.remove'),
(88, 'supportfiles.upload'),
(86, 'supportfiles.view'),
(85, 'system.parameters'),
(22, 'systemCalendar.default'),
(21, 'systemCalendar.dup'),
(24, 'systemCalendar.edit'),
(25, 'systemCalendar.new'),
(23, 'systemCalendar.remove'),
(20, 'systemCalendar.view'),
(62, 'terminology.browse'),
(59, 'terminology.duplicate'),
(60, 'terminology.edit'),
(64, 'terminology.export'),
(63, 'terminology.import'),
(57, 'terminology.indexes'),
(66, 'terminology.inputModels'),
(65, 'terminology.maintenance'),
(61, 'terminology.new'),
(58, 'terminology.remove'),
(372, 'terminology.search'),
(56, 'terminology.stats'),
(55, 'terminology.view'),
(380, 'tm.addEntries'),
(206, 'tm.delete'),
(382, 'tm.deleteEntries'),
(49, 'tm.duplicate'),
(50, 'tm.edit'),
(381, 'tm.editEntries'),
(375, 'tm.enableTMAttributes'),
(47, 'tm.export'),
(46, 'tm.import'),
(45, 'tm.maintenance'),
(51, 'tm.new'),
(48, 'tm.reindex'),
(371, 'tm.search'),
(383, 'tm.search.advanced'),
(44, 'tm.stats'),
(42, 'tm.view'),
(53, 'tmp.edit'),
(54, 'tmp.new'),
(289, 'tmp.remove'),
(52, 'tmp.view'),
(270, 'tmProfile.in.context.match'),
(309, 'uilocale.downloadres'),
(312, 'uilocale.new'),
(308, 'uilocale.remove'),
(311, 'uilocale.setdefault'),
(310, 'uilocale.uploadres'),
(307, 'uilocale.view'),
(27, 'userCalendar.edit'),
(28, 'userCalendar.edit.yours'),
(26, 'userCalendar.view'),
(256, 'users.access.bccEmail'),
(255, 'users.access.ccEmail'),
(38, 'users.edit'),
(202, 'users.edit.assignAnyPermGroups'),
(379, 'users.export'),
(378, 'users.import'),
(40, 'users.new'),
(41, 'users.projects.membership'),
(39, 'users.remove'),
(37, 'users.view'),
(182, 'vendors.customform'),
(181, 'vendors.details'),
(179, 'vendors.edit'),
(177, 'vendors.new'),
(185, 'vendors.rating.edit'),
(183, 'vendors.rating.new'),
(186, 'vendors.rating.remove'),
(184, 'vendors.rating.view'),
(180, 'vendors.remove'),
(178, 'vendors.view'),
(405, 'viewScorecard'),
(16, 'workflow.cancel'),
(74, 'workflows.duplicate'),
(76, 'workflows.edit'),
(77, 'workflows.new'),
(75, 'workflows.remove'),
(73, 'workflows.view'),
(297, 'xmldtd.edit'),
(298, 'xmldtd.new'),
(299, 'xmldtd.remove'),
(296, 'xmldtd.view'),
(96, 'xmlrule.duplicate'),
(97, 'xmlrule.edit'),
(98, 'xmlrule.new'),
(288, 'xmlrule.remove'),
(95, 'xmlrule.view');

-- --------------------------------------------------------

--
-- Table structure for table `permissiongroup`
--

CREATE TABLE `permissiongroup` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(40) NOT NULL,
  `COMPANY_ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(4000) DEFAULT NULL,
  `PERMISSION_SET` varchar(4000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permissiongroup`
--

INSERT INTO `permissiongroup` (`ID`, `NAME`, `COMPANY_ID`, `DESCRIPTION`, `PERMISSION_SET`) VALUES
(1, 'SuperAdministrator', 1, 'Super Administrator Group for Multi-Company', '|1|2|3|6|10|13|14|17|20|26|29|33|35|36|37|38|39|40|41|42|43|44|52|55|56|62|67|73|78|80|85|86|89|93|95|99|108|113|117|127|128|131|136|137|142|144|147|149|150|151|152|155|156|160|161|163|170|172|174|178|181|182|184|190|191|192|193|194|197|202|208|212|213|214|215|231|232|233|234|235|236|237|238|239|240|241|272|355|388|430|436|'),
(2, 'SuperProjectManager', 1, 'Super Project Manager Group for Multi-Company', '|3|4|5|6|7|8|9|10|11|12|13|14|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|32|33|34|35|36|37|38|39|40|41|42|43|44|45|46|47|48|49|50|51|52|53|54|55|56|57|58|59|60|61|62|63|64|65|66|67|68|69|70|71|72|73|75|76|77|78|79|80|82|83|89|90|91|92|93|94|95|96|97|98|99|100|101|102|103|104|117|118|119|120|121|128|130|131|132|133|134|135|136|137|138|140|141|142|143|144|145|146|147|148|149|150|151|152|153|154|155|156|157|158|159|160|161|162|163|164|165|166|167|168|170|171|172|173|174|191|192|193|194|195|196|198|199|200|201|202|205|212|213|214|215|235|236|237|238|239|240|388|389|390|436|'),
(5, 'LocalizationParticipant', 1, 'Default Localization Participant Group', '|163|164|165|166|167|168|169|170|171|172|173|174|195|199|200|201|225|226|245|246|253|254|261|273|283|285|291|324|325|326|327|361|362|363|364|370|373|374|386|');

-- --------------------------------------------------------

--
-- Table structure for table `permissiongroup_user`
--

CREATE TABLE `permissiongroup_user` (
  `PERMISSIONGROUP_ID` bigint(20) NOT NULL,
  `USER_ID` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permissiongroup_user`
--

INSERT INTO `permissiongroup_user` (`PERMISSIONGROUP_ID`, `USER_ID`) VALUES
(1, 'superadmin');

-- --------------------------------------------------------

--
-- Table structure for table `perplexity_service`
--

CREATE TABLE `perplexity_service` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(300) NOT NULL,
  `COMPANY_ID` bigint(20) UNSIGNED NOT NULL,
  `USER_NAME` varchar(300) NOT NULL,
  `PASSWORD` varchar(300) NOT NULL,
  `DESCRIPTION` varchar(4000) DEFAULT NULL,
  `URL` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `plain_text_filter`
--

CREATE TABLE `plain_text_filter` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `FILTER_NAME` varchar(255) NOT NULL,
  `FILTER_DESCRIPTION` varchar(4000) DEFAULT NULL,
  `COMPANY_ID` bigint(20) UNSIGNED NOT NULL,
  `CONFIG_XML` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `po_filter`
--

CREATE TABLE `po_filter` (
  `ID` bigint(20) NOT NULL,
  `FILTER_NAME` varchar(255) NOT NULL,
  `FILTER_DESCRIPTION` varchar(1000) NOT NULL,
  `COMPANY_ID` bigint(20) NOT NULL,
  `SECOND_FILTER_ID` bigint(20) NOT NULL,
  `SECOND_FILTER_TABLE_NAME` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `PROJECT_SEQ` bigint(20) NOT NULL,
  `PROJECT_NAME` varchar(40) NOT NULL,
  `DESCRIPTION` varchar(4000) DEFAULT NULL,
  `MANAGER_USER_ID` varchar(80) NOT NULL,
  `TERMBASE_NAME` varchar(100) DEFAULT NULL,
  `QUOTE_USER_ID` varchar(80) DEFAULT NULL,
  `COMPANYID` bigint(20) NOT NULL,
  `IS_ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `PMCOST` decimal(8,2) DEFAULT '0.00',
  `ATTRIBUTE_SET_ID` bigint(20) DEFAULT NULL,
  `POREQUIRED` tinyint(1) NOT NULL DEFAULT '1',
  `AUTO_ACCEPT_TRANS` tinyint(1) NOT NULL DEFAULT '0',
  `AUTO_SEND_TRANS` tinyint(1) NOT NULL DEFAULT '0',
  `REVIEWONLYAUTOACCEPT` tinyint(1) NOT NULL DEFAULT '0',
  `REVIEWONLYAUTOSEND` tinyint(1) NOT NULL DEFAULT '0',
  `REVIEW_REPORT_INCLUDE_COMPACT_TAGS` tinyint(1) NOT NULL DEFAULT '0',
  `AUTOACCEPTPMTASK` tinyint(1) NOT NULL DEFAULT '0',
  `CHECK_UNTRANSLATED_SEGMENTS` tinyint(1) NOT NULL DEFAULT '0',
  `SAVE_TRANSLATIONS_EDIT_REPORT` char(1) DEFAULT 'Y',
  `SAVE_REVIEWERS_COMMENTS_REPORT` char(1) DEFAULT 'Y',
  `SAVE_OFFLINE_FILES` char(1) DEFAULT 'Y',
  `ALLOW_MANUAL_QA_CHECKS` char(1) DEFAULT 'N',
  `AUTO_ACCEPT_QA_TASK` char(1) DEFAULT 'N',
  `AUTO_SEND_QA_REPORT` char(1) DEFAULT 'N',
  `MANUAL_RUN_DITA_CHECKS` char(1) DEFAULT 'N',
  `AUTO_ACCEPT_DITA_QA_TASK` char(1) DEFAULT 'N',
  `AUTO_SEND_DITA_QA_REPORT` char(1) DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_tm`
--

CREATE TABLE `project_tm` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(60) NOT NULL,
  `DOMAIN` varchar(500) DEFAULT NULL,
  `ORGANIZATION` varchar(400) DEFAULT NULL,
  `DESCRIPTION` varchar(500) DEFAULT NULL,
  `INDEX_TARGET` char(1) DEFAULT 'N',
  `TM3_ID` bigint(20) DEFAULT NULL,
  `CREATION_DATE` datetime DEFAULT NULL,
  `CREATION_USER` varchar(80) DEFAULT NULL,
  `COMPANY_ID` bigint(20) NOT NULL,
  `IS_REMOTE_TM` char(1) DEFAULT 'N',
  `REMOTE_TM_PROFILE_ID` bigint(20) DEFAULT '-1',
  `REMOTE_TM_PROFILE_NAME` varchar(60) DEFAULT NULL,
  `CONVERT_RATE` smallint(6) DEFAULT '0',
  `LAST_TU_ID` int(11) DEFAULT '-1',
  `STATUS` varchar(50) DEFAULT '',
  `CONVERTED_TM3_ID` int(11) DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_tm_attribute`
--

CREATE TABLE `project_tm_attribute` (
  `ID` bigint(20) NOT NULL,
  `TM_ID` bigint(20) NOT NULL,
  `ATT_NAME` varchar(100) NOT NULL,
  `SET_TYPE` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_tm_tuv_l`
--

CREATE TABLE `project_tm_tuv_l` (
  `ID` bigint(20) NOT NULL,
  `TU_ID` bigint(20) DEFAULT NULL,
  `SEGMENT_STRING` text,
  `SEGMENT_CLOB` mediumtext,
  `EXACT_MATCH_KEY` bigint(20) DEFAULT NULL,
  `LOCALE_ID` bigint(20) DEFAULT NULL,
  `CREATION_DATE` datetime NOT NULL,
  `CREATION_USER` varchar(80) DEFAULT NULL,
  `MODIFY_DATE` datetime NOT NULL,
  `MODIFY_USER` varchar(80) DEFAULT NULL,
  `UPDATED_BY_PROJECT` varchar(40) DEFAULT NULL,
  `SID` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_tm_tuv_t`
--

CREATE TABLE `project_tm_tuv_t` (
  `ID` bigint(20) NOT NULL,
  `TU_ID` bigint(20) DEFAULT NULL,
  `SEGMENT_STRING` text,
  `SEGMENT_CLOB` mediumtext,
  `EXACT_MATCH_KEY` bigint(20) DEFAULT NULL,
  `LOCALE_ID` bigint(20) DEFAULT NULL,
  `CREATION_DATE` datetime NOT NULL,
  `CREATION_USER` varchar(80) DEFAULT NULL,
  `MODIFY_DATE` datetime NOT NULL,
  `MODIFY_USER` varchar(80) DEFAULT NULL,
  `UPDATED_BY_PROJECT` varchar(40) DEFAULT NULL,
  `SID` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_tm_tu_l`
--

CREATE TABLE `project_tm_tu_l` (
  `ID` bigint(20) NOT NULL,
  `TM_ID` bigint(20) DEFAULT NULL,
  `FORMAT` varchar(20) DEFAULT NULL,
  `TYPE` varchar(50) NOT NULL,
  `SOURCE_LOCALE_ID` bigint(20) DEFAULT NULL,
  `SOURCE_TM_NAME` varchar(60) DEFAULT NULL,
  `FROM_WORLD_SERVER` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_tm_tu_t`
--

CREATE TABLE `project_tm_tu_t` (
  `ID` bigint(20) NOT NULL,
  `TM_ID` bigint(20) DEFAULT NULL,
  `FORMAT` varchar(20) DEFAULT NULL,
  `TYPE` varchar(50) NOT NULL,
  `SOURCE_LOCALE_ID` bigint(20) DEFAULT NULL,
  `SOURCE_TM_NAME` varchar(60) DEFAULT NULL,
  `FROM_WORLD_SERVER` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_tm_tu_t_prop`
--

CREATE TABLE `project_tm_tu_t_prop` (
  `ID` bigint(20) NOT NULL,
  `TU_ID` bigint(20) NOT NULL,
  `PROP_TYPE` varchar(200) NOT NULL,
  `PROP_VALUE` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_user`
--

CREATE TABLE `project_user` (
  `PROJECT_ID` bigint(20) NOT NULL,
  `USER_ID` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_vendor`
--

CREATE TABLE `project_vendor` (
  `VENDOR_ID` bigint(20) NOT NULL,
  `PROJECT_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_filter`
--

CREATE TABLE `qa_filter` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `FILTER_NAME` varchar(255) NOT NULL,
  `FILTER_DESCRIPTION` varchar(4000) DEFAULT NULL,
  `COMPANY_ID` bigint(20) UNSIGNED NOT NULL,
  `CONFIG_XML` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qrtz_blob_triggers`
--

CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qrtz_calendars`
--

CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qrtz_cron_triggers`
--

CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qrtz_fired_triggers`
--

CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qrtz_job_details`
--

CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qrtz_locks`
--

CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qrtz_paused_trigger_grps`
--

CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qrtz_scheduler_state`
--

CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qrtz_simple_triggers`
--

CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qrtz_simprop_triggers`
--

CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qrtz_triggers`
--

CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rate`
--

CREATE TABLE `rate` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(40) NOT NULL,
  `CURRENCY_CONV_ID` bigint(20) DEFAULT NULL,
  `TYPE` char(1) DEFAULT NULL,
  `ACTIVITY_ID` bigint(20) NOT NULL,
  `LOCALE_PAIR_ID` bigint(20) NOT NULL,
  `EXACT_CONTEXT_RATE` float NOT NULL,
  `EXACT_SEGMENT_TM_RATE` float NOT NULL,
  `FUZZY_LOW_RATE` float NOT NULL,
  `FUZZY_MED_RATE` float NOT NULL,
  `FUZZY_MED_HI_RATE` float NOT NULL,
  `FUZZY_HI_RATE` float NOT NULL,
  `EXACT_CONTEXT_RATE_PER` float NOT NULL,
  `EXACT_SEGMENT_TM_RATE_PER` float NOT NULL,
  `FUZZY_LOW_RATE_PER` float NOT NULL,
  `FUZZY_MED_RATE_PER` float NOT NULL,
  `FUZZY_MED_HI_RATE_PER` float NOT NULL,
  `FUZZY_HI_RATE_PER` float NOT NULL,
  `NO_MATCH_RATE` float NOT NULL,
  `REPETITION_RATE` float NOT NULL,
  `IN_CONTEXT_MATCH_RATE` float NOT NULL,
  `IN_CONTEXT_MATCH_RATE_PER` float NOT NULL,
  `REPETITION_RATE_PER` float NOT NULL,
  `UNIT_RATE` float NOT NULL,
  `IS_ACTIVE` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `remote_access_history`
--

CREATE TABLE `remote_access_history` (
  `ID` bigint(20) NOT NULL,
  `ACCESS_TOKEN` varchar(60) DEFAULT NULL,
  `API_NAME` varchar(60) DEFAULT NULL,
  `USER_ID` varchar(25) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `LAST_ACCESS_DATE` datetime DEFAULT NULL,
  `CONTENTS` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `remote_ip`
--

CREATE TABLE `remote_ip` (
  `ID` bigint(20) NOT NULL,
  `IP` varchar(40) NOT NULL,
  `DESCRIPTION` varchar(4000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `removed_prefix_tag`
--

CREATE TABLE `removed_prefix_tag` (
  `ID` bigint(20) NOT NULL,
  `STRING` mediumtext NOT NULL,
  `TU_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `removed_suffix_tag`
--

CREATE TABLE `removed_suffix_tag` (
  `ID` bigint(20) NOT NULL,
  `STRING` mediumtext NOT NULL,
  `TU_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `removed_tag`
--

CREATE TABLE `removed_tag` (
  `ID` bigint(20) NOT NULL,
  `PREFIX_STRING` mediumtext NOT NULL,
  `SUFFIX_STRING` mediumtext NOT NULL,
  `TU_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reports_data`
--

CREATE TABLE `reports_data` (
  `USER_ID` varchar(100) NOT NULL,
  `REPORT_JOBIDS` varchar(500) NOT NULL DEFAULT '',
  `REPORT_TYPELIST` varchar(500) NOT NULL DEFAULT '',
  `STATUS` varchar(100) DEFAULT NULL,
  `PERCENT` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `ID` bigint(20) NOT NULL,
  `L10N_PROFILE_ID` bigint(20) NOT NULL,
  `TYPE` varchar(35) NOT NULL,
  `EVENT_FLOW_XML` mediumtext,
  `EXCEPTION_XML` text,
  `JOB_ID` bigint(20) DEFAULT NULL,
  `PAGE_ID` bigint(20) DEFAULT NULL,
  `DATA_SOURCE_ID` int(11) NOT NULL,
  `IS_PAGE_CXE_PREVIEWABLE` char(1) NOT NULL,
  `BATCH_ID` varchar(400) DEFAULT NULL,
  `BATCH_PAGE_COUNT` int(5) DEFAULT NULL,
  `BATCH_PAGE_NUMBER` int(5) DEFAULT NULL,
  `BATCH_DOC_PAGE_COUNT` int(5) DEFAULT NULL,
  `BATCH_DOC_PAGE_NUMBER` int(5) DEFAULT NULL,
  `BATCH_JOB_NAME` varchar(320) DEFAULT NULL,
  `BASE_HREF` varchar(2000) DEFAULT NULL,
  `TIMESTAMP` datetime NOT NULL,
  `COMPANY_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reserved_time`
--

CREATE TABLE `reserved_time` (
  `ID` bigint(20) NOT NULL,
  `USER_CALENDAR_ID` bigint(20) NOT NULL,
  `SUBJECT` varchar(4200) NOT NULL,
  `TYPE` varchar(20) NOT NULL,
  `TASK_ID` bigint(20) DEFAULT NULL,
  `START_TIME` datetime NOT NULL,
  `START_HOUR` int(2) NOT NULL,
  `START_MINUTE` int(2) NOT NULL,
  `END_TIME` datetime DEFAULT NULL,
  `END_HOUR` int(2) NOT NULL,
  `END_MINUTE` int(2) NOT NULL,
  `DURATION_EXPRESSION` varchar(100) NOT NULL,
  `REPEAT_EXPRESSION` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rss_feed`
--

CREATE TABLE `rss_feed` (
  `ID` bigint(20) NOT NULL,
  `RSS_URL` varchar(100) DEFAULT NULL,
  `ENCODING` varchar(20) DEFAULT NULL,
  `VERSION` varchar(6) DEFAULT NULL,
  `TITLE` varchar(200) DEFAULT NULL,
  `LINK` varchar(200) DEFAULT NULL,
  `DESCRIPTION` text,
  `LANGUAGE` varchar(12) DEFAULT NULL,
  `COPYRIGHT` varchar(200) DEFAULT NULL,
  `IMAGE_TITLE` varchar(200) DEFAULT NULL,
  `IMAGE_LINK` varchar(200) DEFAULT NULL,
  `IMAGE_URL` varchar(100) DEFAULT NULL,
  `IS_DEFAULT` char(1) DEFAULT 'N',
  `COMPANY_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rss_item`
--

CREATE TABLE `rss_item` (
  `ID` bigint(20) NOT NULL,
  `FEED_ID` bigint(20) DEFAULT NULL,
  `TITLE` varchar(200) DEFAULT NULL,
  `LINK` varchar(200) DEFAULT NULL,
  `DESCRIPTON` text,
  `AUTHOR` varchar(30) DEFAULT NULL,
  `PUBDATE` varchar(30) DEFAULT NULL,
  `STATUS` int(11) DEFAULT '0',
  `PUBLISHED_DATE` datetime DEFAULT NULL,
  `IS_READ` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `scorecard_score`
--

CREATE TABLE `scorecard_score` (
  `ID` bigint(20) NOT NULL,
  `SCORECARD_CATEGORY` varchar(200) DEFAULT NULL,
  `SCORE` int(11) DEFAULT NULL,
  `WORKFLOW_ID` bigint(20) NOT NULL,
  `JOB_ID` bigint(20) NOT NULL,
  `COMPANY_ID` bigint(20) NOT NULL,
  `MODIFY_USER_ID` varchar(300) NOT NULL,
  `IS_ACTIVE` char(1) NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `secondary_target_file`
--

CREATE TABLE `secondary_target_file` (
  `ID` bigint(20) NOT NULL,
  `WORKFLOW_ID` bigint(20) NOT NULL,
  `STORAGE_PATH` varchar(4000) NOT NULL,
  `MODIFIER_USER_ID` varchar(80) NOT NULL,
  `LAST_MODIFIED` bigint(20) NOT NULL,
  `FILE_SIZE` int(11) NOT NULL,
  `EVENT_FLOW_XML` text,
  `STATE` varchar(20) NOT NULL,
  `IS_ACTIVE` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `segmentation_rule`
--

CREATE TABLE `segmentation_rule` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(40) NOT NULL,
  `COMPANY_ID` bigint(20) NOT NULL,
  `SR_TYPE` int(4) NOT NULL DEFAULT '0',
  `DESCRIPTION` varchar(4000) DEFAULT NULL,
  `RULE_TEXT` mediumtext,
  `IS_ACTIVE` char(1) NOT NULL,
  `IS_DEFAULT` char(1) NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `segmentation_rule`
--

INSERT INTO `segmentation_rule` (`ID`, `NAME`, `COMPANY_ID`, `SR_TYPE`, `DESCRIPTION`, `RULE_TEXT`, `IS_ACTIVE`, `IS_DEFAULT`) VALUES
(1, 'default', 1, 0, 'Default segmentation rule.', 'default', 'Y', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `segmentation_rule_tm_profile`
--

CREATE TABLE `segmentation_rule_tm_profile` (
  `SEGMENTATION_RULE_ID` bigint(20) NOT NULL,
  `TM_PROFILE_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `select_option`
--

CREATE TABLE `select_option` (
  `ID` bigint(20) NOT NULL,
  `VALUE` varchar(300) DEFAULT NULL,
  `LIST_CONDITION_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `select_option`
--

INSERT INTO `select_option` (`ID`, `VALUE`, `LIST_CONDITION_ID`) VALUES
(1000, 'not set', 1000),
(1001, 'yes', 1000),
(1002, 'no', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `sequence`
--

CREATE TABLE `sequence` (
  `NAME` varchar(40) NOT NULL,
  `COUNT` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sequence`
--

INSERT INTO `sequence` (`NAME`, `COUNT`) VALUES
('ACTIVITY_SEQ', 1000),
('AOW_SEQ', 1000),
('CALENDAR_SEQ', 1000),
('CALENDAR_WORKING_DAY_SEQ', 1000),
('CALENDAR_WORKING_HOUR_SEQ', 1000),
('COMMENTS_SEQ', 1000),
('COMPANY_SEQ', 1000),
('COST_BY_WORD_COUNT_SEQ', 1000),
('COST_SEQ', 1000),
('CURRENCY_CONVERSION_SEQ', 1000),
('CUSTOM_FIELD_SEQ', 1000),
('CUSTOM_FORM_SEQ', 1000),
('EXPORTING_PAGE_SEQ', 1000),
('EXPORT_BATCH_EVENT_SEQ', 1000),
('EXPORT_LOCATION_SEQ', 1000),
('EXTENSION_SEQ', 1000),
('FILE_PROFILE_SEQ', 1000),
('HOLIDAY_SEQ', 1000),
('IMAGE_REPLACE_FILE_MAP_SEQ', 1000),
('IP_TM_SRC_L_SEQ', 1000),
('IP_TM_SRC_T_SEQ', 1000),
('IP_TM_TRG_L_SEQ', 1000),
('IP_TM_TRG_T_SEQ', 1000),
('ISSUE_SEQ', 1000),
('JOB_SEQ', 1000),
('LEVERAGE_GROUP_SEQ', 1000),
('LOCALE_PAIR_SEQ', 1000),
('LOCALE_SEQ', 1000),
('LOCPROF_VER_SEQ', 1000),
('PAGE_TEMPLATE_SEQ', 1000),
('PAGE_TM_SEQ', 1000),
('PAGE_TM_TUV_L_SEQ', 1000),
('PAGE_TM_TUV_T_SEQ', 1000),
('PAGE_TM_TU_L_SEQ', 1000),
('PAGE_TM_TU_T_SEQ', 1000),
('PERMISSIONGROUP_SEQ', 1000),
('PROFILE_SEQ', 1000),
('PROJECT_SEQ', 1000),
('PROJECT_TM_SEQ', 1000),
('RATE_SEQ', 1000),
('RATING_SEQ', 1000),
('REQUEST_SEQ', 1000),
('RESERVED_TIME_SEQ', 1000),
('SECONDARY_TARGET_FILE_SEQ', 1000),
('SEGMENTATION_RULE_SEQ', 1000),
('SEGMENT_TM_TUV_L_SEQ', 1000),
('SEGMENT_TM_TUV_T_SEQ', 1000),
('SEGMENT_TM_TU_L_SEQ', 1000),
('SEGMENT_TM_TU_T_SEQ', 1000),
('SOURCE_PAGE_SEQ', 1000),
('SURCHARGE_SEQ', 1000),
('SYSTEM_PARAMETER_SEQ', 1000),
('TARGET_PAGE_SEQ', 1000),
('TASK_TUV_SEQ', 1000),
('TEMPLATE_PART_SEQ', 1000),
('TMP_PROJECT_TM_SEQ', 1000),
('TM_PROFILE_SEQ', 1000),
('TM_SEQ', 1000),
('TRANSLATION_UNIT_SEQ', 1000),
('TRANSLATION_UNIT_VARIANT_SEQ', 1000),
('TUV_SEQ', 1000),
('TU_SEQ', 1000),
('USER_CALENDAR_SEQ', 1000),
('USER_CALENDAR_WORKING_DAY_SEQ', 1000),
('USER_CALENDAR_WORKING_HOUR_SEQ', 1000),
('USER_FIELD_SECURITY_SEQ', 1000),
('USER_PARAMETER_SEQ', 1000),
('VENDOR_FIELD_SECURITY_SEQ', 1000),
('VENDOR_ROLE_SEQ', 1000),
('VENDOR_SEQ', 1000),
('WORKFLOW_OWNER_SEQ', 1000),
('WORKFLOW_REQUEST_SEQ', 1000),
('WORKFLOW_TEMPLATE_SEQ', 1000),
('XML_RULE_SEQ', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `source_page`
--

CREATE TABLE `source_page` (
  `ID` bigint(20) NOT NULL,
  `EXTERNAL_PAGE_ID` varchar(750) NOT NULL,
  `WORD_COUNT` int(10) DEFAULT NULL,
  `ORIGINAL_ENCODING` varchar(30) DEFAULT NULL,
  `STATE` varchar(20) NOT NULL,
  `DATA_SOURCE_TYPE` varchar(20) DEFAULT NULL,
  `DATA_TYPE` varchar(20) DEFAULT NULL,
  `INTERNAL_BASE_HREF` varchar(2000) DEFAULT NULL,
  `EXTERNAL_BASE_HREF` varchar(2000) DEFAULT NULL,
  `PREVIOUS_PAGE_ID` bigint(20) DEFAULT NULL,
  `TIMESTAMP` datetime NOT NULL,
  `CONTAINS_GS_TAG` char(1) DEFAULT NULL,
  `STORAGE_PATH` varchar(4000) DEFAULT NULL,
  `MODIFIER_USER_ID` varchar(80) DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `FILE_LENGTH` int(11) DEFAULT NULL,
  `GXML_VERSION` varchar(10) DEFAULT NULL,
  `OVERRIDEN_WORD_COUNT` int(10) DEFAULT NULL,
  `PREV_UPDATE_STATE` varchar(20) DEFAULT NULL,
  `JOB_ID` bigint(20) DEFAULT NULL,
  `COMPANY_ID` bigint(20) NOT NULL,
  `BOM_TYPE` smallint(6) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `source_page_leverage_group`
--

CREATE TABLE `source_page_leverage_group` (
  `LG_ID` bigint(20) NOT NULL,
  `SP_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sso_user_mapping`
--

CREATE TABLE `sso_user_mapping` (
  `ID` bigint(20) NOT NULL,
  `COMPANY_ID` bigint(20) NOT NULL,
  `USER_ID` varchar(80) NOT NULL,
  `SSO_USER_ID` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `surcharge`
--

CREATE TABLE `surcharge` (
  `ID` bigint(20) NOT NULL,
  `TYPE` char(1) NOT NULL,
  `NAME` varchar(40) NOT NULL,
  `CURRENCY_CONV_ID` bigint(20) DEFAULT NULL,
  `AMOUNT` float NOT NULL,
  `COST_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `system_log`
--

CREATE TABLE `system_log` (
  `ID` bigint(20) NOT NULL,
  `EVENT_TYPE` varchar(20) NOT NULL,
  `OBJECT_TYPE` varchar(60) NOT NULL,
  `OBJECT_ID` varchar(20) DEFAULT NULL,
  `OPERATOR` varchar(20) NOT NULL,
  `OPERATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `MESSAGE` varchar(500) DEFAULT NULL,
  `COMPANY_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `system_parameter`
--

CREATE TABLE `system_parameter` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(127) NOT NULL,
  `VALUE` varchar(2000) DEFAULT NULL,
  `COMPANY_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `system_parameter`
--

INSERT INTO `system_parameter` (`ID`, `NAME`, `VALUE`, `COMPANY_ID`) VALUES
(1, 'hibernate.logging', 'false', 1),
(2, 'system.logging.priority', 'INFO', 1),
(3, 'mailserver', 'mail.domain.com', 1),
(4, 'systemNotification.enabled', 'false', 1),
(5, 'server.host', 'localhost', 1),
(6, 'nonSSLPort', '8080', 1),
(7, 'cxe.docsDir', '/home/jboss/globalsight/docs', 1),
(8, 'cap.servlet.url', '/globalsight/CapExportServlet', 1),
(9, 'cxe.servlet.url', '/globalsight/CxeExportServlet', 1),
(11, 'quark.installKey', 'false', 1),
(12, 'frame.installKey', 'false', 1),
(13, 'word.installKey', 'false', 1),
(14, 'excel.installKey', 'false', 1),
(15, 'powerpoint.installKey', 'false', 1),
(16, 'addLanguageMetaTag', 'false', 1),
(17, 'leverager.excludeTuTypes', 'n/a', 1),
(18, 'pm.accessGroup', 'ProjectManager', 1),
(19, 'cap.login.url', 'http://172.18.0.3:8080/globalsight', 1),
(20, 'useProxy', 'false', 1),
(21, 'proxy.server.name', '', 1),
(22, 'proxy.server.port', '', 1),
(24, 'priority.max', '5', 1),
(25, 'priority.default', '3', 1),
(27, 'enable.proxy.ssl', 'false', 1),
(28, 'cxe.ntcsDir', '/home/jboss/globalsight/winfiles', 1),
(30, 'jobCosting.enabled', 'true', 1),
(31, 'warningThresholds.enabled', '0', 1),
(32, 'timer.threshold', '.75', 1),
(33, 'reports.enabled', 'true', 1),
(35, 'addDelete.enabled', 'true', 1),
(36, 'export.overrideCjkFontFace', 'true', 1),
(40, 'login.concurrentDuplicate.allowed', 'true', 1),
(41, 'pdf.installKey', 'false', 1),
(42, 'pdf.dir', '', 1),
(43, 'msoffice.dir', '/home/jboss/globalsight/winfiles', 1),
(44, 'fileStorage.dir', '/home/jboss/globalsight/fileStorage', 1),
(45, 'calendar.installKey', 'false', 1),
(47, 'websvc.installKey', 'true', 1),
(48, 'editor.installKey', 'true', 1),
(49, 'terminology.features.installKey', '0', 1),
(53, 'vendorManagement.installKey', 'false', 1),
(54, 'catalyst.installKey', 'false', 1),
(55, 'quarkmac.installKey', 'false', 1),
(57, 'editor.gxml.installKey', 'false', 1),
(58, 'msoffice2003.dir', '/home/jboss/globalsight/winfiles', 1),
(59, 'adobe.cs3.dir', '/home/jboss/globalsight/winfiles', 1),
(60, 'revenue.enabled', 'true', 1),
(61, 'comments.sorting', 'default', 1),
(62, 'admin.email', 'WelocalizeAdmin@domain.com', 1),
(63, 'indd.installKey', 'false', 1),
(64, 'illustrator.installKey', 'false', 1),
(65, 'adobe.dir', '/home/jboss/globalsight/winfiles', 1),
(66, 'download.delay.time.after.exporting', '0', 1),
(67, 'task.complete.delay.time.after.upload', '0', 1),
(68, 'adobe.cs4.dir', '/home/jboss/globalsight/winfiles', 1),
(69, 'mailserver.account.password', 'nobody', 1),
(70, 'cap.public.url.enable', 'false', 1),
(71, 'cap.public.url', '', 1),
(72, 'openoffice.install.key', 'true', 1),
(73, 'openoffice.install.dir', '/opt/openoffice.org3', 1),
(74, 'cap.login.url.ssl', '', 1),
(75, 'server.ssl.port', '443', 1),
(76, 'server.ssl.enable', 'false', 1),
(77, 'adobe.cs5.dir', '/home/jboss/globalsight/winfiles', 1),
(78, 'passolo.installKey', 'false', 1),
(79, 'passolo.dir', '/home/jboss/globalsight/winfiles', 1),
(80, 'adobe.cs5.5.dir', '/home/jboss/globalsight/winfiles', 1),
(81, 'winpe.installKey', 'false', 1),
(82, 'winpe.dir', '/home/jboss/globalsight/winfiles', 1),
(83, 'incontext.review.enable', 'false', 1),
(84, 'incontext.review.dir.indd', '/home/jboss/globalsight/winfiles', 1),
(85, 'incontext.review.dir.office', '/home/jboss/globalsight/winfiles', 1),
(100, 'export.dirRuleType', 'LOCALE', 1),
(101, 'hyperlinkColorOverride', 'false', 1),
(102, 'hyperlinkColor', '#0000FF', 1),
(103, 'activeHyperlinkColor', '#0000FF', 1),
(104, 'visitedHyperlinkColor', '#0000FF', 1),
(105, 'jobCosting.pivotCurrency', 'USD', 1),
(106, 'leverager.autoReplaceTerms', 'false', 1),
(107, 'email.authentication.enabled', 'false', 1),
(108, 'account.username', 'false', 1),
(109, 'account.password', 'false', 1),
(110, 'export.defaultLocation', '1', 1),
(111, 'anonymous.termbases', 'true', 1),
(112, 'recordsPerPage.jobs', '20', 1),
(113, 'recordsPerPage.tasks', '20', 1),
(114, 'analyze_script.interval', '22/24', 1),
(117, 'machineTranslation.showInEditor', 'false', 1),
(118, 'indesign.master.translate', 'false', 1),
(119, 'ppt.master.translate', 'true', 1),
(120, 'adobe.xmp.translate', 'false', 1),
(121, 'db.driver', 'com.mysql.jdbc.Driver', 1),
(122, 'ldap.minConnections', '1', 1),
(123, 'ldap.maxConnections', '20', 1),
(124, 'cap.refreshUiLists', 'true', 1),
(125, 'cap.refreshRate', '60', 1),
(126, 'cap.refreshProgress', 'true', 1),
(127, 'cap.refreshProgressRate', '1', 1),
(128, 'leverager.batchInsertUnit', '200', 1),
(129, 'leverager.targetIndexing', 'false', 1),
(130, 'analyze_script.initialRun', 'false', 1),
(131, 'analyze_script.run', 'false', 1),
(132, 'default.ui.locale', 'en_US', 1),
(133, 'ui.locales', 'en_US', 1),
(134, 'and.or.nodes', 'false', 1),
(135, 'workflowTemplatesPerPage', '10', 1),
(136, 'tmProfilesPerPage', '10', 1),
(137, 'vendorsPerPage', '10', 1),
(138, 'calendaringDisplayPerPage', '10', 1),
(139, 'pm.email.notification', 'false', 1),
(140, 'reports.checkAccess', 'false', 1),
(141, 'export.remove_info.enabled', 'true', 1),
(142, 'calendar.cleanupStartTime', '20', 1),
(143, 'calendar.cleanupRecurrance', '+w', 1),
(144, 'calendar.cleanupPeriod', '30', 1),
(145, 'duplicationOfObjects.allowed', 'true', 1),
(146, 'jobSearchReplace.allowed', 'true', 1),
(147, 'editalltargetpages.allowed', 'false', 1),
(149, 'remote.ipAddressFilterWSvc', '', 1),
(150, 'machineTranslation.overrideNonExactMatches', 'false', 1),
(151, 'machineTranslation.autoCommitToTM', 'false', 1),
(152, 'machineTranslation.engine', 'com.globalsight.machineTranslation.systran.SystranProxy', 1),
(153, 'formatType.handleImportFailure', 'null', 1),
(154, 'import.manualImportSingleBatch', 'false', 1),
(155, 'import.suggestJobName', 'true', 1),
(156, 'jobCosting.lockFinishedCost', 'true', 1),
(157, 'processRunner.waitForOutput', 'true', 1),
(158, 'maxMyJobsThreads', '5', 1),
(159, 'shutdown.ui.enabled', 'true', 1),
(160, 'shutdown.ui.banner.enabled', 'true', 1),
(161, 'shutdown.ui.msg', 'Countdown to GlobalSight shutdown:', 1),
(162, 'reports.numCustomExternalReports', '0', 1),
(163, 'reimport.option', '0', 1),
(164, 'reimport.delay.milliseconds', '900000', 1),
(165, 'email.defaultPm', '@', 1),
(166, 'customerAccessGroup.installKey', 'true', 1),
(167, 'tm.indexer.minMergeDocs', '10000', 1),
(168, 'myJobs.daysRetrieved', '14', 1),
(169, 'customerAccessGroup.isDell', 'false', 1),
(170, 'reports.activity', 'Dell_Review', 1),
(171, 'overdue.pm.day', '3', 1),
(172, 'overdue.user.day', '1', 1),
(173, 'per.file.charge01.value', '#', 1),
(174, 'per.file.charge02.value', '#', 1),
(175, 'per.job.charge.value', '#', 1),
(176, 'sso.enabled', 'false', 1),
(177, 'server.instance.id', 'GlobalSightInstanceID', 1),
(178, 'restart.ui.enabled', 'true', 1),
(179, 'restart.ui.banner.enabled', 'true', 1);

-- --------------------------------------------------------

--
-- Table structure for table `target_page`
--

CREATE TABLE `target_page` (
  `ID` bigint(20) NOT NULL,
  `STATE` varchar(20) NOT NULL,
  `EXPORTED_SUB_STATE` smallint(6) DEFAULT '1',
  `SOURCE_PAGE_ID` bigint(20) NOT NULL,
  `WORKFLOW_IFLOW_INSTANCE_ID` bigint(20) DEFAULT NULL,
  `TOTAL_WORD_COUNT` int(10) DEFAULT NULL,
  `TOTAL_EXACT_MATCH_WORD_COUNT` int(10) DEFAULT NULL,
  `IN_CONTEXT_MATCH_WORD_COUNT` int(10) DEFAULT NULL,
  `MT_EXACT_MATCH_WORD_COUNT` int(10) DEFAULT NULL,
  `EXACT_SEGMENT_TM_WORD_COUNT` int(10) DEFAULT NULL,
  `EXACT_CONTEXT_WORD_COUNT` int(10) DEFAULT NULL,
  `FUZZY_LOW_WORD_COUNT` int(10) DEFAULT NULL,
  `FUZZY_MED_WORD_COUNT` int(10) DEFAULT NULL,
  `FUZZY_MED_HI_WORD_COUNT` int(10) DEFAULT NULL,
  `FUZZY_HI_WORD_COUNT` int(10) DEFAULT NULL,
  `NO_MATCH_WORD_COUNT` int(10) DEFAULT NULL,
  `REPETITION_WORD_COUNT` int(10) DEFAULT NULL,
  `MT_TOTAL_WORD_COUNT` int(10) DEFAULT '0',
  `MT_FUZZY_NO_MATCH_WORD_COUNT` int(10) DEFAULT '0',
  `MT_REPETITIONS` int(10) DEFAULT '0',
  `MT_ENGINE_WORD_COUNT` int(10) DEFAULT '0',
  `MT_PERPLEXITY` int(10) DEFAULT '0',
  `THRESHOLD_FUZZY_HI_WORD_COUNT` int(10) DEFAULT NULL,
  `THRESHOLD_FUZZY_MED_HI_WORD_COUNT` int(10) DEFAULT NULL,
  `THRESHOLD_FUZZY_MED_WORD_COUNT` int(10) DEFAULT NULL,
  `THRESHOLD_FUZZY_LOW_WORD_COUNT` int(10) DEFAULT NULL,
  `THRESHOLD_NO_MATCH_WORD_COUNT` int(10) DEFAULT NULL,
  `INTERNAL_BASE_HREF` varchar(2000) DEFAULT NULL,
  `EXTERNAL_BASE_HREF` varchar(2000) DEFAULT NULL,
  `EXCEPTION_XML` text,
  `TIMESTAMP` datetime NOT NULL,
  `STORAGE_PATH` varchar(4000) DEFAULT NULL,
  `MODIFIER_USER_ID` varchar(80) DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `FILE_LENGTH` bigint(20) DEFAULT NULL,
  `GXML_VERSION` varchar(10) DEFAULT NULL,
  `PREV_UPDATE_STATE` varchar(20) DEFAULT NULL,
  `EXPORT_SUB_DIR` varchar(128) DEFAULT NULL,
  `CVS_TARGET_MODULE` varchar(2000) DEFAULT NULL,
  `CVS_TARGET_FILENAME` varchar(2000) DEFAULT NULL,
  `NO_USE_IC_MATCH_WORD_COUNT` int(10) DEFAULT NULL,
  `COMPANY_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `target_page_leverage_group`
--

CREATE TABLE `target_page_leverage_group` (
  `LG_ID` bigint(20) NOT NULL,
  `TP_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `task_info`
--

CREATE TABLE `task_info` (
  `TASK_ID` bigint(20) NOT NULL,
  `WORKFLOW_ID` bigint(20) NOT NULL,
  `NAME` varchar(64) NOT NULL,
  `STATE` varchar(50) NOT NULL,
  `ESTIMATED_ACCEPTANCE_DATE` datetime DEFAULT NULL,
  `ESTIMATED_COMPLETION_DATE` datetime DEFAULT NULL,
  `ACCEPTED_DATE` datetime DEFAULT NULL,
  `COMPLETED_DATE` datetime DEFAULT NULL,
  `EXPENSE_RATE_ID` bigint(20) DEFAULT NULL,
  `REVENUE_RATE_ID` bigint(20) DEFAULT NULL,
  `STF_CREATION_STATE` varchar(20) DEFAULT NULL,
  `USER_ID` varchar(80) DEFAULT NULL,
  `RATE_SELECTION_CRITERIA` int(1) NOT NULL,
  `TYPE` varchar(20) DEFAULT NULL,
  `TASK_TYPE` varchar(20) NOT NULL,
  `COMPANY_ID` bigint(20) NOT NULL,
  `IS_UPLOADING` char(1) DEFAULT 'N',
  `IS_REPORT_UPLOADED` int(11) DEFAULT '0',
  `IS_REPORT_UPLOAD_CHECK` int(11) DEFAULT '0',
  `QUALITY_ASSESSMENT` varchar(200) DEFAULT NULL,
  `MARKET_SUITABILITY` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `task_interim`
--

CREATE TABLE `task_interim` (
  `ID` bigint(20) NOT NULL,
  `TASK_ID` bigint(20) DEFAULT NULL,
  `ACTIVITY_NAME` varchar(40) DEFAULT NULL,
  `STATE` varchar(50) NOT NULL,
  `USER_ID` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `task_interim`
--

INSERT INTO `task_interim` (`ID`, `TASK_ID`, `ACTIVITY_NAME`, `STATE`, `USER_ID`) VALUES
(1000, NULL, NULL, 'TRIGGERED', 'superadmin');

-- --------------------------------------------------------

--
-- Table structure for table `task_tuv`
--

CREATE TABLE `task_tuv` (
  `ID` bigint(20) NOT NULL,
  `CURRENT_TUV_ID` bigint(20) NOT NULL,
  `TASK_ID` bigint(20) NOT NULL,
  `VERSION` int(3) NOT NULL,
  `PREVIOUS_TUV_ID` bigint(20) NOT NULL,
  `TASK_NAME` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_audit_log`
--

CREATE TABLE `tb_audit_log` (
  `EVENT_DATE` datetime NOT NULL,
  `USERNAME` varchar(80) NOT NULL,
  `TERMBASE` varchar(200) NOT NULL,
  `TARGET` varchar(200) NOT NULL,
  `LANGUAGES` varchar(500) NOT NULL,
  `ACTION` varchar(30) NOT NULL,
  `DETAILS` varchar(4000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_concept`
--

CREATE TABLE `tb_concept` (
  `TBID` int(20) DEFAULT NULL,
  `CID` int(20) NOT NULL,
  `DOMAIN` varchar(100) NOT NULL DEFAULT '',
  `STATUS` varchar(20) NOT NULL DEFAULT '',
  `PROJECT` varchar(100) NOT NULL DEFAULT '',
  `XML` text NOT NULL,
  `CREATED_ON` datetime NOT NULL,
  `CREATED_BY` varchar(80) NOT NULL,
  `MODIFIED_ON` datetime DEFAULT NULL,
  `MODIFIED_BY` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_language`
--

CREATE TABLE `tb_language` (
  `TBID` int(20) DEFAULT NULL,
  `LID` int(20) NOT NULL,
  `CID` int(20) DEFAULT NULL,
  `NAME` varchar(30) NOT NULL,
  `LOCALE` varchar(5) NOT NULL,
  `XML` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_lock`
--

CREATE TABLE `tb_lock` (
  `TBid` int(10) NOT NULL,
  `Cid` int(10) NOT NULL,
  `Lock_Info` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_scheduled_jobs`
--

CREATE TABLE `tb_scheduled_jobs` (
  `TBid` int(10) NOT NULL,
  `TYPE` varchar(128) NOT NULL,
  `MINUTES` varchar(128) DEFAULT NULL,
  `HOURS` varchar(128) DEFAULT NULL,
  `DAYS_OF_MONTH` varchar(128) DEFAULT NULL,
  `MONTHS` varchar(128) DEFAULT NULL,
  `DAYS_OF_WEEK` varchar(128) DEFAULT NULL,
  `DAY_OF_YEAR` varchar(128) DEFAULT NULL,
  `WEEK_OF_MONTH` varchar(128) DEFAULT NULL,
  `WEEK_OF_YEAR` varchar(128) DEFAULT NULL,
  `YEAR` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_sequence`
--

CREATE TABLE `tb_sequence` (
  `NAME` varchar(30) NOT NULL,
  `VALUE` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_sequence`
--

INSERT INTO `tb_sequence` (`NAME`, `VALUE`) VALUES
('cid', 1),
('lid', 1),
('tbid', 2),
('tid', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_term`
--

CREATE TABLE `tb_term` (
  `TBID` int(20) DEFAULT NULL,
  `TID` int(20) NOT NULL,
  `LID` int(20) DEFAULT NULL,
  `CID` int(20) DEFAULT NULL,
  `LANG_NAME` varchar(30) NOT NULL,
  `TERM` varchar(2000) NOT NULL,
  `TYPE` varchar(50) NOT NULL DEFAULT '',
  `STATUS` varchar(20) NOT NULL DEFAULT '',
  `SORT_KEY` text NOT NULL,
  `XML` text,
  `CREATED_ON` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` varchar(80) DEFAULT NULL,
  `MODIFIED_ON` timestamp NULL DEFAULT '2037-12-31 23:59:59',
  `MODIFIED_BY` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Triggers `tb_term`
--
DELIMITER $$
CREATE TRIGGER `MODIFIED_ON_TIME` BEFORE INSERT ON `tb_term` FOR EACH ROW BEGIN
    DECLARE T TIMESTAMP DEFAULT '2037-12-31 23:59:59';
    IF NEW.MODIFIED_ON = T
	  THEN
	    SET NEW.MODIFIED_ON = NOW();
	END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_termbase`
--

CREATE TABLE `tb_termbase` (
  `TBID` bigint(20) NOT NULL,
  `TB_NAME` varchar(100) NOT NULL,
  `TB_DESCRIPTION` varchar(4000) DEFAULT NULL,
  `TB_DEFINITION` text NOT NULL,
  `COMPANYID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_termbase`
--

INSERT INTO `tb_termbase` (`TBID`, `TB_NAME`, `TB_DESCRIPTION`, `TB_DEFINITION`, `COMPANYID`) VALUES
(1, 'Sample', 'Sample Termbase', '<definition><name>Sample</name><description>Sample Termbase</description><languages><language><name>English</name><locale>en</locale><hasterms>true</hasterms></language><language><name>French</name><locale>fr</locale><hasterms>true</hasterms></language><language><name>Spanish</name><locale>es</locale><hasterms>true</hasterms></language><language><name>German</name><locale>de</locale><hasterms>true</hasterms></language></languages><fields></fields></definition>', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_user_data`
--

CREATE TABLE `tb_user_data` (
  `ID` int(10) NOT NULL,
  `TBID` int(10) NOT NULL,
  `TYPE` int(11) DEFAULT NULL,
  `USERNAME` varchar(80) DEFAULT NULL,
  `NAME` varchar(200) DEFAULT NULL,
  `ISDEFAULT` char(1) NOT NULL DEFAULT 'N',
  `VALUE` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `template`
--

CREATE TABLE `template` (
  `ID` bigint(20) NOT NULL,
  `SOURCE_PAGE_ID` bigint(20) NOT NULL,
  `TYPE` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `template_format`
--

CREATE TABLE `template_format` (
  `NAME` varchar(20) NOT NULL,
  `TEMPLATE_TYPE` char(3) NOT NULL,
  `SOURCE_TYPE` varchar(4) NOT NULL,
  `TEXT` varchar(4000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `template_format`
--

INSERT INTO `template_format` (`NAME`, `TEMPLATE_TYPE`, `SOURCE_TYPE`, `TEXT`) VALUES
('record_end', 'DTL', 'PRS', '</TABLE>\n<BR>'),
('record_end', 'STD', 'PRS', '</TABLE>\n<BR>'),
('record_start', 'DTL', 'PRS', '<TABLE WIDTH=\"100%\" CELLSPACING=\"0\" CELLPADDING=\"0\" BORDER=\"0\">\n<TR><TD VALIGN=\"MIDDLE\" BGCOLOR=\"#CCCCFF\"><SCRIPT>\nvar tuvids<<ID>> = \"<<TUVS<<ID>>>>\";</SCRIPT><IMG \nSRC=\"/gs-images/editor/previewl.gif\"><!-- Preview-- ><A \n href=\"javascript:Preview(tuvids<<ID>>)\"><SCRIPT>document.write(lb_preview)</SCRIPT></A\n><!-- EndPreview-- ><IMG SRC=\"/gs-images/editor/previewr.gif\"></TD>\n<TD WIDTH=\"100%\"></TD>\n</TR>\n</TABLE>\n<TABLE WIDTH=\"100%\" CELLSPACING=\"0\" CELLPADDING=\"4\" BORDER=\"0\" BGCOLOR=\"#CCCCFF\">'),
('record_start', 'STD', 'PRS', '<TABLE WIDTH=\"100%\" CELLSPACING=\"0\" CELLPADDING=\"0\" BORDER=\"0\">\n<TR><TD VALIGN=\"MIDDLE\" BGCOLOR=\"#CCCCFF\"><SCRIPT>\nvar tuvids<<ID>> = \"<<TUVS<<ID>>>>\";</SCRIPT><IMG \nSRC=\"/gs-images/editor/previewl.gif\"><!-- Preview-- ><A \n href=\"javascript:Preview(tuvids<<ID>>)\"><SCRIPT>document.write(lb_preview)</SCRIPT></A\n><!-- EndPreview-- ><IMG SRC=\"/gs-images/editor/previewr.gif\"></TD>\n<TD WIDTH=\"100%\"></TD>\n</TR>\n</TABLE>\n<TABLE WIDTH=\"100%\" CELLSPACING=\"0\" CELLPADDING=\"4\" BORDER=\"0\" BGCOLOR=\"#CCCCFF\">'),
('template_end', 'DTL', 'GXML', '</SPAN></PRE>'),
('template_end', 'STD', 'GXML', ' '),
('template_start', 'DTL', 'GXML', '<PRE><SPAN CLASS=\"editorStandardText\">'),
('template_start', 'STD', 'GXML', ' ');

-- --------------------------------------------------------

--
-- Table structure for table `template_part`
--

CREATE TABLE `template_part` (
  `ID` bigint(20) NOT NULL,
  `TEMPLATE_ID` bigint(20) NOT NULL,
  `ORDER_NUM` int(11) NOT NULL,
  `SKELETON_CLOB` longtext,
  `SKELETON_STRING` varchar(4000) DEFAULT NULL,
  `TU_ID` bigint(20) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `template_part_archived`
--

CREATE TABLE `template_part_archived` (
  `ID` bigint(20) NOT NULL,
  `TEMPLATE_ID` bigint(20) NOT NULL,
  `ORDER_NUM` int(11) NOT NULL,
  `SKELETON_CLOB` longtext,
  `SKELETON_STRING` varchar(4000) DEFAULT NULL,
  `TU_ID` bigint(20) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `term_leverage_match`
--

CREATE TABLE `term_leverage_match` (
  `SOURCE_TUV_ID` bigint(20) DEFAULT NULL,
  `TERMBASE_ID` int(10) NOT NULL,
  `SOURCE_TERM_ID` int(10) NOT NULL,
  `TARGET_TERM_ID` int(10) NOT NULL,
  `TARGET_PAGE_LOCALE` varchar(5) NOT NULL,
  `ORDER_NUM` smallint(6) DEFAULT NULL,
  `SCORE` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tm3_attr`
--

CREATE TABLE `tm3_attr` (
  `id` bigint(20) NOT NULL,
  `tmId` bigint(20) NOT NULL,
  `name` varchar(128) NOT NULL,
  `columnName` varchar(32) DEFAULT NULL,
  `valueType` varchar(128) NOT NULL,
  `affectsIdentity` char(1) NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tm3_id`
--

CREATE TABLE `tm3_id` (
  `tableName` varchar(128) NOT NULL,
  `nextId` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tm3_tm`
--

CREATE TABLE `tm3_tm` (
  `id` bigint(20) NOT NULL,
  `tu_table` varchar(128) DEFAULT NULL,
  `tuv_table` varchar(128) DEFAULT NULL,
  `tuv_ext_table` varchar(128) DEFAULT NULL,
  `fuzzy_table` varchar(128) DEFAULT NULL,
  `attr_val_table` varchar(128) DEFAULT NULL,
  `srcLocaleId` bigint(20) DEFAULT NULL,
  `tgtLocaleId` bigint(20) DEFAULT NULL,
  `sharedStorageId` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tm_profile`
--

CREATE TABLE `tm_profile` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(60) NOT NULL,
  `DESCRIPTION` varchar(500) DEFAULT NULL,
  `PROJECT_TM_ID_FOR_SAVE` bigint(20) NOT NULL,
  `IS_UNLOC_SEG_SAVED_TO_PROJ_TM` char(1) NOT NULL,
  `IS_LOC_SEG_SAVED_TO_PROJ_TM` char(1) NOT NULL,
  `IS_MTED_SEG_SAVED_TO_PROJ_TM` char(1) NOT NULL DEFAULT 'Y',
  `IS_WHOLLY_INTERNAL_TEXT_TO_PROJ_TM` char(1) NOT NULL,
  `IS_APPROVED_SEG_SAVED_TO_PROJ_TM` char(1) NOT NULL,
  `IS_EXACT_MATCH_SEG_SAVED_TO_PROJ_TM` char(1) NOT NULL,
  `IS_UNLOC_SEG_SAVED_TO_PAGE_TM` char(1) NOT NULL,
  `JOB_EXCLUDE_TU_TYPES` varchar(2000) DEFAULT NULL,
  `IS_LEVERAGE_LOCALIZABLE` char(1) NOT NULL,
  `IS_EXACT_MATCH_LEVERAGING` char(1) NOT NULL,
  `IS_CONTEXT_MATCH` char(1) DEFAULT NULL,
  `ICE_PROMOTION_RULES` int(1) NOT NULL DEFAULT '3',
  `IS_TYPE_SENSITIVE_LEVERAGING` char(1) NOT NULL,
  `TYPE_DIFFERENCE_PENALTY` int(11) DEFAULT NULL,
  `IS_CASE_SENSITIVE_LEVERAGING` char(1) NOT NULL,
  `CASE_DIFFERENCE_PENALTY` int(11) DEFAULT NULL,
  `IS_WS_SENSITIVE_LEVERAGING` char(1) NOT NULL,
  `WHITESPACE_DIFFERENCE_PENALTY` int(11) DEFAULT NULL,
  `IS_CODE_SENSITIVE_LEVERAGING` char(1) NOT NULL,
  `CODE_DIFFERENCE_PENALTY` int(11) DEFAULT NULL,
  `IS_MULTILINGUAL_LEVERAGING` char(1) NOT NULL,
  `AUTO_REPAIR` char(1) NOT NULL,
  `MULTIPLE_EXACT_MATCHES` varchar(100) DEFAULT NULL,
  `MULTIPLE_EXACT_MATCHES_PENALTY` int(11) DEFAULT NULL,
  `FUZZY_MATCHES_THRESHOLD` int(11) DEFAULT NULL,
  `NUMBER_OF_MATCHES_RETURNED` int(11) DEFAULT NULL,
  `IS_LATEST_MATCH_FOR_REIMPORT` char(1) NOT NULL,
  `IS_TYPE_LEV_FOR_REIMPORT` char(1) NOT NULL,
  `TYPE_DIFF_PENALTY_REIMPORT` int(11) DEFAULT NULL,
  `IS_MULT_MATCHES_FOR_REIMP` char(1) NOT NULL,
  `MULTIPLE_MATCHES_PENALTY` int(11) DEFAULT NULL,
  `DYN_LEV_FROM_GOLD_TM` char(1) NOT NULL,
  `DYN_LEV_FROM_IN_PROGRESS_TM` char(1) NOT NULL,
  `DYN_LEV_FROM_POPULATION_TM` char(1) NOT NULL,
  `DYN_LEV_FROM_REFERENCE_TM` char(1) NOT NULL,
  `DYN_LEV_STOP_SEARCH` char(1) NOT NULL DEFAULT 'N',
  `IS_MATCH_PERCENTAGE` char(1) DEFAULT 'Y',
  `IS_TM_PROCENDENCE` char(1) DEFAULT 'N',
  `IS_REF_TM` char(1) DEFAULT 'N',
  `REF_TM_PENALTY` int(11) DEFAULT '0',
  `REF_TMS` varchar(255) DEFAULT NULL,
  `IS_OLD_TUV_MATCH` char(1) DEFAULT 'N',
  `OLD_TUV_MATCH_PENALTY` int(11) DEFAULT '1',
  `OLD_TUV_MATCH_DAY` int(11) DEFAULT '1095',
  `GET_UNIQUE_FROM_MULT_TRANS` char(1) DEFAULT 'N',
  `CHOICE_IF_ATT_NOT_MATCH` varchar(20) DEFAULT NULL,
  `TU_ATT_NOT_MATCH_PENALTY` int(11) DEFAULT '1',
  `COMPANY_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tm_profile_attribute`
--

CREATE TABLE `tm_profile_attribute` (
  `ID` bigint(20) NOT NULL,
  `TMP_ID` bigint(20) NOT NULL,
  `ATT_NAME` varchar(100) NOT NULL,
  `OPERATOR` varchar(100) NOT NULL,
  `VALUE_TYPE` varchar(100) NOT NULL,
  `VALUE_DATA` varchar(100) DEFAULT NULL,
  `AND_OR` varchar(12) NOT NULL,
  `PRIORITY_ORDER` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tm_profile_project_tm_info`
--

CREATE TABLE `tm_profile_project_tm_info` (
  `ID` int(11) NOT NULL,
  `TM_PROFILE_ID` bigint(20) DEFAULT NULL,
  `PROJECT_TM_ID` bigint(20) DEFAULT NULL,
  `PROJECT_TM_INDEX` int(4) DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tm_tb_users`
--

CREATE TABLE `tm_tb_users` (
  `TM_TB_ID` bigint(20) NOT NULL,
  `USER_ID` varchar(80) NOT NULL,
  `T_TYPE` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `translation_tu_tuv_attr_1`
--

CREATE TABLE `translation_tu_tuv_attr_1` (
  `ID` bigint(20) NOT NULL,
  `OBJECT_ID` bigint(20) DEFAULT NULL,
  `OBJECT_TYPE` varchar(20) DEFAULT NULL,
  `NAME` varchar(100) NOT NULL,
  `VARCHAR_VALUE` varchar(512) DEFAULT NULL,
  `TEXT_VALUE` text,
  `LONG_VALUE` bigint(20) DEFAULT NULL,
  `DATE_VALUE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `translation_unit_1`
--

CREATE TABLE `translation_unit_1` (
  `ID` bigint(20) NOT NULL,
  `ORDER_NUM` int(11) NOT NULL,
  `TM_ID` int(11) DEFAULT NULL,
  `DATA_TYPE` varchar(20) DEFAULT NULL,
  `TU_TYPE` varchar(50) DEFAULT NULL,
  `LOCALIZE_TYPE` char(1) NOT NULL,
  `LEVERAGE_GROUP_ID` bigint(20) NOT NULL,
  `PID` int(11) NOT NULL,
  `SOURCE_TM_NAME` varchar(60) DEFAULT NULL,
  `XLIFF_TRANSLATION_TYPE` varchar(60) DEFAULT NULL,
  `XLIFF_LOCKED` char(1) NOT NULL DEFAULT 'N',
  `IWS_SCORE` varchar(50) DEFAULT NULL,
  `XLIFF_TARGET_SEGMENT` mediumtext,
  `XLIFF_TARGET_LANGUAGE` varchar(30) DEFAULT NULL,
  `GENERATE_FROM` varchar(50) DEFAULT NULL,
  `SOURCE_CONTENT` varchar(30) DEFAULT NULL,
  `PASSOLO_STATE` varchar(60) DEFAULT NULL,
  `TRANSLATE` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `translation_unit_variant_1`
--

CREATE TABLE `translation_unit_variant_1` (
  `ID` bigint(20) NOT NULL,
  `ORDER_NUM` bigint(20) NOT NULL,
  `LOCALE_ID` bigint(20) NOT NULL,
  `TU_ID` bigint(20) NOT NULL,
  `IS_INDEXED` char(1) NOT NULL,
  `SEGMENT_CLOB` mediumtext,
  `SEGMENT_STRING` text,
  `WORD_COUNT` int(10) DEFAULT NULL,
  `EXACT_MATCH_KEY` bigint(20) DEFAULT NULL,
  `STATE` varchar(40) NOT NULL,
  `MERGE_STATE` varchar(20) NOT NULL,
  `TIMESTAMP` datetime NOT NULL,
  `LAST_MODIFIED` datetime NOT NULL,
  `MODIFY_USER` varchar(80) DEFAULT NULL,
  `CREATION_DATE` datetime DEFAULT NULL,
  `CREATION_USER` varchar(80) DEFAULT NULL,
  `UPDATED_BY_PROJECT` varchar(40) DEFAULT NULL,
  `SID` varchar(255) DEFAULT NULL,
  `SRC_COMMENT` text,
  `REPETITION_OF_ID` bigint(20) DEFAULT NULL,
  `IS_REPEATED` char(1) DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `translation_unit_variant_perplexity_1`
--

CREATE TABLE `translation_unit_variant_perplexity_1` (
  `ID` bigint(20) NOT NULL,
  `tuv_id` bigint(20) DEFAULT NULL,
  `source_score` double DEFAULT '-1',
  `target_score` double DEFAULT '-1',
  `result` char(1) DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tu_concept_relation`
--

CREATE TABLE `tu_concept_relation` (
  `ID` bigint(20) NOT NULL,
  `TU_ID` bigint(20) DEFAULT NULL,
  `CONCEPT_ID` bigint(20) DEFAULT NULL,
  `ADDED_LANGUAGE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `updated_source_page`
--

CREATE TABLE `updated_source_page` (
  `ID` bigint(20) NOT NULL,
  `JOB_ID` bigint(20) NOT NULL,
  `L10N_PROFILE_ID` bigint(20) NOT NULL,
  `SOURCE_PAGE_ID` bigint(20) NOT NULL,
  `DATA_SOURCE` varchar(100) NOT NULL,
  `EXTERNAL_PAGE_ID` varchar(750) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID` bigint(20) NOT NULL,
  `USER_ID` varchar(100) DEFAULT NULL,
  `STATE` int(11) DEFAULT NULL,
  `USER_NAME` varchar(100) DEFAULT NULL,
  `FIRST_NAME` varchar(100) DEFAULT NULL,
  `LAST_NAME` varchar(100) DEFAULT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `COMPANY_NAME` varchar(40) DEFAULT NULL,
  `PASSWORD` varchar(1000) DEFAULT NULL,
  `WSSE_PASSWORD` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(1000) DEFAULT NULL,
  `CC_EMAIL` varchar(1000) DEFAULT NULL,
  `BCC_EMAIL` varchar(1000) DEFAULT NULL,
  `ADDRESS` varchar(1000) DEFAULT NULL,
  `DEFAULT_LOCALE` varchar(100) DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL,
  `OFFICE_PHONE_NUMBER` varchar(300) DEFAULT NULL,
  `HOME_PHONE_NUMBER` varchar(300) DEFAULT NULL,
  `CELL_PHONE_NUMBER` varchar(300) DEFAULT NULL,
  `FAX_PHONE_NUMBER` varchar(300) DEFAULT NULL,
  `IN_ALL_PROJECTS` char(1) NOT NULL,
  `RESET_PASSWORD_TIMES` int(11) DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID`, `USER_ID`, `STATE`, `USER_NAME`, `FIRST_NAME`, `LAST_NAME`, `TITLE`, `COMPANY_NAME`, `PASSWORD`, `WSSE_PASSWORD`, `EMAIL`, `CC_EMAIL`, `BCC_EMAIL`, `ADDRESS`, `DEFAULT_LOCALE`, `TYPE`, `OFFICE_PHONE_NUMBER`, `HOME_PHONE_NUMBER`, `CELL_PHONE_NUMBER`, `FAX_PHONE_NUMBER`, `IN_ALL_PROJECTS`, `RESET_PASSWORD_TIMES`) VALUES
(1, 'superadmin', 2, 'superadmin', 'GlobalSight', 'Administrator', NULL, 'Welocalize', '{MD5}X03MO1qnZdYdgyfeuILPmQ==', NULL, 'WelocalizeAdmin@domain.com', NULL, NULL, NULL, 'en_US', 1, '', '', '', '', 'N', -1);

-- --------------------------------------------------------

--
-- Table structure for table `user_calendar`
--

CREATE TABLE `user_calendar` (
  `ID` bigint(20) NOT NULL,
  `CALENDAR_ID` bigint(20) NOT NULL,
  `OWNER_USER_ID` varchar(80) NOT NULL,
  `ACTIVITY_BUFFER` int(2) NOT NULL,
  `TIME_ZONE` varchar(100) NOT NULL,
  `LAST_UPDATED_BY` varchar(80) NOT NULL,
  `LAST_UPDATED_TIME` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_calendar`
--

INSERT INTO `user_calendar` (`ID`, `CALENDAR_ID`, `OWNER_USER_ID`, `ACTIVITY_BUFFER`, `TIME_ZONE`, `LAST_UPDATED_BY`, `LAST_UPDATED_TIME`) VALUES
(1, 1, 'superadmin', 0, 'GMT-8:00', 'system', '2022-06-15 05:34:38');

-- --------------------------------------------------------

--
-- Table structure for table `user_calendar_working_day`
--

CREATE TABLE `user_calendar_working_day` (
  `ID` bigint(20) NOT NULL,
  `CALENDAR_ID` bigint(20) NOT NULL,
  `WORKING_DAY` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_calendar_working_day`
--

INSERT INTO `user_calendar_working_day` (`ID`, `CALENDAR_ID`, `WORKING_DAY`) VALUES
(1, 1, 2),
(2, 1, 3),
(3, 1, 4),
(4, 1, 5),
(5, 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `user_calendar_working_hour`
--

CREATE TABLE `user_calendar_working_hour` (
  `ID` bigint(20) NOT NULL,
  `USER_CALENDAR_WORKING_DAY_ID` bigint(20) NOT NULL,
  `ORDER_NUM` int(1) NOT NULL,
  `START_HOUR` int(2) NOT NULL,
  `START_MINUTE` int(2) NOT NULL,
  `END_HOUR` int(2) NOT NULL,
  `END_MINUTE` int(2) NOT NULL,
  `DURATION_EXPRESSION` varchar(100) NOT NULL,
  `START_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_calendar_working_hour`
--

INSERT INTO `user_calendar_working_hour` (`ID`, `USER_CALENDAR_WORKING_DAY_ID`, `ORDER_NUM`, `START_HOUR`, `START_MINUTE`, `END_HOUR`, `END_MINUTE`, `DURATION_EXPRESSION`, `START_DATE`) VALUES
(1, 1, 1, 8, 0, 12, 0, '+4H+0m', '2003-10-27 08:00:00'),
(2, 1, 2, 13, 0, 17, 0, '+4H+0m', '2003-10-27 13:00:00'),
(3, 2, 1, 8, 0, 12, 0, '+4H+0m', '2003-10-28 08:00:00'),
(4, 2, 2, 13, 0, 17, 0, '+4H+0m', '2003-10-28 13:00:00'),
(5, 3, 1, 8, 0, 12, 0, '+4H+0m', '2003-10-29 08:00:00'),
(6, 3, 2, 13, 0, 17, 0, '+4H+0m', '2003-10-29 13:00:00'),
(7, 4, 1, 8, 0, 12, 0, '+4H+0m', '2003-10-30 08:00:00'),
(8, 4, 2, 13, 0, 17, 0, '+4H+0m', '2003-10-30 13:00:00'),
(9, 5, 1, 8, 0, 12, 0, '+4H+0m', '2003-10-31 08:00:00'),
(10, 5, 2, 13, 0, 17, 0, '+4H+0m', '2003-10-31 13:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user_default_activities`
--

CREATE TABLE `user_default_activities` (
  `ID` bigint(20) NOT NULL,
  `DEFAULT_ROLE_ID` bigint(20) NOT NULL,
  `ACTIVITY_NAME` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_default_roles`
--

CREATE TABLE `user_default_roles` (
  `ID` bigint(20) NOT NULL,
  `SOURCE_LOCALE` bigint(20) NOT NULL,
  `TARGET_LOCALE` bigint(20) NOT NULL,
  `USER_ID` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_field_security`
--

CREATE TABLE `user_field_security` (
  `ID` bigint(20) NOT NULL,
  `USER_ID` varchar(80) NOT NULL,
  `SECURITIES_XML` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_id_user_name`
--

CREATE TABLE `user_id_user_name` (
  `USER_ID` varchar(80) NOT NULL,
  `USER_NAME` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_id_user_name`
--

INSERT INTO `user_id_user_name` (`USER_ID`, `USER_NAME`) VALUES
('superadmin', 'superadmin');

-- --------------------------------------------------------

--
-- Table structure for table `user_parameter`
--

CREATE TABLE `user_parameter` (
  `ID` bigint(20) NOT NULL,
  `USER_ID` varchar(80) NOT NULL,
  `NAME` varchar(127) NOT NULL,
  `VALUE` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_parameter`
--

INSERT INTO `user_parameter` (`ID`, `USER_ID`, `NAME`, `VALUE`) VALUES
(1000, 'superadmin', 'notificationEnabled', '1'),
(1001, 'superadmin', 'tm_matching_threshold', '70'),
(1002, 'superadmin', 'tb_matching_threshold', '70'),
(1003, 'superadmin', 'editor_autosave', '1'),
(1004, 'superadmin', 'abbreviate_report_name', 'yes'),
(1005, 'superadmin', 'editor_autounlock', '0'),
(1006, 'superadmin', 'editor_autosync', '1'),
(1007, 'superadmin', 'editor_autowhite', '1'),
(1008, 'superadmin', 'editor_layout', 'source_target_vertical'),
(1009, 'superadmin', 'editor_viewmode', '3'),
(1010, 'superadmin', 'editor_ptagmode', 'compact'),
(1011, 'superadmin', 'editor_ptaghilite', '1'),
(1012, 'superadmin', 'editor_show_mt', '0'),
(1013, 'superadmin', 'editor_iterate_subs', '0'),
(1014, 'superadmin', 'editor_linkColorOverride', '1'),
(1015, 'superadmin', 'editor_linkColor', 'blue'),
(1016, 'superadmin', 'editor_activeLinkColor', 'blue'),
(1017, 'superadmin', 'editor_visitedLinkColor', 'blue'),
(1018, 'superadmin', 'PREVIEW_100_MATCH_COLOR', 'Black'),
(1019, 'superadmin', 'PREVIEW_ICE_MATCH_COLOR', 'Black'),
(1020, 'superadmin', 'PREVIEW_NON_MATCH_COLOR', 'Black'),
(1021, 'superadmin', 'segments_max_num', '0'),
(1022, 'superadmin', 'pagename_display', 'full'),
(1023, 'superadmin', 'editor_selection', 'editor_popup'),
(1024, 'superadmin', 'editor_show_closeAllComment', '0'),
(1025, 'superadmin', 'notifyOverDuePM', '0'),
(1026, 'superadmin', 'notifyOverDueUser', '0'),
(1027, 'superadmin', 'notifyDelayedReimport', '0'),
(1028, 'superadmin', 'notifyWorkflowDiscard', '0'),
(1029, 'superadmin', 'notifyExportForUpdate', '0'),
(1030, 'superadmin', 'notifyExportCompletion', '0'),
(1031, 'superadmin', 'notifySuccessfulUpload', '0'),
(1032, 'superadmin', 'notifySavingSegmentsFailure', '0'),
(1033, 'superadmin', 'notifyQuotePerson', '0'),
(1034, 'superadmin', 'format', 'OmegaT'),
(1035, 'superadmin', 'editor', 'WinWord97'),
(1036, 'superadmin', 'encoding', 'defaultEncoding'),
(1037, 'superadmin', 'placeholder', 'compact'),
(1038, 'superadmin', 'resInsSelector', 'resInsTmx14b'),
(1039, 'superadmin', 'editExact', 'no'),
(1040, 'superadmin', 'displayExactMatch', 'no'),
(1041, 'superadmin', 'consolidate', 'yes'),
(1042, 'superadmin', 'consolidateTerm', 'yes'),
(1043, 'superadmin', 'termSelector', 'tbx'),
(1044, 'superadmin', 'populate100', 'yes'),
(1045, 'superadmin', 'populatefuzzy', 'no'),
(1046, 'superadmin', 'needConsolidate', 'yes'),
(1047, 'superadmin', 'changeCreationIdForMT', 'yes'),
(1048, 'superadmin', 'includeRepetitions', 'no'),
(1049, 'superadmin', 'TMEditType', '4'),
(1050, 'superadmin', 'excludeFullyLeveragedFiles', 'no'),
(1051, 'superadmin', 'preserveSourceFolder', 'no'),
(1052, 'superadmin', 'includeXmlNodeContextInformation', 'no'),
(1053, 'superadmin', 'consolidateFileType', 'consolidate'),
(1054, 'superadmin', 'wordCountForDownload', '2000'),
(1055, 'superadmin', 'penalizedReferenceTmPre', 'yes'),
(1056, 'superadmin', 'penalizedReferenceTmPer', 'no'),
(1057, 'superadmin', 'separateTMfile', 'no'),
(1058, 'superadmin', 'populatemt', 'yes'),
(1059, 'superadmin', 'notifyInitilaImportFailure', '1');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` bigint(20) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `STATE` bigint(20) DEFAULT NULL,
  `ACTIVITY_ID` bigint(20) DEFAULT NULL,
  `SOURCE_LOCALE` varchar(100) DEFAULT NULL,
  `TARGET_LOCALE` varchar(100) DEFAULT NULL,
  `USER` varchar(100) DEFAULT NULL,
  `RATE` varchar(100) DEFAULT NULL,
  `COST` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `ID` bigint(20) NOT NULL,
  `CUSTOM_VENDOR_ID` varchar(40) NOT NULL,
  `FIRST_NAME` varchar(40) NOT NULL,
  `LAST_NAME` varchar(40) NOT NULL,
  `PSEUDONYM` varchar(40) NOT NULL,
  `TITLE` varchar(40) DEFAULT NULL,
  `ADDRESS` varchar(4000) DEFAULT NULL,
  `COMPANY` varchar(80) DEFAULT NULL,
  `COUNTRY` varchar(1000) DEFAULT NULL,
  `NATIONALITIES` varchar(2000) DEFAULT NULL,
  `DOB` varchar(20) DEFAULT NULL,
  `NOTES` text,
  `RESUME` text,
  `RESUME_FILENAME` varchar(4000) DEFAULT NULL,
  `APPLICATION_STATUS` varchar(10) NOT NULL,
  `IS_INTERNAL` char(1) DEFAULT NULL,
  `ALLOW_AMBASSADOR_ACCESS` char(1) NOT NULL,
  `IN_ALL_PROJECTS` char(1) NOT NULL,
  `COMMUNICATION_LOCALE` varchar(5) NOT NULL,
  `USER_ID` varchar(80) DEFAULT NULL,
  `TIMESTAMP` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vendor_communication`
--

CREATE TABLE `vendor_communication` (
  `VENDOR_ID` bigint(20) NOT NULL,
  `COMMUNICATION_TYPE` char(1) NOT NULL,
  `COMMUNICATION_VALUE` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vendor_custom_field`
--

CREATE TABLE `vendor_custom_field` (
  `VENDOR_ID` bigint(20) NOT NULL,
  `CUSTOM_FIELD_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vendor_field_security`
--

CREATE TABLE `vendor_field_security` (
  `ID` bigint(20) NOT NULL,
  `VENDOR_ID` bigint(20) NOT NULL,
  `SECURITIES_XML` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vendor_rating`
--

CREATE TABLE `vendor_rating` (
  `ID` bigint(20) NOT NULL,
  `VENDOR_ID` bigint(20) NOT NULL,
  `TASK_ID` bigint(20) DEFAULT NULL,
  `VALUE` int(3) NOT NULL,
  `MODIFY_DATE` datetime NOT NULL,
  `MODIFY_USERID` varchar(80) NOT NULL,
  `COMMENTS` varchar(4000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vendor_role`
--

CREATE TABLE `vendor_role` (
  `ID` bigint(20) NOT NULL,
  `VENDOR_ID` bigint(20) NOT NULL,
  `ACTIVITY_ID` bigint(20) NOT NULL,
  `LOCALE_PAIR_ID` bigint(20) NOT NULL,
  `RATE_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_task_duration`
-- (See below for the actual view)
--
CREATE TABLE `view_task_duration` (
`jobId` bigint(20)
,`source_locale` varchar(7)
,`target_locale` varchar(7)
,`duration` int(7)
,`company_id` bigint(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_workflow_level`
-- (See below for the actual view)
--
CREATE TABLE `view_workflow_level` (
`project_name` varchar(40)
,`job_id` bigint(20)
,`project_manager` varchar(80)
,`job_name` varchar(320)
,`source_locale` varchar(7)
,`target_locale` varchar(7)
,`start_date` datetime
,`actual_end` datetime
,`estimated_cost` float
,`actual_cost` float
,`final_cost` float
,`override_cost` float
,`company_id` bigint(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `wf_template_wf_manager`
--

CREATE TABLE `wf_template_wf_manager` (
  `WORKFLOW_TEMPLATE_ID` bigint(20) NOT NULL,
  `WORKFLOW_MANAGER_ID` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `workflow`
--

CREATE TABLE `workflow` (
  `IFLOW_INSTANCE_ID` bigint(20) NOT NULL,
  `STATE` varchar(40) DEFAULT NULL,
  `TARGET_LOCALE_ID` bigint(20) NOT NULL,
  `JOB_ID` bigint(20) NOT NULL,
  `TYPE` varchar(20) NOT NULL,
  `DISPATCH_DATE` datetime DEFAULT NULL,
  `ESTIMATED_COMPLETION_DATE` datetime DEFAULT NULL,
  `COMPLETED_DATE` datetime DEFAULT NULL,
  `EXPORT_DATE` datetime DEFAULT NULL,
  `FRACTION` varchar(25) NOT NULL,
  `DURATION` bigint(20) DEFAULT NULL,
  `TIMESTAMP` datetime NOT NULL,
  `PLANNED_COMPLETION_DATE` datetime DEFAULT NULL,
  `TOTAL_EXACT_MATCH_WORD_COUNT` int(10) DEFAULT NULL,
  `IN_CONTEXT_MATCH_WORD_COUNT` int(10) DEFAULT NULL,
  `MT_EXACT_MATCH_WORD_COUNT` int(10) DEFAULT NULL,
  `EXACT_SEGMENT_TM_WORD_COUNT` int(10) DEFAULT NULL,
  `EXACT_CONTEXT_WORD_COUNT` int(10) DEFAULT NULL,
  `FUZZY_LOW_WORD_COUNT` int(10) DEFAULT NULL,
  `FUZZY_MED_WORD_COUNT` int(10) DEFAULT NULL,
  `FUZZY_MED_HI_WORD_COUNT` int(10) DEFAULT NULL,
  `FUZZY_HI_WORD_COUNT` int(10) DEFAULT NULL,
  `NO_MATCH_WORD_COUNT` int(10) DEFAULT NULL,
  `REPETITION_WORD_COUNT` int(10) DEFAULT NULL,
  `MT_TOTAL_WORD_COUNT` int(10) DEFAULT '0',
  `MT_FUZZY_NO_MATCH_WORD_COUNT` int(10) DEFAULT '0',
  `MT_REPETITIONS` int(10) DEFAULT '0',
  `MT_ENGINE_WORD_COUNT` int(10) DEFAULT '0',
  `MT_PERPLEXITY_WORD_COUNT` int(10) DEFAULT '0',
  `THRESHOLD_FUZZY_HI_WORD_COUNT` int(10) DEFAULT NULL,
  `THRESHOLD_FUZZY_MED_HI_WORD_COUNT` int(10) DEFAULT NULL,
  `THRESHOLD_FUZZY_MED_WORD_COUNT` int(10) DEFAULT NULL,
  `THRESHOLD_FUZZY_LOW_WORD_COUNT` int(10) DEFAULT NULL,
  `THRESHOLD_NO_MATCH_WORD_COUNT` int(10) DEFAULT NULL,
  `TOTAL_WORD_COUNT` int(10) DEFAULT NULL,
  `IS_ESTI_CMPLTN_DATE_OVERRIDED` char(1) DEFAULT NULL,
  `ESTI_TRANSLATE_CMPLTN_DATE` datetime DEFAULT NULL,
  `IS_ESTI_TRANS_DATE_OVERRIDED` char(1) DEFAULT NULL,
  `TRANSLATION_COMPLETED_DATE` datetime DEFAULT NULL,
  `COMPANY_ID` bigint(20) NOT NULL,
  `NO_USE_IC_MATCH_WORD_COUNT` int(10) DEFAULT NULL,
  `USE_MT` char(1) DEFAULT 'N',
  `MT_PROFILE_NAME` varchar(60) DEFAULT NULL,
  `MT_THRESHOLD` int(11) DEFAULT '0',
  `PRIORITY` int(3) NOT NULL DEFAULT '3',
  `SCORECARD_COMMENT` varchar(500) DEFAULT NULL,
  `SCORECARD_SHOWTYPE` int(11) DEFAULT '-1',
  `IS_SINCE_8_7` char(1) DEFAULT 'Y',
  `FLUENCY_SCORE` varchar(200) DEFAULT NULL,
  `ADEQUACY_SCORE` varchar(200) DEFAULT NULL,
  `DQF_COMMENT` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `workflow_exporting`
--

CREATE TABLE `workflow_exporting` (
  `ID` bigint(20) NOT NULL,
  `WORKFLOW_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `workflow_owner`
--

CREATE TABLE `workflow_owner` (
  `ID` bigint(20) NOT NULL,
  `WORKFLOW_ID` bigint(20) NOT NULL,
  `OWNER_ID` varchar(80) NOT NULL,
  `OWNER_TYPE` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `workflow_request`
--

CREATE TABLE `workflow_request` (
  `ID` bigint(20) NOT NULL,
  `JOB_ID` bigint(20) DEFAULT NULL,
  `TYPE` varchar(100) NOT NULL,
  `EXCEPTION_XML` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `workflow_request_wftemplate`
--

CREATE TABLE `workflow_request_wftemplate` (
  `WORKFLOW_REQUEST_ID` bigint(20) NOT NULL,
  `WORKFLOW_TEMPLATE_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `workflow_state_posts`
--

CREATE TABLE `workflow_state_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `NAME` varchar(40) NOT NULL,
  `DESCRIPTION` varchar(4000) DEFAULT NULL,
  `LISTENER_URL` varchar(100) NOT NULL,
  `SECRET_KEY` varchar(100) DEFAULT NULL,
  `TIMEOUT_PERIOD` int(3) DEFAULT NULL,
  `RETRY_NUMBER` int(3) DEFAULT NULL,
  `NOTIFY_EMAIL` varchar(100) DEFAULT NULL,
  `COMPANY_ID` bigint(20) DEFAULT NULL,
  `POST_JOB_CHANGE` varchar(1) DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `workflow_template`
--

CREATE TABLE `workflow_template` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(60) NOT NULL,
  `DESCRIPTION` varchar(200) DEFAULT NULL,
  `PROJECT_ID` bigint(20) NOT NULL,
  `SOURCE_LOCALE_ID` bigint(20) NOT NULL,
  `TARGET_LOCALE_ID` bigint(20) NOT NULL,
  `CHAR_SET` varchar(30) DEFAULT NULL,
  `IFLOW_TEMPLATE_ID` int(11) NOT NULL,
  `PERPLEXITY_ID` bigint(20) DEFAULT NULL,
  `PERPLEXITY_KEY` varchar(60) DEFAULT NULL,
  `PERPLEXITY_SOURCE_THRESHOLD` double DEFAULT '-1',
  `PERPLEXITY_TARGET_THRESHOLD` double DEFAULT '-1',
  `IS_ACTIVE` char(1) NOT NULL,
  `NOTIFY_PM` char(1) NOT NULL,
  `TYPE` varchar(20) NOT NULL,
  `COMPANYID` bigint(20) NOT NULL,
  `SCORECARD_SHOWTYPE` int(11) DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xliff_alt`
--

CREATE TABLE `xliff_alt` (
  `ID` bigint(20) NOT NULL,
  `TUV_ID` bigint(20) NOT NULL,
  `SEGMENT` text NOT NULL,
  `LANGUAGE` varchar(30) DEFAULT NULL,
  `QUALITY` varchar(30) DEFAULT NULL,
  `SOURCE_SEGMENT` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xml_dtd`
--

CREATE TABLE `xml_dtd` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(40) NOT NULL,
  `COMPANY_ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(4000) DEFAULT NULL,
  `ADD_COMMENT` char(1) NOT NULL,
  `SEND_EMAIL` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xml_rule`
--

CREATE TABLE `xml_rule` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(40) NOT NULL,
  `COMPANY_ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(4000) DEFAULT NULL,
  `RULE_TEXT` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xml_rule_filter`
--

CREATE TABLE `xml_rule_filter` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `FILTER_NAME` varchar(255) NOT NULL,
  `FILTER_DESCRIPTION` varchar(4000) DEFAULT NULL,
  `XML_RULE_ID` bigint(20) NOT NULL DEFAULT '-1',
  `ENABLE_CONVERT_HTML_ENTITY` char(1) NOT NULL DEFAULT 'N',
  `COMPANY_ID` bigint(20) UNSIGNED NOT NULL,
  `USE_XML_RULE` char(1) NOT NULL DEFAULT 'Y',
  `CONFIG_XML` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xml_rule_filter`
--

INSERT INTO `xml_rule_filter` (`ID`, `FILTER_NAME`, `FILTER_DESCRIPTION`, `XML_RULE_ID`, `ENABLE_CONVERT_HTML_ENTITY`, `COMPANY_ID`, `USE_XML_RULE`, `CONFIG_XML`) VALUES
(1, 'XML Filter(Default)', 'The default xml filter', 1, 'N', 1, 'Y', '');

-- --------------------------------------------------------

--
-- Structure for view `view_task_duration`
--
DROP TABLE IF EXISTS `view_task_duration`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_task_duration`  AS SELECT DISTINCT `j`.`ID` AS `jobId`, concat(`l2`.`ISO_LANG_CODE`,'_',`l2`.`ISO_COUNTRY_CODE`) AS `source_locale`, concat(`l1`.`ISO_LANG_CODE`,'_',`l1`.`ISO_COUNTRY_CODE`) AS `target_locale`, (to_days(`ti`.`COMPLETED_DATE`) - to_days(`ti`.`ACCEPTED_DATE`)) AS `duration`, `j`.`COMPANY_ID` AS `company_id` FROM ((((((`job` `j` join `request` `r`) join `l10n_profile` `l10n`) join `workflow` `w`) join `task_info` `ti`) join `locale` `l1`) join `locale` `l2`) WHERE ((`j`.`ID` = `w`.`JOB_ID`) AND (`r`.`JOB_ID` = `j`.`ID`) AND (`r`.`L10N_PROFILE_ID` = `l10n`.`ID`) AND (`w`.`IFLOW_INSTANCE_ID` = `ti`.`WORKFLOW_ID`) AND (`w`.`TARGET_LOCALE_ID` = `l1`.`ID`) AND (`l10n`.`SOURCE_LOCALE_ID` = `l2`.`ID`) AND (`j`.`CREATE_DATE` between (now() - interval 31 day) and now()) AND (`j`.`STATE` in ('EXPORTED','LOCALIZED'))) ;

-- --------------------------------------------------------

--
-- Structure for view `view_workflow_level`
--
DROP TABLE IF EXISTS `view_workflow_level`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_workflow_level`  AS SELECT DISTINCT `p`.`PROJECT_NAME` AS `project_name`, `j`.`ID` AS `job_id`, `p`.`MANAGER_USER_ID` AS `project_manager`, `j`.`NAME` AS `job_name`, (select concat(`locale`.`ISO_LANG_CODE`,'_',`locale`.`ISO_COUNTRY_CODE`) from `locale` where (`locale`.`ID` = `l10n`.`SOURCE_LOCALE_ID`)) AS `source_locale`, (select concat(`locale`.`ISO_LANG_CODE`,'_',`locale`.`ISO_COUNTRY_CODE`) from `locale` where (`locale`.`ID` = `w`.`TARGET_LOCALE_ID`)) AS `target_locale`, `w`.`DISPATCH_DATE` AS `start_date`, `w`.`COMPLETED_DATE` AS `actual_end`, `c`.`ESTIMATED_COST` AS `estimated_cost`, `c`.`ACTUAL_COST` AS `actual_cost`, `c`.`FINAL_COST` AS `final_cost`, `c`.`OVERRIDE_COST` AS `override_cost`, `j`.`COMPANY_ID` AS `company_id` FROM (((((`project` `p` join `l10n_profile` `l10n`) join `request` `r`) join `job` `j`) join `workflow` `w`) join `cost` `c`) WHERE ((`p`.`PROJECT_SEQ` = `l10n`.`PROJECT_ID`) AND (`r`.`L10N_PROFILE_ID` = `l10n`.`ID`) AND (`r`.`JOB_ID` = `j`.`ID`) AND (`w`.`JOB_ID` = `j`.`ID`) AND (`c`.`COSTABLE_OBJECT_TYPE` = 'W') AND (`c`.`COSTABLE_OBJECT_ID` = `w`.`IFLOW_INSTANCE_ID`) AND (`c`.`RATE_TYPE` = 'E') AND (`j`.`STATE` in ('DISPATCHED','EXPORTED','LOCALIZED','ARCHIVED'))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_ACTIVITY_COMPANY_ID` (`COMPANY_ID`);

--
-- Indexes for table `adding_source_page`
--
ALTER TABLE `adding_source_page`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `amount_of_work`
--
ALTER TABLE `amount_of_work`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_AMOUNT_OF_WORK_TASK_ID` (`TASK_ID`);

--
-- Indexes for table `attribute`
--
ALTER TABLE `attribute`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `NAME` (`NAME`),
  ADD KEY `IDX_ATTRIBUTE_COMPANY_ID` (`COMPANY_ID`),
  ADD KEY `IDX_ATTRIBUTE_NAME` (`NAME`),
  ADD KEY `IDX_ATTRIBUTE_DISPLAY_NAME` (`DISPLAY_NAME`);

--
-- Indexes for table `attribute_clone`
--
ALTER TABLE `attribute_clone`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_ATTRIBUTE_CLONE_DISPLAY_NAME` (`DISPLAY_NAME`),
  ADD KEY `IDX_ATTRIBUTE_CLONE_COMPANY_ID` (`COMPANY_ID`);

--
-- Indexes for table `attribute_condition_date`
--
ALTER TABLE `attribute_condition_date`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `attribute_condition_file`
--
ALTER TABLE `attribute_condition_file`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `attribute_condition_float`
--
ALTER TABLE `attribute_condition_float`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `attribute_condition_int`
--
ALTER TABLE `attribute_condition_int`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `attribute_condition_list`
--
ALTER TABLE `attribute_condition_list`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `attribute_condition_text`
--
ALTER TABLE `attribute_condition_text`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `attribute_set`
--
ALTER TABLE `attribute_set`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_ATTRIBUTE_SET_COMPANY_ID` (`COMPANY_ID`);

--
-- Indexes for table `attribute_set_attribute`
--
ALTER TABLE `attribute_set_attribute`
  ADD PRIMARY KEY (`SET_ID`,`ATTRIBUTE_ID`);

--
-- Indexes for table `base_filter`
--
ALTER TABLE `base_filter`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `base_filter_mapping`
--
ALTER TABLE `base_filter_mapping`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `calendar`
--
ALTER TABLE `calendar`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_CALENDAR_COMPANY_ID` (`COMPANY_ID`);

--
-- Indexes for table `calendar_holiday`
--
ALTER TABLE `calendar_holiday`
  ADD PRIMARY KEY (`CALENDAR_ID`,`HOLIDAY_ID`),
  ADD KEY `FK_CALENDAR_HOLIDAY_HOLIDAY_ID` (`HOLIDAY_ID`);

--
-- Indexes for table `calendar_working_day`
--
ALTER TABLE `calendar_working_day`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_CALENDAR_WORKING_DAY_CALENDAR_ID` (`CALENDAR_ID`);

--
-- Indexes for table `calendar_working_hour`
--
ALTER TABLE `calendar_working_hour`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_CALENDAR_WORKING_HOUR_CALENDAR_WORKING_DAY_ID` (`CALENDAR_WORKING_DAY_ID`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `category_post_review`
--
ALTER TABLE `category_post_review`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `category_scorecard`
--
ALTER TABLE `category_scorecard`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_SCORE_CARD_CATEGORY_COMPANY` (`COMPANY_ID`);

--
-- Indexes for table `category_segment_comment`
--
ALTER TABLE `category_segment_comment`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_CATEGORY_COMPANY` (`COMPANY_ID`);

--
-- Indexes for table `code_set`
--
ALTER TABLE `code_set`
  ADD PRIMARY KEY (`CODE_SET`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `connector_blaise`
--
ALTER TABLE `connector_blaise`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `connector_blaise_job`
--
ALTER TABLE `connector_blaise_job`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_JOB_ID` (`JOB_ID`);

--
-- Indexes for table `connector_coti_document`
--
ALTER TABLE `connector_coti_document`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `connector_coti_package`
--
ALTER TABLE `connector_coti_package`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `connector_coti_project`
--
ALTER TABLE `connector_coti_project`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `connector_eloqua`
--
ALTER TABLE `connector_eloqua`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `connector_git`
--
ALTER TABLE `connector_git`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `connector_git_cache_file`
--
ALTER TABLE `connector_git_cache_file`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `connector_git_file_mapping`
--
ALTER TABLE `connector_git_file_mapping`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `connector_git_job`
--
ALTER TABLE `connector_git_job`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `container_role`
--
ALTER TABLE `container_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_CONTAINER_ROLE_NAME` (`NAME`);

--
-- Indexes for table `container_role_rate`
--
ALTER TABLE `container_role_rate`
  ADD PRIMARY KEY (`ROLE_ID`,`RATE_ID`);

--
-- Indexes for table `container_role_user_ids`
--
ALTER TABLE `container_role_user_ids`
  ADD PRIMARY KEY (`ROLE_ID`,`USER_ID`);

--
-- Indexes for table `cost`
--
ALTER TABLE `cost`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `COSTABLE_OBJECT_ID` (`COSTABLE_OBJECT_ID`,`COSTABLE_OBJECT_TYPE`,`RATE_TYPE`),
  ADD KEY `FK_COST_CURRENCY_CONVERSION_ID` (`CURRENCY_CONVERSION_ID`);

--
-- Indexes for table `cost_by_word_count`
--
ALTER TABLE `cost_by_word_count`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `INDEX_COST_ID` (`COST_ID`),
  ADD KEY `IDX_COST_BY_WORD_COUNT_COST_ID` (`COST_ID`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`ISO_COUNTRY_CODE`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ISO_CURRENCY_CODE` (`ISO_CURRENCY_CODE`);

--
-- Indexes for table `currency_conversion`
--
ALTER TABLE `currency_conversion`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_CURRENCY_CONVERSION_CURRENCY_ID` (`CURRENCY_ID`),
  ADD KEY `FK_CURRENCY_CONVERSION_COMPANY_ID` (`COMPANY_ID`);

--
-- Indexes for table `custom_field`
--
ALTER TABLE `custom_field`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `INDEX_FIELD_VALUE` (`FIELD_VALUE`);

--
-- Indexes for table `custom_form`
--
ALTER TABLE `custom_form`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_CUSTOM_FORM_LOCALE_ID` (`LOCALE_ID`);

--
-- Indexes for table `cvs_file_profile`
--
ALTER TABLE `cvs_file_profile`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CVS_FILE_PROFILE_INDEX` (`SOURCE_LOCALE`,`PROJECT_ID`,`MODULE_ID`,`FILE_PROFILE_ID`);

--
-- Indexes for table `cvs_module`
--
ALTER TABLE `cvs_module`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_MODULE_SERVER` (`SERVER`);

--
-- Indexes for table `cvs_repository`
--
ALTER TABLE `cvs_repository`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_REPOSITORY_SERVER` (`SERVER`);

--
-- Indexes for table `cvs_server`
--
ALTER TABLE `cvs_server`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_SERVER_COMPANY` (`COMPANYID`);

--
-- Indexes for table `cvs_server_user`
--
ALTER TABLE `cvs_server_user`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_SERVER_USER` (`SERVER`);

--
-- Indexes for table `cvs_source_files`
--
ALTER TABLE `cvs_source_files`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `delayed_import_request`
--
ALTER TABLE `delayed_import_request`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_DELAYED_IMPORT_REQUEST_PREVIOUS_PAGE_ID` (`PREVIOUS_PAGE_ID`);

--
-- Indexes for table `exportbatch_workflow`
--
ALTER TABLE `exportbatch_workflow`
  ADD PRIMARY KEY (`EXPORT_BATCH_ID`,`WORKFLOW_ID`),
  ADD KEY `FK_EXPORTBATCH_WORKFLOW_WORKFLOW_ID` (`WORKFLOW_ID`);

--
-- Indexes for table `exporting_page`
--
ALTER TABLE `exporting_page`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_EXPORTING_PAGE_EXPORT_BATCH_ID` (`EXPORT_BATCH_ID`);

--
-- Indexes for table `export_batch_event`
--
ALTER TABLE `export_batch_event`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_EXPORT_BATCH_EVENT_JOB_ID` (`JOB_ID`),
  ADD KEY `FK_EXPORT_BATCH_EVENT_TASK_ID` (`TASK_ID`);

--
-- Indexes for table `export_location`
--
ALTER TABLE `export_location`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `NAME` (`NAME`,`COMPANY_ID`),
  ADD KEY `FK_EXPORT_LOCATION_COMPANY_ID` (`COMPANY_ID`);

--
-- Indexes for table `extension`
--
ALTER TABLE `extension`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_EXTENSION_COMPANY_ID` (`COMPANY_ID`);

--
-- Indexes for table `file_profile`
--
ALTER TABLE `file_profile`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_FILE_PROFILE_KNOWN_FORMAT_ID` (`KNOWN_FORMAT_TYPE_ID`),
  ADD KEY `FK_FILE_PROFILE_CODE_SET` (`CODE_SET`),
  ADD KEY `FK_XML_RULE_COMPANY_ID` (`COMPANYID`);

--
-- Indexes for table `file_profile_extension`
--
ALTER TABLE `file_profile_extension`
  ADD PRIMARY KEY (`FILE_PROFILE_ID`,`EXTENSION_ID`),
  ADD KEY `FK_FILE_PROFILE_EXTENSION_EXTENSION_ID` (`EXTENSION_ID`);

--
-- Indexes for table `file_value_item`
--
ALTER TABLE `file_value_item`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `filter_configuration`
--
ALTER TABLE `filter_configuration`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `filter_json`
--
ALTER TABLE `filter_json`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `flux_gs_map`
--
ALTER TABLE `flux_gs_map`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `flux_gs_map_event_type`
--
ALTER TABLE `flux_gs_map_event_type`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `NAME` (`NAME`);

--
-- Indexes for table `flux_gs_map_object_type`
--
ALTER TABLE `flux_gs_map_object_type`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `NAME` (`NAME`);

--
-- Indexes for table `frame_maker_filter`
--
ALTER TABLE `frame_maker_filter`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `holiday`
--
ALTER TABLE `holiday`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_HOLIDAY_COMPANY_ID` (`COMPANY_ID`);

--
-- Indexes for table `html_filter`
--
ALTER TABLE `html_filter`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `image_replace_file_map`
--
ALTER TABLE `image_replace_file_map`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `INDEX_TPID_TUVID_SUBID` (`TARGET_PAGE_ID`,`TUV_ID`,`SUB_ID`),
  ADD KEY `INDEX_IMAGEMAP_TPID` (`TARGET_PAGE_ID`),
  ADD KEY `IDX_IMAGE_REP_FM_TUVID` (`TUV_ID`);

--
-- Indexes for table `indd_filter`
--
ALTER TABLE `indd_filter`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `indd_tu_mapping`
--
ALTER TABLE `indd_tu_mapping`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_UNIQUE` (`ID`);

--
-- Indexes for table `ip_tm_index`
--
ALTER TABLE `ip_tm_index`
  ADD KEY `FK_IP_TM_SRC_ID` (`SRC_ID`),
  ADD KEY `IP_IDX_LOCALE_ID` (`LOCALE_ID`),
  ADD KEY `IP_IDX_JOB_ID` (`JOB_ID`),
  ADD KEY `IP_IDX_POPULATION_TM_ID` (`POPULATION_TM_ID`),
  ADD KEY `IP_IDX_TOKEN` (`TOKEN`);

--
-- Indexes for table `ip_tm_src_l`
--
ALTER TABLE `ip_tm_src_l`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IP_S_L_JOB_ID` (`JOB_ID`),
  ADD KEY `IP_S_L_POPULATION_TM_ID` (`POPULATION_TM_ID`),
  ADD KEY `IP_S_L_LOCALE_ID` (`LOCALE_ID`),
  ADD KEY `IP_S_L_TYPE` (`TYPE`),
  ADD KEY `IP_S_L_EXACT_MATCH_KEY` (`EXACT_MATCH_KEY`);

--
-- Indexes for table `ip_tm_src_t`
--
ALTER TABLE `ip_tm_src_t`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IP_S_T_JOB_ID` (`JOB_ID`),
  ADD KEY `IP_S_T_POPULATION_TM_ID` (`POPULATION_TM_ID`),
  ADD KEY `IP_S_T_LOCALE_ID` (`LOCALE_ID`),
  ADD KEY `IP_S_T_TYPE` (`TYPE`),
  ADD KEY `IP_S_T_EXACT_MATCH_KEY` (`EXACT_MATCH_KEY`);

--
-- Indexes for table `ip_tm_trg_l`
--
ALTER TABLE `ip_tm_trg_l`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IP_T_L_SRC_ID` (`SRC_ID`),
  ADD KEY `IP_T_L_LOCALE_ID` (`LOCALE_ID`);

--
-- Indexes for table `ip_tm_trg_t`
--
ALTER TABLE `ip_tm_trg_t`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IP_T_T_SRC_ID` (`SRC_ID`),
  ADD KEY `IP_T_T_LOCALE_ID` (`LOCALE_ID`),
  ADD KEY `IDX_TU_ID` (`TU_ID`);

--
-- Indexes for table `issue`
--
ALTER TABLE `issue`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `INDEX_LKEY_OTYPE` (`LOGICAL_KEY`,`ISSUE_OBJECT_TYPE`),
  ADD KEY `INDEX_STATUS_OTYPE` (`STATUS`,`ISSUE_OBJECT_TYPE`),
  ADD KEY `INDEX_OID_OTYPE` (`ISSUE_OBJECT_ID`,`ISSUE_OBJECT_TYPE`),
  ADD KEY `INDEX_TARGET_PAGE_ID` (`TARGET_PAGE_ID`);

--
-- Indexes for table `issue_history`
--
ALTER TABLE `issue_history`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `INDEX_IID` (`ISSUE_ID`);

--
-- Indexes for table `java_properties_filter`
--
ALTER TABLE `java_properties_filter`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `java_script_filter`
--
ALTER TABLE `java_script_filter`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `jbpm_action`
--
ALTER TABLE `jbpm_action`
  ADD PRIMARY KEY (`ID_`),
  ADD KEY `FK_ACTION_EVENT` (`EVENT_`),
  ADD KEY `FK_ACTION_EXPTHDL` (`EXCEPTIONHANDLER_`),
  ADD KEY `FK_ACTION_PROCDEF` (`PROCESSDEFINITION_`),
  ADD KEY `FK_CRTETIMERACT_TA` (`TIMERACTION_`),
  ADD KEY `FK_ACTION_ACTNDEL` (`ACTIONDELEGATION_`),
  ADD KEY `FK_ACTION_REFACT` (`REFERENCEDACTION_`);

--
-- Indexes for table `jbpm_bytearray`
--
ALTER TABLE `jbpm_bytearray`
  ADD PRIMARY KEY (`ID_`),
  ADD KEY `FK_BYTEARR_FILDEF` (`FILEDEFINITION_`);

--
-- Indexes for table `jbpm_byteblock`
--
ALTER TABLE `jbpm_byteblock`
  ADD PRIMARY KEY (`PROCESSFILE_`,`INDEX_`),
  ADD KEY `FK_BYTEBLOCK_FILE` (`PROCESSFILE_`);

--
-- Indexes for table `jbpm_comment`
--
ALTER TABLE `jbpm_comment`
  ADD PRIMARY KEY (`ID_`),
  ADD KEY `FK_COMMENT_TOKEN` (`TOKEN_`),
  ADD KEY `FK_COMMENT_TSK` (`TASKINSTANCE_`);

--
-- Indexes for table `jbpm_decisionconditions`
--
ALTER TABLE `jbpm_decisionconditions`
  ADD PRIMARY KEY (`DECISION_`,`INDEX_`),
  ADD KEY `FK_DECCOND_DEC` (`DECISION_`);

--
-- Indexes for table `jbpm_delegation`
--
ALTER TABLE `jbpm_delegation`
  ADD PRIMARY KEY (`ID_`),
  ADD KEY `FK_DELEGATION_PRCD` (`PROCESSDEFINITION_`);

--
-- Indexes for table `jbpm_event`
--
ALTER TABLE `jbpm_event`
  ADD PRIMARY KEY (`ID_`),
  ADD KEY `FK_EVENT_PROCDEF` (`PROCESSDEFINITION_`),
  ADD KEY `FK_EVENT_NODE` (`NODE_`),
  ADD KEY `FK_EVENT_TRANS` (`TRANSITION_`),
  ADD KEY `FK_EVENT_TASK` (`TASK_`);

--
-- Indexes for table `jbpm_exceptionhandler`
--
ALTER TABLE `jbpm_exceptionhandler`
  ADD PRIMARY KEY (`ID_`);

--
-- Indexes for table `jbpm_gs_variable`
--
ALTER TABLE `jbpm_gs_variable`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `INX_GS_TASKINSTANCE` (`TASKINSTANCE_ID`);

--
-- Indexes for table `jbpm_id_group`
--
ALTER TABLE `jbpm_id_group`
  ADD PRIMARY KEY (`ID_`),
  ADD KEY `FK_ID_GRP_PARENT` (`PARENT_`);

--
-- Indexes for table `jbpm_id_membership`
--
ALTER TABLE `jbpm_id_membership`
  ADD PRIMARY KEY (`ID_`),
  ADD KEY `FK_ID_MEMSHIP_GRP` (`GROUP_`),
  ADD KEY `FK_ID_MEMSHIP_USR` (`USER_`);

--
-- Indexes for table `jbpm_id_user`
--
ALTER TABLE `jbpm_id_user`
  ADD PRIMARY KEY (`ID_`);

--
-- Indexes for table `jbpm_log`
--
ALTER TABLE `jbpm_log`
  ADD PRIMARY KEY (`ID_`),
  ADD KEY `FK_LOG_SOURCENODE` (`SOURCENODE_`),
  ADD KEY `FK_LOG_TOKEN` (`TOKEN_`),
  ADD KEY `FK_LOG_OLDBYTES` (`OLDBYTEARRAY_`),
  ADD KEY `FK_LOG_NEWBYTES` (`NEWBYTEARRAY_`),
  ADD KEY `FK_LOG_CHILDTOKEN` (`CHILD_`),
  ADD KEY `FK_LOG_DESTNODE` (`DESTINATIONNODE_`),
  ADD KEY `FK_LOG_TASKINST` (`TASKINSTANCE_`),
  ADD KEY `FK_LOG_SWIMINST` (`SWIMLANEINSTANCE_`),
  ADD KEY `FK_LOG_PARENT` (`PARENT_`),
  ADD KEY `FK_LOG_NODE` (`NODE_`),
  ADD KEY `FK_LOG_ACTION` (`ACTION_`),
  ADD KEY `FK_LOG_VARINST` (`VARIABLEINSTANCE_`),
  ADD KEY `FK_LOG_TRANSITION` (`TRANSITION_`);

--
-- Indexes for table `jbpm_message`
--
ALTER TABLE `jbpm_message`
  ADD PRIMARY KEY (`ID_`),
  ADD KEY `FK_MSG_TOKEN` (`TOKEN_`),
  ADD KEY `FK_CMD_NODE` (`NODE_`),
  ADD KEY `FK_CMD_ACTION` (`ACTION_`),
  ADD KEY `FK_CMD_TASKINST` (`TASKINSTANCE_`);

--
-- Indexes for table `jbpm_moduledefinition`
--
ALTER TABLE `jbpm_moduledefinition`
  ADD PRIMARY KEY (`ID_`),
  ADD KEY `FK_TSKDEF_START` (`STARTTASK_`),
  ADD KEY `FK_MODDEF_PROCDEF` (`PROCESSDEFINITION_`);

--
-- Indexes for table `jbpm_moduleinstance`
--
ALTER TABLE `jbpm_moduleinstance`
  ADD PRIMARY KEY (`ID_`),
  ADD KEY `FK_TASKMGTINST_TMD` (`TASKMGMTDEFINITION_`),
  ADD KEY `FK_MODINST_PRCINST` (`PROCESSINSTANCE_`);

--
-- Indexes for table `jbpm_node`
--
ALTER TABLE `jbpm_node`
  ADD PRIMARY KEY (`ID_`),
  ADD KEY `FK_PROCST_SBPRCDEF` (`SUBPROCESSDEFINITION_`),
  ADD KEY `FK_NODE_PROCDEF` (`PROCESSDEFINITION_`),
  ADD KEY `FK_NODE_ACTION` (`ACTION_`),
  ADD KEY `FK_DECISION_DELEG` (`DECISIONDELEGATION`),
  ADD KEY `FK_NODE_SUPERSTATE` (`SUPERSTATE_`);

--
-- Indexes for table `jbpm_pooledactor`
--
ALTER TABLE `jbpm_pooledactor`
  ADD PRIMARY KEY (`ID_`),
  ADD KEY `IDX_PLDACTR_ACTID` (`ACTORID_`),
  ADD KEY `FK_POOLEDACTOR_SLI` (`SWIMLANEINSTANCE_`);

--
-- Indexes for table `jbpm_processdefinition`
--
ALTER TABLE `jbpm_processdefinition`
  ADD PRIMARY KEY (`ID_`),
  ADD KEY `FK_PROCDEF_STRTSTA` (`STARTSTATE_`);

--
-- Indexes for table `jbpm_processinstance`
--
ALTER TABLE `jbpm_processinstance`
  ADD PRIMARY KEY (`ID_`),
  ADD KEY `FK_PROCIN_PROCDEF` (`PROCESSDEFINITION_`),
  ADD KEY `FK_PROCIN_ROOTTKN` (`ROOTTOKEN_`),
  ADD KEY `FK_PROCIN_SPROCTKN` (`SUPERPROCESSTOKEN_`);

--
-- Indexes for table `jbpm_runtimeaction`
--
ALTER TABLE `jbpm_runtimeaction`
  ADD PRIMARY KEY (`ID_`),
  ADD KEY `FK_RTACTN_PROCINST` (`PROCESSINSTANCE_`),
  ADD KEY `FK_RTACTN_ACTION` (`ACTION_`);

--
-- Indexes for table `jbpm_swimlane`
--
ALTER TABLE `jbpm_swimlane`
  ADD PRIMARY KEY (`ID_`),
  ADD KEY `FK_SWL_ASSDEL` (`ASSIGNMENTDELEGATION_`),
  ADD KEY `FK_SWL_TSKMGMTDEF` (`TASKMGMTDEFINITION_`);

--
-- Indexes for table `jbpm_swimlaneinstance`
--
ALTER TABLE `jbpm_swimlaneinstance`
  ADD PRIMARY KEY (`ID_`),
  ADD KEY `FK_SWIMLANEINST_TM` (`TASKMGMTINSTANCE_`),
  ADD KEY `FK_SWIMLANEINST_SL` (`SWIMLANE_`);

--
-- Indexes for table `jbpm_task`
--
ALTER TABLE `jbpm_task`
  ADD PRIMARY KEY (`ID_`),
  ADD KEY `FK_TSK_TSKCTRL` (`TASKCONTROLLER_`),
  ADD KEY `FK_TASK_ASSDEL` (`ASSIGNMENTDELEGATION_`),
  ADD KEY `FK_TASK_TASKNODE` (`TASKNODE_`),
  ADD KEY `FK_TASK_PROCDEF` (`PROCESSDEFINITION_`),
  ADD KEY `FK_TASK_STARTST` (`STARTSTATE_`),
  ADD KEY `FK_TASK_TASKMGTDEF` (`TASKMGMTDEFINITION_`),
  ADD KEY `FK_TASK_SWIMLANE` (`SWIMLANE_`);

--
-- Indexes for table `jbpm_taskactorpool`
--
ALTER TABLE `jbpm_taskactorpool`
  ADD PRIMARY KEY (`TASKINSTANCE_`,`POOLEDACTOR_`),
  ADD KEY `FK_TSKACTPOL_PLACT` (`POOLEDACTOR_`),
  ADD KEY `FK_TASKACTPL_TSKI` (`TASKINSTANCE_`);

--
-- Indexes for table `jbpm_taskcontroller`
--
ALTER TABLE `jbpm_taskcontroller`
  ADD PRIMARY KEY (`ID_`),
  ADD KEY `FK_TSKCTRL_DELEG` (`TASKCONTROLLERDELEGATION_`);

--
-- Indexes for table `jbpm_taskinstance`
--
ALTER TABLE `jbpm_taskinstance`
  ADD PRIMARY KEY (`ID_`),
  ADD KEY `IDX_TASK_ACTORID` (`ACTORID_`),
  ADD KEY `FK_TASKINST_TMINST` (`TASKMGMTINSTANCE_`),
  ADD KEY `FK_TASKINST_TOKEN` (`TOKEN_`),
  ADD KEY `FK_TASKINST_SLINST` (`SWIMLANINSTANCE_`),
  ADD KEY `FK_TASKINST_TASK` (`TASK_`);

--
-- Indexes for table `jbpm_timer`
--
ALTER TABLE `jbpm_timer`
  ADD PRIMARY KEY (`ID_`),
  ADD KEY `FK_TIMER_TOKEN` (`TOKEN_`),
  ADD KEY `FK_TIMER_PRINST` (`PROCESSINSTANCE_`),
  ADD KEY `FK_TIMER_ACTION` (`ACTION_`),
  ADD KEY `FK_TIMER_TSKINST` (`TASKINSTANCE_`);

--
-- Indexes for table `jbpm_token`
--
ALTER TABLE `jbpm_token`
  ADD PRIMARY KEY (`ID_`),
  ADD KEY `FK_TOKEN_PARENT` (`PARENT_`),
  ADD KEY `FK_TOKEN_NODE` (`NODE_`),
  ADD KEY `FK_TOKEN_PROCINST` (`PROCESSINSTANCE_`),
  ADD KEY `FK_TOKEN_SUBPI` (`SUBPROCESSINSTANCE_`);

--
-- Indexes for table `jbpm_tokenvariablemap`
--
ALTER TABLE `jbpm_tokenvariablemap`
  ADD PRIMARY KEY (`ID_`),
  ADD KEY `FK_TKVARMAP_CTXT` (`CONTEXTINSTANCE_`),
  ADD KEY `FK_TKVARMAP_TOKEN` (`TOKEN_`);

--
-- Indexes for table `jbpm_transition`
--
ALTER TABLE `jbpm_transition`
  ADD PRIMARY KEY (`ID_`),
  ADD KEY `FK_TRANSITION_TO` (`TO_`),
  ADD KEY `FK_TRANS_PROCDEF` (`PROCESSDEFINITION_`),
  ADD KEY `FK_TRANSITION_FROM` (`FROM_`);

--
-- Indexes for table `jbpm_variableaccess`
--
ALTER TABLE `jbpm_variableaccess`
  ADD PRIMARY KEY (`ID_`),
  ADD KEY `FK_VARACC_TSKCTRL` (`TASKCONTROLLER_`),
  ADD KEY `FK_VARACC_SCRIPT` (`SCRIPT_`),
  ADD KEY `FK_VARACC_PROCST` (`PROCESSSTATE_`);

--
-- Indexes for table `jbpm_variableinstance`
--
ALTER TABLE `jbpm_variableinstance`
  ADD PRIMARY KEY (`ID_`),
  ADD KEY `FK_VARINST_TK` (`TOKEN_`),
  ADD KEY `FK_VARINST_TKVARMP` (`TOKENVARIABLEMAP_`),
  ADD KEY `FK_VARINST_PRCINST` (`PROCESSINSTANCE_`),
  ADD KEY `FK_VAR_TSKINST` (`TASKINSTANCE_`),
  ADD KEY `FK_BYTEINST_ARRAY` (`BYTEARRAYVALUE_`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_JOB_COMPANY_ID` (`COMPANY_ID`),
  ADD KEY `INDEX_ID_STATE` (`ID`,`STATE`),
  ADD KEY `INDEX_JOB_NAME` (`NAME`),
  ADD KEY `INDEX_STATE_TIMESTAMP` (`STATE`,`TIMESTAMP`);

--
-- Indexes for table `job_attribute`
--
ALTER TABLE `job_attribute`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_JOB_ATTRIBUTE_JOB_ID` (`JOB_ID`),
  ADD KEY `IDX_JOB_ATTRIBUTE_ATTRIBUTE_ID` (`ATTRIBUTE_ID`);

--
-- Indexes for table `job_attribute_select_option`
--
ALTER TABLE `job_attribute_select_option`
  ADD PRIMARY KEY (`JOB_ATTRIBUTE_ID`,`SELECT_OPTION_ID`);

--
-- Indexes for table `job_group`
--
ALTER TABLE `job_group`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FR_KEY_PROJECT_ID` (`PROJECT_ID`),
  ADD KEY `FR_KEY_SOURCE_LOCALE_ID` (`SOURCE_LOCALE_ID`),
  ADD KEY `FR_KEY_COMPANY_ID` (`COMPANY_ID`);

--
-- Indexes for table `jsp_filter`
--
ALTER TABLE `jsp_filter`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `known_format_type`
--
ALTER TABLE `known_format_type`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `NAME` (`NAME`);

--
-- Indexes for table `l10n_profile`
--
ALTER TABLE `l10n_profile`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_L10N_PROFILE_COMPANYID` (`COMPANYID`),
  ADD KEY `INDEX_SLID` (`SOURCE_LOCALE_ID`),
  ADD KEY `INDEX_IDNAME` (`ID`,`NAME`),
  ADD KEY `IDX_L10N_PROJID_ID` (`PROJECT_ID`,`ID`);

--
-- Indexes for table `l10n_profile_tm_profile`
--
ALTER TABLE `l10n_profile_tm_profile`
  ADD PRIMARY KEY (`L10N_PROFILE_ID`,`TM_PROFILE_ID`),
  ADD KEY `FK_L10N_PROFILE_TM_PROFILE_TM_PROFILE_ID` (`TM_PROFILE_ID`);

--
-- Indexes for table `l10n_profile_version`
--
ALTER TABLE `l10n_profile_version`
  ADD PRIMARY KEY (`VERSION_SEQ`),
  ADD KEY `FK_L10N_PROFILE_VERSION_ORIGINAL_PROFILE_SEQ` (`ORIGINAL_PROFILE_SEQ`),
  ADD KEY `FK_L10N_PROFILE_VERSION_MODIFIED_PROFILE_SEQ` (`MODIFIED_PROFILE_SEQ`);

--
-- Indexes for table `l10n_profile_wftemplate_info`
--
ALTER TABLE `l10n_profile_wftemplate_info`
  ADD PRIMARY KEY (`L10N_PROFILE_ID`,`WF_TEMPLATE_ID`),
  ADD KEY `FK_L10N_PROFILE_WFTEMPLATE_INFO_WF_TEMPLATE_ID` (`WF_TEMPLATE_ID`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`ISO_LANG_CODE`);

--
-- Indexes for table `leverage_group`
--
ALTER TABLE `leverage_group`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `leverage_locales`
--
ALTER TABLE `leverage_locales`
  ADD PRIMARY KEY (`WORKFLOW_INFO_ID`,`LOCALE_ID`),
  ADD KEY `FK_LEVERAGE_LOCALES_LOCALE_ID` (`LOCALE_ID`);

--
-- Indexes for table `leverage_match_1`
--
ALTER TABLE `leverage_match_1`
  ADD PRIMARY KEY (`ORIGINAL_SOURCE_TUV_ID`,`SUB_ID`,`TARGET_LOCALE_ID`,`ORDER_NUM`),
  ADD KEY `INDEX_ORIG_LEV_ORD` (`ORIGINAL_SOURCE_TUV_ID`),
  ADD KEY `IDX_LM_ORDER_ORIGSOURCETUV` (`ORDER_NUM`,`ORIGINAL_SOURCE_TUV_ID`),
  ADD KEY `IDX_LM_SRCPGID_TGTLOCID_ORDNUM` (`SOURCE_PAGE_ID`,`TARGET_LOCALE_ID`,`ORDER_NUM`),
  ADD KEY `IDX_LM_ORIGSRCTUV_TGTLOCID` (`ORIGINAL_SOURCE_TUV_ID`,`TARGET_LOCALE_ID`);

--
-- Indexes for table `leverage_match_attr_1`
--
ALTER TABLE `leverage_match_attr_1`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_4_UNIQUE_KEY` (`ORIGINAL_SOURCE_TUV_ID`,`SUB_ID`,`TARGET_LOCALE_ID`,`ORDER_NUM`),
  ADD KEY `IDX_SPID_TRGLOCID` (`SOURCE_PAGE_ID`,`TARGET_LOCALE_ID`);

--
-- Indexes for table `locale`
--
ALTER TABLE `locale`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_LOCALE_ISO_LANG_CODE` (`ISO_LANG_CODE`),
  ADD KEY `INDEX_IS_UI_LOCALE` (`IS_UI_LOCALE`),
  ADD KEY `INDEX_ISO_COUNTRY_LANG` (`ISO_COUNTRY_CODE`,`ISO_LANG_CODE`);

--
-- Indexes for table `locale_codeset`
--
ALTER TABLE `locale_codeset`
  ADD PRIMARY KEY (`LOCALE_ID`,`CODE_SET`),
  ADD KEY `FK_LOCALE_CODESET_CODE_SET` (`CODE_SET`);

--
-- Indexes for table `locale_pair`
--
ALTER TABLE `locale_pair`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `SOURCE_LOCALE_ID` (`SOURCE_LOCALE_ID`,`TARGET_LOCALE_ID`,`COMPANY_ID`),
  ADD KEY `FK_LOCALE_PAIR_TARGET_LOCALE_ID` (`TARGET_LOCALE_ID`),
  ADD KEY `FK_LOCALE_PAIR_COMPANY_ID` (`COMPANY_ID`),
  ADD KEY `INDEX_SL_ACTIVE` (`IS_ACTIVE`,`SOURCE_LOCALE_ID`);

--
-- Indexes for table `login_attempt`
--
ALTER TABLE `login_attempt`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `login_attempt_config`
--
ALTER TABLE `login_attempt_config`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `module_mapping`
--
ALTER TABLE `module_mapping`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `MODULE_MAPPING_INDEX` (`ID`,`IS_ACTIVE`,`COMPANY_ID`,`SOURCE_LOCALE`,`TARGET_LOCALE`,`SOURCE_MODULE`,`TARGET_MODULE`);

--
-- Indexes for table `module_mapping_di`
--
ALTER TABLE `module_mapping_di`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `SOURCE_LOCALE` (`SOURCE_LOCALE`,`TARGET_LOCALE`,`SOURCE_MODULE`,`TARGET_MODULE`,`USER_ID`);

--
-- Indexes for table `module_rename`
--
ALTER TABLE `module_rename`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_MODULE_MAPPING_ID` (`MODULE_MAPPING_ID`);

--
-- Indexes for table `module_rename_di`
--
ALTER TABLE `module_rename_di`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_MODULE_MAPPING_DI_ID` (`MODULE_MAPPING_ID`);

--
-- Indexes for table `ms_office_doc_filter`
--
ALTER TABLE `ms_office_doc_filter`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ms_office_excel_filter`
--
ALTER TABLE `ms_office_excel_filter`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ms_office_ppt_filter`
--
ALTER TABLE `ms_office_ppt_filter`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `mt_profile`
--
ALTER TABLE `mt_profile`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `mt_profile_extent_info`
--
ALTER TABLE `mt_profile_extent_info`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `office2010_filter`
--
ALTER TABLE `office2010_filter`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `openoffice_filter`
--
ALTER TABLE `openoffice_filter`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `page_tm`
--
ALTER TABLE `page_tm`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_PAGE_TM_SOURCE_LOCALE_ID` (`SOURCE_LOCALE_ID`);

--
-- Indexes for table `page_tm_tuv_l`
--
ALTER TABLE `page_tm_tuv_l`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `PT_TUV_L_EXACT_MATCH_KEY` (`EXACT_MATCH_KEY`),
  ADD KEY `PT_TUV_L_LOCALE_ID` (`LOCALE_ID`),
  ADD KEY `PT_TUV_L_TU_ID` (`TU_ID`);

--
-- Indexes for table `page_tm_tuv_t`
--
ALTER TABLE `page_tm_tuv_t`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `PT_TUV_T_EXACT_MATCH_KEY` (`EXACT_MATCH_KEY`),
  ADD KEY `PT_TUV_T_LOCALE_ID` (`LOCALE_ID`),
  ADD KEY `PT_TUV_T_TU_ID` (`TU_ID`);

--
-- Indexes for table `page_tm_tu_l`
--
ALTER TABLE `page_tm_tu_l`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `PT_TU_L_TM_ID` (`TM_ID`),
  ADD KEY `PT_TU_L_TYPE` (`TYPE`);

--
-- Indexes for table `page_tm_tu_t`
--
ALTER TABLE `page_tm_tu_t`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `PT_TU_T_TM_ID` (`TM_ID`),
  ADD KEY `PT_TU_T_TYPE` (`TYPE`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `NAME` (`NAME`);

--
-- Indexes for table `permissiongroup`
--
ALTER TABLE `permissiongroup`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `NAME` (`NAME`,`COMPANY_ID`),
  ADD KEY `FK_PERMISSIONGROUP_COMPANY_ID` (`COMPANY_ID`);

--
-- Indexes for table `permissiongroup_user`
--
ALTER TABLE `permissiongroup_user`
  ADD PRIMARY KEY (`PERMISSIONGROUP_ID`,`USER_ID`);

--
-- Indexes for table `perplexity_service`
--
ALTER TABLE `perplexity_service`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `plain_text_filter`
--
ALTER TABLE `plain_text_filter`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `po_filter`
--
ALTER TABLE `po_filter`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`PROJECT_SEQ`),
  ADD UNIQUE KEY `PROJECT_NAME` (`PROJECT_NAME`,`COMPANYID`),
  ADD KEY `FK_PROJECT_COMPANYID` (`COMPANYID`),
  ADD KEY `INDEX_ID_USERID` (`PROJECT_SEQ`,`MANAGER_USER_ID`);

--
-- Indexes for table `project_tm`
--
ALTER TABLE `project_tm`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `NAME` (`NAME`,`COMPANY_ID`),
  ADD KEY `FK_PROJECT_TM_COMPANY_ID` (`COMPANY_ID`);

--
-- Indexes for table `project_tm_attribute`
--
ALTER TABLE `project_tm_attribute`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_PROJECT_TM_ATTRIBUTE_TM_ID` (`TM_ID`);

--
-- Indexes for table `project_tm_tuv_l`
--
ALTER TABLE `project_tm_tuv_l`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ST_TUV_L_EXACT_MATCH_KEY` (`EXACT_MATCH_KEY`),
  ADD KEY `ST_TUV_L_LOCALE_ID` (`LOCALE_ID`),
  ADD KEY `ST_TUV_L_TU_ID` (`TU_ID`);

--
-- Indexes for table `project_tm_tuv_t`
--
ALTER TABLE `project_tm_tuv_t`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ST_TUV_T_EXACT_MATCH_KEY` (`EXACT_MATCH_KEY`),
  ADD KEY `ST_TUV_T_LOCALE_ID` (`LOCALE_ID`),
  ADD KEY `ST_TUV_T_TU_ID` (`TU_ID`);

--
-- Indexes for table `project_tm_tu_l`
--
ALTER TABLE `project_tm_tu_l`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ST_TU_L_TM_ID` (`TM_ID`),
  ADD KEY `ST_TU_L_TYPE` (`TYPE`),
  ADD KEY `ST_TU_L_SOURCE_LOCALE_ID` (`SOURCE_LOCALE_ID`);

--
-- Indexes for table `project_tm_tu_t`
--
ALTER TABLE `project_tm_tu_t`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ST_TU_T_TM_ID` (`TM_ID`),
  ADD KEY `ST_TU_T_TYPE` (`TYPE`),
  ADD KEY `ST_TU_T_SOURCE_LOCALE_ID` (`SOURCE_LOCALE_ID`);

--
-- Indexes for table `project_tm_tu_t_prop`
--
ALTER TABLE `project_tm_tu_t_prop`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `PROJECT_TM_TU_T_PROP_TU_ID` (`TU_ID`);

--
-- Indexes for table `project_user`
--
ALTER TABLE `project_user`
  ADD PRIMARY KEY (`PROJECT_ID`,`USER_ID`);

--
-- Indexes for table `project_vendor`
--
ALTER TABLE `project_vendor`
  ADD PRIMARY KEY (`VENDOR_ID`,`PROJECT_ID`);

--
-- Indexes for table `qa_filter`
--
ALTER TABLE `qa_filter`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `qrtz_blob_triggers`
--
ALTER TABLE `qrtz_blob_triggers`
  ADD PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  ADD KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`);

--
-- Indexes for table `qrtz_calendars`
--
ALTER TABLE `qrtz_calendars`
  ADD PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`);

--
-- Indexes for table `qrtz_cron_triggers`
--
ALTER TABLE `qrtz_cron_triggers`
  ADD PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`);

--
-- Indexes for table `qrtz_fired_triggers`
--
ALTER TABLE `qrtz_fired_triggers`
  ADD PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`);

--
-- Indexes for table `qrtz_job_details`
--
ALTER TABLE `qrtz_job_details`
  ADD PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`);

--
-- Indexes for table `qrtz_locks`
--
ALTER TABLE `qrtz_locks`
  ADD PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`);

--
-- Indexes for table `qrtz_paused_trigger_grps`
--
ALTER TABLE `qrtz_paused_trigger_grps`
  ADD PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`);

--
-- Indexes for table `qrtz_scheduler_state`
--
ALTER TABLE `qrtz_scheduler_state`
  ADD PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`);

--
-- Indexes for table `qrtz_simple_triggers`
--
ALTER TABLE `qrtz_simple_triggers`
  ADD PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`);

--
-- Indexes for table `qrtz_simprop_triggers`
--
ALTER TABLE `qrtz_simprop_triggers`
  ADD PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`);

--
-- Indexes for table `qrtz_triggers`
--
ALTER TABLE `qrtz_triggers`
  ADD PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  ADD KEY `SCHED_NAME` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`);

--
-- Indexes for table `rate`
--
ALTER TABLE `rate`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_RATE_CURRENCY_CONV_ID` (`CURRENCY_CONV_ID`),
  ADD KEY `FK_RATE_ACTIVITY_ID` (`ACTIVITY_ID`),
  ADD KEY `FK_RATE_LOCALE_PAIR_ID` (`LOCALE_PAIR_ID`);

--
-- Indexes for table `remote_access_history`
--
ALTER TABLE `remote_access_history`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `remote_ip`
--
ALTER TABLE `remote_ip`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `removed_prefix_tag`
--
ALTER TABLE `removed_prefix_tag`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_TU_ID` (`TU_ID`);

--
-- Indexes for table `removed_suffix_tag`
--
ALTER TABLE `removed_suffix_tag`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_TU_ID` (`TU_ID`);

--
-- Indexes for table `removed_tag`
--
ALTER TABLE `removed_tag`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_TU_ID` (`TU_ID`);

--
-- Indexes for table `reports_data`
--
ALTER TABLE `reports_data`
  ADD PRIMARY KEY (`USER_ID`,`REPORT_JOBIDS`(255),`REPORT_TYPELIST`(255));

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_REQUEST_COMPANY_ID` (`COMPANY_ID`),
  ADD KEY `INDEX_ID_BATCHID` (`ID`,`BATCH_ID`),
  ADD KEY `INDEX_ID_PAGEID` (`ID`,`PAGE_ID`),
  ADD KEY `INDEX_REQUEST_PAGEID` (`PAGE_ID`),
  ADD KEY `INDEX_REQUEST_JOBID` (`JOB_ID`),
  ADD KEY `INDEX_REQUEST_BATCHID` (`BATCH_ID`),
  ADD KEY `IDX_REQUEST_L10NID_JOB` (`L10N_PROFILE_ID`,`JOB_ID`);

--
-- Indexes for table `reserved_time`
--
ALTER TABLE `reserved_time`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_RESERVED_TIME_TASK_ID` (`TASK_ID`),
  ADD KEY `IDX_RESERVED_TIME` (`USER_CALENDAR_ID`,`TASK_ID`,`START_TIME`,`END_TIME`);

--
-- Indexes for table `rss_feed`
--
ALTER TABLE `rss_feed`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IDX_RSS_URL` (`RSS_URL`,`COMPANY_ID`);

--
-- Indexes for table `rss_item`
--
ALTER TABLE `rss_item`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_RSS_ITEM_FEED_ID` (`FEED_ID`);

--
-- Indexes for table `scorecard_score`
--
ALTER TABLE `scorecard_score`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_SCORE_WORKFLOW` (`WORKFLOW_ID`),
  ADD KEY `FK_SCORE_COMPANY` (`COMPANY_ID`);

--
-- Indexes for table `secondary_target_file`
--
ALTER TABLE `secondary_target_file`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_SECONDARY_TARGET_FILE_WORKFLOW_ID` (`WORKFLOW_ID`);

--
-- Indexes for table `segmentation_rule`
--
ALTER TABLE `segmentation_rule`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_SEGMENTATIN_RULE_CASCADE` (`COMPANY_ID`);

--
-- Indexes for table `segmentation_rule_tm_profile`
--
ALTER TABLE `segmentation_rule_tm_profile`
  ADD PRIMARY KEY (`TM_PROFILE_ID`,`SEGMENTATION_RULE_ID`),
  ADD KEY `FK_SEGMENTATION_RULE_TM_PROFILE_TM_PROFILE_ID` (`SEGMENTATION_RULE_ID`);

--
-- Indexes for table `select_option`
--
ALTER TABLE `select_option`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sequence`
--
ALTER TABLE `sequence`
  ADD PRIMARY KEY (`NAME`);

--
-- Indexes for table `source_page`
--
ALTER TABLE `source_page`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_SOURCE_PAGE_PREVIOUS_PAGE_ID` (`PREVIOUS_PAGE_ID`),
  ADD KEY `FK_SOURCE_COMPANY_ID` (`COMPANY_ID`),
  ADD KEY `INDEX_ID_DST` (`ID`,`DATA_SOURCE_TYPE`),
  ADD KEY `INDEX_ID_TS_EPID` (`ID`,`TIMESTAMP`,`EXTERNAL_PAGE_ID`),
  ADD KEY `INDEX_EPID` (`EXTERNAL_PAGE_ID`);

--
-- Indexes for table `source_page_leverage_group`
--
ALTER TABLE `source_page_leverage_group`
  ADD PRIMARY KEY (`LG_ID`,`SP_ID`),
  ADD KEY `IDX_SPLG_SP_LG` (`SP_ID`,`LG_ID`);

--
-- Indexes for table `sso_user_mapping`
--
ALTER TABLE `sso_user_mapping`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `surcharge`
--
ALTER TABLE `surcharge`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_SURCHARGE_CURRENCY_CONV_ID` (`CURRENCY_CONV_ID`),
  ADD KEY `FK_SURCHARGE_COST_ID` (`COST_ID`);

--
-- Indexes for table `system_log`
--
ALTER TABLE `system_log`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `system_parameter`
--
ALTER TABLE `system_parameter`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `NAME` (`NAME`,`COMPANY_ID`),
  ADD KEY `FK_SYSTEM_PARAMETER_COMPANY_ID` (`COMPANY_ID`);

--
-- Indexes for table `target_page`
--
ALTER TABLE `target_page`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_TARGET_PAGE_WORKFLOW_IFLOW_INSTANCE_ID` (`WORKFLOW_IFLOW_INSTANCE_ID`),
  ADD KEY `INDEX_SPID_WFID` (`SOURCE_PAGE_ID`,`WORKFLOW_IFLOW_INSTANCE_ID`);

--
-- Indexes for table `target_page_leverage_group`
--
ALTER TABLE `target_page_leverage_group`
  ADD PRIMARY KEY (`LG_ID`,`TP_ID`),
  ADD KEY `IDX_TPLG_TP_LG` (`TP_ID`,`LG_ID`);

--
-- Indexes for table `task_info`
--
ALTER TABLE `task_info`
  ADD PRIMARY KEY (`TASK_ID`),
  ADD KEY `FK_TASK_INFO_EXPENSE_RATE_ID` (`EXPENSE_RATE_ID`),
  ADD KEY `FK_TASK_INFO_REVENUE_RATE_ID` (`REVENUE_RATE_ID`),
  ADD KEY `FK_TASK_INFO_COMPANY_ID` (`COMPANY_ID`),
  ADD KEY `INDEX_WORKFLOW_ID` (`WORKFLOW_ID`),
  ADD KEY `IDX_TASK_INFO_WORKFLOW_ID` (`WORKFLOW_ID`);

--
-- Indexes for table `task_interim`
--
ALTER TABLE `task_interim`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `INDEX_TASK_ID` (`TASK_ID`),
  ADD KEY `INDEX_USER_ID_STATE` (`USER_ID`,`STATE`);

--
-- Indexes for table `task_tuv`
--
ALTER TABLE `task_tuv`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_TASK_TUV_TASK_ID` (`TASK_ID`),
  ADD KEY `INDEX_CTUVID` (`CURRENT_TUV_ID`),
  ADD KEY `IDX_TASK_TUV_PREV_TUVID` (`PREVIOUS_TUV_ID`);

--
-- Indexes for table `tb_concept`
--
ALTER TABLE `tb_concept`
  ADD PRIMARY KEY (`CID`),
  ADD KEY `IDX_CONCEPT_TBID_CID` (`TBID`,`CID`);

--
-- Indexes for table `tb_language`
--
ALTER TABLE `tb_language`
  ADD PRIMARY KEY (`LID`),
  ADD KEY `IDX_LANGUAGE_TBID_CID_LID` (`TBID`,`CID`,`LID`),
  ADD KEY `IDX_LANGUAGE_CID` (`CID`);

--
-- Indexes for table `tb_lock`
--
ALTER TABLE `tb_lock`
  ADD PRIMARY KEY (`TBid`,`Cid`);

--
-- Indexes for table `tb_scheduled_jobs`
--
ALTER TABLE `tb_scheduled_jobs`
  ADD PRIMARY KEY (`TBid`,`TYPE`);

--
-- Indexes for table `tb_sequence`
--
ALTER TABLE `tb_sequence`
  ADD PRIMARY KEY (`NAME`);

--
-- Indexes for table `tb_term`
--
ALTER TABLE `tb_term`
  ADD PRIMARY KEY (`TID`),
  ADD KEY `IDX_TERM_TBID_CID_LID` (`TBID`,`CID`,`LID`),
  ADD KEY `IDX_TERM_LID` (`LID`),
  ADD KEY `IDX_TERM_CID` (`CID`);

--
-- Indexes for table `tb_termbase`
--
ALTER TABLE `tb_termbase`
  ADD PRIMARY KEY (`TBID`),
  ADD KEY `FK_TERMBASE_COMPANYID` (`COMPANYID`);

--
-- Indexes for table `tb_user_data`
--
ALTER TABLE `tb_user_data`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_TB_USER_DATA_TYPE_USERNAME` (`TBID`,`TYPE`,`USERNAME`);

--
-- Indexes for table `template`
--
ALTER TABLE `template`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_TEMPLATE_SP_TYPE_ID` (`SOURCE_PAGE_ID`,`TYPE`,`ID`);

--
-- Indexes for table `template_format`
--
ALTER TABLE `template_format`
  ADD PRIMARY KEY (`NAME`,`TEMPLATE_TYPE`,`SOURCE_TYPE`);

--
-- Indexes for table `template_part`
--
ALTER TABLE `template_part`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_TU_ID` (`TU_ID`),
  ADD KEY `IDX_TEMPLATEPART_TEMPID` (`TEMPLATE_ID`);

--
-- Indexes for table `template_part_archived`
--
ALTER TABLE `template_part_archived`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_TU_ID` (`TU_ID`),
  ADD KEY `IDX_TEMPLATE_PART_ARCHIVED_TEMPID` (`TEMPLATE_ID`);

--
-- Indexes for table `term_leverage_match`
--
ALTER TABLE `term_leverage_match`
  ADD KEY `INDEX_SOURCE_TUV_ID` (`SOURCE_TUV_ID`);

--
-- Indexes for table `tm3_attr`
--
ALTER TABLE `tm3_attr`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tmId` (`tmId`,`name`);

--
-- Indexes for table `tm3_id`
--
ALTER TABLE `tm3_id`
  ADD PRIMARY KEY (`tableName`);

--
-- Indexes for table `tm3_tm`
--
ALTER TABLE `tm3_tm`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sharedStorageId` (`sharedStorageId`);

--
-- Indexes for table `tm_profile`
--
ALTER TABLE `tm_profile`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_TM_PROFILE_PROJECT_TM_ID_FOR_SAVE` (`PROJECT_TM_ID_FOR_SAVE`);

--
-- Indexes for table `tm_profile_attribute`
--
ALTER TABLE `tm_profile_attribute`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_TM_PROFILE_ATTRIBUTE_TMP_ID` (`TMP_ID`);

--
-- Indexes for table `tm_profile_project_tm_info`
--
ALTER TABLE `tm_profile_project_tm_info`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_TM_PROFILE_PROJECT_TM_INFO_TM_PROFILE_ID` (`TM_PROFILE_ID`),
  ADD KEY `FK_TM_PROFILE_PROJECT_TM_INFO_PROJECT_TM_ID` (`PROJECT_TM_ID`);

--
-- Indexes for table `tm_tb_users`
--
ALTER TABLE `tm_tb_users`
  ADD PRIMARY KEY (`TM_TB_ID`,`USER_ID`,`T_TYPE`);

--
-- Indexes for table `translation_tu_tuv_attr_1`
--
ALTER TABLE `translation_tu_tuv_attr_1`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_OBJECT_ID_TYPE` (`OBJECT_ID`,`OBJECT_TYPE`,`NAME`);

--
-- Indexes for table `translation_unit_1`
--
ALTER TABLE `translation_unit_1`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `INDEX_ID_LG` (`ID`,`LEVERAGE_GROUP_ID`),
  ADD KEY `IDX_TU_LG_ID_ORDER` (`LEVERAGE_GROUP_ID`,`ID`,`ORDER_NUM`),
  ADD KEY `INDEX_IDLT_TU_TM` (`ID`,`LOCALIZE_TYPE`,`TU_TYPE`,`TM_ID`),
  ADD KEY `IDX_TU_TYPE_ID` (`TU_TYPE`,`ID`);

--
-- Indexes for table `translation_unit_variant_1`
--
ALTER TABLE `translation_unit_variant_1`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IDX_TUV_ID_TU` (`ID`,`TU_ID`),
  ADD KEY `REPETITION_OF_ID` (`REPETITION_OF_ID`),
  ADD KEY `INDEX_ID_LOCALE_STATE` (`ID`,`LOCALE_ID`,`STATE`),
  ADD KEY `INDEX_TU_LOC_STATE` (`TU_ID`,`LOCALE_ID`,`STATE`),
  ADD KEY `IDX_TUV_EMKEY_LOC_TU` (`EXACT_MATCH_KEY`,`LOCALE_ID`,`TU_ID`),
  ADD KEY `INDEX_TUV_TUID_STATE` (`TU_ID`,`STATE`),
  ADD KEY `IDX_TUV_LOC_TU_ORDER_ID` (`LOCALE_ID`,`TU_ID`,`ORDER_NUM`,`ID`);

--
-- Indexes for table `translation_unit_variant_perplexity_1`
--
ALTER TABLE `translation_unit_variant_perplexity_1`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tu_concept_relation`
--
ALTER TABLE `tu_concept_relation`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `updated_source_page`
--
ALTER TABLE `updated_source_page`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_USER_JOB_USER_ID` (`USER_ID`),
  ADD KEY `IDX_USER_JOB_USER_NAME` (`USER_NAME`);

--
-- Indexes for table `user_calendar`
--
ALTER TABLE `user_calendar`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `OWNER_USER_ID` (`OWNER_USER_ID`),
  ADD KEY `FK_USER_CALENDAR_CALENDAR_ID` (`CALENDAR_ID`);

--
-- Indexes for table `user_calendar_working_day`
--
ALTER TABLE `user_calendar_working_day`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_USER_CALENDAR_WORKING_DAY_CALENDAR_ID` (`CALENDAR_ID`);

--
-- Indexes for table `user_calendar_working_hour`
--
ALTER TABLE `user_calendar_working_hour`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_USER_CALENDAR_WORKING_HOUR_USER_CALENDAR_WORKING_DAY_ID` (`USER_CALENDAR_WORKING_DAY_ID`);

--
-- Indexes for table `user_default_activities`
--
ALTER TABLE `user_default_activities`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_DEFAULT_ACTIVITIES` (`DEFAULT_ROLE_ID`);

--
-- Indexes for table `user_default_roles`
--
ALTER TABLE `user_default_roles`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_LOCALE_PAIR_SOURCE_LOCALE` (`SOURCE_LOCALE`),
  ADD KEY `FK_LOCALE_PAIR_TARGET_LOCALE` (`TARGET_LOCALE`);

--
-- Indexes for table `user_field_security`
--
ALTER TABLE `user_field_security`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `USER_ID` (`USER_ID`);

--
-- Indexes for table `user_id_user_name`
--
ALTER TABLE `user_id_user_name`
  ADD PRIMARY KEY (`USER_ID`);

--
-- Indexes for table `user_parameter`
--
ALTER TABLE `user_parameter`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `USER_ID` (`USER_ID`,`NAME`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_USER_ROLE_NAME` (`NAME`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `CUSTOM_VENDOR_ID` (`CUSTOM_VENDOR_ID`),
  ADD UNIQUE KEY `PSEUDONYM` (`PSEUDONYM`),
  ADD KEY `INDEX_USER_ID` (`USER_ID`),
  ADD KEY `INDEX_COMPANY` (`COMPANY`),
  ADD KEY `INDEX_FIRST_NAME` (`FIRST_NAME`),
  ADD KEY `INDEX_LAST_NAME` (`LAST_NAME`);

--
-- Indexes for table `vendor_communication`
--
ALTER TABLE `vendor_communication`
  ADD PRIMARY KEY (`VENDOR_ID`,`COMMUNICATION_TYPE`);

--
-- Indexes for table `vendor_custom_field`
--
ALTER TABLE `vendor_custom_field`
  ADD PRIMARY KEY (`VENDOR_ID`,`CUSTOM_FIELD_ID`);

--
-- Indexes for table `vendor_field_security`
--
ALTER TABLE `vendor_field_security`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `VENDOR_ID` (`VENDOR_ID`);

--
-- Indexes for table `vendor_rating`
--
ALTER TABLE `vendor_rating`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `INDEX_RATING_VENDOR_ID` (`VENDOR_ID`),
  ADD KEY `INDEX_TASK_ID` (`TASK_ID`);

--
-- Indexes for table `vendor_role`
--
ALTER TABLE `vendor_role`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `INDEX_ROLE_VENDOR_ID` (`VENDOR_ID`),
  ADD KEY `INDEX_LOCALE_ID` (`LOCALE_PAIR_ID`),
  ADD KEY `INDEX_ACTIVITY_ID` (`ACTIVITY_ID`),
  ADD KEY `INDEX_RATE_ID` (`RATE_ID`);

--
-- Indexes for table `wf_template_wf_manager`
--
ALTER TABLE `wf_template_wf_manager`
  ADD PRIMARY KEY (`WORKFLOW_TEMPLATE_ID`,`WORKFLOW_MANAGER_ID`);

--
-- Indexes for table `workflow`
--
ALTER TABLE `workflow`
  ADD PRIMARY KEY (`IFLOW_INSTANCE_ID`),
  ADD KEY `FK_WORKFLOW_TARGET_LOCALE_ID` (`TARGET_LOCALE_ID`),
  ADD KEY `FK_WORKFLOW_COMPANY_ID` (`COMPANY_ID`),
  ADD KEY `INDEX_WFIDSTATE` (`IFLOW_INSTANCE_ID`,`STATE`),
  ADD KEY `INDEX_WFIDTLID` (`IFLOW_INSTANCE_ID`,`TARGET_LOCALE_ID`),
  ADD KEY `IDX_WORKFLOW_JOB` (`JOB_ID`),
  ADD KEY `IDX_WORKFLOW_STATE_JOB` (`STATE`,`JOB_ID`);

--
-- Indexes for table `workflow_exporting`
--
ALTER TABLE `workflow_exporting`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `workflow_owner`
--
ALTER TABLE `workflow_owner`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `INDEX_WFID` (`WORKFLOW_ID`);

--
-- Indexes for table `workflow_request`
--
ALTER TABLE `workflow_request`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_WORKFLOW_REQUEST_JOB_ID` (`JOB_ID`);

--
-- Indexes for table `workflow_request_wftemplate`
--
ALTER TABLE `workflow_request_wftemplate`
  ADD PRIMARY KEY (`WORKFLOW_REQUEST_ID`,`WORKFLOW_TEMPLATE_ID`),
  ADD KEY `FK_WORKFLOW_REQUEST_WFTEMPLATE_WORKFLOW_TEMPLATE_ID` (`WORKFLOW_TEMPLATE_ID`);

--
-- Indexes for table `workflow_state_posts`
--
ALTER TABLE `workflow_state_posts`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `workflow_template`
--
ALTER TABLE `workflow_template`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_WORKFLOW_TEMPLATE_PROJECT_ID` (`PROJECT_ID`),
  ADD KEY `FK_WORKFLOW_TEMPLATE_SOURCE_LOCALE_ID` (`SOURCE_LOCALE_ID`),
  ADD KEY `FK_WORKFLOW_TEMPLATE_TARGET_LOCALE_ID` (`TARGET_LOCALE_ID`),
  ADD KEY `FK_WORKFLOW_TEMPLATE_COMPANYID` (`COMPANYID`);

--
-- Indexes for table `xliff_alt`
--
ALTER TABLE `xliff_alt`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `INDEX_TUV_ID` (`TUV_ID`);

--
-- Indexes for table `xml_dtd`
--
ALTER TABLE `xml_dtd`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_XML_DTD_CASCADE_COMPANY_ID` (`COMPANY_ID`);

--
-- Indexes for table `xml_rule`
--
ALTER TABLE `xml_rule`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `NAME` (`NAME`,`COMPANY_ID`),
  ADD KEY `FK_XML_RULE_CASCADE_COMPANY_ID` (`COMPANY_ID`);

--
-- Indexes for table `xml_rule_filter`
--
ALTER TABLE `xml_rule_filter`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `adding_source_page`
--
ALTER TABLE `adding_source_page`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `amount_of_work`
--
ALTER TABLE `amount_of_work`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `attribute`
--
ALTER TABLE `attribute`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1002;

--
-- AUTO_INCREMENT for table `attribute_clone`
--
ALTER TABLE `attribute_clone`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `attribute_condition_date`
--
ALTER TABLE `attribute_condition_date`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `attribute_condition_file`
--
ALTER TABLE `attribute_condition_file`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `attribute_condition_float`
--
ALTER TABLE `attribute_condition_float`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `attribute_condition_int`
--
ALTER TABLE `attribute_condition_int`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `attribute_condition_list`
--
ALTER TABLE `attribute_condition_list`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001;

--
-- AUTO_INCREMENT for table `attribute_condition_text`
--
ALTER TABLE `attribute_condition_text`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001;

--
-- AUTO_INCREMENT for table `attribute_set`
--
ALTER TABLE `attribute_set`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `base_filter`
--
ALTER TABLE `base_filter`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `base_filter_mapping`
--
ALTER TABLE `base_filter_mapping`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `calendar`
--
ALTER TABLE `calendar`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `calendar_working_day`
--
ALTER TABLE `calendar_working_day`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `calendar_working_hour`
--
ALTER TABLE `calendar_working_hour`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_post_review`
--
ALTER TABLE `category_post_review`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_scorecard`
--
ALTER TABLE `category_scorecard`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_segment_comment`
--
ALTER TABLE `category_segment_comment`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `connector_blaise`
--
ALTER TABLE `connector_blaise`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `connector_blaise_job`
--
ALTER TABLE `connector_blaise_job`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `connector_coti_document`
--
ALTER TABLE `connector_coti_document`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `connector_coti_package`
--
ALTER TABLE `connector_coti_package`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `connector_coti_project`
--
ALTER TABLE `connector_coti_project`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `connector_eloqua`
--
ALTER TABLE `connector_eloqua`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `connector_git`
--
ALTER TABLE `connector_git`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `connector_git_cache_file`
--
ALTER TABLE `connector_git_cache_file`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `connector_git_file_mapping`
--
ALTER TABLE `connector_git_file_mapping`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `connector_git_job`
--
ALTER TABLE `connector_git_job`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `container_role`
--
ALTER TABLE `container_role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `cost`
--
ALTER TABLE `cost`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `cost_by_word_count`
--
ALTER TABLE `cost_by_word_count`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `currency_conversion`
--
ALTER TABLE `currency_conversion`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001;

--
-- AUTO_INCREMENT for table `custom_field`
--
ALTER TABLE `custom_field`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `custom_form`
--
ALTER TABLE `custom_form`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `cvs_file_profile`
--
ALTER TABLE `cvs_file_profile`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cvs_module`
--
ALTER TABLE `cvs_module`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cvs_repository`
--
ALTER TABLE `cvs_repository`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cvs_server`
--
ALTER TABLE `cvs_server`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cvs_server_user`
--
ALTER TABLE `cvs_server_user`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cvs_source_files`
--
ALTER TABLE `cvs_source_files`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exporting_page`
--
ALTER TABLE `exporting_page`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `export_batch_event`
--
ALTER TABLE `export_batch_event`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `export_location`
--
ALTER TABLE `export_location`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `extension`
--
ALTER TABLE `extension`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `file_profile`
--
ALTER TABLE `file_profile`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `file_value_item`
--
ALTER TABLE `file_value_item`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `filter_configuration`
--
ALTER TABLE `filter_configuration`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `filter_json`
--
ALTER TABLE `filter_json`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `frame_maker_filter`
--
ALTER TABLE `frame_maker_filter`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holiday`
--
ALTER TABLE `holiday`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `html_filter`
--
ALTER TABLE `html_filter`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `image_replace_file_map`
--
ALTER TABLE `image_replace_file_map`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `indd_filter`
--
ALTER TABLE `indd_filter`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `indd_tu_mapping`
--
ALTER TABLE `indd_tu_mapping`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ip_tm_src_l`
--
ALTER TABLE `ip_tm_src_l`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `ip_tm_src_t`
--
ALTER TABLE `ip_tm_src_t`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `ip_tm_trg_l`
--
ALTER TABLE `ip_tm_trg_l`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `ip_tm_trg_t`
--
ALTER TABLE `ip_tm_trg_t`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `issue`
--
ALTER TABLE `issue`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `issue_history`
--
ALTER TABLE `issue_history`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `java_properties_filter`
--
ALTER TABLE `java_properties_filter`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `java_script_filter`
--
ALTER TABLE `java_script_filter`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jbpm_action`
--
ALTER TABLE `jbpm_action`
  MODIFY `ID_` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jbpm_bytearray`
--
ALTER TABLE `jbpm_bytearray`
  MODIFY `ID_` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jbpm_comment`
--
ALTER TABLE `jbpm_comment`
  MODIFY `ID_` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jbpm_delegation`
--
ALTER TABLE `jbpm_delegation`
  MODIFY `ID_` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jbpm_event`
--
ALTER TABLE `jbpm_event`
  MODIFY `ID_` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jbpm_exceptionhandler`
--
ALTER TABLE `jbpm_exceptionhandler`
  MODIFY `ID_` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jbpm_gs_variable`
--
ALTER TABLE `jbpm_gs_variable`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jbpm_id_group`
--
ALTER TABLE `jbpm_id_group`
  MODIFY `ID_` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jbpm_id_membership`
--
ALTER TABLE `jbpm_id_membership`
  MODIFY `ID_` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jbpm_id_user`
--
ALTER TABLE `jbpm_id_user`
  MODIFY `ID_` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jbpm_log`
--
ALTER TABLE `jbpm_log`
  MODIFY `ID_` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jbpm_message`
--
ALTER TABLE `jbpm_message`
  MODIFY `ID_` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jbpm_moduledefinition`
--
ALTER TABLE `jbpm_moduledefinition`
  MODIFY `ID_` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jbpm_moduleinstance`
--
ALTER TABLE `jbpm_moduleinstance`
  MODIFY `ID_` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jbpm_node`
--
ALTER TABLE `jbpm_node`
  MODIFY `ID_` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jbpm_pooledactor`
--
ALTER TABLE `jbpm_pooledactor`
  MODIFY `ID_` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jbpm_processdefinition`
--
ALTER TABLE `jbpm_processdefinition`
  MODIFY `ID_` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jbpm_processinstance`
--
ALTER TABLE `jbpm_processinstance`
  MODIFY `ID_` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jbpm_runtimeaction`
--
ALTER TABLE `jbpm_runtimeaction`
  MODIFY `ID_` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jbpm_swimlane`
--
ALTER TABLE `jbpm_swimlane`
  MODIFY `ID_` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jbpm_swimlaneinstance`
--
ALTER TABLE `jbpm_swimlaneinstance`
  MODIFY `ID_` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jbpm_task`
--
ALTER TABLE `jbpm_task`
  MODIFY `ID_` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jbpm_taskcontroller`
--
ALTER TABLE `jbpm_taskcontroller`
  MODIFY `ID_` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jbpm_taskinstance`
--
ALTER TABLE `jbpm_taskinstance`
  MODIFY `ID_` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jbpm_timer`
--
ALTER TABLE `jbpm_timer`
  MODIFY `ID_` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jbpm_token`
--
ALTER TABLE `jbpm_token`
  MODIFY `ID_` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jbpm_tokenvariablemap`
--
ALTER TABLE `jbpm_tokenvariablemap`
  MODIFY `ID_` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jbpm_transition`
--
ALTER TABLE `jbpm_transition`
  MODIFY `ID_` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jbpm_variableaccess`
--
ALTER TABLE `jbpm_variableaccess`
  MODIFY `ID_` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jbpm_variableinstance`
--
ALTER TABLE `jbpm_variableinstance`
  MODIFY `ID_` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `job_attribute`
--
ALTER TABLE `job_attribute`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `job_group`
--
ALTER TABLE `job_group`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jsp_filter`
--
ALTER TABLE `jsp_filter`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `known_format_type`
--
ALTER TABLE `known_format_type`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `l10n_profile`
--
ALTER TABLE `l10n_profile`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `l10n_profile_version`
--
ALTER TABLE `l10n_profile_version`
  MODIFY `VERSION_SEQ` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `leverage_group`
--
ALTER TABLE `leverage_group`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001;

--
-- AUTO_INCREMENT for table `leverage_match_attr_1`
--
ALTER TABLE `leverage_match_attr_1`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locale`
--
ALTER TABLE `locale`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `locale_pair`
--
ALTER TABLE `locale_pair`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `login_attempt`
--
ALTER TABLE `login_attempt`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `login_attempt_config`
--
ALTER TABLE `login_attempt_config`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001;

--
-- AUTO_INCREMENT for table `module_mapping`
--
ALTER TABLE `module_mapping`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `module_mapping_di`
--
ALTER TABLE `module_mapping_di`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `module_rename`
--
ALTER TABLE `module_rename`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `module_rename_di`
--
ALTER TABLE `module_rename_di`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ms_office_doc_filter`
--
ALTER TABLE `ms_office_doc_filter`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ms_office_excel_filter`
--
ALTER TABLE `ms_office_excel_filter`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ms_office_ppt_filter`
--
ALTER TABLE `ms_office_ppt_filter`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mt_profile`
--
ALTER TABLE `mt_profile`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `mt_profile_extent_info`
--
ALTER TABLE `mt_profile_extent_info`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `office2010_filter`
--
ALTER TABLE `office2010_filter`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `openoffice_filter`
--
ALTER TABLE `openoffice_filter`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `page_tm`
--
ALTER TABLE `page_tm`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `page_tm_tuv_l`
--
ALTER TABLE `page_tm_tuv_l`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `page_tm_tuv_t`
--
ALTER TABLE `page_tm_tuv_t`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `page_tm_tu_l`
--
ALTER TABLE `page_tm_tu_l`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `page_tm_tu_t`
--
ALTER TABLE `page_tm_tu_t`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `permissiongroup`
--
ALTER TABLE `permissiongroup`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `perplexity_service`
--
ALTER TABLE `perplexity_service`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plain_text_filter`
--
ALTER TABLE `plain_text_filter`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `po_filter`
--
ALTER TABLE `po_filter`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `PROJECT_SEQ` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `project_tm`
--
ALTER TABLE `project_tm`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `project_tm_attribute`
--
ALTER TABLE `project_tm_attribute`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `project_tm_tuv_l`
--
ALTER TABLE `project_tm_tuv_l`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `project_tm_tuv_t`
--
ALTER TABLE `project_tm_tuv_t`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `project_tm_tu_l`
--
ALTER TABLE `project_tm_tu_l`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `project_tm_tu_t`
--
ALTER TABLE `project_tm_tu_t`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `project_tm_tu_t_prop`
--
ALTER TABLE `project_tm_tu_t_prop`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `qa_filter`
--
ALTER TABLE `qa_filter`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rate`
--
ALTER TABLE `rate`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `remote_access_history`
--
ALTER TABLE `remote_access_history`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `remote_ip`
--
ALTER TABLE `remote_ip`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `removed_prefix_tag`
--
ALTER TABLE `removed_prefix_tag`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `removed_suffix_tag`
--
ALTER TABLE `removed_suffix_tag`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `removed_tag`
--
ALTER TABLE `removed_tag`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `reserved_time`
--
ALTER TABLE `reserved_time`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `rss_feed`
--
ALTER TABLE `rss_feed`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rss_item`
--
ALTER TABLE `rss_item`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `scorecard_score`
--
ALTER TABLE `scorecard_score`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `secondary_target_file`
--
ALTER TABLE `secondary_target_file`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `segmentation_rule`
--
ALTER TABLE `segmentation_rule`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `select_option`
--
ALTER TABLE `select_option`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1003;

--
-- AUTO_INCREMENT for table `source_page`
--
ALTER TABLE `source_page`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `sso_user_mapping`
--
ALTER TABLE `sso_user_mapping`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `surcharge`
--
ALTER TABLE `surcharge`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `system_log`
--
ALTER TABLE `system_log`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `system_parameter`
--
ALTER TABLE `system_parameter`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `target_page`
--
ALTER TABLE `target_page`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `task_interim`
--
ALTER TABLE `task_interim`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001;

--
-- AUTO_INCREMENT for table `task_tuv`
--
ALTER TABLE `task_tuv`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `tb_concept`
--
ALTER TABLE `tb_concept`
  MODIFY `CID` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_language`
--
ALTER TABLE `tb_language`
  MODIFY `LID` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_term`
--
ALTER TABLE `tb_term`
  MODIFY `TID` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_termbase`
--
ALTER TABLE `tb_termbase`
  MODIFY `TBID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `tb_user_data`
--
ALTER TABLE `tb_user_data`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `template`
--
ALTER TABLE `template`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `template_part`
--
ALTER TABLE `template_part`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `tm3_attr`
--
ALTER TABLE `tm3_attr`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tm3_tm`
--
ALTER TABLE `tm3_tm`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tm_profile`
--
ALTER TABLE `tm_profile`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `tm_profile_attribute`
--
ALTER TABLE `tm_profile_attribute`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `tm_profile_project_tm_info`
--
ALTER TABLE `tm_profile_project_tm_info`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `translation_tu_tuv_attr_1`
--
ALTER TABLE `translation_tu_tuv_attr_1`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translation_unit_variant_perplexity_1`
--
ALTER TABLE `translation_unit_variant_perplexity_1`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `tu_concept_relation`
--
ALTER TABLE `tu_concept_relation`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `updated_source_page`
--
ALTER TABLE `updated_source_page`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `user_calendar`
--
ALTER TABLE `user_calendar`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `user_calendar_working_day`
--
ALTER TABLE `user_calendar_working_day`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `user_calendar_working_hour`
--
ALTER TABLE `user_calendar_working_hour`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `user_default_activities`
--
ALTER TABLE `user_default_activities`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_default_roles`
--
ALTER TABLE `user_default_roles`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_field_security`
--
ALTER TABLE `user_field_security`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `user_parameter`
--
ALTER TABLE `user_parameter`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1060;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `vendor_field_security`
--
ALTER TABLE `vendor_field_security`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `vendor_rating`
--
ALTER TABLE `vendor_rating`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `vendor_role`
--
ALTER TABLE `vendor_role`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `workflow_exporting`
--
ALTER TABLE `workflow_exporting`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `workflow_owner`
--
ALTER TABLE `workflow_owner`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `workflow_request`
--
ALTER TABLE `workflow_request`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `workflow_state_posts`
--
ALTER TABLE `workflow_state_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workflow_template`
--
ALTER TABLE `workflow_template`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `xliff_alt`
--
ALTER TABLE `xliff_alt`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xml_dtd`
--
ALTER TABLE `xml_dtd`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `xml_rule`
--
ALTER TABLE `xml_rule`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `xml_rule_filter`
--
ALTER TABLE `xml_rule_filter`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity`
--
ALTER TABLE `activity`
  ADD CONSTRAINT `FK_ACTIVITY_COMPANY_ID` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`ID`);

--
-- Constraints for table `amount_of_work`
--
ALTER TABLE `amount_of_work`
  ADD CONSTRAINT `FK_AMOUNT_OF_WORK_TASK_ID` FOREIGN KEY (`TASK_ID`) REFERENCES `task_info` (`TASK_ID`);

--
-- Constraints for table `attribute`
--
ALTER TABLE `attribute`
  ADD CONSTRAINT `FK_ATTRIBUTE_COMPANYID` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`ID`);

--
-- Constraints for table `attribute_clone`
--
ALTER TABLE `attribute_clone`
  ADD CONSTRAINT `FK_ATTRIBUTE_CLONE_COMPANYID` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`ID`);

--
-- Constraints for table `attribute_set`
--
ALTER TABLE `attribute_set`
  ADD CONSTRAINT `FK_ATTRIBUTE_SET_COMPANYID` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`ID`);

--
-- Constraints for table `calendar`
--
ALTER TABLE `calendar`
  ADD CONSTRAINT `FK_CALENDAR_COMPANY_ID` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`ID`);

--
-- Constraints for table `calendar_holiday`
--
ALTER TABLE `calendar_holiday`
  ADD CONSTRAINT `FK_CALENDAR_HOLIDAY_CALENDAR_ID` FOREIGN KEY (`CALENDAR_ID`) REFERENCES `calendar` (`ID`),
  ADD CONSTRAINT `FK_CALENDAR_HOLIDAY_HOLIDAY_ID` FOREIGN KEY (`HOLIDAY_ID`) REFERENCES `holiday` (`ID`);

--
-- Constraints for table `calendar_working_day`
--
ALTER TABLE `calendar_working_day`
  ADD CONSTRAINT `FK_CALENDAR_WORKING_DAY_CALENDAR_ID` FOREIGN KEY (`CALENDAR_ID`) REFERENCES `calendar` (`ID`);

--
-- Constraints for table `calendar_working_hour`
--
ALTER TABLE `calendar_working_hour`
  ADD CONSTRAINT `FK_CALENDAR_WORKING_HOUR_CALENDAR_WORKING_DAY_ID` FOREIGN KEY (`CALENDAR_WORKING_DAY_ID`) REFERENCES `calendar_working_day` (`ID`);

--
-- Constraints for table `category_scorecard`
--
ALTER TABLE `category_scorecard`
  ADD CONSTRAINT `FK_SCORE_CARD_CATEGORY_COMPANY` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`ID`);

--
-- Constraints for table `category_segment_comment`
--
ALTER TABLE `category_segment_comment`
  ADD CONSTRAINT `FK_CATEGORY_COMPANY` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`ID`);

--
-- Constraints for table `cost`
--
ALTER TABLE `cost`
  ADD CONSTRAINT `FK_COST_CURRENCY_CONVERSION_ID` FOREIGN KEY (`CURRENCY_CONVERSION_ID`) REFERENCES `currency_conversion` (`ID`);

--
-- Constraints for table `cost_by_word_count`
--
ALTER TABLE `cost_by_word_count`
  ADD CONSTRAINT `FK_COST_BY_WORD_COUNT_COST_ID` FOREIGN KEY (`COST_ID`) REFERENCES `cost` (`ID`);

--
-- Constraints for table `currency_conversion`
--
ALTER TABLE `currency_conversion`
  ADD CONSTRAINT `FK_CURRENCY_CONVERSION_COMPANY_ID` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`ID`),
  ADD CONSTRAINT `FK_CURRENCY_CONVERSION_CURRENCY_ID` FOREIGN KEY (`CURRENCY_ID`) REFERENCES `currency` (`ID`);

--
-- Constraints for table `custom_form`
--
ALTER TABLE `custom_form`
  ADD CONSTRAINT `FK_CUSTOM_FORM_LOCALE_ID` FOREIGN KEY (`LOCALE_ID`) REFERENCES `locale` (`ID`);

--
-- Constraints for table `cvs_module`
--
ALTER TABLE `cvs_module`
  ADD CONSTRAINT `FK_MODULE_SERVER` FOREIGN KEY (`SERVER`) REFERENCES `cvs_server` (`ID`);

--
-- Constraints for table `cvs_repository`
--
ALTER TABLE `cvs_repository`
  ADD CONSTRAINT `FK_REPOSITORY_SERVER` FOREIGN KEY (`SERVER`) REFERENCES `cvs_server` (`ID`);

--
-- Constraints for table `cvs_server`
--
ALTER TABLE `cvs_server`
  ADD CONSTRAINT `FK_SERVER_COMPANY` FOREIGN KEY (`COMPANYID`) REFERENCES `company` (`ID`);

--
-- Constraints for table `cvs_server_user`
--
ALTER TABLE `cvs_server_user`
  ADD CONSTRAINT `FK_SERVER_USER` FOREIGN KEY (`SERVER`) REFERENCES `cvs_server` (`ID`);

--
-- Constraints for table `delayed_import_request`
--
ALTER TABLE `delayed_import_request`
  ADD CONSTRAINT `FK_DELAYED_IMPORT_REQUEST_ID` FOREIGN KEY (`ID`) REFERENCES `request` (`ID`),
  ADD CONSTRAINT `FK_DELAYED_IMPORT_REQUEST_PREVIOUS_PAGE_ID` FOREIGN KEY (`PREVIOUS_PAGE_ID`) REFERENCES `source_page` (`ID`);

--
-- Constraints for table `exportbatch_workflow`
--
ALTER TABLE `exportbatch_workflow`
  ADD CONSTRAINT `FK_EXPORTBATCH_WORKFLOW_EXPORT_BATCH_ID` FOREIGN KEY (`EXPORT_BATCH_ID`) REFERENCES `export_batch_event` (`ID`),
  ADD CONSTRAINT `FK_EXPORTBATCH_WORKFLOW_WORKFLOW_ID` FOREIGN KEY (`WORKFLOW_ID`) REFERENCES `workflow` (`IFLOW_INSTANCE_ID`);

--
-- Constraints for table `exporting_page`
--
ALTER TABLE `exporting_page`
  ADD CONSTRAINT `FK_EXPORTING_PAGE_EXPORT_BATCH_ID` FOREIGN KEY (`EXPORT_BATCH_ID`) REFERENCES `export_batch_event` (`ID`);

--
-- Constraints for table `export_batch_event`
--
ALTER TABLE `export_batch_event`
  ADD CONSTRAINT `FK_EXPORT_BATCH_EVENT_JOB_ID` FOREIGN KEY (`JOB_ID`) REFERENCES `job` (`ID`),
  ADD CONSTRAINT `FK_EXPORT_BATCH_EVENT_TASK_ID` FOREIGN KEY (`TASK_ID`) REFERENCES `task_info` (`TASK_ID`);

--
-- Constraints for table `export_location`
--
ALTER TABLE `export_location`
  ADD CONSTRAINT `FK_EXPORT_LOCATION_COMPANY_ID` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`ID`);

--
-- Constraints for table `extension`
--
ALTER TABLE `extension`
  ADD CONSTRAINT `FK_EXTENSION_COMPANY_ID` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`ID`);

--
-- Constraints for table `file_profile`
--
ALTER TABLE `file_profile`
  ADD CONSTRAINT `FK_FILE_PROFILE_CODE_SET` FOREIGN KEY (`CODE_SET`) REFERENCES `code_set` (`CODE_SET`),
  ADD CONSTRAINT `FK_FILE_PROFILE_KNOWN_FORMAT_ID` FOREIGN KEY (`KNOWN_FORMAT_TYPE_ID`) REFERENCES `known_format_type` (`ID`),
  ADD CONSTRAINT `FK_XML_RULE_COMPANY_ID` FOREIGN KEY (`COMPANYID`) REFERENCES `company` (`ID`);

--
-- Constraints for table `file_profile_extension`
--
ALTER TABLE `file_profile_extension`
  ADD CONSTRAINT `FK_FILE_PROFILE_EXTENSION_EXTENSION_ID` FOREIGN KEY (`EXTENSION_ID`) REFERENCES `extension` (`ID`),
  ADD CONSTRAINT `FK_FILE_PROFILE_EXTENSION_FILE_PROFILE_ID` FOREIGN KEY (`FILE_PROFILE_ID`) REFERENCES `file_profile` (`ID`);

--
-- Constraints for table `holiday`
--
ALTER TABLE `holiday`
  ADD CONSTRAINT `FK_HOLIDAY_COMPANY_ID` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`ID`);

--
-- Constraints for table `image_replace_file_map`
--
ALTER TABLE `image_replace_file_map`
  ADD CONSTRAINT `FK_IMAGE_REPLACE_FILE_MAP_TARGET_PAGE_ID` FOREIGN KEY (`TARGET_PAGE_ID`) REFERENCES `target_page` (`ID`);

--
-- Constraints for table `ip_tm_index`
--
ALTER TABLE `ip_tm_index`
  ADD CONSTRAINT `FK_IP_TM_JOB_ID` FOREIGN KEY (`JOB_ID`) REFERENCES `job` (`ID`),
  ADD CONSTRAINT `FK_IP_TM_LOCALE_ID` FOREIGN KEY (`LOCALE_ID`) REFERENCES `locale` (`ID`),
  ADD CONSTRAINT `FK_IP_TM_SRC_ID` FOREIGN KEY (`SRC_ID`) REFERENCES `ip_tm_src_t` (`ID`);

--
-- Constraints for table `ip_tm_src_l`
--
ALTER TABLE `ip_tm_src_l`
  ADD CONSTRAINT `FK_IP_TM_SRC_L_JOB` FOREIGN KEY (`JOB_ID`) REFERENCES `job` (`ID`),
  ADD CONSTRAINT `FK_IP_TM_SRC_L_LOCALE` FOREIGN KEY (`LOCALE_ID`) REFERENCES `locale` (`ID`);

--
-- Constraints for table `ip_tm_src_t`
--
ALTER TABLE `ip_tm_src_t`
  ADD CONSTRAINT `FK_IP_TM_SRC_T_JOB` FOREIGN KEY (`JOB_ID`) REFERENCES `job` (`ID`),
  ADD CONSTRAINT `FK_IP_TM_SRC_T_LOCALE` FOREIGN KEY (`LOCALE_ID`) REFERENCES `locale` (`ID`);

--
-- Constraints for table `ip_tm_trg_l`
--
ALTER TABLE `ip_tm_trg_l`
  ADD CONSTRAINT `FK_IP_TM_TRG_L_LOCALE_ID` FOREIGN KEY (`LOCALE_ID`) REFERENCES `locale` (`ID`),
  ADD CONSTRAINT `FK_IP_TM_TRG_L_SRC_ID` FOREIGN KEY (`SRC_ID`) REFERENCES `ip_tm_src_l` (`ID`);

--
-- Constraints for table `ip_tm_trg_t`
--
ALTER TABLE `ip_tm_trg_t`
  ADD CONSTRAINT `FK_IP_TM_TRG_T_LOCALE_ID` FOREIGN KEY (`LOCALE_ID`) REFERENCES `locale` (`ID`),
  ADD CONSTRAINT `FK_IP_TM_TRG_T_SRC_ID` FOREIGN KEY (`SRC_ID`) REFERENCES `ip_tm_src_t` (`ID`);

--
-- Constraints for table `issue_history`
--
ALTER TABLE `issue_history`
  ADD CONSTRAINT `FK_ISSUE_HISTORY_ISSUE_ID` FOREIGN KEY (`ISSUE_ID`) REFERENCES `issue` (`ID`);

--
-- Constraints for table `jbpm_action`
--
ALTER TABLE `jbpm_action`
  ADD CONSTRAINT `FK_ACTION_ACTNDEL` FOREIGN KEY (`ACTIONDELEGATION_`) REFERENCES `jbpm_delegation` (`ID_`),
  ADD CONSTRAINT `FK_ACTION_EVENT` FOREIGN KEY (`EVENT_`) REFERENCES `jbpm_event` (`ID_`),
  ADD CONSTRAINT `FK_ACTION_EXPTHDL` FOREIGN KEY (`EXCEPTIONHANDLER_`) REFERENCES `jbpm_exceptionhandler` (`ID_`),
  ADD CONSTRAINT `FK_ACTION_PROCDEF` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`),
  ADD CONSTRAINT `FK_ACTION_REFACT` FOREIGN KEY (`REFERENCEDACTION_`) REFERENCES `jbpm_action` (`ID_`),
  ADD CONSTRAINT `FK_CRTETIMERACT_TA` FOREIGN KEY (`TIMERACTION_`) REFERENCES `jbpm_action` (`ID_`);

--
-- Constraints for table `jbpm_bytearray`
--
ALTER TABLE `jbpm_bytearray`
  ADD CONSTRAINT `FK_BYTEARR_FILDEF` FOREIGN KEY (`FILEDEFINITION_`) REFERENCES `jbpm_moduledefinition` (`ID_`);

--
-- Constraints for table `jbpm_byteblock`
--
ALTER TABLE `jbpm_byteblock`
  ADD CONSTRAINT `FK_BYTEBLOCK_FILE` FOREIGN KEY (`PROCESSFILE_`) REFERENCES `jbpm_bytearray` (`ID_`);

--
-- Constraints for table `jbpm_comment`
--
ALTER TABLE `jbpm_comment`
  ADD CONSTRAINT `FK_COMMENT_TOKEN` FOREIGN KEY (`TOKEN_`) REFERENCES `jbpm_token` (`ID_`),
  ADD CONSTRAINT `FK_COMMENT_TSK` FOREIGN KEY (`TASKINSTANCE_`) REFERENCES `jbpm_taskinstance` (`ID_`);

--
-- Constraints for table `jbpm_decisionconditions`
--
ALTER TABLE `jbpm_decisionconditions`
  ADD CONSTRAINT `FK_DECCOND_DEC` FOREIGN KEY (`DECISION_`) REFERENCES `jbpm_node` (`ID_`);

--
-- Constraints for table `jbpm_delegation`
--
ALTER TABLE `jbpm_delegation`
  ADD CONSTRAINT `FK_DELEGATION_PRCD` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`);

--
-- Constraints for table `jbpm_event`
--
ALTER TABLE `jbpm_event`
  ADD CONSTRAINT `FK_EVENT_NODE` FOREIGN KEY (`NODE_`) REFERENCES `jbpm_node` (`ID_`),
  ADD CONSTRAINT `FK_EVENT_PROCDEF` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`),
  ADD CONSTRAINT `FK_EVENT_TASK` FOREIGN KEY (`TASK_`) REFERENCES `jbpm_task` (`ID_`),
  ADD CONSTRAINT `FK_EVENT_TRANS` FOREIGN KEY (`TRANSITION_`) REFERENCES `jbpm_transition` (`ID_`);

--
-- Constraints for table `jbpm_gs_variable`
--
ALTER TABLE `jbpm_gs_variable`
  ADD CONSTRAINT `FK_GS_TASKINSTANCE` FOREIGN KEY (`TASKINSTANCE_ID`) REFERENCES `jbpm_taskinstance` (`ID_`);

--
-- Constraints for table `jbpm_id_group`
--
ALTER TABLE `jbpm_id_group`
  ADD CONSTRAINT `FK_ID_GRP_PARENT` FOREIGN KEY (`PARENT_`) REFERENCES `jbpm_id_group` (`ID_`);

--
-- Constraints for table `jbpm_id_membership`
--
ALTER TABLE `jbpm_id_membership`
  ADD CONSTRAINT `FK_ID_MEMSHIP_GRP` FOREIGN KEY (`GROUP_`) REFERENCES `jbpm_id_group` (`ID_`),
  ADD CONSTRAINT `FK_ID_MEMSHIP_USR` FOREIGN KEY (`USER_`) REFERENCES `jbpm_id_user` (`ID_`);

--
-- Constraints for table `jbpm_log`
--
ALTER TABLE `jbpm_log`
  ADD CONSTRAINT `FK_LOG_ACTION` FOREIGN KEY (`ACTION_`) REFERENCES `jbpm_action` (`ID_`),
  ADD CONSTRAINT `FK_LOG_CHILDTOKEN` FOREIGN KEY (`CHILD_`) REFERENCES `jbpm_token` (`ID_`),
  ADD CONSTRAINT `FK_LOG_DESTNODE` FOREIGN KEY (`DESTINATIONNODE_`) REFERENCES `jbpm_node` (`ID_`),
  ADD CONSTRAINT `FK_LOG_NEWBYTES` FOREIGN KEY (`NEWBYTEARRAY_`) REFERENCES `jbpm_bytearray` (`ID_`),
  ADD CONSTRAINT `FK_LOG_NODE` FOREIGN KEY (`NODE_`) REFERENCES `jbpm_node` (`ID_`),
  ADD CONSTRAINT `FK_LOG_OLDBYTES` FOREIGN KEY (`OLDBYTEARRAY_`) REFERENCES `jbpm_bytearray` (`ID_`),
  ADD CONSTRAINT `FK_LOG_PARENT` FOREIGN KEY (`PARENT_`) REFERENCES `jbpm_log` (`ID_`),
  ADD CONSTRAINT `FK_LOG_SOURCENODE` FOREIGN KEY (`SOURCENODE_`) REFERENCES `jbpm_node` (`ID_`),
  ADD CONSTRAINT `FK_LOG_SWIMINST` FOREIGN KEY (`SWIMLANEINSTANCE_`) REFERENCES `jbpm_swimlaneinstance` (`ID_`),
  ADD CONSTRAINT `FK_LOG_TASKINST` FOREIGN KEY (`TASKINSTANCE_`) REFERENCES `jbpm_taskinstance` (`ID_`),
  ADD CONSTRAINT `FK_LOG_TOKEN` FOREIGN KEY (`TOKEN_`) REFERENCES `jbpm_token` (`ID_`),
  ADD CONSTRAINT `FK_LOG_TRANSITION` FOREIGN KEY (`TRANSITION_`) REFERENCES `jbpm_transition` (`ID_`),
  ADD CONSTRAINT `FK_LOG_VARINST` FOREIGN KEY (`VARIABLEINSTANCE_`) REFERENCES `jbpm_variableinstance` (`ID_`);

--
-- Constraints for table `jbpm_message`
--
ALTER TABLE `jbpm_message`
  ADD CONSTRAINT `FK_CMD_ACTION` FOREIGN KEY (`ACTION_`) REFERENCES `jbpm_action` (`ID_`),
  ADD CONSTRAINT `FK_CMD_NODE` FOREIGN KEY (`NODE_`) REFERENCES `jbpm_node` (`ID_`),
  ADD CONSTRAINT `FK_CMD_TASKINST` FOREIGN KEY (`TASKINSTANCE_`) REFERENCES `jbpm_taskinstance` (`ID_`),
  ADD CONSTRAINT `FK_MSG_TOKEN` FOREIGN KEY (`TOKEN_`) REFERENCES `jbpm_token` (`ID_`);

--
-- Constraints for table `jbpm_moduledefinition`
--
ALTER TABLE `jbpm_moduledefinition`
  ADD CONSTRAINT `FK_MODDEF_PROCDEF` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`),
  ADD CONSTRAINT `FK_TSKDEF_START` FOREIGN KEY (`STARTTASK_`) REFERENCES `jbpm_task` (`ID_`);

--
-- Constraints for table `jbpm_moduleinstance`
--
ALTER TABLE `jbpm_moduleinstance`
  ADD CONSTRAINT `FK_MODINST_PRCINST` FOREIGN KEY (`PROCESSINSTANCE_`) REFERENCES `jbpm_processinstance` (`ID_`),
  ADD CONSTRAINT `FK_TASKMGTINST_TMD` FOREIGN KEY (`TASKMGMTDEFINITION_`) REFERENCES `jbpm_moduledefinition` (`ID_`);

--
-- Constraints for table `jbpm_node`
--
ALTER TABLE `jbpm_node`
  ADD CONSTRAINT `FK_DECISION_DELEG` FOREIGN KEY (`DECISIONDELEGATION`) REFERENCES `jbpm_delegation` (`ID_`),
  ADD CONSTRAINT `FK_NODE_ACTION` FOREIGN KEY (`ACTION_`) REFERENCES `jbpm_action` (`ID_`),
  ADD CONSTRAINT `FK_NODE_PROCDEF` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`),
  ADD CONSTRAINT `FK_NODE_SUPERSTATE` FOREIGN KEY (`SUPERSTATE_`) REFERENCES `jbpm_node` (`ID_`),
  ADD CONSTRAINT `FK_PROCST_SBPRCDEF` FOREIGN KEY (`SUBPROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`);

--
-- Constraints for table `jbpm_pooledactor`
--
ALTER TABLE `jbpm_pooledactor`
  ADD CONSTRAINT `FK_POOLEDACTOR_SLI` FOREIGN KEY (`SWIMLANEINSTANCE_`) REFERENCES `jbpm_swimlaneinstance` (`ID_`);

--
-- Constraints for table `jbpm_processdefinition`
--
ALTER TABLE `jbpm_processdefinition`
  ADD CONSTRAINT `FK_PROCDEF_STRTSTA` FOREIGN KEY (`STARTSTATE_`) REFERENCES `jbpm_node` (`ID_`);

--
-- Constraints for table `jbpm_processinstance`
--
ALTER TABLE `jbpm_processinstance`
  ADD CONSTRAINT `FK_PROCIN_PROCDEF` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`),
  ADD CONSTRAINT `FK_PROCIN_ROOTTKN` FOREIGN KEY (`ROOTTOKEN_`) REFERENCES `jbpm_token` (`ID_`),
  ADD CONSTRAINT `FK_PROCIN_SPROCTKN` FOREIGN KEY (`SUPERPROCESSTOKEN_`) REFERENCES `jbpm_token` (`ID_`);

--
-- Constraints for table `jbpm_runtimeaction`
--
ALTER TABLE `jbpm_runtimeaction`
  ADD CONSTRAINT `FK_RTACTN_ACTION` FOREIGN KEY (`ACTION_`) REFERENCES `jbpm_action` (`ID_`),
  ADD CONSTRAINT `FK_RTACTN_PROCINST` FOREIGN KEY (`PROCESSINSTANCE_`) REFERENCES `jbpm_processinstance` (`ID_`);

--
-- Constraints for table `jbpm_swimlane`
--
ALTER TABLE `jbpm_swimlane`
  ADD CONSTRAINT `FK_SWL_ASSDEL` FOREIGN KEY (`ASSIGNMENTDELEGATION_`) REFERENCES `jbpm_delegation` (`ID_`),
  ADD CONSTRAINT `FK_SWL_TSKMGMTDEF` FOREIGN KEY (`TASKMGMTDEFINITION_`) REFERENCES `jbpm_moduledefinition` (`ID_`);

--
-- Constraints for table `jbpm_swimlaneinstance`
--
ALTER TABLE `jbpm_swimlaneinstance`
  ADD CONSTRAINT `FK_SWIMLANEINST_SL` FOREIGN KEY (`SWIMLANE_`) REFERENCES `jbpm_swimlane` (`ID_`),
  ADD CONSTRAINT `FK_SWIMLANEINST_TM` FOREIGN KEY (`TASKMGMTINSTANCE_`) REFERENCES `jbpm_moduleinstance` (`ID_`);

--
-- Constraints for table `jbpm_task`
--
ALTER TABLE `jbpm_task`
  ADD CONSTRAINT `FK_TASK_ASSDEL` FOREIGN KEY (`ASSIGNMENTDELEGATION_`) REFERENCES `jbpm_delegation` (`ID_`),
  ADD CONSTRAINT `FK_TASK_PROCDEF` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`),
  ADD CONSTRAINT `FK_TASK_STARTST` FOREIGN KEY (`STARTSTATE_`) REFERENCES `jbpm_node` (`ID_`),
  ADD CONSTRAINT `FK_TASK_SWIMLANE` FOREIGN KEY (`SWIMLANE_`) REFERENCES `jbpm_swimlane` (`ID_`),
  ADD CONSTRAINT `FK_TASK_TASKMGTDEF` FOREIGN KEY (`TASKMGMTDEFINITION_`) REFERENCES `jbpm_moduledefinition` (`ID_`),
  ADD CONSTRAINT `FK_TASK_TASKNODE` FOREIGN KEY (`TASKNODE_`) REFERENCES `jbpm_node` (`ID_`),
  ADD CONSTRAINT `FK_TSK_TSKCTRL` FOREIGN KEY (`TASKCONTROLLER_`) REFERENCES `jbpm_taskcontroller` (`ID_`);

--
-- Constraints for table `jbpm_taskactorpool`
--
ALTER TABLE `jbpm_taskactorpool`
  ADD CONSTRAINT `FK_TASKACTPL_TSKI` FOREIGN KEY (`TASKINSTANCE_`) REFERENCES `jbpm_taskinstance` (`ID_`),
  ADD CONSTRAINT `FK_TSKACTPOL_PLACT` FOREIGN KEY (`POOLEDACTOR_`) REFERENCES `jbpm_pooledactor` (`ID_`);

--
-- Constraints for table `jbpm_taskcontroller`
--
ALTER TABLE `jbpm_taskcontroller`
  ADD CONSTRAINT `FK_TSKCTRL_DELEG` FOREIGN KEY (`TASKCONTROLLERDELEGATION_`) REFERENCES `jbpm_delegation` (`ID_`);

--
-- Constraints for table `jbpm_taskinstance`
--
ALTER TABLE `jbpm_taskinstance`
  ADD CONSTRAINT `FK_TASKINST_SLINST` FOREIGN KEY (`SWIMLANINSTANCE_`) REFERENCES `jbpm_swimlaneinstance` (`ID_`),
  ADD CONSTRAINT `FK_TASKINST_TASK` FOREIGN KEY (`TASK_`) REFERENCES `jbpm_task` (`ID_`),
  ADD CONSTRAINT `FK_TASKINST_TMINST` FOREIGN KEY (`TASKMGMTINSTANCE_`) REFERENCES `jbpm_moduleinstance` (`ID_`),
  ADD CONSTRAINT `FK_TASKINST_TOKEN` FOREIGN KEY (`TOKEN_`) REFERENCES `jbpm_token` (`ID_`);

--
-- Constraints for table `jbpm_timer`
--
ALTER TABLE `jbpm_timer`
  ADD CONSTRAINT `FK_TIMER_ACTION` FOREIGN KEY (`ACTION_`) REFERENCES `jbpm_action` (`ID_`),
  ADD CONSTRAINT `FK_TIMER_PRINST` FOREIGN KEY (`PROCESSINSTANCE_`) REFERENCES `jbpm_processinstance` (`ID_`),
  ADD CONSTRAINT `FK_TIMER_TOKEN` FOREIGN KEY (`TOKEN_`) REFERENCES `jbpm_token` (`ID_`),
  ADD CONSTRAINT `FK_TIMER_TSKINST` FOREIGN KEY (`TASKINSTANCE_`) REFERENCES `jbpm_taskinstance` (`ID_`);

--
-- Constraints for table `jbpm_token`
--
ALTER TABLE `jbpm_token`
  ADD CONSTRAINT `FK_TOKEN_NODE` FOREIGN KEY (`NODE_`) REFERENCES `jbpm_node` (`ID_`),
  ADD CONSTRAINT `FK_TOKEN_PARENT` FOREIGN KEY (`PARENT_`) REFERENCES `jbpm_token` (`ID_`),
  ADD CONSTRAINT `FK_TOKEN_PROCINST` FOREIGN KEY (`PROCESSINSTANCE_`) REFERENCES `jbpm_processinstance` (`ID_`),
  ADD CONSTRAINT `FK_TOKEN_SUBPI` FOREIGN KEY (`SUBPROCESSINSTANCE_`) REFERENCES `jbpm_processinstance` (`ID_`);

--
-- Constraints for table `jbpm_tokenvariablemap`
--
ALTER TABLE `jbpm_tokenvariablemap`
  ADD CONSTRAINT `FK_TKVARMAP_CTXT` FOREIGN KEY (`CONTEXTINSTANCE_`) REFERENCES `jbpm_moduleinstance` (`ID_`),
  ADD CONSTRAINT `FK_TKVARMAP_TOKEN` FOREIGN KEY (`TOKEN_`) REFERENCES `jbpm_token` (`ID_`);

--
-- Constraints for table `jbpm_transition`
--
ALTER TABLE `jbpm_transition`
  ADD CONSTRAINT `FK_TRANSITION_FROM` FOREIGN KEY (`FROM_`) REFERENCES `jbpm_node` (`ID_`),
  ADD CONSTRAINT `FK_TRANSITION_TO` FOREIGN KEY (`TO_`) REFERENCES `jbpm_node` (`ID_`),
  ADD CONSTRAINT `FK_TRANS_PROCDEF` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`);

--
-- Constraints for table `jbpm_variableaccess`
--
ALTER TABLE `jbpm_variableaccess`
  ADD CONSTRAINT `FK_VARACC_PROCST` FOREIGN KEY (`PROCESSSTATE_`) REFERENCES `jbpm_node` (`ID_`),
  ADD CONSTRAINT `FK_VARACC_SCRIPT` FOREIGN KEY (`SCRIPT_`) REFERENCES `jbpm_action` (`ID_`),
  ADD CONSTRAINT `FK_VARACC_TSKCTRL` FOREIGN KEY (`TASKCONTROLLER_`) REFERENCES `jbpm_taskcontroller` (`ID_`);

--
-- Constraints for table `jbpm_variableinstance`
--
ALTER TABLE `jbpm_variableinstance`
  ADD CONSTRAINT `FK_BYTEINST_ARRAY` FOREIGN KEY (`BYTEARRAYVALUE_`) REFERENCES `jbpm_bytearray` (`ID_`),
  ADD CONSTRAINT `FK_VARINST_PRCINST` FOREIGN KEY (`PROCESSINSTANCE_`) REFERENCES `jbpm_processinstance` (`ID_`),
  ADD CONSTRAINT `FK_VARINST_TK` FOREIGN KEY (`TOKEN_`) REFERENCES `jbpm_token` (`ID_`),
  ADD CONSTRAINT `FK_VARINST_TKVARMP` FOREIGN KEY (`TOKENVARIABLEMAP_`) REFERENCES `jbpm_tokenvariablemap` (`ID_`),
  ADD CONSTRAINT `FK_VAR_TSKINST` FOREIGN KEY (`TASKINSTANCE_`) REFERENCES `jbpm_taskinstance` (`ID_`);

--
-- Constraints for table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `FK_JOB_COMPANY_ID` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`ID`);

--
-- Constraints for table `job_group`
--
ALTER TABLE `job_group`
  ADD CONSTRAINT `FR_KEY_COMPANY_ID` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`ID`),
  ADD CONSTRAINT `FR_KEY_PROJECT_ID` FOREIGN KEY (`PROJECT_ID`) REFERENCES `project` (`PROJECT_SEQ`),
  ADD CONSTRAINT `FR_KEY_SOURCE_LOCALE_ID` FOREIGN KEY (`SOURCE_LOCALE_ID`) REFERENCES `locale` (`ID`);

--
-- Constraints for table `l10n_profile`
--
ALTER TABLE `l10n_profile`
  ADD CONSTRAINT `FK_L10N_PROFILE_COMPANYID` FOREIGN KEY (`COMPANYID`) REFERENCES `company` (`ID`),
  ADD CONSTRAINT `FK_L10N_PROFILE_PROJECT_ID` FOREIGN KEY (`PROJECT_ID`) REFERENCES `project` (`PROJECT_SEQ`),
  ADD CONSTRAINT `FK_L10N_PROFILE_SOURCE_LOCALE_ID` FOREIGN KEY (`SOURCE_LOCALE_ID`) REFERENCES `locale` (`ID`);

--
-- Constraints for table `l10n_profile_tm_profile`
--
ALTER TABLE `l10n_profile_tm_profile`
  ADD CONSTRAINT `FK_L10N_PROFILE_TM_PROFILE_L10N_PROFILE_ID` FOREIGN KEY (`L10N_PROFILE_ID`) REFERENCES `l10n_profile` (`ID`),
  ADD CONSTRAINT `FK_L10N_PROFILE_TM_PROFILE_TM_PROFILE_ID` FOREIGN KEY (`TM_PROFILE_ID`) REFERENCES `tm_profile` (`ID`);

--
-- Constraints for table `l10n_profile_version`
--
ALTER TABLE `l10n_profile_version`
  ADD CONSTRAINT `FK_L10N_PROFILE_VERSION_MODIFIED_PROFILE_SEQ` FOREIGN KEY (`MODIFIED_PROFILE_SEQ`) REFERENCES `l10n_profile` (`ID`),
  ADD CONSTRAINT `FK_L10N_PROFILE_VERSION_ORIGINAL_PROFILE_SEQ` FOREIGN KEY (`ORIGINAL_PROFILE_SEQ`) REFERENCES `l10n_profile` (`ID`);

--
-- Constraints for table `l10n_profile_wftemplate_info`
--
ALTER TABLE `l10n_profile_wftemplate_info`
  ADD CONSTRAINT `FK_L10N_PROFILE_WFTEMPLATE_INFO_L10N_PROFILE_ID` FOREIGN KEY (`L10N_PROFILE_ID`) REFERENCES `l10n_profile` (`ID`),
  ADD CONSTRAINT `FK_L10N_PROFILE_WFTEMPLATE_INFO_WF_TEMPLATE_ID` FOREIGN KEY (`WF_TEMPLATE_ID`) REFERENCES `workflow_template` (`ID`);

--
-- Constraints for table `leverage_locales`
--
ALTER TABLE `leverage_locales`
  ADD CONSTRAINT `FK_LEVERAGE_LOCALES_LOCALE_ID` FOREIGN KEY (`LOCALE_ID`) REFERENCES `locale` (`ID`),
  ADD CONSTRAINT `FK_LEVERAGE_LOCALES_WORKFLOW_INFO_ID` FOREIGN KEY (`WORKFLOW_INFO_ID`) REFERENCES `workflow_template` (`ID`);

--
-- Constraints for table `locale`
--
ALTER TABLE `locale`
  ADD CONSTRAINT `FK_LOCALE_ISO_COUNTRY_CODE` FOREIGN KEY (`ISO_COUNTRY_CODE`) REFERENCES `country` (`ISO_COUNTRY_CODE`),
  ADD CONSTRAINT `FK_LOCALE_ISO_LANG_CODE` FOREIGN KEY (`ISO_LANG_CODE`) REFERENCES `language` (`ISO_LANG_CODE`);

--
-- Constraints for table `locale_codeset`
--
ALTER TABLE `locale_codeset`
  ADD CONSTRAINT `FK_LOCALE_CODESET_CODE_SET` FOREIGN KEY (`CODE_SET`) REFERENCES `code_set` (`CODE_SET`),
  ADD CONSTRAINT `FK_LOCALE_CODESET_LOCALE_ID` FOREIGN KEY (`LOCALE_ID`) REFERENCES `locale` (`ID`);

--
-- Constraints for table `locale_pair`
--
ALTER TABLE `locale_pair`
  ADD CONSTRAINT `FK_LOCALE_PAIR_COMPANY_ID` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`ID`),
  ADD CONSTRAINT `FK_LOCALE_PAIR_SOURCE_LOCALE_ID` FOREIGN KEY (`SOURCE_LOCALE_ID`) REFERENCES `locale` (`ID`),
  ADD CONSTRAINT `FK_LOCALE_PAIR_TARGET_LOCALE_ID` FOREIGN KEY (`TARGET_LOCALE_ID`) REFERENCES `locale` (`ID`);

--
-- Constraints for table `module_rename`
--
ALTER TABLE `module_rename`
  ADD CONSTRAINT `FK_MODULE_MAPPING_ID` FOREIGN KEY (`MODULE_MAPPING_ID`) REFERENCES `module_mapping` (`ID`);

--
-- Constraints for table `module_rename_di`
--
ALTER TABLE `module_rename_di`
  ADD CONSTRAINT `FK_MODULE_MAPPING_DI_ID` FOREIGN KEY (`MODULE_MAPPING_ID`) REFERENCES `module_mapping_di` (`ID`);

--
-- Constraints for table `page_tm`
--
ALTER TABLE `page_tm`
  ADD CONSTRAINT `FK_PAGE_TM_SOURCE_LOCALE_ID` FOREIGN KEY (`SOURCE_LOCALE_ID`) REFERENCES `locale` (`ID`);

--
-- Constraints for table `page_tm_tuv_l`
--
ALTER TABLE `page_tm_tuv_l`
  ADD CONSTRAINT `FK_PAGE_TM_TUV_L_TU_ID` FOREIGN KEY (`TU_ID`) REFERENCES `page_tm_tu_l` (`ID`),
  ADD CONSTRAINT `FK_PAGE_TM_TUV_T_LOCALE_ID` FOREIGN KEY (`LOCALE_ID`) REFERENCES `locale` (`ID`);

--
-- Constraints for table `page_tm_tuv_t`
--
ALTER TABLE `page_tm_tuv_t`
  ADD CONSTRAINT `FK_PAGE_TM_TUV_T_TU_ID` FOREIGN KEY (`TU_ID`) REFERENCES `page_tm_tu_t` (`ID`),
  ADD CONSTRAINT `FK_PAGE_TM_TU_T_LOCALE_ID` FOREIGN KEY (`LOCALE_ID`) REFERENCES `locale` (`ID`);

--
-- Constraints for table `page_tm_tu_l`
--
ALTER TABLE `page_tm_tu_l`
  ADD CONSTRAINT `FK_PAGE_TM_TU_L_TM_ID` FOREIGN KEY (`TM_ID`) REFERENCES `page_tm` (`ID`);

--
-- Constraints for table `page_tm_tu_t`
--
ALTER TABLE `page_tm_tu_t`
  ADD CONSTRAINT `FK_PAGE_TM_TU_T` FOREIGN KEY (`TM_ID`) REFERENCES `page_tm` (`ID`);

--
-- Constraints for table `permissiongroup`
--
ALTER TABLE `permissiongroup`
  ADD CONSTRAINT `FK_PERMISSIONGROUP_COMPANY_ID` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`ID`);

--
-- Constraints for table `permissiongroup_user`
--
ALTER TABLE `permissiongroup_user`
  ADD CONSTRAINT `FK_PERMISSIONGROUP_USER_PERMISSIONGROUP_ID` FOREIGN KEY (`PERMISSIONGROUP_ID`) REFERENCES `permissiongroup` (`ID`);

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `FK_PROJECT_COMPANYID` FOREIGN KEY (`COMPANYID`) REFERENCES `company` (`ID`);

--
-- Constraints for table `project_tm`
--
ALTER TABLE `project_tm`
  ADD CONSTRAINT `FK_PROJECT_TM_COMPANY_ID` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`ID`);

--
-- Constraints for table `project_tm_tuv_l`
--
ALTER TABLE `project_tm_tuv_l`
  ADD CONSTRAINT `FK_PROJECT_TM_TUV_L_LOCALE_ID` FOREIGN KEY (`LOCALE_ID`) REFERENCES `locale` (`ID`),
  ADD CONSTRAINT `FK_PROJECT_TM_TUV_L_TU_ID` FOREIGN KEY (`TU_ID`) REFERENCES `project_tm_tu_l` (`ID`);

--
-- Constraints for table `project_tm_tuv_t`
--
ALTER TABLE `project_tm_tuv_t`
  ADD CONSTRAINT `FK_PROJECT_TM_TVU_T_LOCALE_ID` FOREIGN KEY (`LOCALE_ID`) REFERENCES `locale` (`ID`),
  ADD CONSTRAINT `FK_PROJECT_TM_TVU_T_TU_ID` FOREIGN KEY (`TU_ID`) REFERENCES `project_tm_tu_t` (`ID`);

--
-- Constraints for table `project_tm_tu_l`
--
ALTER TABLE `project_tm_tu_l`
  ADD CONSTRAINT `FK_PROJECT_TM_TU_L_SOURCE_LOCALE_ID` FOREIGN KEY (`SOURCE_LOCALE_ID`) REFERENCES `locale` (`ID`),
  ADD CONSTRAINT `FK_PROJECT_TM_TU_L_TM_ID` FOREIGN KEY (`TM_ID`) REFERENCES `project_tm` (`ID`);

--
-- Constraints for table `project_tm_tu_t`
--
ALTER TABLE `project_tm_tu_t`
  ADD CONSTRAINT `FK_PROJECT_TM_TU_T_SOURCE_LOCALE_ID` FOREIGN KEY (`SOURCE_LOCALE_ID`) REFERENCES `locale` (`ID`),
  ADD CONSTRAINT `FK_PROJECT_TM_TU_T_TM_ID` FOREIGN KEY (`TM_ID`) REFERENCES `project_tm` (`ID`);

--
-- Constraints for table `project_user`
--
ALTER TABLE `project_user`
  ADD CONSTRAINT `FK_PROJECT_USER_PROJECT_ID` FOREIGN KEY (`PROJECT_ID`) REFERENCES `project` (`PROJECT_SEQ`);

--
-- Constraints for table `qrtz_blob_triggers`
--
ALTER TABLE `qrtz_blob_triggers`
  ADD CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`);

--
-- Constraints for table `qrtz_cron_triggers`
--
ALTER TABLE `qrtz_cron_triggers`
  ADD CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`);

--
-- Constraints for table `qrtz_simple_triggers`
--
ALTER TABLE `qrtz_simple_triggers`
  ADD CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`);

--
-- Constraints for table `qrtz_simprop_triggers`
--
ALTER TABLE `qrtz_simprop_triggers`
  ADD CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`);

--
-- Constraints for table `qrtz_triggers`
--
ALTER TABLE `qrtz_triggers`
  ADD CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`);

--
-- Constraints for table `rate`
--
ALTER TABLE `rate`
  ADD CONSTRAINT `FK_RATE_ACTIVITY_ID` FOREIGN KEY (`ACTIVITY_ID`) REFERENCES `activity` (`ID`),
  ADD CONSTRAINT `FK_RATE_CURRENCY_CONV_ID` FOREIGN KEY (`CURRENCY_CONV_ID`) REFERENCES `currency_conversion` (`ID`),
  ADD CONSTRAINT `FK_RATE_LOCALE_PAIR_ID` FOREIGN KEY (`LOCALE_PAIR_ID`) REFERENCES `locale_pair` (`ID`);

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `FK_REQUEST_COMPANY_ID` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`ID`),
  ADD CONSTRAINT `FK_REQUEST_JOB_ID` FOREIGN KEY (`JOB_ID`) REFERENCES `job` (`ID`),
  ADD CONSTRAINT `FK_REQUEST_L10N_PROFILE_ID` FOREIGN KEY (`L10N_PROFILE_ID`) REFERENCES `l10n_profile` (`ID`),
  ADD CONSTRAINT `REQUEST_PAGE_ID_FK` FOREIGN KEY (`PAGE_ID`) REFERENCES `source_page` (`ID`);

--
-- Constraints for table `reserved_time`
--
ALTER TABLE `reserved_time`
  ADD CONSTRAINT `FK_RESERVED_TIME_TASK_ID` FOREIGN KEY (`TASK_ID`) REFERENCES `task_info` (`TASK_ID`),
  ADD CONSTRAINT `FK_RESERVED_TIME_USER_CALENDAR_ID` FOREIGN KEY (`USER_CALENDAR_ID`) REFERENCES `user_calendar` (`ID`);

--
-- Constraints for table `rss_item`
--
ALTER TABLE `rss_item`
  ADD CONSTRAINT `FK_RSS_ITEM_FEED_ID` FOREIGN KEY (`FEED_ID`) REFERENCES `rss_feed` (`ID`);

--
-- Constraints for table `scorecard_score`
--
ALTER TABLE `scorecard_score`
  ADD CONSTRAINT `FK_SCORE_COMPANY` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`ID`),
  ADD CONSTRAINT `FK_SCORE_WORKFLOW` FOREIGN KEY (`WORKFLOW_ID`) REFERENCES `workflow` (`IFLOW_INSTANCE_ID`);

--
-- Constraints for table `secondary_target_file`
--
ALTER TABLE `secondary_target_file`
  ADD CONSTRAINT `FK_SECONDARY_TARGET_FILE_WORKFLOW_ID` FOREIGN KEY (`WORKFLOW_ID`) REFERENCES `workflow` (`IFLOW_INSTANCE_ID`);

--
-- Constraints for table `segmentation_rule`
--
ALTER TABLE `segmentation_rule`
  ADD CONSTRAINT `FK_SEGMENTATIN_RULE_CASCADE` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`ID`);

--
-- Constraints for table `segmentation_rule_tm_profile`
--
ALTER TABLE `segmentation_rule_tm_profile`
  ADD CONSTRAINT `FK_SEGMENTATION_RULE_TM_PROFILE_TM_PROFILE_ID` FOREIGN KEY (`SEGMENTATION_RULE_ID`) REFERENCES `segmentation_rule` (`ID`);

--
-- Constraints for table `source_page`
--
ALTER TABLE `source_page`
  ADD CONSTRAINT `FK_SOURCE_COMPANY_ID` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`ID`),
  ADD CONSTRAINT `FK_SOURCE_PAGE_PREVIOUS_PAGE_ID` FOREIGN KEY (`PREVIOUS_PAGE_ID`) REFERENCES `source_page` (`ID`);

--
-- Constraints for table `source_page_leverage_group`
--
ALTER TABLE `source_page_leverage_group`
  ADD CONSTRAINT `FK_SOURCE_PAGE_LEVERAGE_GROUP_LG_ID` FOREIGN KEY (`LG_ID`) REFERENCES `leverage_group` (`ID`),
  ADD CONSTRAINT `FK_SOURCE_PAGE_LEVERAGE_GROUP_SP_ID` FOREIGN KEY (`SP_ID`) REFERENCES `source_page` (`ID`);

--
-- Constraints for table `surcharge`
--
ALTER TABLE `surcharge`
  ADD CONSTRAINT `FK_SURCHARGE_COST_ID` FOREIGN KEY (`COST_ID`) REFERENCES `cost` (`ID`),
  ADD CONSTRAINT `FK_SURCHARGE_CURRENCY_CONV_ID` FOREIGN KEY (`CURRENCY_CONV_ID`) REFERENCES `currency_conversion` (`ID`);

--
-- Constraints for table `system_parameter`
--
ALTER TABLE `system_parameter`
  ADD CONSTRAINT `FK_SYSTEM_PARAMETER_COMPANY_ID` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`ID`);

--
-- Constraints for table `target_page`
--
ALTER TABLE `target_page`
  ADD CONSTRAINT `FK_TARGET_PAGE_SOURCE_PAGE_ID` FOREIGN KEY (`SOURCE_PAGE_ID`) REFERENCES `source_page` (`ID`),
  ADD CONSTRAINT `FK_TARGET_PAGE_WORKFLOW_IFLOW_INSTANCE_ID` FOREIGN KEY (`WORKFLOW_IFLOW_INSTANCE_ID`) REFERENCES `workflow` (`IFLOW_INSTANCE_ID`);

--
-- Constraints for table `target_page_leverage_group`
--
ALTER TABLE `target_page_leverage_group`
  ADD CONSTRAINT `FK_TARGET_PAGE_LEVERAGE_GROUP_LG_ID` FOREIGN KEY (`LG_ID`) REFERENCES `leverage_group` (`ID`),
  ADD CONSTRAINT `FK_TARGET_PAGE_LEVERAGE_GROUP_TP_ID` FOREIGN KEY (`TP_ID`) REFERENCES `target_page` (`ID`);

--
-- Constraints for table `task_info`
--
ALTER TABLE `task_info`
  ADD CONSTRAINT `FK_TASK_INFO_COMPANY_ID` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`ID`),
  ADD CONSTRAINT `FK_TASK_INFO_EXPENSE_RATE_ID` FOREIGN KEY (`EXPENSE_RATE_ID`) REFERENCES `rate` (`ID`),
  ADD CONSTRAINT `FK_TASK_INFO_REVENUE_RATE_ID` FOREIGN KEY (`REVENUE_RATE_ID`) REFERENCES `rate` (`ID`),
  ADD CONSTRAINT `FK_TASK_INFO_WORKFLOW_ID` FOREIGN KEY (`WORKFLOW_ID`) REFERENCES `workflow` (`IFLOW_INSTANCE_ID`);

--
-- Constraints for table `task_tuv`
--
ALTER TABLE `task_tuv`
  ADD CONSTRAINT `FK_TASK_TUV_TASK_ID` FOREIGN KEY (`TASK_ID`) REFERENCES `task_info` (`TASK_ID`);

--
-- Constraints for table `tb_termbase`
--
ALTER TABLE `tb_termbase`
  ADD CONSTRAINT `FK_TERMBASE_COMPANYID` FOREIGN KEY (`COMPANYID`) REFERENCES `company` (`ID`);

--
-- Constraints for table `template`
--
ALTER TABLE `template`
  ADD CONSTRAINT `FK_TEMPLATE_SOURCE_PAGE_ID` FOREIGN KEY (`SOURCE_PAGE_ID`) REFERENCES `source_page` (`ID`);

--
-- Constraints for table `template_part`
--
ALTER TABLE `template_part`
  ADD CONSTRAINT `FK_TEMPLATE_PART_TEMPLATE_ID` FOREIGN KEY (`TEMPLATE_ID`) REFERENCES `template` (`ID`);

--
-- Constraints for table `tm3_attr`
--
ALTER TABLE `tm3_attr`
  ADD CONSTRAINT `tm3_attr_ibfk_1` FOREIGN KEY (`tmId`) REFERENCES `tm3_tm` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tm_profile`
--
ALTER TABLE `tm_profile`
  ADD CONSTRAINT `FK_TM_PROFILE_PROJECT_TM_ID_FOR_SAVE` FOREIGN KEY (`PROJECT_TM_ID_FOR_SAVE`) REFERENCES `project_tm` (`ID`);

--
-- Constraints for table `tm_profile_project_tm_info`
--
ALTER TABLE `tm_profile_project_tm_info`
  ADD CONSTRAINT `FK_TM_PROFILE_PROJECT_TM_INFO_PROJECT_TM_ID` FOREIGN KEY (`PROJECT_TM_ID`) REFERENCES `project_tm` (`ID`),
  ADD CONSTRAINT `FK_TM_PROFILE_PROJECT_TM_INFO_TM_PROFILE_ID` FOREIGN KEY (`TM_PROFILE_ID`) REFERENCES `tm_profile` (`ID`);

--
-- Constraints for table `user_calendar`
--
ALTER TABLE `user_calendar`
  ADD CONSTRAINT `FK_USER_CALENDAR_CALENDAR_ID` FOREIGN KEY (`CALENDAR_ID`) REFERENCES `calendar` (`ID`);

--
-- Constraints for table `user_calendar_working_day`
--
ALTER TABLE `user_calendar_working_day`
  ADD CONSTRAINT `FK_USER_CALENDAR_WORKING_DAY_CALENDAR_ID` FOREIGN KEY (`CALENDAR_ID`) REFERENCES `user_calendar` (`ID`);

--
-- Constraints for table `user_calendar_working_hour`
--
ALTER TABLE `user_calendar_working_hour`
  ADD CONSTRAINT `FK_USER_CALENDAR_WORKING_HOUR_USER_CALENDAR_WORKING_DAY_ID` FOREIGN KEY (`USER_CALENDAR_WORKING_DAY_ID`) REFERENCES `user_calendar_working_day` (`ID`);

--
-- Constraints for table `user_default_activities`
--
ALTER TABLE `user_default_activities`
  ADD CONSTRAINT `FK_DEFAULT_ACTIVITIES` FOREIGN KEY (`DEFAULT_ROLE_ID`) REFERENCES `user_default_roles` (`ID`);

--
-- Constraints for table `user_default_roles`
--
ALTER TABLE `user_default_roles`
  ADD CONSTRAINT `FK_LOCALE_PAIR_SOURCE_LOCALE` FOREIGN KEY (`SOURCE_LOCALE`) REFERENCES `locale` (`ID`),
  ADD CONSTRAINT `FK_LOCALE_PAIR_TARGET_LOCALE` FOREIGN KEY (`TARGET_LOCALE`) REFERENCES `locale` (`ID`);

--
-- Constraints for table `vendor_field_security`
--
ALTER TABLE `vendor_field_security`
  ADD CONSTRAINT `FK_VENDOR_FIELD_SECURITY_VENDOR_ID` FOREIGN KEY (`VENDOR_ID`) REFERENCES `vendor` (`ID`);

--
-- Constraints for table `vendor_rating`
--
ALTER TABLE `vendor_rating`
  ADD CONSTRAINT `FK_VENDOR_RATING_TASK_ID` FOREIGN KEY (`TASK_ID`) REFERENCES `task_info` (`TASK_ID`),
  ADD CONSTRAINT `FK_VENDOR_RATING_VENDOR_ID` FOREIGN KEY (`VENDOR_ID`) REFERENCES `vendor` (`ID`);

--
-- Constraints for table `vendor_role`
--
ALTER TABLE `vendor_role`
  ADD CONSTRAINT `FK_VENDOR_ROLE_ACTIVITY_ID` FOREIGN KEY (`ACTIVITY_ID`) REFERENCES `activity` (`ID`),
  ADD CONSTRAINT `FK_VENDOR_ROLE_LOCALE_PAIR_ID` FOREIGN KEY (`LOCALE_PAIR_ID`) REFERENCES `locale_pair` (`ID`),
  ADD CONSTRAINT `FK_VENDOR_ROLE_RATE_ID` FOREIGN KEY (`RATE_ID`) REFERENCES `rate` (`ID`),
  ADD CONSTRAINT `FK_VENDOR_ROLE_VENDOR_ID` FOREIGN KEY (`VENDOR_ID`) REFERENCES `vendor` (`ID`);

--
-- Constraints for table `wf_template_wf_manager`
--
ALTER TABLE `wf_template_wf_manager`
  ADD CONSTRAINT `FK_WF_TEMPLATE_WF_MANAGER_WORKFLOW_TEMPLATE_ID` FOREIGN KEY (`WORKFLOW_TEMPLATE_ID`) REFERENCES `workflow_template` (`ID`);

--
-- Constraints for table `workflow`
--
ALTER TABLE `workflow`
  ADD CONSTRAINT `FK_WORKFLOW_COMPANY_ID` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`ID`),
  ADD CONSTRAINT `FK_WORKFLOW_JOB_ID` FOREIGN KEY (`JOB_ID`) REFERENCES `job` (`ID`),
  ADD CONSTRAINT `FK_WORKFLOW_TARGET_LOCALE_ID` FOREIGN KEY (`TARGET_LOCALE_ID`) REFERENCES `locale` (`ID`);

--
-- Constraints for table `workflow_owner`
--
ALTER TABLE `workflow_owner`
  ADD CONSTRAINT `FK_WORKFLOW_OWNER_WORKFLOW_ID` FOREIGN KEY (`WORKFLOW_ID`) REFERENCES `workflow` (`IFLOW_INSTANCE_ID`);

--
-- Constraints for table `workflow_request`
--
ALTER TABLE `workflow_request`
  ADD CONSTRAINT `FK_WORKFLOW_REQUEST_JOB_ID` FOREIGN KEY (`JOB_ID`) REFERENCES `job` (`ID`);

--
-- Constraints for table `workflow_request_wftemplate`
--
ALTER TABLE `workflow_request_wftemplate`
  ADD CONSTRAINT `FK_WORKFLOW_REQUEST_WFTEMPLATE_WORKFLOW_REQUEST_ID` FOREIGN KEY (`WORKFLOW_REQUEST_ID`) REFERENCES `workflow_request` (`ID`),
  ADD CONSTRAINT `FK_WORKFLOW_REQUEST_WFTEMPLATE_WORKFLOW_TEMPLATE_ID` FOREIGN KEY (`WORKFLOW_TEMPLATE_ID`) REFERENCES `workflow_template` (`ID`);

--
-- Constraints for table `workflow_template`
--
ALTER TABLE `workflow_template`
  ADD CONSTRAINT `FK_WORKFLOW_TEMPLATE_COMPANYID` FOREIGN KEY (`COMPANYID`) REFERENCES `company` (`ID`),
  ADD CONSTRAINT `FK_WORKFLOW_TEMPLATE_PROJECT_ID` FOREIGN KEY (`PROJECT_ID`) REFERENCES `project` (`PROJECT_SEQ`),
  ADD CONSTRAINT `FK_WORKFLOW_TEMPLATE_SOURCE_LOCALE_ID` FOREIGN KEY (`SOURCE_LOCALE_ID`) REFERENCES `locale` (`ID`),
  ADD CONSTRAINT `FK_WORKFLOW_TEMPLATE_TARGET_LOCALE_ID` FOREIGN KEY (`TARGET_LOCALE_ID`) REFERENCES `locale` (`ID`);

--
-- Constraints for table `xml_dtd`
--
ALTER TABLE `xml_dtd`
  ADD CONSTRAINT `FK_XML_DTD_CASCADE_COMPANY_ID` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`ID`);

--
-- Constraints for table `xml_rule`
--
ALTER TABLE `xml_rule`
  ADD CONSTRAINT `FK_XML_RULE_CASCADE_COMPANY_ID` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
