/*
 Navicat Premium Data Transfer

 Source Server         : aliyun-47.110.60.211
 Source Server Type    : MySQL
 Source Server Version : 50742
 Source Host           : 47.110.60.211:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 50742
 File Encoding         : 65001

 Date: 29/07/2023 09:15:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `like_count` int(11) NOT NULL DEFAULT 0,
  `dislike_count` int(11) NOT NULL DEFAULT 0,
  `collect_count` int(11) NOT NULL DEFAULT 0,
  `comment_count` int(11) NOT NULL DEFAULT 0,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  `user_id` int(10) UNSIGNED NOT NULL,
  `create_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `blog_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES (1, '《西行记》', '去', 0, 0, 1, 0, 0, 1, '2023-07-22 10:56:05');
INSERT INTO `blog` VALUES (2, '《1》', '2', 2, 0, 0, 0, 0, 3, '2023-07-22 10:56:51');
INSERT INTO `blog` VALUES (3, '《4>', '4', 0, 0, 0, 0, 0, 4, '2023-07-22 10:57:17');
INSERT INTO `blog` VALUES (4, '喜之郎', '喜之郎', 0, 0, 0, 0, 0, 9, '2023-07-22 11:46:04');
INSERT INTO `blog` VALUES (5, '论如何成功', '认赵孝权当儿子即可', 0, 0, 0, 0, 0, 10, '2023-07-22 11:50:27');
INSERT INTO `blog` VALUES (9, '赵小全是傻狗', '杨立强是傻逼', 0, 0, 0, 0, 0, 12, '2023-07-28 14:16:07');
INSERT INTO `blog` VALUES (10, '赵小全是傻狗', '杨立强是傻逼', 0, 0, 0, 0, 0, 12, '2023-07-28 14:16:38');
INSERT INTO `blog` VALUES (11, '赵小全是傻鸟', '杨立强是shagou', 0, 0, 0, 0, 0, 12, '2023-07-28 14:16:50');
INSERT INTO `blog` VALUES (12, '赵小全是我儿', '杨立强是元素周期表51号元素', 0, 0, 0, 0, 0, 12, '2023-07-28 14:17:11');
INSERT INTO `blog` VALUES (13, '赵小全是我儿', '杨立强是元素周期表51号元素', 0, 0, 0, 0, 0, 12, '2023-07-28 14:17:13');
INSERT INTO `blog` VALUES (14, '杨立强别叫了', '组长是跳狗', 0, 0, 0, 0, 0, 12, '2023-07-28 14:17:53');
INSERT INTO `blog` VALUES (15, '杨立强是一条恶犬', '组长是条狗', 0, 0, 0, 0, 0, 12, '2023-07-28 14:18:29');
INSERT INTO `blog` VALUES (16, '杨立强只会乱吠', ' 赵小全是一条好犬', 0, 0, 0, 0, 0, 12, '2023-07-28 14:18:49');
INSERT INTO `blog` VALUES (17, '杨立强真不是个东西', ' 赵小全是一条喜欢乱吠的好犬', 0, 0, 0, 0, 0, 12, '2023-07-28 14:19:15');
INSERT INTO `blog` VALUES (18, '喜欢乱吠的杨立强', '喜欢狗叫的赵小泉', 0, 0, 0, 0, 0, 12, '2023-07-28 14:20:53');
INSERT INTO `blog` VALUES (19, '我没屌', '赵小泉喜欢叫', 0, 0, 0, 0, 0, 12, '2023-07-28 14:22:04');

-- ----------------------------
-- Table structure for blog_image
-- ----------------------------
DROP TABLE IF EXISTS `blog_image`;
CREATE TABLE `blog_image`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uri` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `blog_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `blog_id`(`blog_id`) USING BTREE,
  CONSTRAINT `blog_image_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of blog_image
-- ----------------------------
INSERT INTO `blog_image` VALUES (1, '1690524968058835c240e-4d02-4b52-8932-7a86ed4aa933.jpg', 9);
INSERT INTO `blog_image` VALUES (2, '1690524998164e74f9678-850d-42b0-8bdc-074749220fb6.jpg', 10);
INSERT INTO `blog_image` VALUES (3, '16905250103244585522f-a9e7-495e-84fa-2e7e68a5d6d2.jpg', 11);
INSERT INTO `blog_image` VALUES (4, '1690525031716bfc4b2b2-85da-44cb-aa10-8911f7f4eb03.jpg', 12);
INSERT INTO `blog_image` VALUES (5, '1690525033765c380ba36-f915-4aee-91c8-ad2051bf8b75.jpg', 13);
INSERT INTO `blog_image` VALUES (6, '1690525073692ff905930-efc4-453e-8135-3f94737782f7.jpg', 14);
INSERT INTO `blog_image` VALUES (7, '16905251098078c677902-966c-417a-9420-954933be809b.jpg', 15);
INSERT INTO `blog_image` VALUES (8, '16905251291432577b921-b6ce-4694-9744-1cc2d169de39.jpg', 16);
INSERT INTO `blog_image` VALUES (9, '169052515545415856897-6d9d-4ed8-9176-9708ef970c34.jpg', 17);
INSERT INTO `blog_image` VALUES (10, '1690525253702c25b130f-70b8-4f93-9165-3f0d12626bb4.jpg', 18);
INSERT INTO `blog_image` VALUES (11, '1690525325026a7d6187d-318e-45ed-94a2-8fb4403ab88e.jpg', 19);
INSERT INTO `blog_image` VALUES (12, '1690525325120847387d7-c78e-45ea-a78b-ca38e7751729.png', 19);
INSERT INTO `blog_image` VALUES (13, '1690525325202bab62aba-5daf-4d21-8c0a-1737c2c86b41.png', 19);

-- ----------------------------
-- Table structure for blog_user_collect
-- ----------------------------
DROP TABLE IF EXISTS `blog_user_collect`;
CREATE TABLE `blog_user_collect`  (
  `blog_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `create_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`blog_id`, `user_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `blog_user_collect_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `blog_user_collect_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of blog_user_collect
-- ----------------------------
INSERT INTO `blog_user_collect` VALUES (1, 11, NULL);

-- ----------------------------
-- Table structure for blog_user_comment
-- ----------------------------
DROP TABLE IF EXISTS `blog_user_comment`;
CREATE TABLE `blog_user_comment`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `blog_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_date` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `blog_id`(`blog_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `blog_user_comment_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `blog_user_comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of blog_user_comment
-- ----------------------------

-- ----------------------------
-- Table structure for blog_user_dislike
-- ----------------------------
DROP TABLE IF EXISTS `blog_user_dislike`;
CREATE TABLE `blog_user_dislike`  (
  `blog_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `create_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`blog_id`, `user_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `blog_user_dislike_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `blog_user_dislike_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of blog_user_dislike
-- ----------------------------

-- ----------------------------
-- Table structure for blog_user_like
-- ----------------------------
DROP TABLE IF EXISTS `blog_user_like`;
CREATE TABLE `blog_user_like`  (
  `blog_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `create_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`blog_id`, `user_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `blog_user_like_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `blog_user_like_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of blog_user_like
-- ----------------------------
INSERT INTO `blog_user_like` VALUES (2, 1, '2023-07-22 06:13:04');
INSERT INTO `blog_user_like` VALUES (2, 8, '2023-07-22 06:25:46');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `follow_count` int(11) NOT NULL DEFAULT 0,
  `fans_count` int(11) NOT NULL DEFAULT 0,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `create_date` datetime NULL DEFAULT NULL,
  `modify_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  UNIQUE INDEX `nickname`(`nickname`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE,
  UNIQUE INDEX `mobile`(`mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '1', '44444', '狗啊', '0', -3, 0, ' 872588846', ' 64737858425', ' ', 0, NULL, NULL);
INSERT INTO `user` VALUES (3, '2', '4444', '狗', '0', 0, 0, ' 87288846', ' 647858425', ' ', 0, NULL, NULL);
INSERT INTO `user` VALUES (4, '3', '444', '狗0', '0', 0, 0, ' 8728886', ' 64758425', ' ', 0, NULL, NULL);
INSERT INTO `user` VALUES (5, '5', '111', '狗01', '0', 0, 0, ' 87288816', ' 647584125', ' ', 0, NULL, NULL);
INSERT INTO `user` VALUES (6, '6', '6', '狗06', '0', 0, 0, ' 872886816', ' 6475864125', ' ', 0, NULL, NULL);
INSERT INTO `user` VALUES (7, '7', '7', '狗07', '0', 0, 0, ' 872876816', ' 6475764125', ' ', 0, NULL, NULL);
INSERT INTO `user` VALUES (8, 'xioayun', '202cb962ac59075b964b07152d234b70', NULL, NULL, 0, -4, NULL, NULL, NULL, 0, '2023-07-22 11:09:17', NULL);
INSERT INTO `user` VALUES (9, 'xizhilang', '202cb962ac59075b964b07152d234b70', NULL, NULL, -1, 0, NULL, NULL, NULL, 0, '2023-07-22 11:41:35', NULL);
INSERT INTO `user` VALUES (10, '赵孝权', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, 0, 0, NULL, NULL, NULL, 0, '2023-07-22 11:48:08', NULL);
INSERT INTO `user` VALUES (11, 'taikongren', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, 0, 0, NULL, NULL, NULL, 0, '2023-07-22 14:17:10', NULL);
INSERT INTO `user` VALUES (12, '喜之郎', '123456', NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, NULL);

-- ----------------------------
-- Table structure for user_follow
-- ----------------------------
DROP TABLE IF EXISTS `user_follow`;
CREATE TABLE `user_follow`  (
  `user_id` int(10) UNSIGNED NOT NULL,
  `follow_user_id` int(10) UNSIGNED NOT NULL,
  `create_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`, `follow_user_id`) USING BTREE,
  INDEX `follow_user_id`(`follow_user_id`) USING BTREE,
  CONSTRAINT `user_follow_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_follow_ibfk_2` FOREIGN KEY (`follow_user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_follow
-- ----------------------------
INSERT INTO `user_follow` VALUES (1, 3, '2023-07-22 03:18:00');
INSERT INTO `user_follow` VALUES (8, 11, '2023-07-22 06:30:22');
INSERT INTO `user_follow` VALUES (11, 1, '2023-07-22 14:27:36');

-- ----------------------------
-- Table structure for user_search
-- ----------------------------
DROP TABLE IF EXISTS `user_search`;
CREATE TABLE `user_search`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `keyword` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `create_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `user_search_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_search
-- ----------------------------

-- ----------------------------
-- Triggers structure for table blog_user_collect
-- ----------------------------
DROP TRIGGER IF EXISTS `blog_collect_incre`;
delimiter ;;
CREATE TRIGGER `blog_collect_incre` AFTER INSERT ON `blog_user_collect` FOR EACH ROW begin
        update blog set collect_count = collect_count + 1 where id = NEW.blog_id;
    end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table blog_user_collect
-- ----------------------------
DROP TRIGGER IF EXISTS `blog_collect_delete`;
delimiter ;;
CREATE TRIGGER `blog_collect_delete` AFTER DELETE ON `blog_user_collect` FOR EACH ROW begin
    update blog set collect_count = collect_count - 1 where id = OLD.blog_id;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table blog_user_comment
-- ----------------------------
DROP TRIGGER IF EXISTS `blog_comment_incre`;
delimiter ;;
CREATE TRIGGER `blog_comment_incre` AFTER INSERT ON `blog_user_comment` FOR EACH ROW begin
        update blog set comment_count = comment_count + 1 where id = NEW.blog_id;
    end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table blog_user_comment
-- ----------------------------
DROP TRIGGER IF EXISTS `blog_comment_delete`;
delimiter ;;
CREATE TRIGGER `blog_comment_delete` AFTER DELETE ON `blog_user_comment` FOR EACH ROW begin
    update blog set comment_count = comment_count - 1 where id = OLD.blog_id;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table blog_user_dislike
-- ----------------------------
DROP TRIGGER IF EXISTS `blog_dislike_incre`;
delimiter ;;
CREATE TRIGGER `blog_dislike_incre` AFTER INSERT ON `blog_user_dislike` FOR EACH ROW begin
    update blog set dislike_count = dislike_count +1 where id = NEW.blog_id;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table blog_user_dislike
-- ----------------------------
DROP TRIGGER IF EXISTS `blog_dislike_delete`;
delimiter ;;
CREATE TRIGGER `blog_dislike_delete` AFTER DELETE ON `blog_user_dislike` FOR EACH ROW begin
    update blog set dislike_count = dislike_count -1 where id = OLD.blog_id;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table blog_user_like
-- ----------------------------
DROP TRIGGER IF EXISTS `blog_like_incre`;
delimiter ;;
CREATE TRIGGER `blog_like_incre` AFTER INSERT ON `blog_user_like` FOR EACH ROW begin
        update blog set like_count = like_count +1 where id = NEW.blog_id;
    end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table blog_user_like
-- ----------------------------
DROP TRIGGER IF EXISTS `blog_unlike_delete`;
delimiter ;;
CREATE TRIGGER `blog_unlike_delete` AFTER DELETE ON `blog_user_like` FOR EACH ROW begin
    update blog set like_count = like_count -1 where id = OLD.blog_id;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table user_follow
-- ----------------------------
DROP TRIGGER IF EXISTS `user_follow_delete`;
delimiter ;;
CREATE TRIGGER `user_follow_delete` AFTER DELETE ON `user_follow` FOR EACH ROW begin
    update user set fans_count = fans_count - 1 where id = OLD.follow_user_id;
    update user set follow_count = follow_count - 1 where id = OLD.user_id;
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
