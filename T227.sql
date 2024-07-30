/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb3 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS `t227`;
CREATE DATABASE IF NOT EXISTS `t227` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `t227`;

DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='配置文件';

DELETE FROM `config`;

DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE IF NOT EXISTS `dictionary` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` int DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字  Search111 ',
  `super_id` int DEFAULT NULL COMMENT '父字段id',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='字典';

DELETE FROM `dictionary`;
INSERT INTO `dictionary` (`id`, `dic_code`, `dic_name`, `code_index`, `index_name`, `super_id`, `beizhu`, `create_time`) VALUES
	(1, 'sex_types', '性别类型', 1, '男', NULL, NULL, '2022-04-08 08:48:00'),
	(2, 'sex_types', '性别类型', 2, '女', NULL, NULL, '2022-04-08 08:48:00'),
	(3, 'zhongzheng_types', '是否重症', 1, '重症', NULL, NULL, '2022-04-08 08:48:00'),
	(4, 'zhongzheng_types', '是否重症', 2, '轻症', NULL, NULL, '2022-04-08 08:48:00'),
	(5, 'miqiejiechuzhe_geli_types', '隔离类型', 1, '14天隔离', NULL, NULL, '2022-04-08 08:48:00'),
	(6, 'miqiejiechuzhe_geli_types', '隔离类型', 2, '7天隔离', NULL, NULL, '2022-04-08 08:48:00');

DROP TABLE IF EXISTS `huanzhe`;
CREATE TABLE IF NOT EXISTS `huanzhe` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `huanzhe_name` varchar(200) DEFAULT NULL COMMENT '患者姓名 Search111 ',
  `huanzhe_phone` varchar(200) DEFAULT NULL COMMENT '患者手机号',
  `huanzhe_id_number` varchar(200) DEFAULT NULL COMMENT '患者身份证号',
  `huanzhe_photo` varchar(200) DEFAULT NULL COMMENT '患者头像',
  `sex_types` int DEFAULT NULL COMMENT '性别',
  `huanzhe_email` varchar(200) DEFAULT NULL COMMENT '电子邮箱',
  `huanzhe_zhuzhi` varchar(200) DEFAULT NULL COMMENT '患者住址',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '录入时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='患者';

DELETE FROM `huanzhe`;
INSERT INTO `huanzhe` (`id`, `huanzhe_name`, `huanzhe_phone`, `huanzhe_id_number`, `huanzhe_photo`, `sex_types`, `huanzhe_email`, `huanzhe_zhuzhi`, `insert_time`, `create_time`) VALUES
	(1, '患者姓名1', '17703786901', '410224199610232001', 'http://localhost:8080/yiqingxinxiguanlixitong/upload/yuangong1.jpg', 1, '1@qq.com', '患者住址1', '2022-04-08 08:48:14', '2022-04-08 08:48:14'),
	(2, '患者姓名2', '17703786902', '410224199610232002', 'http://localhost:8080/yiqingxinxiguanlixitong/upload/yuangong2.jpg', 1, '2@qq.com', '患者住址2', '2022-04-08 08:48:14', '2022-04-08 08:48:14'),
	(3, '患者姓名3', '17703786903', '410224199610232003', 'http://localhost:8080/yiqingxinxiguanlixitong/upload/yuangong3.jpg', 1, '3@qq.com', '患者住址3', '2022-04-08 08:48:14', '2022-04-08 08:48:14'),
	(4, '患者姓名4', '17703786904', '410224199610232004', 'http://localhost:8080/yiqingxinxiguanlixitong/upload/yuangong1.jpg', 2, '4@qq.com', '患者住址4', '2022-04-08 08:48:14', '2022-04-08 08:48:14'),
	(5, '患者姓名5', '17703786905', '410224199610232005', 'http://localhost:8080/yiqingxinxiguanlixitong/upload/yuangong2.jpg', 1, '5@qq.com', '患者住址5', '2022-04-08 08:48:14', '2022-04-08 08:48:14'),
	(6, '患者2222', '17703786936', '410224199610232002', 'http://localhost:8080/yiqingxinxiguanlixitong/upload/1649416804626.jpg', 2, 'sagg@qq.com', '地址`11', '2022-04-08 11:20:16', '2022-04-08 11:20:16');

DROP TABLE IF EXISTS `miqiejiechuzhe`;
CREATE TABLE IF NOT EXISTS `miqiejiechuzhe` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `huanzhe_id` int DEFAULT NULL COMMENT '患者',
  `miqiejiechuzhe_uuid_number` varchar(200) DEFAULT NULL COMMENT '密切接触者编号 Search111 ',
  `miqiejiechuzhe_geli_address` varchar(200) DEFAULT NULL COMMENT '隔离地址 Search111 ',
  `miqiejiechuzhe_geli_types` int DEFAULT NULL COMMENT '隔离类型',
  `miqiejiechuzhe_content` text COMMENT '隔离备注 ',
  `geli_time` timestamp NULL DEFAULT NULL COMMENT '隔离时间',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '录入时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='密切接触者';

DELETE FROM `miqiejiechuzhe`;
INSERT INTO `miqiejiechuzhe` (`id`, `huanzhe_id`, `miqiejiechuzhe_uuid_number`, `miqiejiechuzhe_geli_address`, `miqiejiechuzhe_geli_types`, `miqiejiechuzhe_content`, `geli_time`, `insert_time`, `create_time`) VALUES
	(1, 1, '164940769495315', '隔离地址1', 2, '隔离备注1', '2022-04-08 08:48:14', '2022-04-08 08:48:14', '2022-04-08 08:48:14'),
	(2, 2, '16494076949537', '隔离地址2', 2, '隔离备注2', '2022-04-08 08:48:14', '2022-04-08 08:48:14', '2022-04-08 08:48:14'),
	(3, 3, '16494076949564', '隔离地址3', 2, '隔离备注3', '2022-04-08 08:48:14', '2022-04-08 08:48:14', '2022-04-08 08:48:14'),
	(4, 4, '164940769495618', '隔离地址4', 1, '隔离备注4', '2022-04-08 08:48:14', '2022-04-08 08:48:14', '2022-04-08 08:48:14'),
	(5, 5, '16494076949563', '隔离地址5', 2, '隔离备注5', '2022-04-08 08:48:14', '2022-04-08 08:48:14', '2022-04-08 08:48:14'),
	(6, 4, '1649416749507', '地址11111', 2, '<p>是个哈哈军军军军</p>', '2022-04-08 11:19:23', '2022-04-08 11:19:25', '2022-04-08 11:19:25');

DROP TABLE IF EXISTS `quezhenhuanzhe`;
CREATE TABLE IF NOT EXISTS `quezhenhuanzhe` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `huanzhe_id` int DEFAULT NULL COMMENT '患者',
  `quezhenhuanzhe_uuid_number` varchar(200) DEFAULT NULL COMMENT '确诊患者编号 Search111 ',
  `quezhenhuanzhe_geli_address` varchar(200) DEFAULT NULL COMMENT '确诊位置 Search111 ',
  `quezhenhuanzhe_content` text COMMENT '确诊备注 ',
  `quezhen_time` timestamp NULL DEFAULT NULL COMMENT '确诊时间',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '录入时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='确诊患者';

DELETE FROM `quezhenhuanzhe`;
INSERT INTO `quezhenhuanzhe` (`id`, `huanzhe_id`, `quezhenhuanzhe_uuid_number`, `quezhenhuanzhe_geli_address`, `quezhenhuanzhe_content`, `quezhen_time`, `insert_time`, `create_time`) VALUES
	(1, 1, '164940769495913', '确诊位置1', '确诊备注1', '2022-04-08 08:48:14', '2022-04-08 08:48:14', '2022-04-08 08:48:14');

DROP TABLE IF EXISTS `siwanghuanzhe`;
CREATE TABLE IF NOT EXISTS `siwanghuanzhe` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `huanzhe_id` int DEFAULT NULL COMMENT '患者',
  `siwanghuanzhe_uuid_number` varchar(200) DEFAULT NULL COMMENT '死亡患者编号 Search111 ',
  `siwanghuanzhe_content` text COMMENT '死亡备注 ',
  `quezhen_time` timestamp NULL DEFAULT NULL COMMENT '死亡时间',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '录入时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COMMENT='死亡患者';

DELETE FROM `siwanghuanzhe`;
INSERT INTO `siwanghuanzhe` (`id`, `huanzhe_id`, `siwanghuanzhe_uuid_number`, `siwanghuanzhe_content`, `quezhen_time`, `insert_time`, `create_time`) VALUES
	(6, 5, '1649416632120', '', '2022-04-08 11:17:12', '2022-04-08 11:17:12', '2022-04-08 11:17:12'),
	(7, 6, '1649417174141', '', '2022-04-08 11:26:14', '2022-04-08 11:26:14', '2022-04-08 11:26:14'),
	(8, 2, '1649417694581', '', '2022-04-08 11:34:55', '2022-04-08 11:34:55', '2022-04-08 11:34:55');

DROP TABLE IF EXISTS `token`;
CREATE TABLE IF NOT EXISTS `token` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='token表';

DELETE FROM `token`;
INSERT INTO `token` (`id`, `userid`, `username`, `tablename`, `role`, `token`, `addtime`, `expiratedtime`) VALUES
	(1, 6, 'admin', 'users', '管理员', 'eask5bpj11h3enrjtixkri073861hnu6', '2022-04-08 08:51:29', '2024-06-10 04:51:35'),
	(2, 1, 'a1', 'yuangong', '员工', 'wpc593yvgda5r4g605sqvfpx4b7201jl', '2022-04-08 11:19:35', '2024-06-10 04:52:20');

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='管理员';

DELETE FROM `users`;
INSERT INTO `users` (`id`, `username`, `password`, `role`, `addtime`) VALUES
	(6, 'admin', '123456', '管理员', '2022-05-02 06:51:13');

DROP TABLE IF EXISTS `yuangong`;
CREATE TABLE IF NOT EXISTS `yuangong` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yuangong_uuid_number` varchar(200) DEFAULT NULL COMMENT '员工编号 Search111 ',
  `yuangong_name` varchar(200) DEFAULT NULL COMMENT '员工姓名 Search111 ',
  `yuangong_phone` varchar(200) DEFAULT NULL COMMENT '员工手机号',
  `yuangong_id_number` varchar(200) DEFAULT NULL COMMENT '员工身份证号',
  `yuangong_photo` varchar(200) DEFAULT NULL COMMENT '员工头像',
  `sex_types` int DEFAULT NULL COMMENT '性别',
  `yuangong_email` varchar(200) DEFAULT NULL COMMENT '电子邮箱',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='员工';

DELETE FROM `yuangong`;
INSERT INTO `yuangong` (`id`, `username`, `password`, `yuangong_uuid_number`, `yuangong_name`, `yuangong_phone`, `yuangong_id_number`, `yuangong_photo`, `sex_types`, `yuangong_email`, `create_time`) VALUES
	(1, '员工1', '123456', '16494076949659', '员工姓名1', '17703786901', '410224199610232001', 'http://localhost:8080/yiqingxinxiguanlixitong/upload/yuangong1.jpg', 1, '1@qq.com', '2022-04-08 08:48:14'),
	(2, '员工2', '123456', '16494076949657', '员工姓名2', '17703786902', '410224199610232002', 'http://localhost:8080/yiqingxinxiguanlixitong/upload/yuangong2.jpg', 2, '2@qq.com', '2022-04-08 08:48:14'),
	(3, '员工3', '123456', '164940769496512', '员工姓名3', '17703786903', '410224199610232003', 'http://localhost:8080/yiqingxinxiguanlixitong/upload/yuangong3.jpg', 2, '3@qq.com', '2022-04-08 08:48:14');

DROP TABLE IF EXISTS `zhiliaoxinxi`;
CREATE TABLE IF NOT EXISTS `zhiliaoxinxi` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `huanzhe_id` int DEFAULT NULL COMMENT '患者',
  `zhiliaoxinxi_uuid_number` varchar(200) DEFAULT NULL COMMENT '治疗信息编号 Search111 ',
  `ganranyuan` varchar(200) DEFAULT NULL COMMENT '感染源',
  `zhongzheng_types` int DEFAULT NULL COMMENT '是否重症',
  `zhuyuan_time` timestamp NULL DEFAULT NULL COMMENT '住院时间',
  `fabing_zhengzhuang` varchar(200) DEFAULT NULL COMMENT '发病症状',
  `zhenzhiyiyuan` varchar(200) DEFAULT NULL COMMENT '诊治医院 Search111 ',
  `hesuanjiance_text` text COMMENT '核酸检测 ',
  `ctjiance_text` text COMMENT 'CT检测史 ',
  `zhiliaoxinxi_content` text COMMENT '信息备注 ',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '录入时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COMMENT='治疗信息';

DELETE FROM `zhiliaoxinxi`;
INSERT INTO `zhiliaoxinxi` (`id`, `huanzhe_id`, `zhiliaoxinxi_uuid_number`, `ganranyuan`, `zhongzheng_types`, `zhuyuan_time`, `fabing_zhengzhuang`, `zhenzhiyiyuan`, `hesuanjiance_text`, `ctjiance_text`, `zhiliaoxinxi_content`, `insert_time`, `create_time`) VALUES
	(1, 1, '164940769496819', '感染源', 2, '2022-04-08 08:48:14', '发病症状1', '诊治医院1', '核酸检测1', 'CT检测史1', '信息备注1', '2022-04-08 08:48:14', '2022-04-08 08:48:14'),
	(2, 2, '16494076949681', '感染源', 2, '2022-04-08 08:48:14', '发病症状2', '诊治医院2', '核酸检测2', 'CT检测史2', '信息备注2', '2022-04-08 08:48:14', '2022-04-08 08:48:14'),
	(3, 3, '164940769496818', '感染源', 2, '2022-04-08 08:48:14', '发病症状3', '诊治医院3', '核酸检测3', 'CT检测史3', '信息备注3', '2022-04-08 08:48:14', '2022-04-08 08:48:14'),
	(4, 4, '164940769496914', '感染源', 1, '2022-04-08 08:48:14', '发病症状4', '诊治医院4', '核酸检测4', 'CT检测史4', '信息备注4', '2022-04-08 08:48:14', '2022-04-08 08:48:14'),
	(5, 5, '164940769496911', '感染源', 1, '2022-04-08 08:48:14', '发病症状5', '诊治医院5', '核酸检测5', 'CT检测史5', '信息备注5', '2022-04-08 08:48:14', '2022-04-08 08:48:14'),
	(6, 6, '1649416824128', '感染源', 2, '2022-04-06 16:00:00', '病状1111', '亿元111', '核酸测', '阿是个哈哈', '<p>更好环境开课</p>', '2022-04-08 11:21:39', '2022-04-08 11:21:39'),
	(7, 6, '1649417104122', '感染源1211', 1, '2022-04-08 11:25:12', '热的时候', '独孤皇后', '打得过哈哈', '几节课', '<p>适当好好</p>', '2022-04-08 11:25:20', '2022-04-08 11:25:20');

DROP TABLE IF EXISTS `zhiyuhuanzhe`;
CREATE TABLE IF NOT EXISTS `zhiyuhuanzhe` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `huanzhe_id` int DEFAULT NULL COMMENT '患者',
  `zhiyuhuanzhe_uuid_number` varchar(200) DEFAULT NULL COMMENT '治愈患者编号 Search111 ',
  `zhiyuhuanzhe_content` text COMMENT '治愈备注 ',
  `quezhen_time` timestamp NULL DEFAULT NULL COMMENT '治愈时间',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '录入时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COMMENT='治愈患者';

DELETE FROM `zhiyuhuanzhe`;
INSERT INTO `zhiyuhuanzhe` (`id`, `huanzhe_id`, `zhiyuhuanzhe_uuid_number`, `zhiyuhuanzhe_content`, `quezhen_time`, `insert_time`, `create_time`) VALUES
	(6, 4, '1649416645623', '', '2022-04-08 11:17:26', '2022-04-08 11:17:26', '2022-04-08 11:17:26'),
	(7, 3, '1649417184196', '', '2022-04-08 11:26:24', '2022-04-08 11:26:24', '2022-04-08 11:26:24');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
