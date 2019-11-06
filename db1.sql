-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.7.24 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for coursera
CREATE DATABASE IF NOT EXISTS `coursera` /*!40100 DEFAULT CHARACTER SET utf32 COLLATE utf32_unicode_ci */;
USE `coursera`;

-- Dumping structure for table coursera.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table coursera.categories: ~2 rows (approximately)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
REPLACE INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
	(1, NULL, 1, 'Category 1', 'category-1', '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(2, NULL, 1, 'Category 2', 'category-2', '2019-11-05 13:58:42', '2019-11-05 13:58:42');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Dumping structure for table coursera.courses
CREATE TABLE IF NOT EXISTS `courses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` float DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `theme_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table coursera.courses: ~0 rows (approximately)
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;

-- Dumping structure for table coursera.data_rows
CREATE TABLE IF NOT EXISTS `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table coursera.data_rows: ~79 rows (approximately)
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
REPLACE INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
	(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
	(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
	(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 3),
	(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '{}', 4),
	(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 5),
	(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 6),
	(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
	(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 8),
	(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsTo","column":"role_id","key":"id","label":"display_name","pivot_table":"roles","pivot":"0","taggable":"0"}', 10),
	(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsToMany","column":"id","key":"id","label":"display_name","pivot_table":"user_roles","pivot":"1","taggable":"0"}', 11),
	(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 12),
	(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
	(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
	(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
	(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
	(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
	(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
	(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
	(21, 1, 'role_id', 'text', 'Role', 0, 1, 1, 1, 1, 1, '{}', 9),
	(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{"default":"","null":"","options":{"":"-- None --"},"relationship":{"key":"id","label":"name"}}', 2),
	(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{"default":1}', 3),
	(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
	(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{"slugify":{"origin":"name"}}', 5),
	(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
	(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
	(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
	(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
	(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
	(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
	(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
	(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{"resize":{"width":"1000","height":"null"},"quality":"70%","upsize":true,"thumbnails":[{"name":"medium","scale":"50%"},{"name":"small","scale":"25%"},{"name":"cropped","crop":{"width":"300","height":"250"}}]}', 7),
	(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{"slugify":{"origin":"title","forceUpdate":true},"validation":{"rule":"unique:posts,slug"}}', 8),
	(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
	(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
	(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{"default":"DRAFT","options":{"PUBLISHED":"published","DRAFT":"draft","PENDING":"pending"}}', 11),
	(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
	(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
	(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
	(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
	(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
	(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
	(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
	(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
	(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{"slugify":{"origin":"title"},"validation":{"rule":"unique:pages,slug"}}', 6),
	(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
	(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
	(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{"default":"INACTIVE","options":{"INACTIVE":"INACTIVE","ACTIVE":"ACTIVE"}}', 9),
	(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
	(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
	(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
	(56, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(57, 7, 'label', 'text', 'Label', 0, 1, 1, 1, 1, 1, '{}', 2),
	(58, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
	(59, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
	(60, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 1, 1, 1, 1, 1, '{}', 6),
	(61, 1, 'profile_id', 'text', 'Profile Id', 0, 1, 1, 1, 1, 1, '{}', 12),
	(62, 1, 'user_belongsto_profile_relationship', 'relationship', 'profile', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Profile","table":"profiles","type":"belongsTo","column":"profile_id","key":"id","label":"label","pivot_table":"categories","pivot":"0","taggable":"0"}', 13),
	(63, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(64, 8, 'title', 'text', 'Title', 0, 1, 1, 1, 1, 1, '{}', 2),
	(65, 8, 'description', 'text', 'Description', 0, 1, 1, 1, 1, 1, '{}', 3),
	(66, 8, 'image', 'text', 'Image', 0, 1, 1, 1, 1, 1, '{}', 4),
	(67, 8, 'link', 'text', 'Link', 0, 1, 1, 1, 1, 1, '{}', 5),
	(68, 8, 'price', 'text', 'Price', 0, 1, 1, 1, 1, 1, '{}', 6),
	(69, 8, 'user_id', 'select_dropdown', 'User Id', 0, 1, 1, 1, 1, 1, '{}', 7),
	(70, 8, 'theme_id', 'select_dropdown', 'Theme Id', 0, 1, 1, 1, 1, 1, '{}', 8),
	(71, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 9),
	(72, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10),
	(73, 8, 'course_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{"model":"TCG\\\\Voyager\\\\Models\\\\User","table":"users","type":"belongsTo","column":"user_id","key":"id","label":"name","pivot_table":"categories","pivot":"0","taggable":null}', 11),
	(74, 8, 'course_belongsto_theme_relationship', 'relationship', 'themes', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Theme","table":"themes","type":"belongsTo","column":"id","key":"id","label":"label","pivot_table":"categories","pivot":"0","taggable":null}', 12),
	(75, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(76, 9, 'label', 'text', 'Label', 0, 1, 1, 1, 1, 1, '{}', 2),
	(77, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
	(78, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
	(79, 9, 'active', 'text', 'Active', 0, 1, 1, 1, 1, 1, '{}', 5);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;

-- Dumping structure for table coursera.data_types
CREATE TABLE IF NOT EXISTS `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table coursera.data_types: ~9 rows (approximately)
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
REPLACE INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
	(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"desc","default_search_key":null,"scope":null}', '2019-11-05 13:58:38', '2019-11-05 16:31:41'),
	(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2019-11-05 13:58:38', '2019-11-05 13:58:38'),
	(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2019-11-05 13:58:38', '2019-11-05 13:58:38'),
	(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(7, 'profiles', 'profiles', 'Profile', 'Profiles', NULL, 'App\\Profile', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}', '2019-11-05 14:15:08', '2019-11-05 14:15:08'),
	(8, 'courses', 'courses', 'Course', 'Courses', NULL, 'App\\Course', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}', '2019-11-05 16:49:10', '2019-11-05 16:49:10'),
	(9, 'themes', 'themes', 'Theme', 'Themes', NULL, 'App\\Theme', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}', '2019-11-05 16:56:33', '2019-11-05 16:56:33');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;

-- Dumping structure for table coursera.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table coursera.failed_jobs: ~0 rows (approximately)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table coursera.menus
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table coursera.menus: ~1 rows (approximately)
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
REPLACE INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', '2019-11-05 13:58:38', '2019-11-05 13:58:38');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;

-- Dumping structure for table coursera.menu_items
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table coursera.menu_items: ~21 rows (approximately)
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
REPLACE INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
	(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2019-11-05 13:58:38', '2019-11-05 13:58:38', 'voyager.dashboard', NULL),
	(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 6, '2019-11-05 13:58:38', '2019-11-05 16:57:49', 'voyager.media.index', NULL),
	(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2019-11-05 13:58:38', '2019-11-05 13:58:38', 'voyager.users.index', NULL),
	(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2019-11-05 13:58:38', '2019-11-05 13:58:38', 'voyager.roles.index', NULL),
	(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 10, '2019-11-05 13:58:38', '2019-11-05 17:00:05', NULL, NULL),
	(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2019-11-05 13:58:38', '2019-11-05 16:28:42', 'voyager.menus.index', NULL),
	(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2019-11-05 13:58:38', '2019-11-05 16:28:42', 'voyager.database.index', NULL),
	(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2019-11-05 13:58:38', '2019-11-05 16:28:42', 'voyager.compass.index', NULL),
	(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2019-11-05 13:58:38', '2019-11-05 16:28:42', 'voyager.bread.index', NULL),
	(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 11, '2019-11-05 13:58:38', '2019-11-05 17:00:05', 'voyager.settings.index', NULL),
	(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 9, '2019-11-05 13:58:42', '2019-11-05 17:00:05', 'voyager.categories.index', NULL),
	(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 7, '2019-11-05 13:58:42', '2019-11-05 16:57:49', 'voyager.posts.index', NULL),
	(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 8, '2019-11-05 13:58:42', '2019-11-05 16:57:49', 'voyager.pages.index', NULL),
	(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2019-11-05 13:58:43', '2019-11-05 16:28:42', 'voyager.hooks', NULL),
	(15, 1, 'Profiles', '', '_self', NULL, NULL, NULL, 12, '2019-11-05 14:15:08', '2019-11-05 17:00:05', 'voyager.profiles.index', NULL),
	(16, 1, 'Profiles', '/admin/profiles', '_self', 'voyager-person', '#000000', NULL, 4, '2019-11-05 16:28:28', '2019-11-05 16:29:27', NULL, ''),
	(17, 1, 'Courses', '', '_self', NULL, NULL, NULL, 13, '2019-11-05 16:49:10', '2019-11-05 17:00:05', 'voyager.courses.index', NULL),
	(18, 1, 'Themes', '', '_self', NULL, NULL, NULL, 14, '2019-11-05 16:56:33', '2019-11-05 17:00:05', 'voyager.themes.index', NULL),
	(19, 1, 'school', '', '_self', NULL, '#000000', NULL, 5, '2019-11-05 16:57:28', '2019-11-05 16:57:49', NULL, ''),
	(20, 1, 'themes', '/admin/themes', '_self', 'voyager-book', '#000000', 19, 1, '2019-11-05 16:59:09', '2019-11-05 16:59:57', NULL, ''),
	(21, 1, 'Courses', '/admin/courses', '_self', 'voyager-bulb', '#000000', 19, 2, '2019-11-05 16:59:38', '2019-11-05 17:00:05', NULL, '');
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;

-- Dumping structure for table coursera.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table coursera.migrations: ~27 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
REPLACE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2016_01_01_000000_add_voyager_user_fields', 1),
	(4, '2016_01_01_000000_create_data_types_table', 1),
	(5, '2016_05_19_173453_create_menu_table', 1),
	(6, '2016_10_21_190000_create_roles_table', 1),
	(7, '2016_10_21_190000_create_settings_table', 1),
	(8, '2016_11_30_135954_create_permission_table', 1),
	(9, '2016_11_30_141208_create_permission_role_table', 1),
	(10, '2016_12_26_201236_data_types__add__server_side', 1),
	(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
	(12, '2017_01_14_005015_create_translations_table', 1),
	(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
	(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
	(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
	(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
	(17, '2017_08_05_000000_add_group_to_settings_table', 1),
	(18, '2017_11_26_013050_add_user_role_relationship', 1),
	(19, '2017_11_26_015000_create_user_roles_table', 1),
	(20, '2018_03_11_000000_add_user_settings', 1),
	(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
	(22, '2018_03_16_000000_make_settings_value_nullable', 1),
	(23, '2019_08_19_000000_create_failed_jobs_table', 1),
	(24, '2016_01_01_000000_create_pages_table', 2),
	(25, '2016_01_01_000000_create_posts_table', 2),
	(26, '2016_02_15_204651_create_categories_table', 2),
	(27, '2017_04_11_000000_alter_post_nullable_fields_table', 2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table coursera.pages
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table coursera.pages: ~1 rows (approximately)
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
REPLACE INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
	(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2019-11-05 13:58:42', '2019-11-05 13:58:42');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;

-- Dumping structure for table coursera.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table coursera.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table coursera.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table coursera.permissions: ~56 rows (approximately)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
REPLACE INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
	(1, 'browse_admin', NULL, '2019-11-05 13:58:38', '2019-11-05 13:58:38'),
	(2, 'browse_bread', NULL, '2019-11-05 13:58:38', '2019-11-05 13:58:38'),
	(3, 'browse_database', NULL, '2019-11-05 13:58:38', '2019-11-05 13:58:38'),
	(4, 'browse_media', NULL, '2019-11-05 13:58:38', '2019-11-05 13:58:38'),
	(5, 'browse_compass', NULL, '2019-11-05 13:58:38', '2019-11-05 13:58:38'),
	(6, 'browse_menus', 'menus', '2019-11-05 13:58:38', '2019-11-05 13:58:38'),
	(7, 'read_menus', 'menus', '2019-11-05 13:58:38', '2019-11-05 13:58:38'),
	(8, 'edit_menus', 'menus', '2019-11-05 13:58:38', '2019-11-05 13:58:38'),
	(9, 'add_menus', 'menus', '2019-11-05 13:58:38', '2019-11-05 13:58:38'),
	(10, 'delete_menus', 'menus', '2019-11-05 13:58:38', '2019-11-05 13:58:38'),
	(11, 'browse_roles', 'roles', '2019-11-05 13:58:38', '2019-11-05 13:58:38'),
	(12, 'read_roles', 'roles', '2019-11-05 13:58:38', '2019-11-05 13:58:38'),
	(13, 'edit_roles', 'roles', '2019-11-05 13:58:38', '2019-11-05 13:58:38'),
	(14, 'add_roles', 'roles', '2019-11-05 13:58:38', '2019-11-05 13:58:38'),
	(15, 'delete_roles', 'roles', '2019-11-05 13:58:38', '2019-11-05 13:58:38'),
	(16, 'browse_users', 'users', '2019-11-05 13:58:38', '2019-11-05 13:58:38'),
	(17, 'read_users', 'users', '2019-11-05 13:58:38', '2019-11-05 13:58:38'),
	(18, 'edit_users', 'users', '2019-11-05 13:58:38', '2019-11-05 13:58:38'),
	(19, 'add_users', 'users', '2019-11-05 13:58:38', '2019-11-05 13:58:38'),
	(20, 'delete_users', 'users', '2019-11-05 13:58:38', '2019-11-05 13:58:38'),
	(21, 'browse_settings', 'settings', '2019-11-05 13:58:38', '2019-11-05 13:58:38'),
	(22, 'read_settings', 'settings', '2019-11-05 13:58:38', '2019-11-05 13:58:38'),
	(23, 'edit_settings', 'settings', '2019-11-05 13:58:38', '2019-11-05 13:58:38'),
	(24, 'add_settings', 'settings', '2019-11-05 13:58:38', '2019-11-05 13:58:38'),
	(25, 'delete_settings', 'settings', '2019-11-05 13:58:38', '2019-11-05 13:58:38'),
	(26, 'browse_categories', 'categories', '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(27, 'read_categories', 'categories', '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(28, 'edit_categories', 'categories', '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(29, 'add_categories', 'categories', '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(30, 'delete_categories', 'categories', '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(31, 'browse_posts', 'posts', '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(32, 'read_posts', 'posts', '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(33, 'edit_posts', 'posts', '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(34, 'add_posts', 'posts', '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(35, 'delete_posts', 'posts', '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(36, 'browse_pages', 'pages', '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(37, 'read_pages', 'pages', '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(38, 'edit_pages', 'pages', '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(39, 'add_pages', 'pages', '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(40, 'delete_pages', 'pages', '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(41, 'browse_hooks', NULL, '2019-11-05 13:58:43', '2019-11-05 13:58:43'),
	(42, 'browse_profiles', 'profiles', '2019-11-05 14:15:08', '2019-11-05 14:15:08'),
	(43, 'read_profiles', 'profiles', '2019-11-05 14:15:08', '2019-11-05 14:15:08'),
	(44, 'edit_profiles', 'profiles', '2019-11-05 14:15:08', '2019-11-05 14:15:08'),
	(45, 'add_profiles', 'profiles', '2019-11-05 14:15:08', '2019-11-05 14:15:08'),
	(46, 'delete_profiles', 'profiles', '2019-11-05 14:15:08', '2019-11-05 14:15:08'),
	(47, 'browse_courses', 'courses', '2019-11-05 16:49:10', '2019-11-05 16:49:10'),
	(48, 'read_courses', 'courses', '2019-11-05 16:49:10', '2019-11-05 16:49:10'),
	(49, 'edit_courses', 'courses', '2019-11-05 16:49:10', '2019-11-05 16:49:10'),
	(50, 'add_courses', 'courses', '2019-11-05 16:49:10', '2019-11-05 16:49:10'),
	(51, 'delete_courses', 'courses', '2019-11-05 16:49:10', '2019-11-05 16:49:10'),
	(52, 'browse_themes', 'themes', '2019-11-05 16:56:33', '2019-11-05 16:56:33'),
	(53, 'read_themes', 'themes', '2019-11-05 16:56:33', '2019-11-05 16:56:33'),
	(54, 'edit_themes', 'themes', '2019-11-05 16:56:33', '2019-11-05 16:56:33'),
	(55, 'add_themes', 'themes', '2019-11-05 16:56:33', '2019-11-05 16:56:33'),
	(56, 'delete_themes', 'themes', '2019-11-05 16:56:33', '2019-11-05 16:56:33');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for table coursera.permission_role
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table coursera.permission_role: ~55 rows (approximately)
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
REPLACE INTO `permission_role` (`permission_id`, `role_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(12, 1),
	(13, 1),
	(14, 1),
	(15, 1),
	(16, 1),
	(17, 1),
	(18, 1),
	(19, 1),
	(20, 1),
	(21, 1),
	(22, 1),
	(23, 1),
	(24, 1),
	(25, 1),
	(26, 1),
	(27, 1),
	(28, 1),
	(29, 1),
	(30, 1),
	(31, 1),
	(32, 1),
	(33, 1),
	(34, 1),
	(35, 1),
	(36, 1),
	(37, 1),
	(38, 1),
	(39, 1),
	(40, 1),
	(42, 1),
	(43, 1),
	(44, 1),
	(45, 1),
	(46, 1),
	(47, 1),
	(48, 1),
	(49, 1),
	(50, 1),
	(51, 1),
	(52, 1),
	(53, 1),
	(54, 1),
	(55, 1),
	(56, 1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;

-- Dumping structure for table coursera.posts
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table coursera.posts: ~5 rows (approximately)
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
REPLACE INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
	(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(5, 1, 1, 'My first post in laravel voyager', NULL, NULL, '<div style="color: #eeffff; background-color: #263238; font-family: Consolas, \'Courier New\', monospace; line-height: 19px; white-space: pre;">Lorem ipsum dolor sit amet consectetur adipisicing elit. Soluta, ex. Quae, eligendi quisquam accusantium quidem minus expedita unde odio ratione odit perferendis maxime cumque, soluta tenetur fuga quibusdam vero obcaecati? Harum cum nihil explicabo consequatur nobis eum rem voluptas tempora alias, eaque debitis maxime nemo quo! Rerum, dolor velit, harum molestiae quibusdam vitae itaque doloremque adipisci voluptates, quasi illum necessitatibus omnis! Voluptate consequatur non, fuga consequuntur quis necessitatibus veniam officiis aut asperiores harum eveniet quod! Debitis odit delectus tempore sed quis, laborum nemo? Sint quidem ipsam amet facere doloremque! Minima deleniti nesciunt eos facilis repellat itaque earum ullam aliquam eveniet voluptatem dicta, a doloremque mollitia eligendi dolor suscipit, eius officiis dolorum? Voluptatum, quae enim soluta iste nisi quam saepe expedita fugiat exercitationem natus quia, explicabo placeat quibusdam! Omnis deleniti temporibus quos dolorum saepe distinctio ad atque voluptates laboriosam, aperiam quam sit necessitatibus eum hic deserunt recusandae iusto nesciunt commodi laborum nemo iure a non. Nulla numquam aliquam explicabo commodi tempore ducimus consequuntur voluptatem consequatur laudantium, voluptatum officia impedit voluptate iste, nesciunt in molestiae quae assumenda possimus rem magni neque. Vero provident architecto numquam aliquam placeat nam? Alias sequi tempora optio, saepe asperiores labore harum atque blanditiis nisi, eum, earum minima.</div>', 'posts\\November2019\\MVGrKFefSxmBIRKNCQLI.jpg', 'my-first-post-in-laravel-voyager', NULL, NULL, 'PUBLISHED', 0, '2019-11-05 14:44:08', '2019-11-05 14:44:35');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;

-- Dumping structure for table coursera.profiles
CREATE TABLE IF NOT EXISTS `profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table coursera.profiles: ~2 rows (approximately)
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
REPLACE INTO `profiles` (`id`, `label`, `created_at`, `updated_at`) VALUES
	(1, 'Instructor', '2019-11-05 14:15:43', '2019-11-05 14:15:43'),
	(2, 'Student', '2019-11-05 16:30:06', '2019-11-05 16:30:06');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;

-- Dumping structure for table coursera.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table coursera.roles: ~2 rows (approximately)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
REPLACE INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'Administrator', '2019-11-05 13:58:38', '2019-11-05 13:58:38'),
	(2, 'user', 'Normal User', '2019-11-05 13:58:38', '2019-11-05 13:58:38');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table coursera.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table coursera.settings: ~10 rows (approximately)
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
REPLACE INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
	(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
	(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
	(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
	(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
	(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
	(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
	(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
	(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
	(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
	(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- Dumping structure for table coursera.themes
CREATE TABLE IF NOT EXISTS `themes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table coursera.themes: ~2 rows (approximately)
/*!40000 ALTER TABLE `themes` DISABLE KEYS */;
REPLACE INTO `themes` (`id`, `label`, `created_at`, `updated_at`, `active`) VALUES
	(1, 'Frontend', '2019-11-05 17:00:34', '2019-11-05 17:00:34', NULL),
	(2, 'Backend', '2019-11-05 17:00:47', '2019-11-05 17:00:47', NULL);
/*!40000 ALTER TABLE `themes` ENABLE KEYS */;

-- Dumping structure for table coursera.translations
CREATE TABLE IF NOT EXISTS `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table coursera.translations: ~30 rows (approximately)
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
REPLACE INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
	(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(21, 'menu_items', 'title', 2, 'pt', 'Media', '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2019-11-05 13:58:42', '2019-11-05 13:58:42'),
	(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2019-11-05 13:58:43', '2019-11-05 13:58:43'),
	(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2019-11-05 13:58:43', '2019-11-05 13:58:43'),
	(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2019-11-05 13:58:43', '2019-11-05 13:58:43');
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;

-- Dumping structure for table coursera.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `profile_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table coursera.users: ~1 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
REPLACE INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`, `profile_id`) VALUES
	(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$.xofll5fcOG.Ti3Df8OlrePyoPM54UMWNAzwPBbpOi7hrTdSB1fwm', 'GIhJJMM34kBMf9gymQIGP7NKOGrIZO2DNT98QkMvRPoNB5saWuE2f9OHodOC', NULL, '2019-11-05 13:58:42', '2019-11-05 13:58:42', 2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table coursera.user_roles
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table coursera.user_roles: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
