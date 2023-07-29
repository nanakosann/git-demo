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

 Date: 22/07/2023 11:36:10
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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES (1, '《西行记》', '去', 0, 0, 0, 0, 0, 1, '2023-07-22 10:56:05');
INSERT INTO `blog` VALUES (2, '《1》', '2', 0, 0, 0, 0, 0, 3, '2023-07-22 10:56:51');
INSERT INTO `blog` VALUES (3, '《4>', '4', 0, 0, 0, 0, 0, 4, '2023-07-22 10:57:17');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_image
-- ----------------------------

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_user_collect
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_user_like
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '1', '44444', '狗啊', '0', -2, 0, ' 872588846', ' 64737858425', ' ', 0, NULL, NULL);
INSERT INTO `user` VALUES (3, '2', '4444', '狗', '0', 0, 0, ' 87288846', ' 647858425', ' ', 0, NULL, NULL);
INSERT INTO `user` VALUES (4, '3', '444', '狗0', '0', 0, 0, ' 8728886', ' 64758425', ' ', 0, NULL, NULL);
INSERT INTO `user` VALUES (5, '5', '111', '狗01', '0', 0, 0, ' 87288816', ' 647584125', ' ', 0, NULL, NULL);
INSERT INTO `user` VALUES (6, '6', '6', '狗06', '0', 0, 0, ' 872886816', ' 6475864125', ' ', 0, NULL, NULL);
INSERT INTO `user` VALUES (7, '7', '7', '狗07', '0', 0, 0, ' 872876816', ' 6475764125', ' ', 0, NULL, NULL);
INSERT INTO `user` VALUES (8, 'xioayun', '202cb962ac59075b964b07152d234b70', NULL, NULL, 0, -2, NULL, NULL, NULL, 0, '2023-07-22 11:09:17', NULL);

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_follow
-- ----------------------------
INSERT INTO `user_follow` VALUES (1, 3, '2023-07-22 03:18:00');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
