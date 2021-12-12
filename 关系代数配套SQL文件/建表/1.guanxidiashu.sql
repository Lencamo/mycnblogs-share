/*
 Navicat Premium Data Transfer

 Source Server         : Demo_Connect
 Source Server Type    : MySQL
 Source Server Version : 50734
 Source Host           : localhost:3306
 Source Schema         : 1.guanxidiashu

 Target Server Type    : MySQL
 Target Server Version : 50734
 File Encoding         : 65001

 Date: 12/12/2021 14:26:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for coures
-- ----------------------------
DROP TABLE IF EXISTS `coures`;
CREATE TABLE `coures`  (
  `Cno` tinyint(120) NOT NULL,
  `Cname` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Cpno` tinyint(120) NULL DEFAULT NULL,
  `Ccredit` tinyint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`Cno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coures
-- ----------------------------
INSERT INTO `coures` VALUES (1, '数据库', 5, 4);
INSERT INTO `coures` VALUES (2, '数学', NULL, 2);
INSERT INTO `coures` VALUES (3, '信息系统', 1, 4);
INSERT INTO `coures` VALUES (4, '操作系统', 6, 3);
INSERT INTO `coures` VALUES (5, '数据结构', 7, 4);
INSERT INTO `coures` VALUES (6, '数据处理', NULL, 2);
INSERT INTO `coures` VALUES (7, 'Java语言', 6, 4);

-- ----------------------------
-- Table structure for r2
-- ----------------------------
DROP TABLE IF EXISTS `r2`;
CREATE TABLE `r2`  (
  `A` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `B` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `C` int(12) NOT NULL,
  PRIMARY KEY (`C`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r2
-- ----------------------------
INSERT INTO `r2` VALUES ('a1', 'b1', 5);
INSERT INTO `r2` VALUES ('a1', 'b2', 6);
INSERT INTO `r2` VALUES ('a2', 'b3', 8);
INSERT INTO `r2` VALUES ('a2', 'b4', 12);

-- ----------------------------
-- Table structure for r3
-- ----------------------------
DROP TABLE IF EXISTS `r3`;
CREATE TABLE `r3`  (
  `A` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `B` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `C` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`B`, `C`, `A`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r3
-- ----------------------------
INSERT INTO `r3` VALUES ('a1', 'b1', 'c2');
INSERT INTO `r3` VALUES ('a1', 'b2', 'c1');
INSERT INTO `r3` VALUES ('a1', 'b2', 'c3');
INSERT INTO `r3` VALUES ('a2', 'b2', 'c3');
INSERT INTO `r3` VALUES ('a2', 'b3', 'c7');
INSERT INTO `r3` VALUES ('a3', 'b4', 'c6');
INSERT INTO `r3` VALUES ('a4', 'b6', 'c6');

-- ----------------------------
-- Table structure for s2
-- ----------------------------
DROP TABLE IF EXISTS `s2`;
CREATE TABLE `s2`  (
  `B` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `E` int(12) NOT NULL,
  PRIMARY KEY (`B`, `E`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s2
-- ----------------------------
INSERT INTO `s2` VALUES ('b1', 3);
INSERT INTO `s2` VALUES ('b2', 7);
INSERT INTO `s2` VALUES ('b3', 2);
INSERT INTO `s2` VALUES ('b3', 10);
INSERT INTO `s2` VALUES ('b5', 2);

-- ----------------------------
-- Table structure for s3
-- ----------------------------
DROP TABLE IF EXISTS `s3`;
CREATE TABLE `s3`  (
  `B` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `C` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `D` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`D`, `C`, `B`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s3
-- ----------------------------
INSERT INTO `s3` VALUES ('b2', 'c1', 'd1');
INSERT INTO `s3` VALUES ('b1', 'c2', 'd1');
INSERT INTO `s3` VALUES ('b2', 'c3', 'd2');

-- ----------------------------
-- Table structure for sc
-- ----------------------------
DROP TABLE IF EXISTS `sc`;
CREATE TABLE `sc`  (
  `Sno` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Cno` tinyint(120) NOT NULL,
  `Grade` tinyint(120) NULL DEFAULT NULL,
  PRIMARY KEY (`Sno`, `Cno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sc
-- ----------------------------
INSERT INTO `sc` VALUES ('20180001', 1, 92);
INSERT INTO `sc` VALUES ('20180001', 2, 86);
INSERT INTO `sc` VALUES ('20180001', 3, 88);
INSERT INTO `sc` VALUES ('20180002', 2, 90);
INSERT INTO `sc` VALUES ('20180002', 3, 80);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `Sno` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Sname` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Ssex` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Sage` tinyint(120) UNSIGNED NULL DEFAULT NULL,
  `Sdept` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Sno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('20180001', '张三', '男', 20, 'CS');
INSERT INTO `student` VALUES ('20180002', '李四', '男', 18, 'CS');
INSERT INTO `student` VALUES ('20180003', '王五', '女', 19, 'MA');
INSERT INTO `student` VALUES ('20180004', '赵六', '男', 19, 'IS');

SET FOREIGN_KEY_CHECKS = 1;
