/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 24/09/2024 16:08:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `course_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `course_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `teacher_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `credits` decimal(2, 1) NULL DEFAULT NULL,
  PRIMARY KEY (`course_id`) USING BTREE,
  INDEX `teacher_id`(`teacher_id`) USING BTREE,
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('C001', '高等数学', 'T001', 4.0);
INSERT INTO `course` VALUES ('C002', '大学物理', 'T002', 3.5);
INSERT INTO `course` VALUES ('C003', '程序设计', 'T003', 4.0);
INSERT INTO `course` VALUES ('C004', '数据结构', 'T004', 3.5);
INSERT INTO `course` VALUES ('C005', '数据库原理', 'T005', 4.0);
INSERT INTO `course` VALUES ('C006', '操作系统', 'T006', 3.5);

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score`  (
  `student_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `course_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `score` decimal(4, 1) NULL DEFAULT NULL,
  PRIMARY KEY (`student_id`, `course_id`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE,
  CONSTRAINT `score_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `score_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of score
-- ----------------------------
INSERT INTO `score` VALUES ('2021001', 'C001', 85.5);
INSERT INTO `score` VALUES ('2021001', 'C002', 78.0);
INSERT INTO `score` VALUES ('2021001', 'C003', 90.5);
INSERT INTO `score` VALUES ('2021002', 'C001', 92.0);
INSERT INTO `score` VALUES ('2021002', 'C002', 83.5);
INSERT INTO `score` VALUES ('2021002', 'C004', 58.0);
INSERT INTO `score` VALUES ('2021003', 'C001', 76.5);
INSERT INTO `score` VALUES ('2021003', 'C003', 85.0);
INSERT INTO `score` VALUES ('2021003', 'C005', 69.5);
INSERT INTO `score` VALUES ('2021004', 'C002', 88.5);
INSERT INTO `score` VALUES ('2021004', 'C004', 92.5);
INSERT INTO `score` VALUES ('2021004', 'C006', 86.0);
INSERT INTO `score` VALUES ('2021005', 'C001', 61.0);
INSERT INTO `score` VALUES ('2021005', 'C003', 87.5);
INSERT INTO `score` VALUES ('2021005', 'C005', 84.0);
INSERT INTO `score` VALUES ('2021006', 'C002', 79.5);
INSERT INTO `score` VALUES ('2021006', 'C004', 83.0);
INSERT INTO `score` VALUES ('2021006', 'C006', 90.0);
INSERT INTO `score` VALUES ('2021007', 'C001', 93.5);
INSERT INTO `score` VALUES ('2021007', 'C003', 89.0);
INSERT INTO `score` VALUES ('2021007', 'C005', 94.5);
INSERT INTO `score` VALUES ('2021008', 'C002', 86.5);
INSERT INTO `score` VALUES ('2021008', 'C004', 91.0);
INSERT INTO `score` VALUES ('2021008', 'C006', 87.5);
INSERT INTO `score` VALUES ('2021009', 'C001', 80.0);
INSERT INTO `score` VALUES ('2021009', 'C003', 62.5);
INSERT INTO `score` VALUES ('2021009', 'C005', 85.5);
INSERT INTO `score` VALUES ('2021010', 'C002', 64.5);
INSERT INTO `score` VALUES ('2021010', 'C004', 89.5);
INSERT INTO `score` VALUES ('2021010', 'C006', 93.0);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `student_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `gender` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `birth_date` date NULL DEFAULT NULL,
  `my_class` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`student_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('2021001', '张三', '男', '2003-05-15', '计算机一班');
INSERT INTO `student` VALUES ('2021002', '李四', '女', '2003-08-22', '计算机一班');
INSERT INTO `student` VALUES ('2021003', '王五', '男', '2002-11-30', '数学一班');
INSERT INTO `student` VALUES ('2021004', '赵六', '女', '2003-02-14', '数学一班');
INSERT INTO `student` VALUES ('2021005', '钱七', '男', '2002-07-08', '物理一班');
INSERT INTO `student` VALUES ('2021006', '孙八', '女', '2003-09-19', '物理一班');
INSERT INTO `student` VALUES ('2021007', '周九', '男', '2002-12-01', '化学一班');
INSERT INTO `student` VALUES ('2021008', '吴十', '女', '2003-03-25', '化学一班');
INSERT INTO `student` VALUES ('2021009', '郑十一', '男', '2002-06-11', '生物一班');
INSERT INTO `student` VALUES ('2021010', '王十二', '女', '2003-10-05', '生物一班');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `teacher_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `gender` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `birth_date` date NULL DEFAULT NULL,
  `title` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`teacher_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('T001', '张教授', '男', '1975-03-12', '教授');
INSERT INTO `teacher` VALUES ('T002', '李副教授', '女', '1980-07-22', '副教授');
INSERT INTO `teacher` VALUES ('T003', '王讲师', '男', '1985-11-08', '讲师');
INSERT INTO `teacher` VALUES ('T004', '赵助教', '女', '1990-05-15', '助教');
INSERT INTO `teacher` VALUES ('T005', '钱教授', '男', '1972-09-30', '教授');
INSERT INTO `teacher` VALUES ('T006', '孙副教授', '女', '1978-12-18', '副教授');
INSERT INTO `teacher` VALUES ('T007', '周讲师', '男', '1983-04-25', '讲师');
INSERT INTO `teacher` VALUES ('T008', '吴助教', '女', '1988-08-07', '助教');
INSERT INTO `teacher` VALUES ('T009', '郑教授', '男', '1970-01-01', '教授');
INSERT INTO `teacher` VALUES ('T010', '刘副教授', '女', '1976-06-14', '副教授');

SET FOREIGN_KEY_CHECKS = 1;
