-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 02, 2020 at 02:50 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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

CREATE TABLE `bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `date_order` date DEFAULT NULL,
  `total` float DEFAULT NULL COMMENT 'tổng tiền',
  `payment` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'hình thức thanh toán',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'code',
  `stt` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '0-đang chờ, 1-đang giao, 2 đã giao',
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`id`, `id_customer`, `date_order`, `total`, `payment`, `note`, `code`, `stt`, `created_at`, `updated_at`) VALUES
(15, 30, '2020-10-11', 4500, 'COD', 'dhdshrhwreyew', NULL, '0', '2020-10-11 10:46:16', '2020-10-11 10:46:16');

-- --------------------------------------------------------

--
-- Table structure for table `bill_detail`
--

CREATE TABLE `bill_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_bill` int(10) NOT NULL,
  `id_product` int(10) NOT NULL,
  `quantity` int(11) NOT NULL COMMENT 'số lượng',
  `unit_price` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill_detail`
--

INSERT INTO `bill_detail` (`id`, `id_bill`, `id_product`, `quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
(22, 15, 38, 6, 750, '2020-10-11 10:46:16', '2020-10-11 10:46:16');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'mã khách hàng',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'tên khách hàng',
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'email',
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'đia chỉ',
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'số điện thoại',
  `stt` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'STT',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `email`, `address`, `phone`, `stt`, `created_at`, `updated_at`) VALUES
(30, 'Lê Trí Đức', 'allerwill.lee@gmail.com', 'Thủ Đức', '0939506264', 'ON', '2020-10-11 10:46:16', '2020-10-11 10:46:16');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Mã sản phẩm',
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Tên sản phẩm',
  `id_type` int(10) UNSIGNED DEFAULT NULL COMMENT 'Mã loại',
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Mô tả',
  `unit_price` float DEFAULT NULL COMMENT 'Đơn giá',
  `promotion_price` float DEFAULT NULL COMMENT 'Giá bán',
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'hình ảnh',
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'đơn vị',
  `new` tinyint(4) DEFAULT 0 COMMENT 'mới',
  `stt` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'STT',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Chỉnh sửa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `id_type`, `description`, `unit_price`, `promotion_price`, `image`, `unit`, `new`, `stt`, `created_at`, `updated_at`) VALUES
(38, 'RAM DDR3 Laptop 8G/1600 PC3L KINGSTON/SAMSUNG', 50, '<p>Ram Laptop DDR3 8GB bus 1600 của h&atilde;ng Samsung được th&aacute;o m&aacute;y v&agrave; test kĩ trước khi giao đến cho kh&aacute;ch h&agrave;ng. Ram c&oacute; thể l&agrave; h&atilde;ng Samsung/ Hynix/ Kingston t&ugrave;y v&agrave;o đợt h&agrave;ng. Tất cả được bảo h&agrave;nh 1 đổi 1 trong 12 th&aacute;ng. Gi&aacute; đ&atilde; được bao gồm c&ocirc;ng lắp đặt cho kh&aacute;ch</p>', 700000, 669000, 'sGRsMOv7DXLkg2Mg.jpg', 'liter', 0, 'ON', '2020-10-11 09:08:51', '2020-10-13 11:08:44'),
(39, 'RAM DDR3 Laptop 4G/1600 PC3L KINGSTON/SAMSUNG', 50, '<p>H&agrave;ng th&aacute;o m&aacute;y, bảo h&agrave;nh 12 th&aacute;ng 1 đổi 1.</p>', 400000, 365000, 'edpVn3ZMnTLxzoF6.PNG', 'pound', 0, 'ON', '2020-10-11 17:12:37', '2020-10-11 17:13:39'),
(40, 'RAM DDR4 Laptop 4G/2400 Kington', 54, '<p>RAM laptop DDR4&nbsp;Kingston Bus 2400 new bảo h&agrave;nh 36 th&aacute;ng 1 đổi 1.</p>', 450000, 399000, 'rPK2VeZKXyxb2A4C.jpg', 'Pound', 0, 'ON', '2020-10-13 12:10:13', '2020-10-13 12:10:13'),
(41, 'RAM DDR4 Laptop 8G bus 2400 Samsung', 54, '<p>RAM DDR4 SAMSUNG 8GB bus 2400 new bảo h&agrave;nh 1 đổi 1 3 năm</p>', 840000, 799000, 'RQCCcr2EfepGEqDB.jpg', 'Pound', 0, 'ON', '2020-10-13 12:17:12', '2020-10-13 12:17:12');

-- --------------------------------------------------------

--
-- Table structure for table `slide`
--

CREATE TABLE `slide` (
  `id` int(11) NOT NULL COMMENT 'Mã Slide',
  `link` varchar(100) NOT NULL COMMENT 'Liên kết đến sản phẩm',
  `image` varchar(100) NOT NULL COMMENT 'hình ảnh',
  `stt` varchar(50) DEFAULT NULL COMMENT 'STT',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Chỉnh sửa '
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `slide`
--

INSERT INTO `slide` (`id`, `link`, `image`, `stt`, `created_at`, `updated_at`) VALUES
(16, '38', 'y830ptNfxkanst5P.jpg', 'ON', '2018-12-09 16:31:34', '2020-10-11 09:11:40'),
(18, '38', 'BnxhfiPlBWpNWrKJ.jpg', 'ON', '2018-12-09 16:33:04', '2020-10-11 09:11:31'),
(20, '38', 'umca5CzQlxRlX91A.png', 'ON', '2018-12-09 16:33:18', '2020-10-11 09:11:21');

-- --------------------------------------------------------

--
-- Table structure for table `systems`
--

CREATE TABLE `systems` (
  `id` int(11) NOT NULL,
  `key` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Khóa xác định',
  `name` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Tên hiện thị',
  `stt` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'STT',
  `value` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Giá trị',
  `comment` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Ghi chú',
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `systems`
--

INSERT INTO `systems` (`id`, `key`, `name`, `stt`, `value`, `comment`, `updated_at`) VALUES
(1, 'logo', 'Logo trang web', 'ON', 'logo.png', 'Tại đây bạn có thể chỉnh sửa Logo cũng như hiện hoăc ẩn nó.', '2020-10-11 09:13:01'),
(2, 'title', 'Tiêu đề trang web', 'ON', 'LEQ Store - Linh kiện Laptop - PC - Đồ chơi tin học', 'Tại đây bạn có thể chỉnh sửa tiêu đề cũng như hiện hoăc ẩn nó.', '2020-10-11 09:25:32'),
(3, 'slide', 'Slide đầu trang', 'ON', 'slide.png', 'Bạn có thể ẩn hiện Slide đầu trang.', '2018-12-04 04:03:27'),
(4, 'type', 'Loại sản phẩm', 'ON', 'type.png', 'Bạn có thể ẩn hoặc hiện thị Loại sản phẩm trên menu.', '2018-12-09 17:22:16'),
(5, 'about', 'Thông tin trang web', 'ON', '<h5 style=\"margin-left:0px; margin-right:0px; text-align:center\"><span style=\"font-family:Courier New,Courier,monospace\"><span style=\"font-size:18px\"><span style=\"color:#c0392b\"><strong>SHOP MUA SẮM V&Agrave; B&Aacute;N H&Agrave;NG ONLINE ĐƠN GIẢN, NHANH CH&Oacute;NG TR&Ecirc;N ĐIỆN THOẠI DI ĐỘNG</strong></span></span></span></h5>\r\n\r\n<p style=\"margin-left:0px; margin-right:0px; text-align:justify\"><span style=\"font-size:18px\"><span style=\"color:#f39c12\">Nếu bạn đang t&igrave;m kiếm một trang web để mua v&agrave; b&aacute;n h&agrave;ng trực tuyến th&igrave; Shop l&agrave; một sự lựa chọn hiệu quả d&agrave;nh cho bạn. </span><span style=\"color:#2ecc71\"><span style=\"font-family:Lucida Sans Unicode,Lucida Grande,sans-serif\">Bản chất của Shop l&agrave; một social ecommerce platform - nền tảng cho ph&eacute;p người b&aacute;n h&agrave;ng c&oacute; thể xem như một trang web thương mại điện tử t&iacute;ch hợp mạng x&atilde; hội để tương t&aacute;c, </span></span><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"color:#c0392b\">thay đổi th&ocirc;ng tin để cho kh&aacute;ch h&agrave;ng c&oacute; thể dễ d&agrave;ng tiếp cận được. Nhờ nền tảng đ&oacute;, việc mua h&agrave;ng tr&ecirc;n Shop trở n&ecirc;n nhanh ch&oacute;ng v&agrave; đơn giản hơn. Bạn c&oacute; thể tr&ograve; chuyện trực tiếp với nh&agrave; b&aacute;n h&agrave;ng để hỏi trực tiếp về mặt h&agrave;ng cần mua. C&ograve;n nếu bạn muốn t&igrave;m mua những d&ograve;ng sản phẩm ch&iacute;nh h&atilde;ng, uy t&iacute;n</span></span><span style=\"color:#2ecc71\">,</span><span style=\"color:#f39c12\"> </span><span style=\"font-family:Verdana,Geneva,sans-serif\"><span style=\"color:#7f8c8d\">Shop Mall ch&iacute;nh l&agrave; sự lựa chọn l&iacute; tưởng d&agrave;nh cho bạn. Đến với Shop, cơ hội để trở th&agrave;nh một nh&agrave; b&aacute;n h&agrave;ng dễ d&agrave;ng hơn bao giờ hết. Chỉ với v&agrave;i thao t&aacute;c tr&ecirc;n ứng dụng, bạn đ&atilde; c&oacute; thể đăng b&aacute;n ngay những sản phẩm của m&igrave;nh. Kh&ocirc;ng những thế, c&aacute;c nh&agrave; b&aacute;n h&agrave;ng c&oacute; thể t&ugrave;y chọn c&aacute;c t&iacute;nh năng</span></span><span style=\"color:#f39c12\"> &ldquo;<em>Shop tạm nghỉ&rdquo; hoặc tự tạo ri&ecirc;ng cho m&igrave;nh một chương tr&igrave;nh khuyến m&atilde;i để thu h&uacute;t người mua với những sản phẩm c&oacute; mức gi&aacute; hấp dẫn. </em></span><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><span style=\"color:#000000\"><em>Khi đăng nhập tại Shopee K&ecirc;nh người b&aacute;n, bạn c&oacute; thể dễ d&agrave;ng ph&acirc;n loại sản phẩm, theo d&otilde;i đơn h&agrave;ng, chăm s&oacute;c kh&aacute;ch h&agrave;ng v&agrave; cập nhập ngay c&aacute;c hoạt động của shop.</em></span></span></span></p>', 'Hãy soạn nội dung giới thiệu trang web và Lưu lại.', '2018-12-03 04:36:01'),
(6, 'contact', 'Liên hệ trang web', 'ON', '<p><span style=\"color:#2c3e50\"><span style=\"font-size:22px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">Designed with&nbsp;<img alt=\"heart\" src=\"http://localhost/WD2-pro/public/CKEditorFullColor/plugins/smiley/images/heart.png\" style=\"height:23px; width:23px\" title=\"heart\" />&nbsp;in Ho Chi Minh<br />\r\n﻿Phone: 0939 506 264</span></span></span></p>\r\n\r\n<p><span style=\"color:#2c3e50\"><span style=\"font-size:22px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">Email: allerwill.lee@gmail.com</span></span></span></p>', 'Hãy soạn nội dung liên hệ cho trang web và Lưu lại.', '2020-10-11 10:11:09'),
(7, 'header', 'Đầu trang', 'ON', '<h3><span style=\"color:#ff9900\">Ch&agrave;o mừng qu&yacute; kh&aacute;ch đến với shop C&ocirc;ng Nghệ LEQ</span></h3>', 'Hãy soạn nội dung cho đầu trang web và Lưu lại.', '2020-10-11 15:38:57'),
(8, 'footer', 'Cuối trang', 'ON', '<p><span style=\"font-size:14px\"><span style=\"font-family:Times New Roman,Times,serif\"><strong><span style=\"color:#7f8c8d\">Gọi mua h&agrave;ng&nbsp;</span></strong></span></span><span style=\"font-family:Comic Sans MS,cursive\"><span style=\"font-size:16px\"><strong><a href=\"tel:0939506264\">0939506264</a></strong></span></span><span style=\"font-size:16px\"><span style=\"font-family:Times New Roman,Times,serif\"><strong><span style=\"color:#7f8c8d\">&nbsp;(7:30 - 22:00)</span></strong></span></span></p>\r\n\r\n<p><strong><span style=\"color:#7f8c8d\"><span style=\"font-size:14px\">Email:&nbsp;</span></span><span style=\"font-size:12px\"><span style=\"font-family:Comic Sans MS,cursive\"><a href=\"mailto:allerwill.lee@gmail.com\" style=\"font-size: 16px;\">allerwill.lee@gmail.com</a></span></span></strong><span style=\"font-size:12px\"><span style=\"font-family:Times New Roman,Times,serif\"><strong><span style=\"color:#7f8c8d\"><span style=\"font-family:Comic Sans MS,cursive\">&nbsp;</span></span></strong></span></span><span style=\"font-size:14px\"><span style=\"font-family:Times New Roman,Times,serif\"><strong><span style=\"color:#7f8c8d\">(8:00 - 21:30)</span></strong></span></span></p>', 'Hãy soạn nội dung cho cuối trang web và Lưu lại.', '2020-10-11 10:15:43'),
(9, 'payment', 'Phương thức thanh toán', 'ON', 'payment.png', 'Hãy soạn nội dung cho phương thức thanh toán và Lưu lại.', '2018-12-03 04:37:10'),
(10, 'facebook', 'Facebook', 'ON', 'https://www.facebook.com/allerwill', 'Facebook', '2020-10-11 09:26:29'),
(11, 'instagram', 'Instagram', 'ON', 'https://www.instagram.com/allerwill.le/', 'Instagram', '2020-10-11 10:28:58'),
(12, 'google', 'Google+', 'ON', NULL, 'Google+', '2020-10-11 09:26:29'),
(13, 'background', 'Hình nền', 'OFF', 'background_img.png', '#ffffff', '2018-11-15 11:12:46'),
(19, 'backmenu', 'Hình ảnh menu', 'OFF', 'backmenu_img.png', 'Hình nền  của thanh menu.', '2018-11-16 02:30:05'),
(14, 'subbackground', 'Hình nền phụ', 'OFF', 'subbackground_img.png', '#c0c0c0', '2018-11-15 11:12:48'),
(15, 'color', 'Màu chữ', 'ON', '#000080', 'Bạn có thể chọn màu cho chữ.', '2018-11-15 10:58:23'),
(16, 'btncolor', 'Màu chữ Nút', 'ON', '#000000', 'Bạn có thể chọn màu cho chữ của các nút, menu...', '2018-11-15 11:00:29'),
(17, 'btnback', 'Màu nền Nút', 'ON', '#ffffff', 'Bạn có thể chọn màu cho nền của các nút, menu...', '2018-11-15 10:59:53'),
(18, 'subbackcolor', 'Màu nền phụ', 'ON', '#8080ff', 'Bạn có thể chọn màu cho nền chi tiết khác.', '2018-11-15 10:59:07');

-- --------------------------------------------------------

--
-- Table structure for table `type_products`
--

CREATE TABLE `type_products` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Mã loại',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên loại',
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Mô tả',
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'hình ảnh',
  `stt` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Trạng thái',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Chỉnh sửa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `type_products`
--

INSERT INTO `type_products` (`id`, `name`, `description`, `image`, `stt`, `created_at`, `updated_at`) VALUES
(50, 'RAM LAPTOP THÁO MÁY', '<h3><span style=\"color:#2c3e50; font-family:Verdana, Geneva, sans-serif\">RAM- Random Access Memory l&agrave; bộ phận quan trọng trong Laptop- PC của bạn, một bộ nhớ RAM đầy đủ gi&uacute;p bạn c&oacute; thể đa nhiệm nhiều t&aacute;c vụ m&agrave; kh&ocirc;ng lo về giật lag m&aacute;y hay tr&agrave;n bộ nhớ. RAM th&aacute;o m&aacute;y được LEQ Store th&aacute;o từ những chiếc laptop mang thương hiệu Dell, HP, ThinkPad được gia c&ocirc;ng OEM bởi c&aacute;c nh&agrave; sản xuất t&ecirc;n tuổi như Samsung, Hynix, Kingston. Tất cả đều được LEQ Store test kĩ v&agrave; bảo h&agrave;nh 1 đổi 1 trong 12 th&aacute;ng cho qu&yacute; kh&aacute;ch h&agrave;ng.</span></h3>', 'PyQwkLifDYgxlv3E.jpg', 'ON', '2018-12-08 02:55:28', '2020-10-13 10:47:18'),
(51, 'SSD Chính hãng', '<h3><span style=\"font-family:Comic Sans MS,cursive\">SSD- Solid Sate Drive l&agrave; ổ cứng thể rắn cho tốc độ truy xuất nhanh gấp 10 lần ổ cứng th&ocirc;ng thường.</span></h3>\r\n\r\n<p><span style=\"font-family:Comic Sans MS,cursive\">Hiện tại LEQ Store đang cung cấp ch&iacute;nh h&atilde;ng&nbsp;c&aacute;c loại ổ cứng chuẩn Sata III v&agrave; NVMe cho Laptop v&agrave; PC với gi&aacute; rất phải chăng v&agrave; được bảo h&agrave;nh ch&iacute;nh h&atilde;ng 1 đổi 1 trong 3 năm.</span></p>', 'jeitENsxvSuRSfCQ.jpg', 'ON', '2018-12-10 04:18:41', '2020-10-13 10:41:17'),
(52, 'Đồ chơi tin học', '<p>C&aacute;c sản phẩm tin học như B&uacute;t điều khiển từ xa, thẻ nhớ, Box ổ cứng, c&aacute;c loại c&aacute;p chuyển đổi....</p>', '8hare00aH0F3U92A.jpg', 'ON', '2020-10-11 09:55:21', '2020-10-11 17:35:00'),
(53, 'RAM PC CHÍNH HÃNG', '<p>RAM PC Ch&iacute;nh h&atilde;ng của LEQ được bảo h&agrave;nh ch&iacute;nh h&atilde;ng 1 đổi 1 trong 3 năm.</p>', 'gXb5v6gwp0qMsCRq.jpg', 'ON', '2020-10-13 10:50:15', '2020-10-13 10:50:15'),
(54, 'RAM LAPTOP NEW', '<p>RAM LAPTOP NEW Bảo h&agrave;nh 36 th&aacute;ng</p>', '5uq79KN9OffPqye9.jpg', 'ON', '2020-10-13 12:06:41', '2020-10-13 12:06:41');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Mã Uer',
  `full_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Họ tên',
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Email',
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Mật khẩu',
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Số điện thoại',
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Địa chỉ',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Token',
  `type` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'loại tài khoản',
  `stt` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Trạng thái',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Chỉnh sửa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `phone`, `address`, `remember_token`, `type`, `stt`, `created_at`, `updated_at`) VALUES
(54, 'Lê Trí Đức', 'allerwill.lee@gmail.com', '$2y$10$M3j5kjsWs.Io1.UOM6BbwOUizofjRnPwzKND/X18ZjCO6.jcpDgrS', '0939506264', 'Thủ Đức', '9Q58K6ROKzXqGuD4QuK9nguSCTQYmyrSdh7IGPVREwOETKDzeiiyfkXcmlOE', 'Supper Admin', 'ON', '2020-10-11 09:59:26', '2020-10-11 09:59:26'),
(55, 'bigboss', 'peter.bigboss@gmail.com', '$2y$10$Qd5TyIUVwjwvLt1qFsRg5.rQDennaWecnhPXCw/Xv7miOoXyizdQi', NULL, NULL, NULL, 'Supper Admin', 'ON', '2020-10-11 10:01:10', '2020-10-11 10:01:10'),
(56, 'Tesst 1', 'aaaaa@gmail.com', '$2y$10$oNuBQxVzob4y4YdKNRGhN.BIphgefg8ygCDQJI.tjCOB7bfE/WzFq', '02284455488', 'Thu Duc', NULL, 'Customer', 'OFF', '2020-10-11 10:02:25', '2020-10-11 10:02:25'),
(57, 'pup pup', 'puppupkk@yopmail.com', '$2y$10$WMq8JoGKmviGThqsWlul.evrOHgp3Peik9BaFTpyV.u7TnS90mlWa', '12241888', 'ssfeffef', NULL, 'Customer', 'OFF', '2020-10-11 10:03:46', '2020-10-11 10:03:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bills_ibfk_1` (`id_customer`);

--
-- Indexes for table `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_detail_ibfk_2` (`id_product`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_id_type_foreign` (`id_type`);

--
-- Indexes for table `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `systems`
--
ALTER TABLE `systems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_products`
--
ALTER TABLE `type_products`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'mã khách hàng', AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã sản phẩm', AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã Slide', AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `systems`
--
ALTER TABLE `systems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `type_products`
--
ALTER TABLE `type_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã loại', AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã Uer', AUTO_INCREMENT=58;

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
