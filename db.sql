-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost:80
-- Generation Time: Apr 03, 2019 at 11:23 AM
-- Server version: 5.7.25-0ubuntu0.16.04.2
-- PHP Version: 7.0.33-0ubuntu0.16.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts_department`
--

CREATE TABLE `accounts_department` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `manager_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts_department`
--

INSERT INTO `accounts_department` (`id`, `name`, `manager_id`) VALUES
(1, 'Product Management', 3),
(2, 'Core Services', 2),
(3, 'Testing', 6);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_dependent`
--

CREATE TABLE `accounts_dependent` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `relation` varchar(30) NOT NULL,
  `mobileno` bigint(20) NOT NULL,
  `emp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts_dependent`
--

INSERT INTO `accounts_dependent` (`id`, `name`, `relation`, `mobileno`, `emp_id`) VALUES
(1, 'Suraj', 'Brother', 9099912345, 3),
(2, 'Adithya', 'Brother', 9123123123, 3);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_designation`
--

CREATE TABLE `accounts_designation` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts_designation`
--

INSERT INTO `accounts_designation` (`id`, `name`) VALUES
(1, 'HR'),
(4, 'Senior Project Manager'),
(2, 'Software Engineer'),
(3, 'Software Engineer II');

-- --------------------------------------------------------

--
-- Table structure for table `accounts_location`
--

CREATE TABLE `accounts_location` (
  `id` int(11) NOT NULL,
  `location` varchar(255) NOT NULL,
  `deptno_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_project`
--

CREATE TABLE `accounts_project` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handledby_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts_project`
--

INSERT INTO `accounts_project` (`id`, `name`, `handledby_id`) VALUES
(1, 'Bing', 2),
(2, 'Email Client', 2),
(3, 'Automated Testing App', 3),
(4, 'project X', 1),
(5, 'Project 2', 3);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_user`
--

CREATE TABLE `accounts_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `eid` int(11) DEFAULT NULL,
  `is_hr` tinyint(1) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT NULL,
  `is_approved` tinyint(1) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `designation_id` int(11) DEFAULT NULL,
  `hr_id` int(11) DEFAULT NULL,
  `supervisor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts_user`
--

INSERT INTO `accounts_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `eid`, `is_hr`, `is_admin`, `is_approved`, `address`, `salary`, `dob`, `dept_id`, `designation_id`, `hr_id`, `supervisor_id`) VALUES
(1, 'pbkdf2_sha256$120000$Dl0h4vJfu4j5$7DmGib2zWKPGS4H86DzNhTxxJ68o3QVUJ1BmXr8wrmA=', '2019-04-02 09:49:20.849231', 1, 'root', 'Root', '', 'root@root.com', 1, 1, '2019-04-02 08:04:21.000000', NULL, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'pbkdf2_sha256$120000$bwbpPC2ISFW6$0fqHW1VvS6iR6jvQ54218C3MkSOaG581Gelx6N62a84=', '2019-04-02 08:20:53.042897', 0, 'rohan', 'Rohan', 'Murthy', 'g@g.com', 0, 1, '2019-04-02 08:06:30.827730', NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'pbkdf2_sha256$120000$x5Gb8rZ9bUKL$Ze4X+wYrS5Dr1cICv3dzDoR/cksot/E/3GNuiV0byiE=', '2019-04-02 09:20:32.446156', 0, 'suhas', 'Suhas', 'HR', 'suhas@gmail.com', 0, 1, '2019-04-02 08:07:23.510944', NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'pbkdf2_sha256$120000$TLh6o3jIMHIO$LrSYLVY7F6jId7kUNjVLhVaW5Mm6KFufzwEBvUIPpZs=', NULL, 0, 'raj', 'Raj', 'Garag', 'raj123@gmail.com', 0, 1, '2019-04-02 08:07:40.951155', NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'pbkdf2_sha256$120000$uUuPGFRnvqLi$S8CfmIhM9fKfYIrL76lboKuF00QASGh1ugZoe8BhFVM=', NULL, 0, 'shakthy', 'Shakthy', 'Shiv', 'shakthy@gmail.com', 0, 1, '2019-04-02 08:08:06.156628', NULL, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, 4, NULL),
(6, 'pbkdf2_sha256$120000$PxICsAe3hinf$qcOxXCEV+5iKDWKP506B7KcnTvJ0W8R85Hji67saNMY=', '2019-04-02 08:28:24.863928', 0, 'sanketh', 'Sanketh', '', 'sanketh@gmail.com', 0, 1, '2019-04-02 08:08:28.847977', NULL, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, 3, 4),
(7, 'pbkdf2_sha256$120000$lhLxSLsKTxmZ$GG5Zbi7JwhDnryG9U2ZUqZdQ/pmFpGdY42AXqsblvA8=', NULL, 0, 'shailesh', 'Shailesh', 'Rao', 'shailesh@gmail.com', 0, 1, '2019-04-02 08:08:49.314905', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'pbkdf2_sha256$120000$GITzjq3jecqO$qIwlf3z9xdCZUNQhYrItSCGkkZCcIF+zzIwb933fhdI=', '2019-04-02 08:27:46.125875', 0, 'samarth', 'Samarth', 'MS', 'samarth@gmail.com', 0, 1, '2019-04-02 08:09:08.275391', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'pbkdf2_sha256$120000$vylp73f0oijT$+/G4Zy/mO3uiAf+yyMWaNO2uwv3NRCLekHju/EDpOKc=', NULL, 0, 'preetham', 'Preetham', '', 'preetham@gmail.com', 0, 1, '2019-04-02 08:09:32.311766', NULL, 0, 0, 0, NULL, NULL, NULL, 2, NULL, NULL, NULL),
(10, 'pbkdf2_sha256$120000$GbSTUpCoZYIO$jGmY5iVeTqkkNyiI/H7yBPwdx5ChGk8nQd21hqCJBpw=', NULL, 0, 'arjun', 'Arjun', 'Ach', 'arjun@gmail.com', 0, 1, '2019-04-02 08:10:19.048665', NULL, 0, 0, 0, NULL, NULL, NULL, 2, NULL, NULL, NULL),
(11, 'pbkdf2_sha256$120000$1QGUaMg3l7jG$4/t8EHb2Sye+qrUDjWy4KU+xLaTBjjWe5WPlwhIHhzw=', NULL, 0, 'abhinav', 'Abhinav', 'Upadhya', 'abhinav@gmail.com', 0, 1, '2019-04-02 08:10:44.940896', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 'pbkdf2_sha256$120000$GGzReVNAuiSQ$UWGnx7GorsoKSmCH1LEF5RfqGut5mT/6OEBDCH0kZKs=', '2019-04-02 09:17:22.732309', 0, 'xyz', 'xyz', 'xyz', 'xyz@gmail.com', 0, 1, '2019-04-02 09:17:17.929743', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_user_groups`
--

CREATE TABLE `accounts_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_user_user_permissions`
--

CREATE TABLE `accounts_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_workson`
--

CREATE TABLE `accounts_workson` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add works on', 6, 'add_workson'),
(22, 'Can change works on', 6, 'change_workson'),
(23, 'Can delete works on', 6, 'delete_workson'),
(24, 'Can view works on', 6, 'view_workson'),
(25, 'Can add dependent', 7, 'add_dependent'),
(26, 'Can change dependent', 7, 'change_dependent'),
(27, 'Can delete dependent', 7, 'delete_dependent'),
(28, 'Can view dependent', 7, 'view_dependent'),
(29, 'Can add user', 8, 'add_user'),
(30, 'Can change user', 8, 'change_user'),
(31, 'Can delete user', 8, 'delete_user'),
(32, 'Can view user', 8, 'view_user'),
(33, 'Can add designation', 9, 'add_designation'),
(34, 'Can change designation', 9, 'change_designation'),
(35, 'Can delete designation', 9, 'delete_designation'),
(36, 'Can view designation', 9, 'view_designation'),
(37, 'Can add location', 10, 'add_location'),
(38, 'Can change location', 10, 'change_location'),
(39, 'Can delete location', 10, 'delete_location'),
(40, 'Can view location', 10, 'view_location'),
(41, 'Can add project', 11, 'add_project'),
(42, 'Can change project', 11, 'change_project'),
(43, 'Can delete project', 11, 'delete_project'),
(44, 'Can view project', 11, 'view_project'),
(45, 'Can add department', 12, 'add_department'),
(46, 'Can change department', 12, 'change_department'),
(47, 'Can delete department', 12, 'delete_department'),
(48, 'Can view department', 12, 'view_department'),
(49, 'Can add leave', 13, 'add_leave'),
(50, 'Can change leave', 13, 'change_leave'),
(51, 'Can delete leave', 13, 'delete_leave'),
(52, 'Can view leave', 13, 'view_leave'),
(53, 'Can add salary', 14, 'add_salary'),
(54, 'Can change salary', 14, 'change_salary'),
(55, 'Can delete salary', 14, 'delete_salary'),
(56, 'Can view salary', 14, 'view_salary'),
(57, 'Can add backup', 15, 'add_backup'),
(58, 'Can change backup', 15, 'change_backup'),
(59, 'Can delete backup', 15, 'delete_backup'),
(60, 'Can view backup', 15, 'view_backup'),
(61, 'Can add backup user', 16, 'add_backupuser'),
(62, 'Can change backup user', 16, 'change_backupuser'),
(63, 'Can delete backup user', 16, 'delete_backupuser'),
(64, 'Can view backup user', 16, 'view_backupuser');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2019-04-02 08:04:45.164847', '1', 'Root ', 2, '[{"changed": {"fields": ["first_name", "is_admin"]}}]', 8, 1),
(2, '2019-04-02 08:05:13.893332', '1', 'Root ', 2, '[{"changed": {"fields": ["is_approved"]}}]', 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(12, 'accounts', 'department'),
(7, 'accounts', 'dependent'),
(9, 'accounts', 'designation'),
(10, 'accounts', 'location'),
(11, 'accounts', 'project'),
(8, 'accounts', 'user'),
(6, 'accounts', 'workson'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(13, 'leaves', 'leave'),
(15, 'log', 'backup'),
(16, 'log', 'backupuser'),
(14, 'salary', 'salary'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2019-04-02 08:02:14.992118'),
(2, 'contenttypes', '0002_remove_content_type_name', '2019-04-02 08:02:16.278136'),
(3, 'auth', '0001_initial', '2019-04-02 08:02:20.631964'),
(4, 'auth', '0002_alter_permission_name_max_length', '2019-04-02 08:02:20.766045'),
(5, 'auth', '0003_alter_user_email_max_length', '2019-04-02 08:02:20.818452'),
(6, 'auth', '0004_alter_user_username_opts', '2019-04-02 08:02:20.881304'),
(7, 'auth', '0005_alter_user_last_login_null', '2019-04-02 08:02:20.932390'),
(8, 'auth', '0006_require_contenttypes_0002', '2019-04-02 08:02:20.973573'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2019-04-02 08:02:21.029568'),
(10, 'auth', '0008_alter_user_username_max_length', '2019-04-02 08:02:21.086983'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2019-04-02 08:02:21.142223'),
(12, 'accounts', '0001_initial', '2019-04-02 08:02:38.884741'),
(13, 'admin', '0001_initial', '2019-04-02 08:02:40.734899'),
(14, 'admin', '0002_logentry_remove_auto_add', '2019-04-02 08:02:40.808308'),
(15, 'admin', '0003_logentry_add_action_flag_choices', '2019-04-02 08:02:40.914263'),
(16, 'leaves', '0001_initial', '2019-04-02 08:02:42.015981'),
(17, 'log', '0001_initial', '2019-04-02 08:02:52.304067'),
(18, 'salary', '0001_initial', '2019-04-02 08:02:53.609058'),
(19, 'sessions', '0001_initial', '2019-04-02 08:02:54.237286');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('813b2vjujcf13ci2miecinsjrgjxcg0x', 'NGJmOTU2N2JmZmYzYjFiMTllYTU0NjA3NjcyZjJmNGQwMWFiYTBkMzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJlMDRlOTYwOTFkNzBjNDE1NjVkYzE0YmZjZTc2YTExOGE5OGM0NDNlIn0=', '2019-04-16 09:49:20.933327');

-- --------------------------------------------------------

--
-- Table structure for table `leaves_leave`
--

CREATE TABLE `leaves_leave` (
  `id` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `is_approved` tinyint(1) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `eid_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leaves_leave`
--

INSERT INTO `leaves_leave` (`id`, `from_date`, `to_date`, `is_approved`, `reason`, `eid_id`) VALUES
(2, '2019-04-04', '2019-04-04', 0, 'Vacation', 6),
(3, '2019-04-03', '2019-04-03', 0, 'Sick', 2);

-- --------------------------------------------------------

--
-- Table structure for table `log_backup`
--

CREATE TABLE `log_backup` (
  `id` int(11) NOT NULL,
  `time` datetime(6) NOT NULL,
  `by_id` int(11) NOT NULL,
  `from_data_id` int(11) NOT NULL,
  `on_user_id` int(11) NOT NULL,
  `to_data_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log_backup`
--

INSERT INTO `log_backup` (`id`, `time`, `by_id`, `from_data_id`, `on_user_id`, `to_data_id`) VALUES
(1, '2019-04-02 08:11:05.953890', 1, 1, 2, 2),
(2, '2019-04-02 08:11:13.060923', 1, 3, 3, 4),
(3, '2019-04-02 08:11:22.459814', 1, 5, 4, 6),
(4, '2019-04-02 08:11:49.748412', 1, 7, 2, 8),
(5, '2019-04-02 08:11:57.147159', 1, 9, 3, 10),
(6, '2019-04-02 08:12:08.862465', 1, 11, 4, 12),
(7, '2019-04-02 08:17:18.165376', 1, 13, 5, 14),
(8, '2019-04-02 08:17:30.298187', 1, 15, 6, 16),
(9, '2019-04-02 08:25:59.312209', 1, 17, 6, 18),
(10, '2019-04-02 08:28:16.465189', 3, 19, 6, 20),
(11, '2019-04-02 09:10:46.897165', 1, 21, 4, 22),
(12, '2019-04-02 09:31:05.635055', 1, 23, 9, 24),
(13, '2019-04-02 09:31:14.525898', 1, 25, 10, 26);

-- --------------------------------------------------------

--
-- Table structure for table `log_backupuser`
--

CREATE TABLE `log_backupuser` (
  `id` int(11) NOT NULL,
  `eid` int(11) DEFAULT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `is_hr` tinyint(1) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT NULL,
  `is_approved` tinyint(1) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `designation_id` int(11) DEFAULT NULL,
  `hr_id` int(11) DEFAULT NULL,
  `supervisor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log_backupuser`
--

INSERT INTO `log_backupuser` (`id`, `eid`, `first_name`, `last_name`, `is_hr`, `is_admin`, `is_approved`, `address`, `salary`, `dob`, `dept_id`, `designation_id`, `hr_id`, `supervisor_id`) VALUES
(1, NULL, 'Rohan', 'Murthy', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, NULL, 'Rohan', 'Murthy', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, NULL, 'Suhas', 'HR', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, NULL, 'Suhas', 'HR', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, NULL, 'Raj', 'Garag', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, NULL, 'Raj', 'Garag', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, NULL, 'Rohan', 'Murthy', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, NULL, 'Rohan', 'Murthy', 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, NULL, 'Suhas', 'HR', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, NULL, 'Suhas', 'HR', 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, NULL, 'Raj', 'Garag', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, NULL, 'Raj', 'Garag', 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, NULL, 'Shakthy', 'Shiv', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, NULL, 'Shakthy', 'Shiv', 0, 0, 1, NULL, NULL, NULL, NULL, NULL, 4, NULL),
(15, NULL, 'Sanketh', '', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, NULL, 'Sanketh', '', 0, 0, 1, NULL, NULL, NULL, NULL, NULL, 2, NULL),
(17, NULL, 'Sanketh', '', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, NULL, 'Sanketh', '', 0, 0, 1, NULL, NULL, NULL, NULL, NULL, 3, NULL),
(19, NULL, 'Sanketh', '', 0, 0, 1, NULL, NULL, NULL, NULL, NULL, 3, NULL),
(20, NULL, 'Sanketh', '', 0, 0, 1, NULL, NULL, NULL, NULL, NULL, 3, 4),
(21, NULL, 'Raj', 'Garag', 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, NULL, 'Raj', 'Garag', 1, 0, 1, 'Blore', NULL, NULL, NULL, NULL, NULL, NULL),
(23, NULL, 'Preetham', '', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, NULL, 'Preetham', '', 0, 0, 0, NULL, NULL, NULL, 2, NULL, NULL, NULL),
(25, NULL, 'Arjun', 'Ach', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, NULL, 'Arjun', 'Ach', 0, 0, 0, NULL, NULL, NULL, 2, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `salary_salary`
--

CREATE TABLE `salary_salary` (
  `id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `date` datetime(6) NOT NULL,
  `emp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salary_salary`
--

INSERT INTO `salary_salary` (`id`, `amount`, `date`, `emp_id`) VALUES
(1, 20000, '2019-04-01 18:30:00.000000', 3),
(2, 25000, '2019-04-01 18:30:00.000000', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts_department`
--
ALTER TABLE `accounts_department`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `accounts_department_manager_id_ff5f1cc2_fk_accounts_user_id` (`manager_id`);

--
-- Indexes for table `accounts_dependent`
--
ALTER TABLE `accounts_dependent`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_dependent_emp_id_name_b1041337_uniq` (`emp_id`,`name`);

--
-- Indexes for table `accounts_designation`
--
ALTER TABLE `accounts_designation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `accounts_location`
--
ALTER TABLE `accounts_location`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_location_deptno_id_location_bfcb7d13_uniq` (`deptno_id`,`location`);

--
-- Indexes for table `accounts_project`
--
ALTER TABLE `accounts_project`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `accounts_project_handledby_id_4fb2a1a9_fk_accounts_department_id` (`handledby_id`);

--
-- Indexes for table `accounts_user`
--
ALTER TABLE `accounts_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `accounts_user_dept_id_1a6d362f_fk_accounts_department_id` (`dept_id`),
  ADD KEY `accounts_user_designation_id_8a91ad5d_fk_accounts_designation_id` (`designation_id`),
  ADD KEY `accounts_user_hr_id_4caf727f_fk_accounts_user_id` (`hr_id`),
  ADD KEY `accounts_user_supervisor_id_f571ce05_fk_accounts_user_id` (`supervisor_id`);

--
-- Indexes for table `accounts_user_groups`
--
ALTER TABLE `accounts_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_user_groups_user_id_group_id_59c0b32f_uniq` (`user_id`,`group_id`),
  ADD KEY `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `accounts_user_user_permissions`
--
ALTER TABLE `accounts_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq` (`user_id`,`permission_id`),
  ADD KEY `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `accounts_workson`
--
ALTER TABLE `accounts_workson`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_workson_employee_id_7d94af40_fk_accounts_user_id` (`employee_id`),
  ADD KEY `accounts_workson_project_id_8df5ea4b_fk_accounts_project_id` (`project_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_accounts_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `leaves_leave`
--
ALTER TABLE `leaves_leave`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leaves_leave_eid_id_70e9f9d4_fk_accounts_user_id` (`eid_id`);

--
-- Indexes for table `log_backup`
--
ALTER TABLE `log_backup`
  ADD PRIMARY KEY (`id`),
  ADD KEY `log_backup_by_id_f13cf08c_fk_accounts_user_id` (`by_id`),
  ADD KEY `log_backup_from_data_id_4e64fd58_fk_log_backupuser_id` (`from_data_id`),
  ADD KEY `log_backup_on_user_id_2ffa43b2_fk_accounts_user_id` (`on_user_id`),
  ADD KEY `log_backup_to_data_id_d4db796b_fk_log_backupuser_id` (`to_data_id`);

--
-- Indexes for table `log_backupuser`
--
ALTER TABLE `log_backupuser`
  ADD PRIMARY KEY (`id`),
  ADD KEY `log_backupuser_dept_id_c5090f3a_fk_accounts_department_id` (`dept_id`),
  ADD KEY `log_backupuser_designation_id_f30956c9_fk_accounts_` (`designation_id`),
  ADD KEY `log_backupuser_hr_id_fc2822f9_fk_accounts_user_id` (`hr_id`),
  ADD KEY `log_backupuser_supervisor_id_be8c4419_fk_accounts_user_id` (`supervisor_id`);

--
-- Indexes for table `salary_salary`
--
ALTER TABLE `salary_salary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salary_salary_emp_id_ddc8b6ed_fk_accounts_user_id` (`emp_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts_department`
--
ALTER TABLE `accounts_department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `accounts_dependent`
--
ALTER TABLE `accounts_dependent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `accounts_designation`
--
ALTER TABLE `accounts_designation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `accounts_location`
--
ALTER TABLE `accounts_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `accounts_project`
--
ALTER TABLE `accounts_project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `accounts_user`
--
ALTER TABLE `accounts_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `accounts_user_groups`
--
ALTER TABLE `accounts_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `accounts_user_user_permissions`
--
ALTER TABLE `accounts_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `accounts_workson`
--
ALTER TABLE `accounts_workson`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `leaves_leave`
--
ALTER TABLE `leaves_leave`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `log_backup`
--
ALTER TABLE `log_backup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `log_backupuser`
--
ALTER TABLE `log_backupuser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `salary_salary`
--
ALTER TABLE `salary_salary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts_department`
--
ALTER TABLE `accounts_department`
  ADD CONSTRAINT `accounts_department_manager_id_ff5f1cc2_fk_accounts_user_id` FOREIGN KEY (`manager_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `accounts_dependent`
--
ALTER TABLE `accounts_dependent`
  ADD CONSTRAINT `accounts_dependent_emp_id_3ccdd093_fk_accounts_user_id` FOREIGN KEY (`emp_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `accounts_location`
--
ALTER TABLE `accounts_location`
  ADD CONSTRAINT `accounts_location_deptno_id_b0e19fa3_fk_accounts_department_id` FOREIGN KEY (`deptno_id`) REFERENCES `accounts_department` (`id`);

--
-- Constraints for table `accounts_project`
--
ALTER TABLE `accounts_project`
  ADD CONSTRAINT `accounts_project_handledby_id_4fb2a1a9_fk_accounts_department_id` FOREIGN KEY (`handledby_id`) REFERENCES `accounts_department` (`id`);

--
-- Constraints for table `accounts_user`
--
ALTER TABLE `accounts_user`
  ADD CONSTRAINT `accounts_user_dept_id_1a6d362f_fk_accounts_department_id` FOREIGN KEY (`dept_id`) REFERENCES `accounts_department` (`id`),
  ADD CONSTRAINT `accounts_user_designation_id_8a91ad5d_fk_accounts_designation_id` FOREIGN KEY (`designation_id`) REFERENCES `accounts_designation` (`id`),
  ADD CONSTRAINT `accounts_user_hr_id_4caf727f_fk_accounts_user_id` FOREIGN KEY (`hr_id`) REFERENCES `accounts_user` (`id`),
  ADD CONSTRAINT `accounts_user_supervisor_id_f571ce05_fk_accounts_user_id` FOREIGN KEY (`supervisor_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `accounts_user_groups`
--
ALTER TABLE `accounts_user_groups`
  ADD CONSTRAINT `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `accounts_user_groups_user_id_52b62117_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `accounts_user_user_permissions`
--
ALTER TABLE `accounts_user_user_permissions`
  ADD CONSTRAINT `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `accounts_user_user_p_user_id_e4f0a161_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `accounts_workson`
--
ALTER TABLE `accounts_workson`
  ADD CONSTRAINT `accounts_workson_employee_id_7d94af40_fk_accounts_user_id` FOREIGN KEY (`employee_id`) REFERENCES `accounts_user` (`id`),
  ADD CONSTRAINT `accounts_workson_project_id_8df5ea4b_fk_accounts_project_id` FOREIGN KEY (`project_id`) REFERENCES `accounts_project` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `leaves_leave`
--
ALTER TABLE `leaves_leave`
  ADD CONSTRAINT `leaves_leave_eid_id_70e9f9d4_fk_accounts_user_id` FOREIGN KEY (`eid_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `log_backup`
--
ALTER TABLE `log_backup`
  ADD CONSTRAINT `log_backup_by_id_f13cf08c_fk_accounts_user_id` FOREIGN KEY (`by_id`) REFERENCES `accounts_user` (`id`),
  ADD CONSTRAINT `log_backup_from_data_id_4e64fd58_fk_log_backupuser_id` FOREIGN KEY (`from_data_id`) REFERENCES `log_backupuser` (`id`),
  ADD CONSTRAINT `log_backup_on_user_id_2ffa43b2_fk_accounts_user_id` FOREIGN KEY (`on_user_id`) REFERENCES `accounts_user` (`id`),
  ADD CONSTRAINT `log_backup_to_data_id_d4db796b_fk_log_backupuser_id` FOREIGN KEY (`to_data_id`) REFERENCES `log_backupuser` (`id`);

--
-- Constraints for table `log_backupuser`
--
ALTER TABLE `log_backupuser`
  ADD CONSTRAINT `log_backupuser_dept_id_c5090f3a_fk_accounts_department_id` FOREIGN KEY (`dept_id`) REFERENCES `accounts_department` (`id`),
  ADD CONSTRAINT `log_backupuser_designation_id_f30956c9_fk_accounts_` FOREIGN KEY (`designation_id`) REFERENCES `accounts_designation` (`id`),
  ADD CONSTRAINT `log_backupuser_hr_id_fc2822f9_fk_accounts_user_id` FOREIGN KEY (`hr_id`) REFERENCES `accounts_user` (`id`),
  ADD CONSTRAINT `log_backupuser_supervisor_id_be8c4419_fk_accounts_user_id` FOREIGN KEY (`supervisor_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `salary_salary`
--
ALTER TABLE `salary_salary`
  ADD CONSTRAINT `salary_salary_emp_id_ddc8b6ed_fk_accounts_user_id` FOREIGN KEY (`emp_id`) REFERENCES `accounts_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
