/*
 Navicat Premium Data Transfer

 Source Server         : guojiale
 Source Server Type    : MySQL
 Source Server Version : 50742
 Source Host           : 47.99.151.155:3306
 Source Schema         : Second-hand trading platform

 Target Server Type    : MySQL
 Target Server Version : 50742
 File Encoding         : 65001

 Date: 23/07/2023 10:47:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for stu_collect_product
-- ----------------------------
DROP TABLE IF EXISTS `stu_collect_product`;
CREATE TABLE `stu_collect_product`  (
  `id` int(11) NOT NULL COMMENT '收藏表id',
  `product_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `stu_id` int(11) NULL DEFAULT NULL COMMENT '学生id',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stu_collect_product
-- ----------------------------

-- ----------------------------
-- Table structure for stu_comment_product
-- ----------------------------
DROP TABLE IF EXISTS `stu_comment_product`;
CREATE TABLE `stu_comment_product`  (
  `id` int(11) NOT NULL COMMENT '评论表id',
  `product_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `stu_id` int(11) NULL DEFAULT NULL COMMENT '学生id',
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评论',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stu_comment_product
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
