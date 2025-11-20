-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2025 at 07:29 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blogcms`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `filename` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `mime` varchar(255) DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `folder` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_11_18_063109_create_posts_table', 1),
(5, '2025_11_18_063110_create_media_table', 1),
(6, '2025_11_18_063110_create_pages_table', 1),
(7, '2025_11_19_085827_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `content`, `published`, `created_at`, `updated_at`) VALUES
(1, 'Faqs', 'faqs', '<h2><strong>CKEditor&nbsp;5 documentation</strong></h2><p><a href=\"https://ckeditor.com/docs/ckeditor5/latest/getting-started/index.html\">Getting started</a></p><p>Learn how to install, integrate and configure CKEditor&nbsp;5. More complex aspects, like using frameworks or styling your editor and content are explained here, too.</p><p><a href=\"https://ckeditor.com/docs/ckeditor5/latest/features/index.html\">Features</a></p><p>Learn about the plethora of features available for CKEditor&nbsp;5 for editing, productivity, collaboration and more!</p><p><a href=\"https://ckeditor.com/docs/ckeditor5/latest/examples/index.html\">Examples</a></p><p>Try out CKEditor&nbsp;5. See some of the possible customizations of CKEditor.</p><p><a href=\"https://ckeditor.com/docs/ckeditor5/latest/framework/index.html\">CKEditor&nbsp;5 Framework</a></p><p>Learn how to work with CKEditor&nbsp;5 Framework, customize it, create your own plugins and custom editors, change the UI or even bring your own UI to the editor.</p><p><a href=\"https://ckeditor.com/docs/ckeditor5/latest/api/index.html\">API Reference</a></p><p>The complete API documentation.</p><p><a href=\"https://ckeditor.com/docs/ckeditor5/latest/updating/index.html\">Updating and maintaining</a></p><p>Find out all about updating to the newest version, dealing with breaking changes, and other important information on how to maintain your CKEditor&nbsp;5. This section also covers migrating from CKEditor 4.</p><p><a href=\"https://ckeditor.com/docs/ckeditor5/latest/support/index.html\">Support</a></p><p>Need help with CKEditor&nbsp;5? Learn how to get support and find answers to the most frequently asked questions!</p><h2><strong>Contribute</strong></h2><p>CKEditor&nbsp;5 is an Open Source project and your contribution is most welcome. Feel free to <a href=\"https://ckeditor.com/docs/ckeditor5/latest/support/index.html#reporting-issues\">report bugs</a> or improve the code on <a href=\"https://github.com/ckeditor/ckeditor5\">GitHub</a>. Since CKEditor&nbsp;5 is localized, you can also help <a href=\"https://ckeditor.com/docs/ckeditor5/latest/framework/contributing/contributing.html#translating\">translating it</a>. You do not need to be a programmer to contribute to the project!</p>', 1, '2025-11-20 00:29:37', '2025-11-20 00:29:37');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'api-token', 'ee3f96c5598d5636d08da03396cccd66d4db1d9d2e0fd8ba362c2db834a4ce89', '[\"*\"]', '2025-11-20 00:29:39', NULL, '2025-11-19 23:12:05', '2025-11-20 00:29:39');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `excerpt` text DEFAULT NULL,
  `content` longtext NOT NULL,
  `published` tinyint(1) NOT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `featured_image` varchar(255) DEFAULT NULL,
  `meta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`meta`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `slug`, `excerpt`, `content`, `published`, `published_at`, `featured_image`, `meta`, `created_at`, `updated_at`) VALUES
(1, 1, 'How to Use Laravel 12 Effectively', 'how-to-use-laravel-12-effectively-QWwA9', NULL, '<p>Laravel 12 brings several new improvements...</p>', 1, NULL, 'posts/FfdMw3TNDxxcUtGgMzZ4f2p1SYOzpgD9tLOhG3xV.jpg', '{\"title\":\"meta title\",\"description\":\"meta description\"}', '2025-11-19 23:11:55', '2025-11-20 00:26:10'),
(2, 1, 'React + Laravel 12 Full Stack Guide', 'react-laravel-12-full-stack-guide-rFpzz', NULL, 'This guide explains how to connect React with Laravel 12...', 1, NULL, NULL, NULL, '2025-11-19 23:11:55', '2025-11-19 23:11:55'),
(3, 1, 'Why You Should Upgrade to Laravel 12', 'why-you-should-upgrade-to-laravel-12-aZ2KP', NULL, 'Laravel 12 introduces new architecture improvements...', 0, NULL, NULL, NULL, '2025-11-19 23:11:55', '2025-11-19 23:11:55'),
(4, 1, 'Dolorem velit harum voluptatum omnis aut ut quis maiores.', 'dolorem-velit-harum-voluptatum-omnis-aut-ut-quis-maiores-tDzt9', NULL, 'Expedita amet ut odio sint voluptates fuga cupiditate. Id id accusamus quia est. Omnis distinctio nostrum eum rem. Eveniet aliquid consequatur eos. Blanditiis ut minus magnam eos. Nulla recusandae sint excepturi veritatis unde omnis sequi.', 0, NULL, NULL, NULL, '2025-11-19 23:11:55', '2025-11-19 23:11:55'),
(5, 1, 'Esse fugit enim et sed et labore.', 'esse-fugit-enim-et-sed-et-labore-AhbIj', NULL, 'Voluptas sint aliquid aut recusandae est. Voluptatem nulla fugit nostrum est quasi. Perspiciatis quos voluptas illo voluptatum dolores iste. Corporis numquam nihil quo nemo distinctio. Labore labore numquam incidunt. Tenetur fugiat unde reiciendis qui. Laboriosam quibusdam nemo quae rerum et dolorem laborum. Molestiae eum architecto occaecati vero est in. Sit voluptate qui pariatur minima eaque. Nihil recusandae omnis dolores ipsa. Beatae ea pariatur incidunt ullam illo est.', 0, NULL, NULL, NULL, '2025-11-19 23:11:55', '2025-11-19 23:11:55'),
(6, 1, 'Aut inventore aut aut.', 'aut-inventore-aut-aut-nbK4E', NULL, 'Est amet et nobis impedit aut voluptates. Et esse unde et error. Itaque molestiae quaerat reprehenderit quas reiciendis provident voluptates. Qui maiores quia eligendi. Quis asperiores qui quo voluptatem exercitationem. Eaque qui dolorem expedita. Quod amet consequatur sit cum. Exercitationem adipisci ut id quasi ut. Numquam quia ab nesciunt ipsam ut. Quibusdam illo tempore ex a. Dolorem blanditiis sed adipisci incidunt.', 1, NULL, NULL, NULL, '2025-11-19 23:11:55', '2025-11-19 23:11:55'),
(7, 1, 'At at suscipit mollitia sed voluptas nihil facere.', 'at-at-suscipit-mollitia-sed-voluptas-nihil-facere-Msa1D', NULL, 'Consectetur nemo consequuntur et non et. Reprehenderit fugit est soluta rem maiores libero. Occaecati facere nostrum repudiandae ex porro veniam. Aut libero sunt asperiores. Incidunt tenetur ut aut consequatur quibusdam id reprehenderit.', 1, NULL, NULL, NULL, '2025-11-19 23:11:55', '2025-11-19 23:11:55'),
(8, 1, 'Similique ducimus voluptas odit eos esse quia exercitationem.', 'similique-ducimus-voluptas-odit-eos-esse-quia-exercitationem-UxZBH', NULL, 'Minima fugiat autem inventore quaerat odit. Sint voluptatibus facilis qui quibusdam placeat ea. Voluptatem optio quae tempore dolorum. Eligendi mollitia aut modi reprehenderit. Voluptate est autem voluptates fugit ipsum. Dolores quod quo aliquam pariatur animi ut ut deserunt. Ut nisi aut dolor delectus. Ea est facilis neque quisquam. Praesentium enim minima laudantium veniam sed quis unde. Officiis quae voluptatem minus animi perferendis dolorum.', 0, NULL, NULL, NULL, '2025-11-19 23:11:55', '2025-11-19 23:11:55'),
(9, 1, 'Ipsum et veniam et voluptates et.', 'ipsum-et-veniam-et-voluptates-et-JTUIA', NULL, 'Dolorem illum debitis autem perferendis. Velit mollitia et dolores sint occaecati quia consequatur adipisci. Rerum et eos corrupti autem ipsum voluptatem omnis. Repudiandae assumenda laudantium vitae quisquam incidunt sunt sit. Sunt placeat ex excepturi sed omnis eum. Magnam voluptatibus nihil assumenda id nostrum necessitatibus. Sit maiores quo nisi.', 1, NULL, NULL, NULL, '2025-11-19 23:11:55', '2025-11-19 23:11:55'),
(10, 1, 'Tenetur qui voluptatem voluptas odio asperiores.', 'tenetur-qui-voluptatem-voluptas-odio-asperiores-YLRoP', NULL, 'Ut laudantium molestiae necessitatibus et vel laboriosam. Quae sed id eos quos itaque. Vel fugiat odit nulla. Ut et debitis accusamus eaque rerum modi. Nihil non sunt voluptatibus porro qui aspernatur eum. Doloribus quidem laudantium voluptatem quaerat et pariatur occaecati non. Et ut alias excepturi consequuntur.', 0, NULL, NULL, NULL, '2025-11-19 23:11:55', '2025-11-19 23:11:55'),
(11, 1, 'Labore est libero qui harum.', 'labore-est-libero-qui-harum-6ksgm', NULL, 'Ducimus esse qui aut sed excepturi dolores aut nulla. Consequatur et et ab sit delectus odit eum molestiae. Quia autem sunt sed quia in libero magnam. Maxime magnam quia et voluptatem aut. Sit nemo laborum saepe non. Earum omnis voluptas qui voluptate optio aliquam sit.', 1, NULL, NULL, NULL, '2025-11-19 23:11:55', '2025-11-19 23:11:55'),
(12, 1, 'Enim dolorum saepe dolor magni quia.', 'enim-dolorum-saepe-dolor-magni-quia-QRPeh', NULL, 'Ratione animi totam dignissimos vitae qui tempora. Id esse et eaque ad porro. Minima et harum consectetur harum ducimus. Rem ratione possimus odio. Minus eos exercitationem et quo assumenda velit sunt. Qui asperiores atque voluptatum dolor eum quia. Praesentium fuga deserunt quibusdam voluptates quidem pariatur. Rem eveniet rem fugiat quaerat quis laudantium esse. Nam quo et est quae animi dolorem quae amet.', 0, NULL, NULL, NULL, '2025-11-19 23:11:55', '2025-11-19 23:11:55'),
(13, 1, 'Dignissimos ut consequatur quae repudiandae quod saepe.', 'dignissimos-ut-consequatur-quae-repudiandae-quod-saepe-E64UM', NULL, 'Ab ipsum tenetur expedita illo voluptas vero in. Dolorem illum nostrum provident quis ex cum error. Earum accusantium quo asperiores. Provident sapiente aut voluptas adipisci nihil voluptatem dolores necessitatibus. Rerum officiis eligendi et ut. Distinctio ab possimus dicta inventore aperiam molestiae reprehenderit. Aliquid blanditiis vel repellendus. Non saepe debitis vel.', 1, NULL, NULL, NULL, '2025-11-19 23:11:55', '2025-11-19 23:11:55'),
(14, 1, 'Dolorum nam maxime quisquam est nihil facilis.', 'dolorum-nam-maxime-quisquam-est-nihil-facilis-y6Dfk', NULL, 'Ipsa itaque ex ut est. Beatae voluptas voluptatum minima dolores rem ab distinctio. Repudiandae voluptatem repudiandae et et sed sit. Quod iste nihil et. Aspernatur impedit voluptas dolore commodi quo. Dolorem omnis sunt non nihil ut aut sit. Molestias autem id alias voluptatem excepturi. Explicabo culpa doloribus dignissimos et iusto recusandae fugiat. Et aut voluptatibus quas earum.', 1, NULL, NULL, NULL, '2025-11-19 23:11:55', '2025-11-19 23:11:55'),
(15, 1, 'Ea consequuntur error repellat reprehenderit sit est.', 'ea-consequuntur-error-repellat-reprehenderit-sit-est-7gCIX', NULL, 'Est asperiores consequatur quasi eius molestiae et. Et consequatur est nisi quas est et. Accusamus beatae aperiam iste nihil qui. Repellat quo tempora officiis et quisquam nulla et. Sed nisi temporibus ut eum minima dolorem atque nihil. Eius quas praesentium qui est facilis molestiae dignissimos. Veniam dolor omnis sequi sit. Repellendus excepturi non aut sunt ea odit quia. Temporibus sunt placeat pariatur expedita.', 0, NULL, NULL, NULL, '2025-11-19 23:11:55', '2025-11-19 23:11:55'),
(16, 1, 'Et quam id neque laudantium sequi possimus.', 'et-quam-id-neque-laudantium-sequi-possimus-bl6aS', NULL, 'Incidunt qui quae assumenda atque exercitationem corporis illum. Voluptatibus non rerum est animi architecto. Quam commodi ut odit quod et. Voluptate quisquam ipsum consequatur cumque quae et iste ut. Enim nobis iste facere. Est aut aut ea cumque. Et placeat quas eos earum in perferendis. Ut et nihil id est unde. Magni enim ea minima nesciunt sit repellendus quo voluptate. In magnam esse ut. Ut non eaque deserunt omnis.', 0, NULL, NULL, NULL, '2025-11-19 23:11:55', '2025-11-19 23:11:55'),
(17, 1, 'Recusandae sint ipsum voluptatem fuga.', 'recusandae-sint-ipsum-voluptatem-fuga-8MCr4', NULL, 'Repellat aut a consequatur eveniet beatae. Quisquam ipsum est voluptas quod in. Enim explicabo hic velit repudiandae sit. Rerum nulla alias et iusto dolor molestiae eligendi. Minima qui laudantium autem cumque eos ut. Impedit vitae quis voluptatem fugit mollitia.', 0, NULL, NULL, NULL, '2025-11-19 23:11:55', '2025-11-19 23:11:55'),
(18, 1, 'Aut eum ullam commodi et ea occaecati.', 'aut-eum-ullam-commodi-et-ea-occaecati-kDSBK', NULL, 'Corporis nulla eos quod enim nihil et. Omnis ut accusamus autem excepturi harum. Id id voluptas vel repudiandae. Eum fugit iste vitae doloribus. Aspernatur est est eaque dignissimos reiciendis et. Velit adipisci exercitationem sunt eos impedit assumenda. Et nihil ipsam reprehenderit minus veritatis ratione.', 0, NULL, NULL, NULL, '2025-11-19 23:11:55', '2025-11-19 23:11:55'),
(19, 1, 'Tenetur omnis amet quas harum doloribus.', 'tenetur-omnis-amet-quas-harum-doloribus-4lGA7', NULL, 'Similique nobis atque provident nam iure et. Earum dignissimos itaque eveniet. Aperiam asperiores nulla et optio et excepturi corrupti. Saepe accusamus qui ad ut aut. Nulla libero temporibus assumenda. Cumque asperiores occaecati eveniet tenetur ea iure ipsum. Harum aliquid pariatur repellendus error sed fugiat. Ea facere ut sed laudantium quae. Inventore incidunt praesentium natus blanditiis est hic quos.', 1, NULL, NULL, NULL, '2025-11-19 23:11:55', '2025-11-19 23:11:55'),
(20, 1, 'Consequuntur maxime sunt hic voluptate at ratione dicta aspernatur.', 'consequuntur-maxime-sunt-hic-voluptate-at-ratione-dicta-aspernatur-DvTM2', NULL, 'Aliquid recusandae quis tenetur officia consectetur. Et exercitationem quo animi quia et eos maiores. Sed sit natus sed consequuntur. Maiores eum quisquam consequatur commodi velit voluptas perferendis. Voluptates qui tenetur quam et officia perspiciatis est. Quia laborum voluptas tenetur et sed. Ea repudiandae non nihil et. Quibusdam doloribus ipsam cumque dolorem est eaque saepe. Nostrum occaecati nisi autem eos aut mollitia.', 1, NULL, NULL, NULL, '2025-11-19 23:11:55', '2025-11-19 23:11:55'),
(21, 1, 'Repellat quo facere modi dolorem accusamus.', 'repellat-quo-facere-modi-dolorem-accusamus-k5yMY', NULL, 'Beatae voluptates sed sed neque et. Occaecati voluptate vel fugit sunt dolore deleniti repellendus ducimus. Et deserunt voluptas aliquid quia provident. Eius est nostrum quas alias ut. Laudantium vitae sit voluptatibus tempora. Doloremque sint possimus quis dolore ut. Sapiente sit quod sit vel consectetur placeat. Nihil et exercitationem soluta est saepe. Dicta praesentium illo occaecati at repellendus. Voluptatem laudantium consequatur ipsam pariatur hic officiis.', 1, NULL, NULL, NULL, '2025-11-19 23:11:55', '2025-11-19 23:11:55'),
(22, 1, 'Quasi dolore saepe qui unde.', 'quasi-dolore-saepe-qui-unde-E8zfy', NULL, 'Quia beatae eligendi dolorem exercitationem. Esse eum provident id fugiat eum quia et. Vel doloribus inventore provident laudantium facere. Quisquam ut molestiae ut commodi quos aut. Et placeat ratione rerum vero consequuntur qui.', 0, NULL, NULL, NULL, '2025-11-19 23:11:55', '2025-11-19 23:11:55'),
(23, 1, 'Tempore qui voluptatem impedit id ea.', 'tempore-qui-voluptatem-impedit-id-ea-gvRQE', NULL, 'Excepturi id non itaque et in recusandae rerum. Laudantium quia iusto ut fugit aperiam. Quia fugit officia omnis voluptates. Praesentium voluptatem vel corrupti. Debitis repellendus qui autem dolorum in dolores. Ea et tempora unde ipsum doloremque.', 0, NULL, NULL, NULL, '2025-11-19 23:11:55', '2025-11-19 23:11:55');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('ACttHdYNdNItGm5JLRKdVDWTJdhskvSPO77DiH0z', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVTREQ1V4MHJiTkdPaGJUU0hlbG51aWo5YXhqcUhuWlVkbHRQTkwxQyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1763618406);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'user',
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `role`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin User', 'admin@example.com', NULL, 'admin', '$2y$12$M7WLEmSPWng65xm81d2SNO/2LLDGX1SM/5d/EO/x5Ny0wp9WY8PAG', NULL, '2025-11-19 23:11:55', '2025-11-19 23:11:55'),
(2, 'Queenie Eichmann', 'alfreda.hoeger@example.com', '2025-11-19 23:11:55', 'user', '$2y$12$5G/WWkqpVH4Wownhve.atO0pbUWs.5fDpVL2yPP1.3xSE4TOKG5ou', 'spFOrRYWkL', '2025-11-19 23:11:55', '2025-11-19 23:11:55'),
(3, 'Mrs. Felicita Predovic I', 'ipouros@example.com', '2025-11-19 23:11:55', 'user', '$2y$12$5G/WWkqpVH4Wownhve.atO0pbUWs.5fDpVL2yPP1.3xSE4TOKG5ou', 'uc554jZiE0', '2025-11-19 23:11:55', '2025-11-19 23:11:55'),
(4, 'Eulalia Kihn', 'anais78@example.net', '2025-11-19 23:11:55', 'user', '$2y$12$5G/WWkqpVH4Wownhve.atO0pbUWs.5fDpVL2yPP1.3xSE4TOKG5ou', 'F9KzkvVYG8', '2025-11-19 23:11:55', '2025-11-19 23:11:55'),
(5, 'Hilma Moen', 'dakota90@example.com', '2025-11-19 23:11:55', 'user', '$2y$12$5G/WWkqpVH4Wownhve.atO0pbUWs.5fDpVL2yPP1.3xSE4TOKG5ou', 'UcPlET9Bnn', '2025-11-19 23:11:55', '2025-11-19 23:11:55'),
(6, 'Courtney Johnston I', 'kshanahan@example.com', '2025-11-19 23:11:55', 'user', '$2y$12$5G/WWkqpVH4Wownhve.atO0pbUWs.5fDpVL2yPP1.3xSE4TOKG5ou', 'HhQNwRTsJB', '2025-11-19 23:11:55', '2025-11-19 23:11:55'),
(7, 'Talia Brekke I', 'kautzer.lindsay@example.org', '2025-11-19 23:11:55', 'user', '$2y$12$5G/WWkqpVH4Wownhve.atO0pbUWs.5fDpVL2yPP1.3xSE4TOKG5ou', 'kDVMQYv95j', '2025-11-19 23:11:55', '2025-11-19 23:11:55'),
(8, 'Vergie Heaney', 'krajcik.verona@example.com', '2025-11-19 23:11:55', 'user', '$2y$12$5G/WWkqpVH4Wownhve.atO0pbUWs.5fDpVL2yPP1.3xSE4TOKG5ou', 'Rs6hHDdtW3', '2025-11-19 23:11:55', '2025-11-19 23:11:55'),
(9, 'Laila Wilderman', 'greta13@example.net', '2025-11-19 23:11:55', 'user', '$2y$12$5G/WWkqpVH4Wownhve.atO0pbUWs.5fDpVL2yPP1.3xSE4TOKG5ou', 'hzWBPQCNlg', '2025-11-19 23:11:55', '2025-11-19 23:11:55'),
(10, 'Carson Ruecker', 'qgulgowski@example.com', '2025-11-19 23:11:55', 'user', '$2y$12$5G/WWkqpVH4Wownhve.atO0pbUWs.5fDpVL2yPP1.3xSE4TOKG5ou', 'hR3P4Qnh34', '2025-11-19 23:11:55', '2025-11-19 23:11:55'),
(11, 'Dr. Joany Kohler', 'carlee57@example.net', '2025-11-19 23:11:55', 'user', '$2y$12$5G/WWkqpVH4Wownhve.atO0pbUWs.5fDpVL2yPP1.3xSE4TOKG5ou', 'pV7wMBqldi', '2025-11-19 23:11:55', '2025-11-19 23:11:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_user_id_foreign` (`user_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
