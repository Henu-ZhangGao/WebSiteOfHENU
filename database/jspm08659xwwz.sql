/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : jspm08659xwwz

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2021-06-01 17:41:56
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `admins`
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '帐号',
  `pwd` varchar(50) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员';

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('1', 'admin', 'admin', '2021-05-28 17:18:13');

-- ----------------------------
-- Table structure for `liuyanban`
-- ----------------------------
DROP TABLE IF EXISTS `liuyanban`;
CREATE TABLE `liuyanban` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `xingming` varchar(50) NOT NULL COMMENT '姓名',
  `lianxidianhua` varchar(50) NOT NULL COMMENT '联系电话',
  `liuyanneirong` text NOT NULL COMMENT '留言内容',
  `liuyanren` varchar(50) NOT NULL COMMENT '留言人',
  `huifuneirong` text NOT NULL COMMENT '回复内容',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='留言板';

-- ----------------------------
-- Records of liuyanban
-- ----------------------------
INSERT INTO `liuyanban` VALUES ('1', '小明', '13666666666', '6666666', '001', '666666666', '2021-06-01 17:39:24');

-- ----------------------------
-- Table structure for `lunbotu`
-- ----------------------------
DROP TABLE IF EXISTS `lunbotu`;
CREATE TABLE `lunbotu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '标题',
  `image` varchar(255) NOT NULL COMMENT '图片',
  `url` varchar(255) NOT NULL COMMENT '连接地址',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='轮播图';

-- ----------------------------
-- Records of lunbotu
-- ----------------------------
INSERT INTO `lunbotu` VALUES ('1', '54535', 'upload/1622540094263.jpg', '#', '2021-06-01 17:34:55');
INSERT INTO `lunbotu` VALUES ('2', '8798797', 'upload/1622540104424.jpg', '#', '2021-06-01 17:35:05');

-- ----------------------------
-- Table structure for `pinglun`
-- ----------------------------
DROP TABLE IF EXISTS `pinglun`;
CREATE TABLE `pinglun` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `biao` varchar(50) NOT NULL COMMENT '表',
  `biaoid` int(11) NOT NULL COMMENT '表id',
  `biaoti` varchar(255) NOT NULL COMMENT '标题',
  `pingfen` varchar(255) NOT NULL COMMENT '评分',
  `pinglunneirong` text NOT NULL COMMENT '评论内容',
  `pinglunren` varchar(50) NOT NULL COMMENT '评论人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='评论';

-- ----------------------------
-- Records of pinglun
-- ----------------------------
INSERT INTO `pinglun` VALUES ('1', 'xinwenxinxi', '7', '阿拉杨主任，激励后来人', '1', '666666', '001', '2021-06-01 17:38:59');

-- ----------------------------
-- Table structure for `pinglunhuifu`
-- ----------------------------
DROP TABLE IF EXISTS `pinglunhuifu`;
CREATE TABLE `pinglunhuifu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pinglunid` int(10) unsigned NOT NULL COMMENT '评论id',
  `biao` varchar(50) NOT NULL COMMENT '表',
  `biaoid` int(11) NOT NULL COMMENT '表id',
  `biaoti` varchar(255) NOT NULL COMMENT '标题',
  `pinglunneirong` text NOT NULL COMMENT '评论内容',
  `pinglunren` varchar(50) NOT NULL COMMENT '评论人',
  `huifuneirong` text NOT NULL COMMENT '回复内容',
  `huifuren` varchar(50) NOT NULL COMMENT '回复人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `pinglunhuifu_pinglunid_index` (`pinglunid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='评论回复';

-- ----------------------------
-- Records of pinglunhuifu
-- ----------------------------
INSERT INTO `pinglunhuifu` VALUES ('1', '1', 'xinwenxinxi', '7', '阿拉杨主任，激励后来人', '666666', '001', '88888888', '001', '2021-06-01 17:39:05');

-- ----------------------------
-- Table structure for `shoucangjilu`
-- ----------------------------
DROP TABLE IF EXISTS `shoucangjilu`;
CREATE TABLE `shoucangjilu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL COMMENT '收藏用户',
  `xwid` int(10) unsigned NOT NULL COMMENT '对应模块id',
  `biao` varchar(255) NOT NULL COMMENT '收藏得模块',
  `biaoti` varchar(255) NOT NULL COMMENT '显示的标题',
  `url` varchar(512) NOT NULL COMMENT '收藏URL',
  `ziduan` varchar(255) NOT NULL COMMENT '对应模块字段',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='收藏记录';

-- ----------------------------
-- Records of shoucangjilu
-- ----------------------------
INSERT INTO `shoucangjilu` VALUES ('1', '001', '7', 'xinwenxinxi', '阿拉杨主任，激励后来人', 'http://localhost:8080/jspm08659xwwz/xinwenxinxidetail.jsp?id=7', 'biaoti', '2021-06-01 17:39:08');

-- ----------------------------
-- Table structure for `xinwenfenlei`
-- ----------------------------
DROP TABLE IF EXISTS `xinwenfenlei`;
CREATE TABLE `xinwenfenlei` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fenleimingcheng` varchar(50) NOT NULL COMMENT '分类名称',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='新闻分类';

-- ----------------------------
-- Records of xinwenfenlei
-- ----------------------------
INSERT INTO `xinwenfenlei` VALUES ('1', '国内新闻', '2021-05-28 17:27:45');
INSERT INTO `xinwenfenlei` VALUES ('2', '国际新闻', '2021-05-28 17:38:21');
INSERT INTO `xinwenfenlei` VALUES ('3', '娱乐新闻', '2021-06-01 17:10:00');
INSERT INTO `xinwenfenlei` VALUES ('4', '军事新闻', '2021-06-01 17:10:03');

-- ----------------------------
-- Table structure for `xinwenxinxi`
-- ----------------------------
DROP TABLE IF EXISTS `xinwenxinxi`;
CREATE TABLE `xinwenxinxi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `biaoti` varchar(255) NOT NULL COMMENT '标题',
  `fenlei` int(10) unsigned NOT NULL COMMENT '分类',
  `tupian` varchar(255) NOT NULL COMMENT '图片',
  `tianjiaren` varchar(50) NOT NULL COMMENT '添加人',
  `dianjilv` int(11) NOT NULL COMMENT '点击率',
  `neirong` longtext NOT NULL COMMENT '内容',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `xinwenxinxi_fenlei_index` (`fenlei`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='新闻信息';

-- ----------------------------
-- Records of xinwenxinxi
-- ----------------------------
INSERT INTO `xinwenxinxi` VALUES ('1', '何兆武、章开沅去世，共和国一日痛失两位知名历史学家', '1', 'upload/1622538760647.png', 'admin', '1', '<p class=\"one-p\" style=\"margin-top: 0px; margin-bottom: 2em; padding: 0px; line-height: 2.2; overflow-wrap: break-word; color: rgb(0, 0, 0); font-family: &quot;Microsoft Yahei&quot;, Avenir, &quot;Segoe UI&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">5月28日，澎湃新闻记者从清华大学获悉，历史学家、翻译家、清华大学教授何兆武于5月28日上午在北京逝世。</p><p class=\"one-p\" style=\"margin-top: 0px; margin-bottom: 2em; padding: 0px; line-height: 2.2; overflow-wrap: break-word; color: rgb(0, 0, 0); font-family: &quot;Microsoft Yahei&quot;, Avenir, &quot;Segoe UI&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">公开资料显示，何兆武，历史学家、翻译家，1921年生于北京（祖籍湖南），1939年考入西南联大，先后就读于土木、历史、哲学、外文系。</p><p class=\"one-p\" style=\"margin-top: 0px; margin-bottom: 2em; padding: 0px; line-height: 2.2; overflow-wrap: break-word; color: rgb(0, 0, 0); font-family: &quot;Microsoft Yahei&quot;, Avenir, &quot;Segoe UI&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">何兆武1956年至1986年任中国社会科学院历史研究所助理研究员、研究员，1986年后任清华大学思想文化研究所教授，历史研究著作有《中国思想发展史》等，译著代表作有罗素的《西方哲学史》、卢梭的《社会契约论》等。</p><p class=\"one-p\" style=\"margin-top: 0px; margin-bottom: 2em; padding: 0px; line-height: 2.2; overflow-wrap: break-word; color: rgb(0, 0, 0); font-family: &quot;Microsoft Yahei&quot;, Avenir, &quot;Segoe UI&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">2006年，何兆武推出口述史《上学记》。文史学者刘超曾评价称，“这部‘浓缩了20世纪中国知识分子心灵史’的随笔，一经推出即受到多方瞩目，除了让人了解民国教育及一代学人的成长历程外，也让人们反思当下教育的种种困境。”</p><p class=\"one-p\" style=\"margin-top: 0px; margin-bottom: 2em; padding: 0px; line-height: 2.2; overflow-wrap: break-word; color: rgb(0, 0, 0); font-family: &quot;Microsoft Yahei&quot;, Avenir, &quot;Segoe UI&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">另据华中师范大学官方微博消息，著名历史学家、教育家，华中师范大学前校长、人文社科资深教授，华中师范大学中国近代史研究所创建人，章开沅先生于2021年5月28日8时15分在武汉仙逝，享年95岁。</p><p class=\"one-p\" style=\"margin-top: 0px; margin-bottom: 2em; padding: 0px; line-height: 2.2; overflow-wrap: break-word; color: rgb(0, 0, 0); font-family: &quot;Microsoft Yahei&quot;, Avenir, &quot;Segoe UI&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">公开资料显示，章开沅，祖籍浙江湖州，1926年7月生于安徽芜湖。早年就读于金陵大学历史系，曾任教中原大学，后来一直在华中师范大学任教，是中国辛亥革命史研究会、华中师范大学历史研究所（现改名为中国近代史研究所）和中国教会大学史研究中心的创办人和领导人。</p><p class=\"one-p\" style=\"margin-top: 0px; margin-bottom: 2em; padding: 0px; line-height: 2.2; overflow-wrap: break-word; color: rgb(0, 0, 0); font-family: &quot;Microsoft Yahei&quot;, Avenir, &quot;Segoe UI&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">章开沅曾任华中师范大学校长（1984～1990年）、国务院学位委员会历史学科第一、二届评议组成员、召集人。2010年11月入选首批荆楚社科名家，2018年12月获颁第七届吴玉章人文社会科学终身成就奖。</p><p><br/></p>', '2021-06-01 17:12:56');
INSERT INTO `xinwenxinxi` VALUES ('2', '台当局坚持“鸵鸟政策”不封城，民众却“自行封城”', '1', 'upload/1622539619161.png', 'admin', '1', '<p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; text-indent: 2em; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">台湾疫情持续升温，<a target=\"_blank\" href=\"https://news.163.com/news/search?keyword=%E5%8F%B0%E5%8C%97%E5%B8%82\" style=\"box-sizing: inherit; color: rgb(0, 140, 210);\">台北市</a>及<a target=\"_blank\" href=\"https://news.163.com/news/search?keyword=%E6%96%B0%E5%8C%97%E5%B8%82\" style=\"box-sizing: inherit; color: rgb(0, 140, 210);\">新北市</a>15日起升至三级警戒，16日台湾本土单日新增破两百例，17日本土新增病例达到333例。尽管台民进党当局面对来势汹汹的疫情，仍继续选择“不普筛，不<a target=\"_blank\" href=\"https://news.163.com/news/search?keyword=%E5%B0%81%E5%9F%8E\" style=\"box-sizing: inherit; color: rgb(0, 140, 210);\">封城</a>”的“鸵鸟政策”，但台湾民众却“自行封城”，整个台北宛如空城。</p><p class=\"f_center\" style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 0px; padding: 0px; text-align: center; color: rgb(102, 102, 102); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; white-space: normal;\"><img src=\"./upload/1622539640233.png\" style=\"box-sizing: inherit; border-style: initial; margin-bottom: 10px;\"/></p><p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; text-indent: 2em; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">5月15日，“台湾流行疫情指挥中心”宣布将台北市及新北市升至三级警戒，引发全台恐慌，人心惶惶。</p><p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; text-indent: 2em; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">疫情形势愈发严峻，台民进党当局却坚持不“封城”。对此，台湾“流行疫情指挥中心”指挥官陈时中回应称：“若是（封城），台湾民众可能会跟防疫政策对抗，这样防疫就一定会失败。”他表示，只有连续14天每日新增100名本土案例，台湾才会选择“封城”。</p><p class=\"f_center\" style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 0px; padding: 0px; text-align: center; color: rgb(102, 102, 102); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; white-space: normal;\"><img src=\"./upload/1622539640474.png\" style=\"box-sizing: inherit; border-style: initial; margin-bottom: 10px;\"/></p><p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; text-indent: 2em; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">陈时中</p><p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; text-indent: 2em; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">然而，台湾民众的自发行动，却打了这位指挥官的脸。在台民进党当局选择不“封城”的情况下，台湾民众搞起了“自行封城”。</p><p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; text-indent: 2em; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">据台湾中时新闻网5月17日报道，随着台湾双北地区疫情风险节节升高，台湾众多网民纷纷在社交平台上呼吁大家“自行封城”，不要外出。</p><p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; text-indent: 2em; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">在脸书群组“信义区三两事”上，众多台湾网民上传了周末台北信义商业区的“空城照”。香堤大道、101广场不复往日喧嚣，非常冷清。而台湾著名餐厅“鼎泰丰”也是门可罗雀，在周六（15日）晚的用餐高峰期，却亮着“内用等待时间0分”的灯牌。</p><p><br/></p>', '2021-06-01 17:27:20');
INSERT INTO `xinwenxinxi` VALUES ('3', '2021年5月10日外交部发言人华春莹主持例行记者会', '2', 'upload/1622539696058.png', 'admin', '1', '<p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; text-indent: 2em; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\"><img alt=\"2021年5月10日外交部发言人华春莹主持例行记者会\" src=\"./upload/1622539708709.png\" style=\"box-sizing: inherit; border-style: initial;\"/></p><p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; text-indent: 2em; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\"></p><p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; text-indent: 2em; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\"></p><p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; text-indent: 2em; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">“中国+中亚五国”外长第二次会晤将于5月12日在陕西西安举行，国务委员兼外长王毅将主持会晤。哈萨克斯坦副总理兼外长特列乌别尔季、吉尔吉斯斯坦外长卡扎克巴耶夫、塔吉克斯坦外长穆赫里丁、土库曼斯坦副总理兼外长梅列多夫、乌兹别克斯坦外长卡米洛夫将来华参会。</p><p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; text-indent: 2em; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">中国同中亚五国是友好邻邦和战略伙伴，传统友谊深厚，各领域交往合作密切。去年7月，王毅国务委员兼外长同中亚五国外长以视频方式举行首次会晤，为双方增进互信、深化合作打造了新平台。今年是中亚国家独立30周年、中国共产党成立100周年，明年是中国同中亚国家建交30周年，各方对进一步加强彼此之间的合作都寄予厚望，中国同中亚国家关系发展面临新的历史机遇。</p><p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; text-indent: 2em; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">在这样的背景下，中方倡议召开“中国+中亚五国”外长第二次会晤，也是首次面对面线下会晤，得到各方积极响应和支持。这次会晤期间，王毅国务委员兼外长将同中亚五国外长围绕抗疫合作、共建“一带一路”、互联互通、国际协作等共同关心的问题深入交换意见，商签有关成果文件，举行一系列双边会谈及多边友好交流活动。</p><p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; text-indent: 2em; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">特别值得一提的是，中亚自古就是丝绸之路的重要节点，也是习近平主席提出“丝绸之路经济带”倡议的诞生地，各国都是中方共建“一带一路”的重要合作伙伴。这次会晤在古丝绸之路发源地西安举行，具有特殊意义。我们相信这次会晤一定会取得圆满成功，推动中国同中亚国家关系实现新发展，助力共建“一带一路”合作取得新成果。</p><p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; text-indent: 2em; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\"><strong style=\"box-sizing: inherit;\"><strong style=\"box-sizing: inherit;\">深圳卫视记者：</strong>5<strong style=\"box-sizing: inherit;\">月</strong><strong style=\"box-sizing: inherit;\">9</strong><strong style=\"box-sizing: inherit;\">日，俄罗斯在莫斯科红场举行盛大阅兵式，庆祝卫国战争胜利</strong><strong style=\"box-sizing: inherit;\">76</strong><strong style=\"box-sizing: inherit;\">周年。俄罗斯总统普京在致辞中表示，个别国家正试图重拾纳粹主义，奉行</strong><strong style=\"box-sizing: inherit;\">“</strong><strong style=\"box-sizing: inherit;\">本国例外</strong><strong style=\"box-sizing: inherit;\">”</strong><strong style=\"box-sizing: inherit;\">政策，俄一贯捍卫国际法准则，将坚定维护国家利益和人民安全。中方对此有何评论？</strong></strong></p><p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; text-indent: 2em; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\"><a target=\"_blank\" href=\"https://news.163.com/news/search?keyword=%E5%8D%8E%E6%98%A5%E8%8E%B9\" style=\"box-sizing: inherit; color: rgb(0, 140, 210);\">华春莹</a>：我们注意到昨天俄罗斯成功举办纪念卫国战争胜利76周年盛大阅兵仪式，对此表示诚挚祝贺。今年是第二次世界大战胜利76周年，中国和俄罗斯分别是第二次世界大战亚洲和欧洲主战场，为二战取得最终胜利付出惨烈的民族牺牲，作出巨大历史贡献。</p><p><br/></p>', '2021-06-01 17:28:28');
INSERT INTO `xinwenxinxi` VALUES ('4', '金灿荣：美国反华共识超越“懂王”时代？纯属瞎耽误功夫', '4', 'upload/1622539724563.png', 'admin', '1', '<p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; text-indent: 2em; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\"><img alt=\"金灿荣：美国反华共识超越“懂王”时代？纯属瞎耽误功夫\" src=\"./upload/1622539734077.png\" title=\"点击查看大图\" class=\"bigimg\" width=\"530\" style=\"box-sizing: inherit; border-style: initial;\"/></p><p><br style=\"box-sizing: inherit; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\"/></p><p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; text-indent: 2em; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\"></p><p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; text-indent: 2em; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\"><strong style=\"box-sizing: inherit;\">观察者网：《2021年战略竞争法案》中使用了“掠夺性”的国际经济行为、“军事扩张”等字眼来形容中国，这些可以看作是美国给中国打上的新标签吗？</strong></p><p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; text-indent: 2em; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\"><strong style=\"box-sizing: inherit;\">金灿荣：</strong>这个话以前应该是一些右翼学者、政客说过，将其正式写进法案里还是第一次。</p><p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; text-indent: 2em; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">但《2021年战略竞争法案》要这么写跟<a target=\"_blank\" href=\"https://news.163.com/news/search?keyword=%E6%8B%9C%E7%99%BB\" style=\"box-sizing: inherit; color: rgb(0, 140, 210);\">拜登</a>本人关系不大，它反映的是美国国会两党在中国问题上的高度一致。这个法案是民主共和两党共同提出的，民主党方面的提出者是<a target=\"_blank\" href=\"https://news.163.com/news/search?keyword=%E5%A4%96%E4%BA%A4\" style=\"box-sizing: inherit; color: rgb(0, 140, 210);\">外交</a>关系委员会主席、民主党参议员梅内德斯（Bob Menendez），共和党方面是参议员里施（Jim Risch）。</p><p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; text-indent: 2em; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">首先，对于这个法案我们要高度重视，它反映着两党国会议员的高度共识，对华的敌意达到了新高度。</p><p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; text-indent: 2em; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">其次，法案涉及的内容确实很广，覆盖政治、军事、经济、内政各个方面。法案文本共283页，原本民主党文本282页，共和党的是146页，结合后增加了一点到283页。大致分为这么几块：经济上，声称我们搞“掠夺性经济扩张”，对应地要对我们施加“反腐败”“知识产权规则”来整我们；政治上说我们“破坏国际规则”；军事上说我们搞“军事威胁”，而美国则要带领盟友一块抵抗我们；还有一点特别令中国恼火，那就是美国将深化对中国的干预，包括对新疆、西藏、香港、台湾地区事务的介入，最敏感就是取消很多美台官方来往的限制。</p><p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; text-indent: 2em; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">这种国会两党高度同步对华示强的情况，是特朗普时期都未曾发生过的，特朗普在位时反华态势还在酝酿，现在应该讲普遍态势已经成型。我们国内还有一些人存在幻想，说中国让两步就能够缓和中美关系，现在看来，这纯粹是一厢情愿。</p><p class=\"f_center\" style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 0px; padding: 0px; text-align: center; color: rgb(102, 102, 102); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; white-space: normal;\"></p><p><br/></p>', '2021-06-01 17:28:54');
INSERT INTO `xinwenxinxi` VALUES ('5', '\"迫降风暴\"扯上俄罗斯，法奥取消飞往莫斯科航班', '4', 'upload/1622539781248.png', 'admin', '1', '<p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; text-indent: 2em; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">【环球时报综合报道】瑞安航空公司飞机迫降<a target=\"_blank\" href=\"https://news.163.com/news/search?keyword=%E6%98%8E%E6%96%AF%E5%85%8B\" style=\"box-sizing: inherit; color: rgb(0, 140, 210);\">明斯克</a>机场事件进一步发酵，而俄罗斯被牵入其中。欧盟发布“领空禁令”后，法国和奥地利航空公司分别在26日和27日取消飞往<a target=\"_blank\" href=\"https://news.163.com/news/search?keyword=%E8%8E%AB%E6%96%AF%E7%A7%91\" style=\"box-sizing: inherit; color: rgb(0, 140, 210);\">莫斯科</a>的<a target=\"_blank\" href=\"https://news.163.com/news/search?keyword=%E8%88%AA%E7%8F%AD\" style=\"box-sizing: inherit; color: rgb(0, 140, 210);\">航班</a>，原因是俄罗斯政府没有批准飞机改变航线。</p><p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; text-indent: 2em; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\"></p><p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; text-indent: 2em; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">据法新社27日报道，奥地利航空公司当天发表声明，称根据欧盟航空安全局的建议，已暂停该公司经过<a target=\"_blank\" href=\"https://news.163.com/news/search?keyword=%E7%99%BD%E4%BF%84%E7%BD%97%E6%96%AF\" style=\"box-sizing: inherit; color: rgb(0, 140, 210);\">白俄罗斯</a>领空的航班，因此有必要改变维也纳至莫斯科航班的航线，“改变航线必须得到有关部门的批准，俄罗斯当局没有给我们这个许可”。同样的事情还发生在法国航空公司身上。该公司26日宣布将原定于当天从巴黎飞往莫斯科的航班推迟，原因是俄方未批准绕开白领空的飞行计划。26日，一架从明斯克飞往西班牙巴塞罗那的白俄罗斯航班在波兰边境附近盘旋几分钟后返回明斯克。波兰方面称，这是因为波兰和法国政府都已禁止白飞机飞越本国领土。白俄罗斯通讯社称，白外交部发言人表示，法国的决定是“空中强盗行径”。</p><p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; text-indent: 2em; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">尽管希腊总理27日表示，没有迹象表明俄罗斯特工曾搭乘被迫降落的航班，但一些西方国家政要怀疑俄罗斯参与飞机迫降事件。“德国之声”称，英国外交大臣拉布24日表示，俄罗斯在这次行动中可能扮演重要角色。德国总理默克尔25日称，俄罗斯在飞机迫降事件中所扮演的角色存在疑问，她将在未来与俄罗斯总统普京的会晤中提出这个问题。对此，俄外交部发言人扎哈罗娃26日表示，西方国家难以摒弃“恐俄症”思维，俄方在飞机迫降问题上不偏袒任何一方，支持就此事开展合理调查，基于事实得出结论。对于28日俄白总统举行会面，俄总统新闻秘书佩斯科夫表示，除经济和双边关系问题外，两人还将讨论飞机迫降事件。</p><p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; text-indent: 2em; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">法新社27日称，尽管迫降事件使白俄罗斯重新成为欧盟的关注焦点，但欧盟外交与安全政策高级代表博雷利警告说，从长远来看，欧盟在如何与俄罗斯打交道方面面临更多问题。他强调，制裁不能实现所有目标，</p><p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; text-indent: 2em; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">欧盟领导人要求该组织官员6月提交报告，分析布鲁塞尔和莫斯科的关系以及欧盟能做些什么。德国外长马斯27日称，欧盟应就白俄罗斯问题与俄保持联系。</p><p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; text-indent: 2em; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">西方国家继续就迫降事件向白俄罗斯施压。据法新社27日报道，七国集团当天敦促白俄罗斯“立即无条件”释放普罗塔谢维奇。继周一的“领空禁令”后，欧盟威胁对白俄罗斯实施更多的经济制裁。博雷利称，可能停止从白俄罗斯进口钾肥，停止进口经白俄罗斯向欧洲输送的俄罗斯天然气，钾肥出口和天然气“过路费”是白政府的两大收入来源。英美法等西方国家26日发表联合声明，呼吁国际民用航空组织（ICAO）对飞机迫降事件进行调查，将肇事者绳之以法。ICAO周四召开紧急会议讨论迫降事件。（柳直）</p><p><br/></p>', '2021-06-01 17:30:17');
INSERT INTO `xinwenxinxi` VALUES ('6', '“摇滚老炮”的风流生涯', '3', 'upload/1622539914108.png', 'admin', '1', '<p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">如果说“崔健”是摇滚“教父”的话，那么郑钧就是“青翼蝠王”，不是多能“打”，而是很能“吸血”。</p><p class=\"f_center\" style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 0px; padding: 0px; text-align: center; line-height: 20px; color: rgb(102, 102, 102); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; white-space: normal;\"><img src=\"./upload/1622539924228.png\" style=\"box-sizing: inherit; border-style: initial; margin-bottom: 10px;\"/><br style=\"box-sizing: inherit;\"/></p><p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　一、</p><p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　郑钧1967年出生在一个根正苗红的知识分子家庭，爷爷郑自毅是黄埔军校六期毕业的传奇人物，父母都是大学老师，家里没一个没考上大学的。</p><p class=\"f_center\" style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 0px; padding: 0px; text-align: center; line-height: 20px; color: rgb(102, 102, 102); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; white-space: normal;\"><img src=\"./upload/1622539924282.png\" style=\"box-sizing: inherit; border-style: initial; margin-bottom: 10px;\"/><br style=\"box-sizing: inherit;\"/></p><p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　然而一切都在1974年改变了。</p><p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　1974年，父亲因病去世时，郑钧才7岁，哥哥比他大4岁，从此奉行“长兄如父”“棍棒底下出孝子”，常把郑钧揍得满脸血，还警告他：“不能向妈妈告状！</p><p><br/></p>', '2021-06-01 17:32:04');
INSERT INTO `xinwenxinxi` VALUES ('7', '阿拉杨主任，激励后来人', '1', 'upload/1622539950788.png', 'admin', '7', '<p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">在当地时间3月19日中美高层战略对话结束后，直至今日，有关杨洁篪的各种信息仍在刷屏。</p><p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　这位现任中央政治局委员、中央外事工作委员会办公室主任之所以能引起持续关注，当然是他在媒体注目下，表现出的对美方的态度，让人想起了老布什曾经给他起的绰号——“老虎杨”。然而，也有人说他有着硬汉柔情……</p><p class=\"f_center\" style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 0px; padding: 0px; text-align: center; line-height: 20px; color: rgb(102, 102, 102); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; white-space: normal;\">　　<img src=\"./upload/1622539962421.png\" style=\"box-sizing: inherit; border-style: initial; margin-bottom: 10px;\"/><br style=\"box-sizing: inherit;\"/></p><p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　<strong style=\"box-sizing: inherit;\">杨洁篪在中美高层战略对话开场白中阐明中方有关立场</strong></p><p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　01</p><p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　<strong style=\"box-sizing: inherit;\">资深外交官杨洁篪，就是有这样的魅力。</strong>对如今的美方硬气说话，除了国家层面的原因以外，也有分析认为，生于1950年的他，在外交生涯上，从驻美大使，到外交部长，一路行来，曾与基辛格、老布什、小布什、奥巴马等打过交道。</p><p class=\"f_center\" style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 0px; padding: 0px; text-align: center; line-height: 20px; color: rgb(102, 102, 102); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; white-space: normal;\">　　<img src=\"./upload/1622539962471.png\" style=\"box-sizing: inherit; border-style: initial; margin-bottom: 10px;\"/><br style=\"box-sizing: inherit;\"/></p><p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　<strong style=\"box-sizing: inherit;\">当年的杨洁篪和基辛格</strong></p><p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　在杨洁篪面前，怎么说，如今的美国国务卿布林肯、美国国家安全顾问沙利文都算后生。</p><p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　然而，海叔要说，外交场合，国际之间，简单的论资排辈并不说明问题。</p><p><br/></p>', '2021-06-01 17:32:42');
INSERT INTO `xinwenxinxi` VALUES ('8', '香港一武术世界冠军运动生涯完结，当庭痛哭', '1', 'upload/1622539987302.png', 'admin', '1', '<p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　据香港文汇报3月11日报道，2019年6月9日，大批暴徒在“揽炒派”煽动下，通宵占据金钟夏悫道和围攻香港立法会的警察防线，此后，有13名暴徒被控罪。他们当中的最后一批不认罪的5名被告，于3月10日被法院裁定全部罪成。部分被告原本可以拥有美好事业、学业，但现在前途尽毁。</p><p class=\"f_center\" style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 0px; padding: 0px; text-align: center; line-height: 20px; color: rgb(102, 102, 102); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; white-space: normal;\">　　<img src=\"./upload/1622539998084.png\" style=\"box-sizing: inherit; border-style: initial; margin-bottom: 10px;\"/><br style=\"box-sizing: inherit;\"/></p><p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　被告邝淯铭曾在香港武术界有一定成就（文汇报资料图）</p><p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　据文汇报介绍，这5名被告中，温镇豪被控一项故意阻挠在正当执行职务的警务人员罪（阻差办公罪），指他于2019年6月10日，在立法会综合大楼公众入口外的指定示威区阻挠高级督察龙俊胤；其余4被告王洛钧、邝淯铭、曾泳祥、廖德辉被控于同日同地参与非法集结。</p><p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　东区裁判法院被裁判官邓少雄在庭上指出，呈堂视频中的绿衣人就是温镇豪，他一直注视着高级督察龙俊胤，趁其制服一名向警方防线投掷水樽的白衣男暴徒时，冲前作180度转身拉住龙俊胤的右上臂，令白衣暴徒得以逃走，动作一气呵成，是蓄意阻挠警方工作。因此，裁定被告阻差办公罪成，判其实时入狱7星期。</p><p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　裁判官邓少雄继续指出，通过视频能够确认，其他4名被告都是其中参与非法集结的人，他们被捕时身穿的服饰及身型，和视频中一致。从视频中可见，他们4人曾各自推动铁马、与他人合力将铁马堆成路障、又招手示意其他人加入组成人链向警方防线移动等，部分片段更拍摄到他们的正面，因而裁定4人犯有参与非法集结罪。</p><p class=\"f_center\" style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 0px; padding: 0px; text-align: center; line-height: 20px; color: rgb(102, 102, 102); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; white-space: normal;\">　　<img src=\"./upload/1622539998266.png\" style=\"box-sizing: inherit; border-style: initial; margin-bottom: 10px;\"/><br style=\"box-sizing: inherit;\"/></p><p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　香港东区裁判法院</p><p style=\"box-sizing: inherit; margin-top: 34px; margin-bottom: 34px; padding: 0px; text-align: justify; color: rgb(64, 64, 64); font-family: Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; white-space: normal;\">　　大公网报道，邝淯铭的律师求情称，邝早在8岁起已入选香港武术队受训，2008年10岁时赢得世界青少年武术锦标赛（男子枪术）个人金牌，至16岁时转为全职运动员，并曾获香港民政事务局局长嘉许。邝淯铭的武术教练也评价邝的体能和技术优秀，有能力在世界赛及亚运会上冲击奖牌。而当邝淯铭被捕后，亦曾获准担保，到韩国参赛并获得铜牌。如果因本案留下案底，他的全职运动员生涯将会完结，希望法庭量刑时多加考虑。而被告曾泳祥原本今年护理系毕业，但现在学业尽毁。</p><p><br/></p>', '2021-06-01 17:33:18');

-- ----------------------------
-- Table structure for `yonghu`
-- ----------------------------
DROP TABLE IF EXISTS `yonghu`;
CREATE TABLE `yonghu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `yonghuming` varchar(50) NOT NULL COMMENT '用户名',
  `mima` varchar(50) NOT NULL COMMENT '密码',
  `xingming` varchar(50) NOT NULL COMMENT '姓名',
  `xingbie` varchar(10) NOT NULL COMMENT '性别',
  `shouji` varchar(50) NOT NULL COMMENT '手机',
  `youxiang` varchar(50) NOT NULL COMMENT '邮箱',
  `shenfenzheng` varchar(50) NOT NULL COMMENT '身份证',
  `touxiang` varchar(255) NOT NULL COMMENT '头像',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of yonghu
-- ----------------------------
INSERT INTO `yonghu` VALUES ('1', '001', '001', '小明', '男', '13666666666', '123456@qq.com', '513436200003296474', 'upload/1622540324341.png', '2021-06-01 17:38:45');

-- ----------------------------
-- Table structure for `youqinglianjie`
-- ----------------------------
DROP TABLE IF EXISTS `youqinglianjie`;
CREATE TABLE `youqinglianjie` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wangzhanmingcheng` varchar(50) NOT NULL COMMENT '网站名称',
  `wangzhi` varchar(50) NOT NULL COMMENT '网址',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='友情链接';

-- ----------------------------
-- Records of youqinglianjie
-- ----------------------------
INSERT INTO `youqinglianjie` VALUES ('1', '百度', 'http://www.baidu.com', '2021-06-01 17:08:24');
INSERT INTO `youqinglianjie` VALUES ('2', '谷歌', 'http://www.google.cn', '2021-06-01 17:08:24');
INSERT INTO `youqinglianjie` VALUES ('3', '新浪', 'http://www.sina.com', '2021-06-01 17:08:24');
INSERT INTO `youqinglianjie` VALUES ('4', 'QQ', 'http://www.qq.com', '2021-06-01 17:08:24');
INSERT INTO `youqinglianjie` VALUES ('5', '网易', 'http://www.163.com', '2021-06-01 17:08:24');
