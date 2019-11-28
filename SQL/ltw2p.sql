-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 28, 2019 at 09:29 AM
-- Server version: 5.7.26
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ltw2p`
--

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
CREATE TABLE IF NOT EXISTS `bills` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_customer` int(11) DEFAULT NULL,
  `date_order` date DEFAULT NULL,
  `total` float DEFAULT NULL COMMENT 'Total',
  `payment` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'payment method',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT 'code',
  `stt` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '0-waiting, 1-delivering, 2 delivered,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `bills_ibfk_1` (`id_customer`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`id`, `id_customer`, `date_order`, `total`, `payment`, `note`, `code`, `stt`, `created_at`, `updated_at`) VALUES
(9, 27, '2019-11-13', 350000, 'COD', NULL, NULL, '0', '2019-11-13 08:03:25', '2019-11-13 08:03:25'),
(8, 26, '2019-11-12', 165000, 'COD', NULL, NULL, '2', '2019-11-13 08:05:46', '2019-11-13 08:05:46'),
(10, 27, '2019-11-13', 160000, 'COD', NULL, NULL, '1', '2019-11-13 08:40:09', '2019-11-13 08:40:09'),
(11, 27, '2019-11-13', 1800000, 'COD', NULL, NULL, '1', '2019-11-13 09:47:34', '2019-11-13 09:47:34'),
(12, 27, '2019-12-03', 160000, 'ATM', '123', '13123', '2', '2019-11-23 09:25:27', '2019-11-23 09:25:27'),
(13, 28, '2019-12-10', 295000, 'COD', 'Giao hàng nhanh', NULL, '2', '2019-11-23 09:25:25', '2019-11-23 09:25:25'),
(14, 29, '2019-12-10', 295000, 'ZaloPay', 'cần shiper xinh', '451322', '2', '2019-11-23 09:25:23', '2019-11-23 09:25:23'),
(15, 30, '2019-11-24', 60000, 'COD', '45+44', NULL, '0', '2019-11-24 10:54:01', '2019-11-24 10:54:01'),
(16, 30, '2019-11-24', 885000, 'COD', '4646', NULL, '0', '2019-11-24 14:08:22', '2019-11-24 14:08:22');

-- --------------------------------------------------------

--
-- Table structure for table `bill_detail`
--

DROP TABLE IF EXISTS `bill_detail`;
CREATE TABLE IF NOT EXISTS `bill_detail` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_bill` int(10) NOT NULL,
  `id_product` int(10) NOT NULL,
  `quantity` int(11) NOT NULL COMMENT 'số lượng',
  `unit_price` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `bill_detail_ibfk_2` (`id_product`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill_detail`
--

INSERT INTO `bill_detail` (`id`, `id_bill`, `id_product`, `quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
(18, 11, 17, 4, 450000, '2019-11-13 09:00:27', '2019-11-13 09:00:27'),
(17, 10, 1, 1, 160000, '2019-11-13 08:18:58', '2019-11-13 08:18:58'),
(16, 9, 16, 1, 190000, '2019-11-13 08:03:25', '2019-11-13 08:03:25'),
(15, 9, 1, 1, 160000, '2019-11-13 08:03:25', '2019-11-13 08:03:25'),
(14, 8, 2, 1, 165000, '2019-11-12 13:14:00', '2019-11-12 13:14:00'),
(19, 12, 1, 1, 160000, '2019-12-03 08:41:36', '2019-12-03 08:41:36'),
(20, 13, 20, 1, 295000, '2019-12-10 04:47:20', '2019-12-10 04:47:20'),
(21, 14, 19, 1, 295000, '2019-12-10 04:49:16', '2019-12-10 04:49:16'),
(22, 15, 36, 1, 60000, '2019-11-24 10:54:01', '2019-11-24 10:54:01'),
(23, 16, 19, 3, 295000, '2019-11-24 14:08:22', '2019-11-24 14:08:22');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'customer id',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'customer name',
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'email',
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'address',
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'phone number',
  `stt` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Arrange',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `email`, `address`, `phone`, `stt`, `created_at`, `updated_at`) VALUES
(28, 'Customer 2', 'customer1@gmail.com', 'HCM', '0123642363', 'ON', '2019-11-23 09:13:07', '2019-11-23 09:13:07'),
(29, 'Customer 1', 'customer1@gmail.com', 'HCM', '1236542363', 'ON', '2019-11-23 09:12:42', '2019-11-23 09:12:42'),
(30, 'Will Le', 'allerwill.lee@gmail.com', 'Ho Chi Minh', '0903455677', 'ON', '2019-11-24 10:54:01', '2019-11-24 10:54:01');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Product code',
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Product n',
  `id_type` int(10) UNSIGNED DEFAULT NULL COMMENT 'Mã loại',
  `description` text COLLATE utf8_unicode_ci COMMENT 'Mô tả',
  `unit_price` float DEFAULT NULL COMMENT 'Đơn giá',
  `promotion_price` float DEFAULT NULL COMMENT 'Giá bán',
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'hình ảnh',
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'đơn vị',
  `new` tinyint(4) DEFAULT '0' COMMENT 'mới',
  `stt` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'STT',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Chỉnh sửa',
  PRIMARY KEY (`id`),
  KEY `products_id_type_foreign` (`id_type`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `id_type`, `description`, `unit_price`, `promotion_price`, `image`, `unit`, `new`, `stt`, `created_at`, `updated_at`) VALUES
(19, 'GREEN TEA LEMON MOUSSE - BÁNH MOUSSE TRÀ XANH CHANH', 47, '<p><span style=\"font-size:14px\"><span style=\"font-family:Tahoma,Geneva,sans-serif\">Đ&atilde; c&oacute; một Tiramisu nồng n&agrave;n say đắm, sao vẫn cứ mơ một thanh khiết, tinh kh&ocirc;i?</span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Tahoma,Geneva,sans-serif\">TR&Agrave; XANH CHANH - B&Aacute;NH ĐẾN TỪ GIẤC MƠ</span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Tahoma,Geneva,sans-serif\">Một m&agrave;u xanh thanh khiết bất tận&hellip; Một trắng trong tinh kh&ocirc;i nhẹ nh&agrave;ng&hellip; &nbsp;Một đồi tr&agrave; trải d&agrave;i ng&uacute;t&nbsp;tầm mắt&hellip; Một giấc mơ xanh trắng những sắc m&agrave;u!</span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Tahoma,Geneva,sans-serif\">B&ecirc;n cạnh Tiramisu th&igrave; Green Tea Lemon l&agrave; chiếc b&aacute;nh Signature (đặc trưng của tiệm), do vậy kh&ocirc;ng kh&oacute; giải th&iacute;ch v&igrave; sao b&aacute;nh được y&ecirc;u th&iacute;ch nhiều tại Dolce Vita.</span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Tahoma,Geneva,sans-serif\">&hearts; &nbsp;Cốt b&aacute;nh l&agrave; b&ocirc;ng lan tr&agrave; xanh. Kem mousse bằng ph&ocirc; mai (cream cheese), kem tươi (whipping cream) v&agrave; nước cốt chanh (lemon).&nbsp;</span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Tahoma,Geneva,sans-serif\">&hearts;&nbsp;Mặt b&aacute;nh l&agrave; lớp thạch l&agrave;m từ gelatin v&agrave; nước cốt chanh.&nbsp;</span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Tahoma,Geneva,sans-serif\">B&aacute;nh được trang tr&iacute; ngẫu hứng, với những nguy&ecirc;n liệu sẵn c&oacute; tại tiệm l&agrave; chocolate v&agrave; tr&aacute;i c&acirc;y tươi.</span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Tahoma,Geneva,sans-serif\">Bạn c&oacute; tham khảo mẫu b&aacute;nh ở đ&acirc;y nh&eacute;:&nbsp;Mẫu b&aacute;nh Mousse</span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Tahoma,Geneva,sans-serif\">Nếu bạn c&oacute; y&ecirc;u cầu trang tr&iacute; đặc biệt, xin li&ecirc;n hệ để được đ&aacute;p ứng tốt hơn.</span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Tahoma,Geneva,sans-serif\">&hearts; Vị b&aacute;nh: B&aacute;nh b&eacute;o vừa, chua v&agrave; ngọt dịu, thơm dịu tr&agrave; xanh v&agrave; thơm vị chanh.</span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Tahoma,Geneva,sans-serif\">&hearts; Dolce Vita sử dụng những nguy&ecirc;n liệu tươi ngon v&agrave; chất lượng để đảm bảo độ &ldquo;ngon v&agrave; l&agrave;nh&rdquo; của b&aacute;nh cao nhất. Ch&uacute;ng t&ocirc;i n&oacute;i kh&ocirc;ng với chất bảo quản, chất tạo đ&ocirc;ng, tạo xốp..</span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Tahoma,Geneva,sans-serif\">&hearts; &nbsp;H&atilde;y chọn một cỡ b&aacute;nh ph&ugrave; hợp với số người ăn để thưởng thức vị b&aacute;nh ngon nhất. Nếu kh&ocirc;ng d&ugrave;ng hết ,vui l&ograve;ng cho v&agrave;o hộp k&iacute;n v&agrave; bảo quản tủ lạnh để sử dụng trong v&ograve;ng 3 ng&agrave;y.</span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Tahoma,Geneva,sans-serif\">&hearts;&nbsp; B&aacute;nh từ 220.000đ được giao miễn ph&iacute; trong v&ograve;ng 3km, v&agrave; t&iacute;nh ph&iacute; nếu xa hơn. B&aacute;nh được bảo quản tốt trong v&ograve;ng 45 ph&uacute;t di chuyển bằng xe m&aacute;y. Nếu c&aacute;ch xa hơn thời gian tr&ecirc;n, bạn n&ecirc;n c&acirc;n nhắc khi đặt b&aacute;nh ở tiệm v&igrave; ch&uacute;ng t&ocirc;i kh&ocirc;ng chịu tr&aacute;ch nhiệm nếu b&aacute;nh hỏng.</span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Tahoma,Geneva,sans-serif\">&hearts;&nbsp; Ch&uacute;ng t&ocirc;i chỉ giao b&aacute;nh trong khu vực TP HCM. Nếu ở xa hơn, bạn cần chủ động phương tiện để vận chuyển b&aacute;nh.</span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Tahoma,Geneva,sans-serif\">&hearts; &nbsp;Vui l&ograve;ng đặt trước &iacute;t nhất 4 tiếng&nbsp;để tiệm b&aacute;nh phục vụ bạn tốt nhất. Nếu đặt cận giờ, tiệm chỉ c&oacute; thể phục vụ những b&aacute;nh c&oacute; sẵn.</span></span></p>', 295000, 255000, 'Xo1SZ73TlbMD9Go5.png', 'cái', 1, 'ON', '2019-12-08 02:58:11', '2019-12-09 16:57:35'),
(20, 'MATCHA YOGURT MOUSSE - BÁNH MOUSSE TRÀ XANH SỮA CHUA', 47, '<p><span style=\"font-family:Tahoma,Geneva,sans-serif\"><span style=\"font-size:14px\">Matcha Yogurt Mousse - Phomai Matcha Sữa chua đ&iacute;ch thị l&agrave; m&oacute;n b&aacute;nh của tr&agrave; xanh.&nbsp;</span></span></p>\r\n\r\n<p><span style=\"font-family:Tahoma,Geneva,sans-serif\"><span style=\"font-size:14px\">&hearts; &nbsp;B&aacute;nh l&agrave;m từ b&ocirc;ng lan tr&agrave; xanh; lớp kem mousse gồm ph&ocirc; mai, sữa chua, bột tr&agrave; xanh, kem tươi whipping. M&agrave;u của b&aacute;nh l&agrave; m&agrave;u tự nhi&ecirc;n của tr&agrave; xanh. V&igrave; tr&agrave; xanh kh&ocirc;ng tan ho&agrave;n to&agrave;n trong mousse n&ecirc;n tạo cảm gi&aacute;c &quot;nhẫn nhẫn&quot; kh&ocirc;ng phải dễ ăn, n&ecirc;n đ&acirc;y l&agrave; chiếc b&aacute;nh d&agrave;nh ri&ecirc;ng cho t&iacute;n đồ của tr&agrave; xanh.</span></span></p>\r\n\r\n<p><span style=\"font-family:Tahoma,Geneva,sans-serif\"><span style=\"font-size:14px\">** Sữa chua được tiệm tự l&agrave;m từ nguồn sữa thanh tr&ugrave;ng Long Th&agrave;nh; Matcha Nhật vụ thu.</span></span></p>\r\n\r\n<p><span style=\"font-family:Tahoma,Geneva,sans-serif\"><span style=\"font-size:14px\"><img src=\"https://bizweb.dktcdn.net/100/163/301/files/matcha-yogurt-mousse-banh-kem-tra-xanh-sua-chua-tiem-banh-dolce-vita-quan-3.png?v=1502183658254\" /></span></span></p>\r\n\r\n<p><span style=\"font-family:Tahoma,Geneva,sans-serif\"><span style=\"font-size:14px\">&hearts; B&aacute;nh được trang tr&iacute; ngẫu hứng, với những nguy&ecirc;n liệu sẵn c&oacute; tại tiệm l&agrave; chocolate v&agrave; tr&aacute;i c&acirc;y tươi. C&oacute; thể viết lời ch&uacute;c l&ecirc;n mặt b&aacute;nh.</span></span></p>\r\n\r\n<p><span style=\"font-family:Tahoma,Geneva,sans-serif\"><span style=\"font-size:14px\">Bạn c&oacute; tham khảo mẫu b&aacute;nh ở đ&acirc;y nh&eacute;:&nbsp;<a href=\"https://tiembanhdolcevita.com/mousse-cake-1\">Mẫu b&aacute;nh Mousse</a></span></span></p>\r\n\r\n<p><span style=\"font-family:Tahoma,Geneva,sans-serif\"><span style=\"font-size:14px\">Nếu bạn c&oacute; y&ecirc;u cầu trang tr&iacute; đặc biệt, xin li&ecirc;n hệ để được đ&aacute;p ứng tốt hơn.</span></span></p>\r\n\r\n<p><span style=\"font-family:Tahoma,Geneva,sans-serif\"><span style=\"font-size:14px\">&hearts; Dolce Vita sử dụng những nguy&ecirc;n liệu tươi ngon v&agrave; chất lượng để đảm bảo độ &ldquo;ngon v&agrave; l&agrave;nh&rdquo; của b&aacute;nh cao nhất. Ch&uacute;ng t&ocirc;i n&oacute;i kh&ocirc;ng với chất bảo quản, chất tạo đ&ocirc;ng, tạo xốp..</span></span></p>\r\n\r\n<p><span style=\"font-family:Tahoma,Geneva,sans-serif\"><span style=\"font-size:14px\"><img src=\"https://bizweb.dktcdn.net/100/163/301/products/matcha-yogurt-mousse-banh-kem-tra-xanh-sua-chua-tiem-banh-dolce-vita-quan-1.png?v=1520774151530\" /></span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-family:Tahoma,Geneva,sans-serif\"><span style=\"font-size:14px\">&hearts; &nbsp;H&atilde;y chọn một cỡ b&aacute;nh ph&ugrave; hợp với số người ăn để thưởng thức vị b&aacute;nh ngon nhất. Nếu kh&ocirc;ng d&ugrave;ng hết ,vui l&ograve;ng cho v&agrave;o hộp k&iacute;n v&agrave; bảo quản tủ lạnh để sử dụng trong v&ograve;ng 3 ng&agrave;y.</span></span></p>\r\n\r\n<p><span style=\"font-family:Tahoma,Geneva,sans-serif\"><span style=\"font-size:14px\">&hearts;&nbsp; B&aacute;nh từ 220.000đ được giao miễn ph&iacute; trong v&ograve;ng 3km, v&agrave; t&iacute;nh ph&iacute; nếu xa hơn. B&aacute;nh được bảo quản tốt trong v&ograve;ng 45 ph&uacute;t di chuyển bằng xe m&aacute;y. Nếu c&aacute;ch xa hơn thời gian tr&ecirc;n, bạn n&ecirc;n c&acirc;n nhắc khi đặt b&aacute;nh ở tiệm v&igrave; ch&uacute;ng t&ocirc;i kh&ocirc;ng chịu tr&aacute;ch nhiệm nếu b&aacute;nh hỏng.</span></span></p>\r\n\r\n<p><span style=\"font-family:Tahoma,Geneva,sans-serif\"><span style=\"font-size:14px\">&hearts;&nbsp; Ch&uacute;ng t&ocirc;i chỉ giao b&aacute;nh trong khu vực TP HCM. Nếu ở xa hơn, bạn cần chủ động phương tiện để vận chuyển b&aacute;nh.</span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-family:Tahoma,Geneva,sans-serif\"><span style=\"font-size:14px\"><img src=\"https://bizweb.dktcdn.net/100/163/301/files/matcha-yogurt-mousse-banh-kem-tra-xanh-sua-chua-tiem-banh-dolce-vita-quan-4.png?v=1502183767875\" /></span></span></p>\r\n\r\n<p><span style=\"font-family:Tahoma,Geneva,sans-serif\"><span style=\"font-size:14px\">&hearts; &nbsp;Vui l&ograve;ng đặt trước &iacute;t nhất 4 tiếng&nbsp;để tiệm b&aacute;nh phục vụ bạn tốt nhất. Nếu đặt cận giờ, tiệm chỉ c&oacute; thể phục vụ những b&aacute;nh c&oacute; sẵn.</span></span></p>', 295000, 295000, 'YXL7xwQzb9TXS3vo.png', 'cái', 1, 'ON', '2019-12-08 03:00:17', '2019-12-09 16:57:43'),
(21, 'TIRAMISU (Ổ HÌNH TRÁI TIM)', 47, '<p>&hearts; TIRAMISU&nbsp;l&agrave; một loại b&aacute;nh ngọt tr&aacute;ng miệng vị c&agrave; ph&ecirc; rất nổi tiếng của nước &Yacute;, gồm c&aacute;c lớp b&aacute;nh Lady Fingers (Savoiardi, [savoˈjardi] (l&agrave; một loại b&aacute;nh quy, giống như b&aacute;nh champaign của Việt Nam nhưng ngon hơn) nh&uacute;ng c&agrave; ph&ecirc; xen kẽ với hỗn hợp trứng, đường, ph&ocirc; mai mascarpone đ&aacute;nh b&ocirc;ng. Vị đắng của tiramisu c&oacute; nhờ lớp bột cacao phủ đều mặt b&aacute;nh. C&ocirc;ng thức b&aacute;nh n&agrave;y được biến tấu th&agrave;nh nhiều m&oacute;n b&aacute;nh v&agrave; m&oacute;n tr&aacute;ng miệng kh&aacute;c nhau.&nbsp;Trong phi&ecirc;n bản hiện đại của Tiramisu m&agrave; Dolce Vita đang l&agrave;m&nbsp;th&igrave; phần b&aacute;nh lady fingers được nh&uacute;ng th&ecirc;m rượu.</p>\r\n\r\n<p>&hearts; Bởi những th&agrave;nh phần đặc biệt m&agrave; chiếc b&aacute;nh Tiramisu c&oacute; một hương vị đặc biệt: nồng ch&aacute;t từ rượu, đắng từ chocolate, vị cafe v&agrave; vị b&eacute;o từ phomai. Ch&uacute;ng t&ocirc;i tự h&agrave;o l&agrave; một trong những nơi l&agrave;m ra chiếc b&aacute;nh Tiramisu đ&uacute;ng nghĩa.</p>\r\n\r\n<p><img src=\"https://bizweb.dktcdn.net/100/163/301/files/banh-kem-dolce-vita-tiramisu-2.png?v=1520774386204\" /></p>\r\n\r\n<p>&hearts; B&aacute;nh ổ Tiramisu th&ocirc;ng thường ở Dolce Vita sẽ c&oacute; cốt l&agrave; b&aacute;nh b&ocirc;ng lan chocolate mỏng. Cốt b&aacute;nh l&agrave; lady fingers c&oacute; ở phần b&aacute;nh ly Tiramisu. Nếu bạn muốn thưởng thức b&aacute;nh ổ nguy&ecirc;n bản với lady fingers th&igrave; vui l&ograve;ng chọn b&aacute;nh Tiramisu Ladyfingers. Tuy vậy, chủ quan của tiệm th&igrave; Ladyfinger mặc d&ugrave; đ&uacute;ng nguy&ecirc;n bản hơn, nhưng d&ugrave;ng cảm gi&aacute;c sẽ kh&ocirc; v&agrave; cứng hơn b&ocirc;ng lan n&ecirc;n một số người sẽ cảm thấy kh&ocirc;ng ngon bằng.</p>\r\n\r\n<p>&hearts; Mặt b&aacute;nh được trang tr&iacute; ngẫu hứng bằng tr&aacute;i c&acirc;y tươi v&agrave; socola. Nếu bạn c&oacute; y&ecirc;u cầu đặc biệt, xin vui l&ograve;ng li&ecirc;n hệ với tiệm b&aacute;nh.</p>\r\n\r\n<p>&hearts; Dolce Vita sử dụng những nguy&ecirc;n liệu tươi ngon v&agrave; chất lượng để đảm bảo độ &ldquo;ngon v&agrave; l&agrave;nh&rdquo; của b&aacute;nh cao nhất. Ch&uacute;ng t&ocirc;i n&oacute;i kh&ocirc;ng với chất bảo quản, chất tạo đ&ocirc;ng, tạo xốp..</p>\r\n\r\n<p>&hearts; &nbsp;H&atilde;y chọn một cỡ b&aacute;nh ph&ugrave; hợp với số người ăn để thưởng thức vị b&aacute;nh ngon nhất. Nếu kh&ocirc;ng d&ugrave;ng hết ,vui l&ograve;ng cho v&agrave;o hộp k&iacute;n v&agrave; bảo quản tủ lạnh để sử dụng trong v&ograve;ng 3 ng&agrave;y.</p>\r\n\r\n<p>&hearts;&nbsp; B&aacute;nh từ 220.000đ được giao miễn ph&iacute; trong v&ograve;ng 3km, v&agrave; t&iacute;nh ph&iacute; nếu xa hơn. B&aacute;nh được bảo quản tốt trong v&ograve;ng 45 ph&uacute;t di chuyển bằng xe m&aacute;y. Nếu c&aacute;ch xa hơn thời gian tr&ecirc;n, bạn n&ecirc;n c&acirc;n nhắc khi đặt b&aacute;nh ở tiệm v&igrave; ch&uacute;ng t&ocirc;i kh&ocirc;ng chịu tr&aacute;ch nhiệm nếu b&aacute;nh hỏng.</p>\r\n\r\n<p>&hearts;&nbsp; Ch&uacute;ng t&ocirc;i chỉ giao b&aacute;nh trong khu vực TP HCM. Nếu ở xa hơn, bạn cần chủ động phương tiện để vận chuyển b&aacute;nh.</p>\r\n\r\n<p>&hearts; &nbsp;Vui l&ograve;ng đặt trước &iacute;t nhất 4 tiếng&nbsp;để tiệm b&aacute;nh phục vụ bạn tốt nhất. Nếu đặt cận giờ, tiệm chỉ c&oacute; thể phục vụ những b&aacute;nh c&oacute; sẵn.</p>', 330000, 310000, 'khfoQRRJSYkLWgUK.png', 'hộp', 0, 'ON', '2019-12-08 03:02:09', '2019-12-09 16:57:42'),
(22, 'Bánh kem sinh nhật in hình trái tim màu tím', 47, '<h3><span style=\"font-family:Georgia,serif\">Hướng dẫn mua h&agrave;ng</span></h3>\r\n\r\n<p><span style=\"font-family:Georgia,serif\">Qu&yacute; kh&aacute;ch truy cập v&agrave;o Fanpage: B&aacute;nh Kem Ngộ Nghĩnh (fb.com/banhkemngonghinh102) hoặc Website: banhkemngonghinh.com để xem v&agrave; lựa chọn mẫu b&aacute;nh bạn th&iacute;ch nhất.<br />\r\n- H&atilde;y lựa chọn mẫu bạn th&iacute;ch nhất v&agrave; gửi ngay cho ch&uacute;ng t&ocirc;i qua Facebook, Zalo, Viber.<br />\r\n- Facebook: B&aacute;nh Kem Ngộ Nghĩnh (fb.com/banhkemgnonghinh102) - Zalo: 0905 820 528 - Viber: 0905 820 528</span></p>\r\n\r\n<h3><span style=\"font-family:Georgia,serif\">Hướng dẫn thanh to&aacute;n</span></h3>\r\n\r\n<p><span style=\"font-family:Georgia,serif\">Hiện tại, ch&uacute;ng t&ocirc;i mới chỉ cung cấp 2 h&igrave;nh thức thanh to&aacute;n: (1). nhận h&agrave;ng thanh to&aacute;n v&agrave; (2). thanh to&aacute;n chuyển khoản.<br />\r\n- 1. Qu&yacute; kh&aacute;ch đặt h&agrave;ng v&agrave; được nh&acirc;n vi&ecirc;n x&aacute;c nhận qua cuộc gọi trực tiếp. Qua đ&oacute;, ch&uacute;ng t&ocirc;i giao h&agrave;ng về cho qu&yacute; kh&aacute;ch. Qu&yacute; kh&aacute;ch nhận h&agrave;ng, kiểm tra h&agrave;ng v&agrave; thanh to&aacute;n trực tiếp cho nh&acirc;n vi&ecirc;n giao b&aacute;nh.<br />\r\n- 2: Qu&yacute; kh&aacute;ch chuyển khoản trước cho ch&uacute;ng t&ocirc;i qua t&agrave;i khoản nh&acirc;n h&agrave;ng, v&agrave; ch&uacute;ng t&ocirc;i sẽ vận chuyển mẫu b&aacute;nh bạn đ&atilde; chọn về địa chỉ của bạn</span></p>', 250000, 230000, 'jOi7v5S4To0t8NLk.jpg', 'hộp', 1, 'ON', '2019-12-10 04:12:51', '2019-12-10 04:12:51'),
(23, 'Bánh hộp thiếc Pepperidge Farm', 51, '<h4><strong>TH&Ocirc;NG TIN SẢN PHẨM</strong><br />\r\n<strong>B&aacute;nh hộp thiếc Pepperidge Farm Classic 376g</strong><br />\r\n- B&aacute;nh hộp thiếc Pepperidge Farm Classic 376g được thiết kế hộp thiếc sang trọng, cao cấp với c&aacute;c d&ograve;ng b&aacute;nh Pepperidge Farm hỗn hợp đa dạng c&aacute;c d&ograve;ng b&aacute;nh tuyệt ngon, gi&uacute;p kh&aacute;ch h&agrave;ng được thưởng thức nhiều loại b&aacute;nh ngon với hương vị kh&aacute;c nhau, ... v&agrave; l&agrave; m&oacute;n qu&agrave; cao cấp, đầy &yacute; nghĩa d&agrave;nh tặng người th&acirc;n, đối t&aacute;c, bạn b&egrave;, đồng nghiệp,... trong c&aacute;c dịp Lễ Tết.<br />\r\n<strong>Trọng lượng:</strong>&nbsp;376g<br />\r\n--------------------------------------------------------<br />\r\n<strong>TH&Ocirc;NG TIN SI&Ecirc;U THỊ OCCIDENTMART</strong><br />\r\n<a href=\"http://occidentmart.vn/banh-keo-hat-say/banh-nhap-khau-1/banh-hop-thiec\">Occident Mart</a>&nbsp;l&agrave; si&ecirc;u thị b&aacute;n lẻ c&aacute;c mặt h&agrave;ng ti&ecirc;u d&ugrave;ng nhanh c&oacute; xuất xứ từ nhiều quốc gia tr&ecirc;n thế giới.&nbsp;<a href=\"http://occidentmart.vn/banh-keo-hat-say/banh-nhap-khau-1/banh-hop-thiec\">Occidentmart</a>&nbsp;cam kết mang đến 4 gi&aacute; trị v&agrave;ng:<br />\r\n=&gt; Nhập khẩu trực tiếp kh&ocirc;ng qua trung gian<br />\r\n=&gt; Chất lượng sản phẩm theo &quot;Ti&ecirc;u chuẩn Ch&acirc;u &Acirc;u&quot;<br />\r\n=&gt;&nbsp; Dịch vụ chăm s&oacute;c kh&aacute;ch h&agrave;ng&nbsp;<br />\r\n=&gt; Gi&aacute; th&agrave;nh hợp l&yacute;</h4>', 250000, 0, 'hbVvA85clAN7L4Ff.jpg', 'hộp', 1, 'ON', '2019-12-10 04:19:58', '2019-12-10 04:19:58'),
(24, 'Bánh xốp Happy Max 5x25(125g)', 51, '<h4><span style=\"font-family:Tahoma,Geneva,sans-serif\"><strong>TH&Ocirc;NG TIN SẢN PHẨM</strong><br />\r\n<strong>B&aacute;nh xốp Happy Max 5x25(125g)</strong><br />\r\n- B&aacute;nh xốp kẹp s&ocirc; c&ocirc; la sữa hạt dẻ Happy max 5x25(125g) với 5 lớp nguy&ecirc;n liệu th&uacute; vị gồm: lớp b&aacute;nh gi&ograve;n, lớp kem socola nh&acirc;n hạt dẻ, lớp kem sữa tươi v&agrave; cuối c&ugrave;ng l&agrave; phủ 1 lớp socola hảo hạng thơm ngon mang đến hương vị ngọt ng&agrave;o cho người thưởng thức.&nbsp;<br />\r\n- G&oacute;i b&aacute;nh 115g gồm 5 phong b&aacute;nh nhỏ, thuận lợi cho mỗi lần thưởng thức hoặc bạn c&oacute; thể mang đi l&agrave;m, đi chơi, đi học.<br />\r\n- C&aacute;ch d&ugrave;ng:Ăn trực tiếp, ngon hơn khi kết hợp với thức uống bạn y&ecirc;u th&iacute;ch (cafe, sữa tươi, tr&agrave;...) t&ugrave;y khẩu vị.<br />\r\n- Bảo quản: Để trong ngăn m&aacute;t tủ lạnh trong trường hợp kh&ocirc;ng sử dụng hết hoặc bảo quản ở nơi kh&ocirc; tho&aacute;ng, m&aacute;t mẻ, tr&aacute;nh &aacute;nh nắng mặt trời trực tiếp.<br />\r\nTrọng lượng: 5x25(125g)<br />\r\n<strong>TH&Ocirc;NG TIN THƯƠNG HIỆU</strong><br />\r\n- Nh&atilde;n hiệu &quot;Happy&quot; thuộc c&ocirc;ng ty ZPC Flis, Ba Lan<br />\r\n- C&ocirc;ng ty ZPC Flis ph&aacute;t triển từ nhiều năm theo h&igrave;nh thức truyền thống gia đ&igrave;nh. Bắt đầu hoạt động ri&ecirc;ng biệt v&agrave;o năm 1992, sau những trải nghiệm t&iacute;ch cực c&ocirc;ng ty ng&agrave;y một ph&aacute;t triển. Sự ph&aacute;t triển năng động của c&ocirc;ng ty trong những năm gần đ&acirc;y li&ecirc;n quan chặt chẽ đến việc thay thế ho&agrave;n to&agrave;n chiến lược sản xuất v&agrave; ch&iacute;nh s&aacute;ch thương mại. Thiết bị của nh&agrave; m&aacute;y được m&ocirc; tả l&agrave; một trong những thiết bị hiện đại nhất tr&ecirc;n thế giới.<br />\r\n- Cung cấp của c&ocirc;ng ty ZPC Flis l&agrave; một loạt c&aacute;c wafers: Waflapłaskie sau khi chế biến, wafers wafer (karpatka), đường wafer ống. C&ocirc;ng ty sử dụng nhiều loại kem được l&agrave;m h&agrave;i ho&agrave; để tạo ra những chiếc b&aacute;nh tinh tế.<br />\r\n--------------------------------------------------------<br />\r\n<strong>TH&Ocirc;NG TIN SI&Ecirc;U THỊ OCCIDENTMART</strong><br />\r\n<a href=\"http://occidentmart.vn/banh-keo-hat-say/banh-nhap-khau-1/banh-quy-banh-xop-banh-que\">Occident Mart</a>&nbsp;l&agrave; si&ecirc;u thị b&aacute;n lẻ c&aacute;c mặt h&agrave;ng ti&ecirc;u d&ugrave;ng nhanh c&oacute; xuất xứ từ nhiều quốc gia tr&ecirc;n thế giới.&nbsp;<a href=\"http://occidentmart.vn/banh-keo-hat-say/banh-nhap-khau-1/banh-quy-banh-xop-banh-que\">Occidentmart</a>&nbsp;cam kết mang đến 4 gi&aacute; trị v&agrave;ng:<br />\r\n=&gt; Nhập khẩu trực tiếp kh&ocirc;ng qua trung gian<br />\r\n=&gt; Chất lượng sản phẩm theo &quot;Ti&ecirc;u chuẩn Ch&acirc;u &Acirc;u&quot;<br />\r\n=&gt; &nbsp;Dịch vụ chăm s&oacute;c kh&aacute;ch h&agrave;ng&nbsp;<br />\r\n=&gt; Gi&aacute; th&agrave;nh hợp l&yacute;</span></h4>', 50000, 45000, 'm1L9Uy81tqIe1b7z.jpg', 'hộp', 0, 'ON', '2019-12-10 04:21:04', '2019-12-10 04:21:04'),
(25, 'Bánh Bơ Đậu Phộng KitKat Chunky 38g', 51, '<h4><strong>TH&Ocirc;NG TIN SẢN PHẨM</strong><br />\r\n<strong>B&aacute;nh Bơ Đậu Phộng KitKat Chunky 38g</strong><br />\r\n- Thanh B&aacute;nh Bơ Đậu Phộng KitKat Chunky (38g) l&agrave; một trong những m&oacute;n ăn vặt y&ecirc;u th&iacute;ch của nhiều người, th&iacute;ch hợp đem theo khi đi cắm trại, du lịch hay đi chơi c&ugrave;ng bạn b&egrave;.<br />\r\n- B&aacute;nh được l&agrave;m từ nguồn nguy&ecirc;n liệu sạch đem đến hương vị thơm ngon, ngọt b&ugrave;i, kh&ocirc;ng qu&aacute; b&eacute;o n&ecirc;n th&iacute;ch hợp với khẩu vị của nhiều người.<br />\r\n- Sản phẩm kh&ocirc;ng chứa phẩm m&agrave;u hoặc h&oacute;a chất độc hại, qu&aacute; tr&igrave;nh sản xuất được kiểm định nghi&ecirc;m ngặt, đảm bảo chất lượng.<br />\r\n- Đặc biệt, b&aacute;nh c&ograve;n chứa nhiều th&agrave;nh phần hữu &iacute;ch cho sức khỏe, d&ugrave;ng cho bữa ăn nhẹ, cung cấp nhiều năng lượng, cho bạn một ng&agrave;y học tập, l&agrave;m việc hiệu quả.<br />\r\n<strong>Quy c&aacute;ch đ&oacute;ng hộp:</strong>&nbsp;38g</h4>', 14000, 0, 'QgVXHYi0HJDR2zXx.jpg', 'hộp', 1, 'ON', '2019-12-10 04:22:47', '2019-12-10 04:22:47'),
(26, 'Bánh Adélie hạnh nhân sô cô la 150G', 47, '<p>Sản phẩm được sản xuất từ nhiều nguy&ecirc;n liệu như đường, s&ocirc; c&ocirc; la đen 18% (ca cao 73%), hạnh nh&acirc;n 12%, nước, l&ograve;ng trắng trứng, xi-r&ocirc; glucose, sữa, bột ca cao, chất l&agrave;m đặc, chiết xuất l&uacute;a mạch, hương liệu... Nhờ c&ocirc;ng thức đặc biệt c&ugrave;ng sự kết hợp độc đ&aacute;o đ&atilde; tạo n&ecirc;n một loại b&aacute;nh v&ocirc; c&ugrave;ng thơm ngon, hấp dẫn. &nbsp;Sản phẩm được nhập khẩu từ Ph&aacute;p, mang thương hệu nổi tiếng thế giới Ad&eacute;lie.&nbsp;</p>\r\n\r\n<p><u><strong>Hương vị</strong></u>: hạnh nh&acirc;n v&agrave; s&ocirc; c&ocirc; la<br />\r\n<u><strong>Quy c&aacute;ch:</strong></u>&nbsp;&nbsp;hộp 2 chiếc<br />\r\n<u><strong>Trọng lượng:</strong></u>&nbsp;150g&nbsp;<br />\r\n<u><strong>Bảo quản:</strong></u>&nbsp;24h trong tủ lạnh (+4 độ C), 3 ng&agrave;y trong ngăn đ&aacute; tủ lạnh (-12 độ C), giữ sản phẩm cho đến hết hạn sử dụng ghi tr&ecirc;n bao b&igrave; ở -18 độ C&nbsp;<br />\r\n<u><strong>Th&agrave;nh phần:</strong></u>&nbsp;Tham khảo chi tiết tr&ecirc;n sản phẩm.<br />\r\n<u><strong>Xuất xứ</strong></u>: Ph&aacute;p<br />\r\n<u><strong>Thương hiệu:</strong></u>&nbsp;Adelie</p>\r\n\r\n<h2>Tag:</h2>\r\n\r\n<ul>\r\n	<li><a href=\"http://occidentmart.vn/product/search?tag=B%C3%A1nh%20Ad%C3%A9lie%20h%E1%BA%A1nh%20nh%C3%A2n%20s%C3%B4%20c%C3%B4%20la%20150G\">B&aacute;nh Ad&eacute;lie hạnh nh&acirc;n s&ocirc; c&ocirc; la 150G</a></li>\r\n</ul>', 180000, 150000, '1Ls8Ry4XK03OIqO4.jpg', 'hộp', 0, 'ON', '2019-12-10 04:24:51', '2019-12-10 04:24:51'),
(27, '4 CẶP LẠC HỒNG TRANG TRÍ BÁNH KEM', 49, '<p>CHI TIẾT SẢN PHẨM</p>\r\n\r\n<p>Danh Mục</p>\r\n\r\n<p><a href=\"https://shopee.vn/\">Shopee</a><a href=\"https://shopee.vn/Nh%C3%A0-C%E1%BB%ADa-%C4%90%E1%BB%9Di-S%E1%BB%91ng-cat.87\">Nh&agrave; Cửa &amp; Đời Sống</a><a href=\"https://shopee.vn/%C4%90%E1%BB%93-d%C3%B9ng-nh%C3%A0-b%E1%BA%BFp-Ph%C3%B2ng-%C4%83n-cat.87.1997\">Đồ d&ugrave;ng nh&agrave; bếp &amp; Ph&ograve;ng ăn</a><a href=\"https://shopee.vn/D%E1%BB%A5ng-c%E1%BB%A5-l%C3%A0m-b%C3%A1nh-cat.87.1997.13757\">Dụng cụ l&agrave;m b&aacute;nh</a></p>\r\n\r\n<p>Thương hiệu<a href=\"https://shopee.vn/search?attrId=1132&amp;attrName=Th%C6%B0%C6%A1ng%20hi%E1%BB%87u&amp;attrVal=No%20Brand\">No Brand</a></p>\r\n\r\n<p>Gửi từ</p>\r\n\r\n<p>Quận Nam Từ Li&ecirc;m, H&agrave; Nội</p>\r\n\r\n<p>M&Ocirc; TẢ SẢN PHẨM</p>\r\n\r\n<p>- Hạc hồng trang tr&iacute; b&aacute;nh sinh nhật. - Sản phẩm trang tr&iacute; b&aacute;nh mới được ưa chu&ocirc;ng nhất hiện nay bởi n&oacute; đẹp v&agrave; bắt mắt. -Li&ecirc;n hệ: dụng cụ ONG VẼ - SDT: 0853 116 712 HOẶC 0868971 591</p>', 180000, 140000, 'gn0gkSdB7S93ixrA.jpg', 'cái', 1, 'ON', '2019-12-10 04:29:52', '2019-12-10 04:29:52'),
(28, 'COMBO 3 GÓI BÁNH KEM XỐP NABATI PHÔ MAI (3 X 58G)', 51, '<p>CHI TIẾT SẢN PHẨM</p>\r\n\r\n<p>Danh Mục</p>\r\n\r\n<p><a href=\"https://shopee.vn/\">Shopee</a><a href=\"https://shopee.vn/B%C3%A1ch-Ho%C3%A1-Online-cat.9824\">B&aacute;ch Ho&aacute; Online</a><a href=\"https://shopee.vn/%C4%90%E1%BB%93-h%E1%BB%99p-%C4%90%C3%B3ng-g%C3%B3i-cat.9824.9831\">Đồ hộp &amp; Đ&oacute;ng g&oacute;i</a></p>\r\n\r\n<p>Thương hiệu<a href=\"https://shopee.vn/search?attrId=8426&amp;attrName=Th%C6%B0%C6%A1ng%20hi%E1%BB%87u&amp;attrVal=Nabati\">Nabati</a></p>\r\n\r\n<p>Xuất xứ<a href=\"https://shopee.vn/search?attrId=19946&amp;attrName=Xu%E1%BA%A5t%20x%E1%BB%A9&amp;attrVal=Indonesia\">Indonesia</a></p>\r\n\r\n<p>Gửi từ</p>\r\n\r\n<p>Huyện Ho&agrave;i Đức, H&agrave; Nội</p>\r\n\r\n<p>M&Ocirc; TẢ SẢN PHẨM</p>\r\n\r\n<p>COMBO 3 G&Oacute;I B&Aacute;NH KEM XỐP NABATI PH&Ocirc; MAI (3 x 58G) B&Aacute;NH KEM XỐP NABATI PH&Ocirc; MAI Khối lượng: 58g Hướng dẫn sử dụng: D&ugrave;ng trực tiếp. Th&agrave;nh phần nguy&ecirc;n liệu: Bột m&igrave;, đường, dầu thực vật (c&oacute; chứa chất chống oxy h&oacute;a TBHQ), bột whey, muối, bột ph&ocirc; mai, chất nhũ h&oacute;a, đậu n&agrave;nh, viatamin (A, B1, B2, B6, B12). Hạn sử dụng: 12 th&aacute;ng Xuất xứ: Indonesia. Quy c&aacute;ch đ&oacute;ng g&oacute;i: G&oacute;i <a href=\"https://shopee.vn/banhxop-tag\">#banhxop</a> <a href=\"https://shopee.vn/banhkemxop-tag\">#banhkemxop</a> <a href=\"https://shopee.vn/banhnhapkhau-tag\">#banhnhapkhau</a> <a href=\"https://shopee.vn/banhnk-tag\">#banhnk</a> <a href=\"https://shopee.vn/kemxop-tag\">#kemxop</a> <a href=\"https://shopee.vn/banhngot-tag\">#banhngot</a> <a href=\"https://shopee.vn/banh-tag\">#banh</a> <a href=\"https://shopee.vn/banhkem-tag\">#banhkem</a></p>', 30000, 20000, '9WoQ1omDblbxlKUb.jpg', 'hộp', 0, 'ON', '2019-12-10 04:31:55', '2019-12-10 04:31:55'),
(29, 'Bánh Gavottes Plaisir Dentelle Hỗn Hợp (240g)', 51, '<h3>TH&Ocirc;NG TIN CHI TIẾT</h3>\r\n\r\n<table cellspacing=\"0\" id=\"chi-tiet\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Thương hiệu</td>\r\n			<td><a href=\"http://tiki.vn/thuong-hieu/gavottes.html\">Gavottes</a></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Xuất xứ thương hiệu</td>\r\n			<td>Ph&aacute;p</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Sản xuất tại</td>\r\n			<td>Ph&aacute;p</td>\r\n		</tr>\r\n		<tr>\r\n			<td>SKU</td>\r\n			<td>6710363469188</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Trọng lượng</td>\r\n			<td>240g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hướng dẫn bảo quản</td>\r\n			<td>Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h3>M&Ocirc; TẢ SẢN PHẨM</h3>\r\n\r\n<ul>\r\n	<li><strong>B&aacute;nh Gavottes Plaisir Dentelle Hỗn Hợp (240g)&nbsp;</strong>với th&agrave;nh phần được bổ sung đầy đủ vitamin v&agrave; kho&aacute;ng chất, gi&uacute;p cơ thể tr&agrave;n đầy năng lượng,&nbsp;thường&nbsp;được d&ugrave;ng trong bữa s&aacute;ng hoặc bữa ăn nhẹ gi&uacute;p cơ thể lu&ocirc;n sẵn s&agrave;ng năng lượng cho c&aacute;c hoạt động h&agrave;ng ng&agrave;y.</li>\r\n	<li>Hương vị thơm ngon v&agrave; kh&ocirc;ng g&acirc;y ng&aacute;n, được kiểm tra nghi&ecirc;m ngặt qu&aacute; tr&igrave;nh chế biến từ kh&acirc;u chọn nguy&ecirc;n liệu cho đến khi th&agrave;nh phẩm.</li>\r\n	<li>Ngo&agrave;i d&ugrave;ng trong gia đ&igrave;nh, bạn cũng c&oacute; thể sử dụng để l&agrave;m qu&agrave; tặng trong những dịp lễ, Tết hay mang theo nh&acirc;m nhi trong những chuyến du lịch, d&atilde; ngoại.</li>\r\n</ul>', 280000, 245000, 'kTMQsfqqFvFvEAXa.jpg', 'hộp', 0, 'ON', '2019-12-10 04:34:11', '2019-12-10 04:34:11'),
(30, 'Bánh Chocolate KitKat Bites Gói 40g', 48, '<h3>TH&Ocirc;NG TIN CHI TIẾT</h3>\r\n\r\n<table cellspacing=\"0\" id=\"chi-tiet\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Thương hiệu</td>\r\n			<td><a href=\"http://tiki.vn/thuong-hieu/kit-kat.html\">Kit Kat</a></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Sản xuất tại</td>\r\n			<td>Malaysia</td>\r\n		</tr>\r\n		<tr>\r\n			<td>SKU</td>\r\n			<td>9304838077779</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hạn sử dụng</td>\r\n			<td>12/2016</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h3>M&Ocirc; TẢ SẢN PHẨM</h3>\r\n\r\n<p><strong>B&aacute;nh Chocolate KitKat Bites G&oacute;i 40g</strong></p>\r\n\r\n<p><strong>B&aacute;nh Chocolate KitKat Bites G&oacute;i 40g</strong>&nbsp;l&agrave; b&aacute;nh snack chocolate mang đến cho bạn những gi&acirc;y ph&uacute;t th&uacute; vị khi tr&ograve; chuyện, vui chơi c&ugrave;ng bạn b&egrave;. B&aacute;nh được l&agrave;m từ c&aacute;c th&agrave;nh phần sạch, đ&atilde; qua tuyển chọn kỹ lưỡng n&ecirc;n đảm bảo an to&agrave;n cho sức khỏe người d&ugrave;ng. G&oacute;i b&aacute;nh nhỏ, c&oacute; thể đem theo mọi l&uacute;c mọi nơi, &quot;giải quyết&quot; cảm gi&aacute;c buồn ch&aacute;n ngay lập tức.</p>\r\n\r\n<p><img alt=\"Bánh Chocolate KitKat Bites Gói 40g\" src=\"https://tikicdn.com/media/catalog/product/k/i/kitkat%20bites%2040g.u2409.d20160524.t202532.jpg\" style=\"height:600px; width:600px\" title=\"Bánh Chocolate KitKat Bites Gói 40g\" /></p>\r\n\r\n<p><strong>Th&ocirc;ng tin sản phẩm</strong></p>\r\n\r\n<p><strong>Nguy&ecirc;n liệu thơm ngon</strong></p>\r\n\r\n<p>B&aacute;nh Chocolate KitKat Bites l&agrave; sự h&ograve;a quyện độc đ&aacute;o giữa vị ngọt ng&agrave;o của chocolate, vị b&eacute;o ngậy của sữa, độ xốp, gi&ograve;n của b&aacute;nh. Sản phẩm mang đến cho bạn hương vị thơm ngon, hấp dẫn.</p>\r\n\r\n<p><strong>Chất lượng tuyệt hảo</strong></p>\r\n\r\n<p>B&aacute;nh Chocolate KitKat Bites kh&ocirc;ng chứa phẩm m&agrave;u hoặc h&oacute;a chất độc hại, qu&aacute; tr&igrave;nh sản xuất được kiểm định nghi&ecirc;m ngặt, đảm bảo chất lượng. Đặc biệt, b&aacute;nh c&ograve;n chứa nhiều th&agrave;nh phần hữu &iacute;ch cho sức khỏe, d&ugrave;ng cho bữa ăn nhẹ, cung cấp nhiều năng lượng, cho bạn một ng&agrave;y học tập, l&agrave;m việc hiệu quả.</p>\r\n\r\n<p><strong>M&oacute;n ăn nhẹ hấp dẫn</strong></p>\r\n\r\n<p>Kh&aacute;c với c&aacute;c d&ograve;ng KitKat th&ocirc;ng thường, KitKat Bites l&agrave; dạng b&aacute;nh snack với từng vi&ecirc;n nhỏ, bạn c&oacute; thể nh&acirc;m nhi c&ugrave;ng bạn b&egrave; hoặc đem theo để vừa ăn vừa &quot;t&aacute;m&quot; trong c&aacute;c chuyến d&atilde; ngoại, du lịch. Chocolate KitKat dần trở th&agrave;nh một trong những thương hiệu b&aacute;nh kẹo rất nổi tiếng được nhiều người tin d&ugrave;ng.</p>\r\n\r\n<p><strong>Hướng dẫn sử dụng</strong></p>\r\n\r\n<p>- D&ugrave;ng trực tiếp.</p>\r\n\r\n<p>- Bảo quản nơi kh&ocirc; m&aacute;t, tr&aacute;nh &aacute;nh s&aacute;ng trực tiếp.</p>\r\n\r\n<p>&nbsp;</p>', 17000, 15000, 'Iq1No9CGEft9rekV.jpg', 'cái', 0, 'ON', '2019-12-10 04:35:45', '2019-12-10 04:35:45'),
(31, 'Bánh Quy Bơ Danisa (454g)', 51, '<h3>TH&Ocirc;NG TIN CHI TIẾT</h3>\r\n\r\n<table cellspacing=\"0\" id=\"chi-tiet\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Thương hiệu</td>\r\n			<td><a href=\"http://tiki.vn/thuong-hieu/danisa.html\">Danisa</a></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Xuất xứ thương hiệu</td>\r\n			<td>Indonesia</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Sản xuất tại</td>\r\n			<td>Indonesia</td>\r\n		</tr>\r\n		<tr>\r\n			<td>SKU</td>\r\n			<td>1693827642394</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Trọng lượng</td>\r\n			<td>454g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hướng dẫn bảo quản</td>\r\n			<td>Nơi kh&ocirc; r&aacute;o, dưới 30 độ C, tr&aacute;nh &aacute;nh nắng trực tiếp</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hạn sử dụng</td>\r\n			<td>Xem tr&ecirc;n bao b&igrave; sản phẩm</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h3>M&Ocirc; TẢ SẢN PHẨM</h3>\r\n\r\n<ul>\r\n	<li><strong>B&aacute;nh Quy Bơ Danisa (454g)</strong>&nbsp;l&agrave; loại b&aacute;nh được sản xuất bởi tập đo&agrave;n h&agrave;ng đầu Indonesia Mayora. Sản phẩm được l&agrave;m từ những nguy&ecirc;n liệu cao cấp kết hợp với c&ocirc;ng nghệ hiện đại, mang đậm chất ho&agrave;ng gia qu&yacute; ph&aacute;i của Đan Mạch.</li>\r\n	<li>B&aacute;nh Quy Bơ Danisa được sản xuất theo c&ocirc;ng nghệ Ch&acirc;u &Acirc;u của Đan Mạch, đ&atilde; qua c&aacute;c kh&acirc;u kiểm tra nghi&ecirc;m ngặt, mang đậm chất ho&agrave;ng gia qu&yacute; ph&aacute;i. B&aacute;nh Danisa đảm bảo chất lượng an to&agrave;n, kh&ocirc;ng c&oacute; đường h&oacute;a học, kh&ocirc;ng chứa h&oacute;a chất độc hại, mang đến sự an t&acirc;m cho bạn.</li>\r\n	<li>B&aacute;nh c&oacute; hương vị dễ ăn, thơm ngon, b&eacute;o dịu, gi&ograve;n tan rất hấp dẫn. B&ecirc;n cạnh đ&oacute;, b&aacute;nh cũng cung cấp nhiều năng lượng, protein v&agrave; một số vitamin n&ecirc;n rất th&iacute;ch hợp l&agrave;m m&oacute;n ăn nhẹ bổ dưỡng cho những người bận rộn.</li>\r\n	<li>Sản phẩm được đ&oacute;ng g&oacute;i trong một chiếc hộp thiếc chất lượng cao c&ugrave;ng lớp giấy bọc gi&uacute;p b&aacute;nh kh&ocirc;ng bị vỡ v&agrave; vẫn giữ được độ gi&ograve;n ngay cả khi đ&atilde; mở bao b&igrave;. B&aacute;nh l&agrave; sự lựa chọn ho&agrave;n hảo mỗi khi bạn c&oacute; nhu cầu mua hộp b&aacute;nh về ăn hoặc mang tặng, biếu người th&acirc;n, gia đ&igrave;nh.</li>\r\n</ul>', 180000, 150000, '70l4zTPp2YxFlgyx.jpg', 'hộp', 0, 'ON', '2019-12-10 04:36:39', '2019-12-10 04:36:39'),
(32, 'Bánh Chocochip TOPCAKE Castana (Hộp 600g) - Phúc Lộc Thọ', 47, '<h3>TH&Ocirc;NG TIN CHI TIẾT</h3>\r\n\r\n<table cellspacing=\"0\" id=\"chi-tiet\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Thương hiệu</td>\r\n			<td><a href=\"http://tiki.vn/thuong-hieu/topcake.html\">Topcake</a></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Sản xuất tại</td>\r\n			<td>Việt Nam</td>\r\n		</tr>\r\n		<tr>\r\n			<td>SKU</td>\r\n			<td>6933327586435</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Th&agrave;nh phần</td>\r\n			<td>Bột m&igrave;, đường, chất b&eacute;o thực vật, dầu bơ khan, cơm dừa sấy, s&ocirc;c&ocirc;la hạt, trứng, gừng, nho kh&ocirc;, chất tạo xốp [amoni hydro carbonat (E503ii), natri hydro carbonat (E500ii)], hạnh nh&acirc;n, mạch nha, sữa nguy&ecirc;n kem, muối, chất nhũ h&oacute;a [lecitin (E322i)], bột ca cao, hương s&ocirc;c&ocirc;la tổng hợp, chất điều chỉnh độ acid [monocalci orthophosphat (E341i)], m&agrave;u thực phẩm [beta-caroten tổng hợp (E160ai)].</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Trọng lượng</td>\r\n			<td>600g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hướng dẫn sử dụng</td>\r\n			<td>D&ugrave;ng trực tiếp. N&ecirc;n sử dụng sản phẩm trong v&ograve;ng 45 ph&uacute;t sau khi mở bao b&igrave; trực tiếp.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hướng dẫn bảo quản</td>\r\n			<td>Bảo quản ở nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hạn sử dụng</td>\r\n			<td>Xem tr&ecirc;n bao b&igrave; sản phẩm</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h3>M&Ocirc; TẢ SẢN PHẨM</h3>\r\n\r\n<ul>\r\n	<li><strong>B&aacute;nh Chocochip TOPCAKE Castana (Hộp 600g) - Ph&uacute;c Lộc Thọ&nbsp;</strong>vẫn giữ được t&ocirc;ng m&agrave;u đỏ chủ đạo cho ng&agrave;y Tết truyền thống, kết hợp h&igrave;nh ảnh Ph&uacute;c - Lộc - Thọ sẽ mang đến nhiều may mắn v&agrave; t&agrave;i lộc cho gia chủ cũng như người nhận qu&agrave;.&nbsp;</li>\r\n	<li>Hỗn hợp b&aacute;nh chocochip nhiều m&ugrave;i vị như s&ocirc; c&ocirc; la, gừng, bơ sữa được đ&oacute;ng g&oacute;i trong hộp thiếc vu&ocirc;ng cao 600g đẹp mắt gi&uacute;p người tặng dễ lựa chọn, ph&ugrave; hợp với c&aacute;c nhu cầu biếu tặng ng&agrave;y Tết.</li>\r\n	<li>Những chiếc b&aacute;nh quy cao cấp được l&agrave;m từ 100% trứng thật, bơ thật sẽ gi&uacute;p qu&agrave; tặng của bạn th&ecirc;m tr&acirc;n trọng, &yacute; nghĩa. B&ecirc;n cạnh đ&oacute;, sản phẩm được sản xuất theo d&acirc;y chuyền c&ocirc;ng nghệ v&agrave; quy tr&igrave;nh kiểm tra nghi&ecirc;m ngặt đảm bảo sức khỏe cho người ti&ecirc;u d&ugrave;ng.</li>\r\n	<li>C&aacute;c th&agrave;nh c&oacute; trong b&aacute;nh cung cấp nhiều chất dinh dưỡng thiết yếu cho cơ thể gi&uacute;p bạn tr&agrave;n đầy năng lượng cho ng&agrave;y l&agrave;m việc hiệu quả.</li>\r\n	<li>Sản phẩm được đ&oacute;ng hộp đẹp mắt, gi&uacute;p bảo quản sản phẩm tốt hơn đồng thời dễ d&agrave;ng mang theo sản phẩm c&aacute;c chuyến du lịch, c&ocirc;ng t&aacute;c để nh&acirc;m nhi b&ecirc;n t&aacute;ch tr&agrave;, c&agrave; ph&ecirc; c&ugrave;ng bạn b&egrave;, đồng nghiệp.</li>\r\n</ul>', 110000, 0, 'tEUlxMz2LPeX8TUV.jpg', 'cái', 1, 'ON', '2019-12-10 04:37:23', '2019-12-10 04:37:23'),
(33, 'Bánh quy nhân sầu riêng 240g – Musang King Durian Biscuit', 47, '<h3>TH&Ocirc;NG TIN CHI TIẾT</h3>\r\n\r\n<table cellspacing=\"0\" id=\"chi-tiet\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Thương hiệu</td>\r\n			<td><a href=\"http://tiki.vn/thuong-hieu/oem.html\">OEM</a></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Sản xuất tại</td>\r\n			<td>Malaysia</td>\r\n		</tr>\r\n		<tr>\r\n			<td>SKU</td>\r\n			<td>2588598915688</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h3>M&Ocirc; TẢ SẢN PHẨM</h3>\r\n\r\n<p>B&aacute;nh quy nh&acirc;n sầu ri&ecirc;ng Musang (240g) sản phẩm được nhập khẩu từ Malaysia. Được xem như l&agrave; đặc sản Malaysia.</p>\r\n\r\n<p>Sản phẩm được đ&oacute;ng g&oacute;i đẹp mắt, tiện lợi v&agrave; dễ sử dụng cũng như việc bảo quản.</p>\r\n\r\n<p>B&aacute;nh kh&ocirc;ng chứa đường h&oacute;a học kh&ocirc;ng sử dụng chất độc hại v&agrave; đ&atilde; qua kiểm nghiệm đảm bảo an to&agrave;n cho sức khỏe người ti&ecirc;u d&ugrave;ng</p>', 80000, 70000, 'LEA3VKsbMnf6reaw.jpg', 'cái', 0, 'ON', '2019-12-10 04:38:12', '2019-12-10 04:38:12'),
(34, 'Bánh Vị Socola Trắng Và Hạt Hạnh Nhân Tahoe Pepperidge Farm (204g)', 51, '<h3>TH&Ocirc;NG TIN CHI TIẾT</h3>\r\n\r\n<table cellspacing=\"0\" id=\"chi-tiet\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Thương hiệu</td>\r\n			<td><a href=\"http://tiki.vn/thuong-hieu/pepperidge-farm.html\">Pepperidge Farm</a></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Xuất xứ thương hiệu</td>\r\n			<td>Mỹ</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Sản xuất tại</td>\r\n			<td>Mỹ</td>\r\n		</tr>\r\n		<tr>\r\n			<td>SKU</td>\r\n			<td>3647849175697</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Trọng lượng</td>\r\n			<td>206g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hướng dẫn bảo quản</td>\r\n			<td>Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hạn sử dụng</td>\r\n			<td>Xem tr&ecirc;n bao b&igrave; sản phẩm</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h3>M&Ocirc; TẢ SẢN PHẨM</h3>\r\n\r\n<ul>\r\n	<li><strong>B&aacute;nh Vị Socola Trắng V&agrave; Hạt Hạnh Nh&acirc;n Tahoe Pepperidge Farm (204g)&nbsp;</strong>c&oacute; th&agrave;nh phần nguy&ecirc;n liệu được lựa chọn kỹ lưỡng, kh&ocirc;ng chứa h&oacute;a chất độc hại, an to&agrave;n cho người d&ugrave;ng.</li>\r\n	<li>Sản phẩm được sản xuất tr&ecirc;n quy tr&igrave;nh c&ocirc;ng nghệ hiện đại, được kiểm duyệt chặt chẽ, đảm bảo chất lượng v&agrave; đ&acirc;y c&ograve;n l&agrave; sản phẩm được ưa chuộng tr&ecirc;n thị trường.</li>\r\n	<li>Th&agrave;nh phần c&oacute; trong b&aacute;nh gi&uacute;p bạn bổ sung c&aacute;c vitamin v&agrave; kho&aacute;ng chất cần thiết cho cơ thể mỗi ng&agrave;y. B&aacute;nh vị socola trắng v&agrave; hạt hạnh nh&acirc;n gi&uacute;p bổ sung năng lượng vừa đủ trong thời gian d&agrave;i học tập v&agrave; l&agrave;m việc.</li>\r\n	<li>Sản phẩm được đ&oacute;ng g&oacute;i&nbsp;nhỏ gọn, tiện lợi sử dụng trong gia đ&igrave;nh hoặc mang đi du lịch, d&atilde; ngoại. Vỏ&nbsp;đựng sản phẩm l&agrave;m từ nguy&ecirc;n liệu sạch, kh&ocirc;ng lẫn tạp chất h&oacute;a học độc hại.</li>\r\n</ul>', 80000, 0, 'yBHyoNGdVDGvaDpp.jpg', 'hộp', 1, 'ON', '2019-12-10 04:39:01', '2019-12-10 04:39:01'),
(35, 'Bánh AFC - Vị Lúa Mì (300g)', 51, '<h3>TH&Ocirc;NG TIN CHI TIẾT</h3>\r\n\r\n<table cellspacing=\"0\" id=\"chi-tiet\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Thương hiệu</td>\r\n			<td><a href=\"http://tiki.vn/thuong-hieu/afc.html\">AFC</a></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Sản xuất tại</td>\r\n			<td>Việt Nam</td>\r\n		</tr>\r\n		<tr>\r\n			<td>SKU</td>\r\n			<td>3323252383941</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Th&agrave;nh phần</td>\r\n			<td>Bột m&igrave;, dầu olenin, shortening, đường, mạch nha, đạm whey, vảy khoai t&acirc;y, bơ, bột ph&ocirc; mai, muối&hellip;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Trọng lượng</td>\r\n			<td>300g</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h3>M&Ocirc; TẢ SẢN PHẨM</h3>\r\n\r\n<ul>\r\n	<li><strong>B&aacute;nh AFC - Vị L&uacute;a M&igrave; (300g)</strong>&nbsp;l&agrave;m từ nguy&ecirc;n liệu cao cấp, cho hương vị trọn vẹn tr&ecirc;n từng chiếc b&aacute;nh.</li>\r\n	<li>B&aacute;nh dễ ăn, hương vị thơm ngon, gi&ograve;n tan rất hấp dẫn, ph&ugrave; hợp cho mọi khẩu vị người d&ugrave;ng.</li>\r\n	<li>Ngo&agrave;i ra, b&aacute;nh c&ograve;n cung cấp năng lượng, protein, chất xơ, đặc biệt l&agrave; vitamin D v&agrave; canxi gi&uacute;p xương chắc khỏe.</li>\r\n	<li>Sản phẩm th&iacute;ch hợp l&agrave;m m&oacute;n ăn nhẹ bổ dưỡng cho những người bận rộn.</li>\r\n	<li>B&aacute;nh AFC vị l&uacute;a m&igrave; được sản xuất tr&ecirc;n quy tr&igrave;nh c&ocirc;ng nghệ hiện đại, được kiểm duyệt chặt chẽ.</li>\r\n	<li>Sản phẩm đảm bảo chất lượng an to&agrave;n, kh&ocirc;ng c&oacute; đường h&oacute;a học, kh&ocirc;ng chứa h&oacute;a chất độc hại, mang đến sự an t&acirc;m cho bạn.</li>\r\n</ul>', 35000, 0, 'op4k9oKFl8nD0jPW.png', 'cái', 1, 'ON', '2019-12-10 04:39:41', '2019-12-10 04:39:41'),
(36, 'Bánh Chocolate KitKat Bites Gói 200g', 51, '<h3>TH&Ocirc;NG TIN CHI TIẾT</h3>\r\n\r\n<table cellspacing=\"0\" id=\"chi-tiet\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Thương hiệu</td>\r\n			<td><a href=\"http://tiki.vn/thuong-hieu/kit-kat.html\">Kit Kat</a></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Sản xuất tại</td>\r\n			<td>Malaysia</td>\r\n		</tr>\r\n		<tr>\r\n			<td>SKU</td>\r\n			<td>9300996910576</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hạn sử dụng</td>\r\n			<td>2/2017</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h3>M&Ocirc; TẢ SẢN PHẨM</h3>\r\n\r\n<p><strong>B&aacute;nh Chocolate KitKat Bites G&oacute;i 200g</strong></p>\r\n\r\n<p><strong>B&aacute;nh Chocolate KitKat Bites G&oacute;i 200g</strong>&nbsp;đ&oacute;ng g&oacute;i lớn để bạn thỏa th&iacute;ch thưởng thức khi đang tr&ograve; chuyện c&ugrave;ng bạn b&egrave;. Bạn cũng c&oacute; thể đem theo để nh&acirc;m nhi trong c&aacute;c chuyến đi d&atilde; ngoại hay du lịch. B&aacute;nh được l&agrave;m từ nguồn nguy&ecirc;n liệu an to&agrave;n, chứa h&agrave;m lượng dinh dưỡng cao, kh&ocirc;ng chỉ l&agrave; m&oacute;n ăn vặt m&agrave; cũng gi&uacute;p cung cấp năng lượng, cho tinh thần sảng kho&aacute;i hơn.</p>\r\n\r\n<p><img alt=\"Bánh Chocolate KitKat Bites Gói 200g\" src=\"https://tikicdn.com/media/catalog/product/s/o/socola%20kit%20kat%20bites%20goi%20200g.u2409.d20160524.t203902.jpg\" style=\"height:600px; width:600px\" title=\"Bánh Chocolate KitKat Bites Gói 200g\" /></p>\r\n\r\n<p><strong>Th&ocirc;ng tin sản phẩm</strong></p>\r\n\r\n<p><strong>Nguy&ecirc;n liệu thơm ngon</strong></p>\r\n\r\n<p>B&aacute;nh Chocolate KitKat Bites l&agrave; sự h&ograve;a quyện độc đ&aacute;o giữa vị ngọt ng&agrave;o của chocolate, vị b&eacute;o ngậy của sữa, độ xốp, gi&ograve;n của b&aacute;nh. Sản phẩm mang đến cho bạn hương vị thơm ngon, hấp dẫn.</p>\r\n\r\n<p><strong>Chất lượng tuyệt hảo</strong></p>\r\n\r\n<p>B&aacute;nh Chocolate KitKat Bites kh&ocirc;ng chứa phẩm m&agrave;u hoặc h&oacute;a chất độc hại, qu&aacute; tr&igrave;nh sản xuất được kiểm định nghi&ecirc;m ngặt, đảm bảo chất lượng. Đặc biệt, b&aacute;nh c&ograve;n chứa nhiều th&agrave;nh phần hữu &iacute;ch cho sức khỏe, d&ugrave;ng cho bữa ăn nhẹ, cung cấp nhiều năng lượng, cho bạn một ng&agrave;y học tập, l&agrave;m việc hiệu quả.</p>\r\n\r\n<p><strong>M&oacute;n ăn nhẹ hấp dẫn</strong></p>\r\n\r\n<p>Kh&aacute;c với c&aacute;c d&ograve;ng KitKat th&ocirc;ng thường, KitKat Bites l&agrave; dạng b&aacute;nh snack với từng vi&ecirc;n nhỏ, bạn c&oacute; thể nh&acirc;m nhi c&ugrave;ng bạn b&egrave; hoặc đem theo để vừa ăn vừa &quot;t&aacute;m&quot; trong c&aacute;c chuyến d&atilde; ngoại, du lịch. Chocolate KitKat dần trở th&agrave;nh một trong những thương hiệu b&aacute;nh kẹo rất nổi tiếng được nhiều người tin d&ugrave;ng.</p>\r\n\r\n<p><strong>G&oacute;i 200g tiết kiệm hơn</strong></p>\r\n\r\n<p>Sản phẩm được đ&oacute;ng g&oacute;i lớn 200g gi&uacute;p bạn tiết kiệm chi ph&iacute;, thời gian mua sắm. Với g&oacute;i b&aacute;nh lớn n&agrave;y, bạn sẽ thỏa m&atilde;n &quot;cơn th&egrave;m&quot; ngọt bất cứ l&uacute;c n&agrave;o.</p>\r\n\r\n<p><strong>Hướng dẫn sử dụng</strong></p>\r\n\r\n<p>- D&ugrave;ng trực tiếp.</p>\r\n\r\n<p>- Bảo quản nơi kh&ocirc; m&aacute;t, tr&aacute;nh &aacute;nh s&aacute;ng trực tiếp.</p>\r\n\r\n<p><a href=\"https://tiki.vn/banh-chocolate-kitkat-bites-goi-200g-p504022.html?src=search&amp;2hi=1&amp;keyword=b%C3%A1nh#\" title=\"Xem Thêm Nội Dung\">Xem Th&ecirc;m Nội Dung</a></p>', 60000, 0, 'LyoBo3Vip4WlORJj.jpg', 'hộp', 1, 'ON', '2019-12-10 04:40:28', '2019-12-10 04:40:28'),
(37, 'Temp 1', 51, '<h3>TH&Ocirc;NG TIN CHI TIẾT</h3>\r\n\r\n<table cellspacing=\"0\" id=\"chi-tiet\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Thương hiệu</td>\r\n			<td><a href=\"http://tiki.vn/thuong-hieu/cosy.html\">Temp</a></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Xuất xứ thương hiệu</td>\r\n			<td>Temp</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Sản xuất tại</td>\r\n			<td>Việt Nam</td>\r\n		</tr>\r\n		<tr>\r\n			<td>SKU</td>\r\n			<td>8040888658933</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Th&agrave;nh phần</td>\r\n			<td>Temp</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Trọng lượng</td>\r\n			<td>320g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hướng dẫn sử dụng</td>\r\n			<td>Temp</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hướng dẫn bảo quản</td>\r\n			<td>\r\n			<p>Temp</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h3>M&Ocirc; TẢ SẢN PHẨM</h3>\r\n\r\n<p>Temp</p>', 40000, 0, 'yPCdh239B4d7UkRX.png', 'cái', 1, 'ON', '2019-12-10 04:41:22', '2019-11-23 08:26:02');

-- --------------------------------------------------------

--
-- Table structure for table `slide`
--

DROP TABLE IF EXISTS `slide`;
CREATE TABLE IF NOT EXISTS `slide` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã Slide',
  `link` varchar(100) NOT NULL COMMENT 'Liên kết đến sản phẩm',
  `image` varchar(100) NOT NULL COMMENT 'hình ảnh',
  `stt` varchar(50) DEFAULT NULL COMMENT 'STT',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Chỉnh sửa ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `slide`
--

INSERT INTO `slide` (`id`, `link`, `image`, `stt`, `created_at`, `updated_at`) VALUES
(15, '19', '1-vegetables.jpg', 'ON', '2019-12-09 16:31:26', '2019-12-09 16:31:26'),
(16, '20', '2-fruits.jpg', 'ON', '2019-12-09 16:31:34', '2019-12-09 16:31:34'),
(18, '19', '3-juices.jpg', 'ON', '2019-12-09 16:33:04', '2019-12-09 16:33:04'),
(20, '21', '4-dried.jpg', 'ON', '2019-12-09 16:33:18', '2019-12-09 16:33:18');

-- --------------------------------------------------------

--
-- Table structure for table `systems`
--

DROP TABLE IF EXISTS `systems`;
CREATE TABLE IF NOT EXISTS `systems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Khóa xác định',
  `name` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Tên hiện thị',
  `stt` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'STT',
  `value` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT 'Giá trị',
  `comment` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Ghi chú',
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `systems`
--

INSERT INTO `systems` (`id`, `key`, `name`, `stt`, `value`, `comment`, `updated_at`) VALUES
(1, 'logo', 'Web Logo', 'ON', 'small-logo.png', 'Here you can edit it OK', '2019-11-23 08:53:20'),
(2, 'title', 'Web title', 'ON', 'VEGEFOODS- Web Dev 2 - Production', 'Here is web title', '2019-11-23 08:53:22'),
(3, 'slide', 'Slide hero', 'ON', 'slide.jpg', 'Slide hero', '2019-12-04 04:03:27'),
(4, 'type', 'Type Product', 'ON', '', '', '2019-12-09 17:22:16'),
(5, 'about', 'Web infor', 'ON', '<h5 style=\"margin-left:0px; margin-right:0px; text-align:center\">\r\n  <span style=\"font-family:Courier New,Courier,monospace\">\r\n    <span style=\"font-size:18px\"><span style=\"color:#c0392b\">\r\n      <strong>ABOUT US WORK</strong>\r\n      </span>\r\n    </span>\r\n  </span></h5>\r\n', 'About us', '2019-12-03 04:36:01'),
(6, 'contact', 'Contact Us', 'ON', '<p><span style=\"color:#2c3e50\"><span style=\"font-size:22px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">Develop by <strong>Group 10 with Love</strong><br />\r\n﻿Mobile: 0939 506 264<br />\r\nFax <em>123-456-5679</em></span></span>\r\n    </span>\r\n</p>', 'Contact content', '2019-12-03 04:36:04'),
(7, 'header', 'Header', 'OFF', '<h1 style=\"text-align:center\"><span style=\"font-size:18px\"><span style=\"font-family:Verdana,Geneva,sans-serif\"><span style=\"color:#27ae60\">Header works!</span></span></span></h1>', 'Header content', '2019-12-04 03:11:16'),
(8, 'footer', 'Footer', 'ON', '<p><span style=\"font-size:14px\"><span style=\"font-family:Times New Roman,Times,serif\"><strong><span style=\"color:#7f8c8d\">Contact for service</span><a href=\"mailto:allerwill.lee@gmail.com?subject=Hello&amp;body=Xin%20ch%C3%A0o\"><span style=\"color:#7f8c8d\">allerwill.lee@gmail.com</span></a><span style=\"color:#7f8c8d\">&nbsp;(7:30 - 22:00)</span></strong>\r\n    </span>\r\n    </span>\r\n</p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Times New Roman,Times,serif\"><strong><span style=\"color:#7f8c8d\">Contact for technical issue</span><a href=\"tel:0337292905\"><span style=\"color:#7f8c8d\">0939 506 264</span></a><span style=\"color:#7f8c8d\">&nbsp;(8:00 - 21:30)</span></strong>\r\n    </span>\r\n    </span>\r\n</p>', 'Footer', '2019-12-03 04:12:50'),
(9, 'payment', 'Payment Method', 'ON', 'payment.png', '', '2019-12-03 04:37:10'),
(10, 'facebook', 'Facebook', 'ON', 'https://www.facebook.com/Allerwill', 'Facebook', '2019-11-13 04:33:08'),
(11, 'instagram', 'Instagram', 'ON', 'https://www.instagram.com/allerwill.lee/', 'Instagram', '2019-11-12 04:00:20'),
(12, 'google', 'Google+', 'ON', 'google.com', 'Google+', '2019-11-19 07:12:37'),
(13, 'background', 'Background', 'OFF', 'Will.png', '#ffffff', '2019-11-15 11:12:46'),
(19, 'backmenu', 'Menu picture', 'OFF', '', '', '2019-11-16 02:30:05'),
(14, 'subbackground', 'Sub Background', 'OFF', '', '#c0c0c0', '2019-11-15 11:12:48'),
(15, 'color', 'Text color', 'ON', '#000080', '', '2019-11-15 10:58:23'),
(16, 'btncolor', 'Text button color', 'ON', '#000000', '', '2019-11-15 11:00:29'),
(17, 'btnback', 'Button color', 'ON', '#ffffff', '', '2019-11-15 10:59:53'),
(18, 'subbackcolor', 'Sub back color', 'ON', '#8080ff', '', '2019-11-15 10:59:07');

-- --------------------------------------------------------

--
-- Table structure for table `type_products`
--

DROP TABLE IF EXISTS `type_products`;
CREATE TABLE IF NOT EXISTS `type_products` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã loại',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên loại',
  `description` text COLLATE utf8_unicode_ci COMMENT 'Mô tả',
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'hình ảnh',
  `stt` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Trạng thái',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Chỉnh sửa',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `type_products`
--

INSERT INTO `type_products` (`id`, `name`, `description`, `image`, `stt`, `created_at`, `updated_at`) VALUES
(47, 'Vegetables', '<h3><span style=\"color:#2c3e50\"><span style=\"font-family:Verdana,Geneva,sans-serif\">Vegetables</span></span></h3>', 'vege.jpg', 'ON', '2019-12-08 02:51:35', '2019-12-10 04:10:29'),
(48, 'Fruits', '<h3><span style=\"color:#4e5f70\"><span style=\"font-family:Verdana,Geneva,sans-serif\">Fruits</span></span></h3>', 'fruit.jpg', 'ON', '2019-12-08 02:52:41', '2019-11-23 09:04:17'),
(49, 'Juices', '<h3><strong><span style=\"color:#4e5f70\"><span style=\"font-family:Verdana,Geneva,sans-serif\">Juices</span></span></strong></h3>', 'juice.jpg', 'ON', '2019-12-08 02:54:37', '2019-11-23 09:04:14'),
(50, 'Dried', '<h3><span style=\"font-family:Verdana,Geneva,sans-serif\"><span style=\"color:#2c3e50\">Dried</span></span></h3>', 'OgjUnqCAUk1n5dhS.jpg', 'ON', '2019-12-08 02:55:28', '2019-11-23 08:34:59'),
(51, 'Temp', '<h3><span style=\"font-family:Comic Sans MS,cursive\">Temp</span></h3>', 'dried.jpg', 'ON', '2019-12-10 04:18:41', '2019-12-10 04:18:41');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã Uer',
  `full_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Họ tên',
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Email',
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Mật khẩu',
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Số điện thoại',
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Địa chỉ',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Token',
  `type` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'loại tài khoản',
  `stt` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Trạng thái',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Chỉnh sửa',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `phone`, `address`, `remember_token`, `type`, `stt`, `created_at`, `updated_at`) VALUES
(54, 'Will Le', 'allerwill.lee@gmail.com', '$2y$10$lAmgSHLQt4RfuKElcbeubOfuf1K8Q5/NT7AJvOFWaMs6YdJKDsN5O', '0939506264', 'Ho Chi Minh', NULL, 'Supper Admin', 'ON', '2019-11-23 06:27:54', '2019-11-23 06:27:54'),
(55, 'Thanh Hồ', 'hominhthanh@gmail.com', '$2y$10$6mcyqDXGr4eU64dnHIoVCuKEYu1aL5IkbOgoh204q58CivhmcSu8K', '0903455677', 'Landmark', NULL, 'Admin', 'ON', '2019-11-23 06:30:54', '2019-11-23 06:30:54'),
(56, 'Trường Hoàng', 'hohoangtentruong@gmail.com', '$2y$10$W1r8VcjVLd50U8Vn3UpY6ee8Vq1jT5p4.Kiz5QTUEC1gOJ1UV5BjS', '012345678', 'Time Square', NULL, 'Admin', 'ON', '2019-11-23 06:31:55', '2019-11-23 06:31:55');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_id_type_foreign` FOREIGN KEY (`id_type`) REFERENCES `type_products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
