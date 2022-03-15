/*
 Navicat Premium Data Transfer

 Source Server         : 101.35.53.113
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : 101.35.53.113:3306
 Source Schema         : keyboard

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 15/03/2022 11:00:18
*/

CREATE DATABASE IF NOT EXISTS keyboard;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for event
-- ----------------------------

CREATE TABLE IF NOT EXISTS `event`  (
  `log_time` datetime(0) NULL DEFAULT NULL,
  `log` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `host` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hostname` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for remote_cmd
-- ----------------------------
CREATE TABLE IF NOT EXISTS `remote_cmd`  (
  `host` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hostname` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `is_execute` tinyint(1) NULL DEFAULT NULL,
  `cmd` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `execute_time` datetime(0) NULL DEFAULT NULL,
  `message_box` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `pop_times` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
/*
 Navicat Premium Data Transfer

 Source Server         : 101.35.53.113
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : 101.35.53.113:3306
 Source Schema         : keyboard

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 15/03/2022 11:00:18
*/

CREATE DATABASE IF NOT EXISTS keyboard;
USE keyboard;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for event
-- ----------------------------

CREATE TABLE IF NOT EXISTS `event`  (
  `log_time` datetime(0) NULL DEFAULT NULL,
  `log` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `host` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hostname` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for remote_cmd
-- ----------------------------
CREATE TABLE IF NOT EXISTS `remote_cmd`  (
  `host` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hostname` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `is_execute` tinyint(1) NULL DEFAULT NULL,
  `cmd` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `execute_time` datetime(0) NULL DEFAULT NULL,
  `message_box` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `pop_times` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
