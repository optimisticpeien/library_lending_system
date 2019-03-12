/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : library_lending_system

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 20/02/2019 12:45:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('root', 'root', '000');
INSERT INTO `admin` VALUES ('外语001', '外语001', '001');
INSERT INTO `admin` VALUES ('外语002', '外语002', '002');
INSERT INTO `admin` VALUES ('外语003', '外语003', '003');
INSERT INTO `admin` VALUES ('外语004', '外语004', '004');
INSERT INTO `admin` VALUES ('外语005', '外语005', '005');
INSERT INTO `admin` VALUES ('文学001', '文学001', '001');
INSERT INTO `admin` VALUES ('文学002', '文学002', '002');
INSERT INTO `admin` VALUES ('文学003', '文学003', '003');
INSERT INTO `admin` VALUES ('文学004', '文学004', '004');
INSERT INTO `admin` VALUES ('文学005', '文学005', '005');
INSERT INTO `admin` VALUES ('杂志001', '杂志001', '001');
INSERT INTO `admin` VALUES ('杂志002', '杂志002', '002');
INSERT INTO `admin` VALUES ('杂志003', '杂志003', '003');
INSERT INTO `admin` VALUES ('杂志004', '杂志004', '004');
INSERT INTO `admin` VALUES ('自然科学001', '自然科学001', '001');
INSERT INTO `admin` VALUES ('自然科学002', '自然科学002', '002');
INSERT INTO `admin` VALUES ('自然科学003', '自然科学003', '003');
INSERT INTO `admin` VALUES ('自然科学004', '自然科学004', '004');
INSERT INTO `admin` VALUES ('音乐001', '音乐001', '001');
INSERT INTO `admin` VALUES ('音乐002', '音乐002', '002');
INSERT INTO `admin` VALUES ('音乐003', '音乐003', '003');

-- ----------------------------
-- Table structure for announcement
-- ----------------------------
DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement`  (
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date` datetime(0) NOT NULL,
  `visibility` bit(3) NOT NULL,
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`title`) USING BTREE,
  UNIQUE INDEX `announcement_title_uindex`(`title`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of announcement
-- ----------------------------
INSERT INTO `announcement` VALUES ('《流浪地球》的投资方能赚多少钱？', '2019-02-12 15:06:52', b'110', '《流浪地球》无疑已经成为2019年春节档最大赢家。根据猫眼专业版数据，该片上映8天，累计票房25亿人民币，领跑春节档。排名第二的《疯狂的外星人》（16亿）与之相差9亿人民币。\r\n\r\n该片目前的分账票房为23.4亿，片方（39%）9.13亿，影院（52.3%）12.2亿，其他（8.7%）2亿。\r\n\r\n根据现在的分账模式，一部电影的票房收入要遵循这个公式：扣除3.3%的营业税和5%的电影事业专项资金，剩下的91.7%为一部电影的“可分账票房”，由电影院、发行方和制片方来分成。在这91.7%中，电影院及院线提留55%，而发行方要12%，剩下的33%是制片方的收入。\r\n\r\n据此前的报道，《流浪地球》的投资方一共有9家公司，成本大约在5.3亿左右。《流浪地球》主要出品方包括：中国电影股份有限公司、北京京西文化旅游股份有限公司、吴京的北京登峰国际文化传播有限公司，郭帆文化传媒有限公司（该片导演郭帆的公司）。\r\n\r\n联合出品方则高达23家（包括阿里影业、腾讯影业、湖南芒果娱乐、耀莱影视、上海电影集团等），发行2家，联合发行7家。其中，中国电影和北京文化是出品方也是发行方，北京文化还是《流浪地球》的制作方。\r\n\r\n那么，《流浪地球》背后的这几家公司能从中获益多少？或许以从他们最近发布的公告中获得答案。\r\n\r\n上海电影2月10日发布公告称，截至 2019年2月7日，公司来源于该影片的综合收益暂为-280万元~-230万元（最终数据以实际结算为准）。值得注意的是，目前-280万元至-230万元的收益是建立在2019年2月7日24时7.36亿元的票房基础之上计算的。而公告日为10日，若上海电影将票房拉后至10日15.93亿来进行测算，而综合收益大概率将为正数。\r\n\r\n公告还表示，鉴于影片还在上映中，相关收益将随着票房增加而相应增长，公司将视收益情况适时发布进展公告。\r\n\r\n文投控股2月10日表示，不完全统计， 截至2019年2月10日零时，该影片在中国大陆地区上映5日，累计票房收入约为人民币15.93亿元，超过公司最近一个会计年度经审计的合并财务报表营业收入的50%。文投控股称，因公司参与投资该影片的比例较小，截至2019年2月10日零时，公司投资于该影片所产生的营业收入尚未形成较大规模，对公司业绩的影响不大。中国电影2月11日发布晚间公告称，截至2月10日，公司投资电影《流浪地球》所产生的收益约为9500~10500万元。目前，该影片仍在上映之中，公司来源于该影片的收益将伴随影片票房的增长而增加。\r\n\r\n值得注意的是，中国电影是最先介入到《流浪地球》的公司。澎湃新闻从中国电影发布于2017年4月的一则变更募集资金投资项目公告中了解到，流浪地球是该公司2017年投资拍摄的项目，项目投资额为4500万元。\r\n\r\n北京文化2019年1月4日的公告称，公司第七届董事会第九次会议同意公司与郭帆文化传媒签署《电影＜流浪地球＞联合投资协议》，郭帆文化传媒追加投资电影《流浪地球》，追加投资金额900万元。2017年1月24日公司一份公告显示，北京文化对电影《流浪地球》项目的总投资1.075亿元，其中公司投资的影片制片成本7250万元，公司垫付的宣传和发行成本不低于2500万元、不超过3500万元。\r\n\r\n北京文化可以算是最大赢家了。从《战狼2》到《我不是药神》《无名之辈》，多次押宝。2018年12月6日，北京文化发布的公告显示，截至12月4日，《无名之辈》累计票房收入约为6.66亿元，超过公司最近一个会计年度经审计的合并财务报表营业收入的50%，公司来源于《无名之辈》的票房收益约为6000万元~7000万元。\r\n\r\n北京文化2018年三季报显示，公司前三季度实现归母净利润4625.90万元，同比增长144.55%。当时《无名之辈》还在上映，这笔预计的票房收益已经超过了北京文化前三季度的净利润。\r\n\r\n除以上几个投资方，《流浪地球》还有一个投资人，吴京。据网上传，吴京实际上是零片酬客串出演，但是由于最后剧组资金不够，吴京自掏6000万元参与了《流浪地球》。\r\n\r\n可以大胆预测，该片的票房可能远不止25亿。目前，猫眼专业版对该片的票房预测是51亿元。如果《流浪地球》最后的票房收入是50亿，吴京能拿到多少钱呢？此次吴京是通过他的公司登峰国际进行投资的，他在该公司的占股为90%，按照他的投资比例推算，《流浪地球》的制片方可以拿到50x33%=16.5亿，登峰国际公司收入1.8亿，那么吴京个人则可以拿到1.6亿。');
INSERT INTO `announcement` VALUES ('2019年中国电影票房破百亿 流浪地球排第一', '2019-02-12 15:07:10', b'011', '【CNMO新闻】2月12日，猫眼电影发布消息称，截止2019年2月11日21:38，2019年中国电影年度票房已经累计突破100亿，用时41天，与2018年相比，提前8天完成该成就。\r\n\r\n流浪地球\r\n\r\n根据资料显示，2019年中国电影票房排行榜前20位中有15部是国产电影，其中“流浪地球”以23.5亿的票房暂居第一，“疯狂的外星人”目前以15.5亿的票房成绩位于第二名。好莱坞大片“大黄蜂”以11.4亿票房排在第三位，大黄蜂也是榜单前五名中唯一的进口片。\r\n\r\n春节档表现依旧强势，前五中在春节期间上映的电影多达四部。其中 “飞驰人生”和“新喜剧之王”位列第四和第五，“熊出没：原始时代”和“白蛇：缘起”两部优质动画电影紧随其后，说明大家现在对于动画电影的包容度变得更高。\r\n\r\n图片来自猫眼\r\n\r\n猫眼表示，2018年中国电影票房累计突破600亿。所以说2019年能否打破上一年创造的票房纪录？让我们拭目以待！');
INSERT INTO `announcement` VALUES ('440万签最后3人，火箭已锁定2目标，最强的一位有点儿悬！', '2019-02-12 15:07:02', b'101', '火箭在中期交易市场上动作频频，经过一系列的运作，莫雷不但将奢侈税清零，还腾出了3个阵容名额，期待在买断市场上再次寻求补强。但现实却很残酷，马修斯加盟了步行者，艾灵顿去了活塞，林书豪选择了猛龙，火箭至今也还没能完成捡漏。不过火箭还是具备一些优势，另外，他们的目标也非常明确。\r\n\r\n火箭至少有2个优势，一是有薪金空间。火箭目前距离奢侈税线大约还有110万美元的差额，这足以签下一名买断球员，更为关键的是，火箭的中产特例还剩下了330万美元可供使用。用440万美元签下3名球员，薪金方面是完全足够的，参考法里埃德和小里弗斯的合同，火箭甚至有机会通过提高薪水去抢人。\r\n\r\n二是火箭有帮助球员重返巅峰的能力。本赛季，火箭发掘了克拉克和豪斯，激活了法里埃德和小里弗斯，这些人都在火箭打出了身价。对于买断球员来说，眼前的利益并非终极考量，未来的发展才是最重要的，为了下一份合同他们也希望能够去一支好的球队。还有一部分老将希望能够冲冠，火箭也能够满足条件。\r\n\r\n火箭的第13人基本已经确定，那就是旧将豪斯。据The Athletic记者Kelly Iko的报道，丹纽尔-豪斯对于在3月1日前和火箭达成合同感到乐观，如果成功，他将可以代表火箭征战季后赛。莫雷已经放弃了恩尼斯，豪斯的作用早就已经得到过证明，香珀特为火箭提供了双保险，但转正豪斯仍然是火箭的重要目标。\r\n\r\n第14人目前还没有确定，但已经有了明确的人选。据雅虎记者Chris Haynes报道，经纪人里奇-保罗透露，火箭和湖人有意签下马基夫-莫里斯。虽然湖人有里奇-保罗这层关系在，但火箭也并不是毫无机会，莫里斯兄弟和哈登私交甚笃。莫里斯的伤病已经接近痊愈，他预计将在本周决定去向，火箭必定会全力争取。\r\n\r\n第15人成了火箭最大的不确定因素。火箭还需要补强两点，一是纯投手，射手是无论什么时候都不会嫌多的；二是能够护框抢板的大中锋，法里埃德的身高是一大短板。据火箭跟队记者费根的分析，莫里斯非常适合火箭，但最强的人选是公牛的罗宾-洛佩斯，不过洛佩斯已经明确表示过想去勇士，加盟希望很小。');
INSERT INTO `announcement` VALUES ('四川省凉山州木里县森林火灾已扑灭', '2019-02-12 15:07:44', b'010', '2月10日凌晨，四川省凉山州木里县三桷桠乡里铺村和高房子村交界处发生森林火灾。火灾发生后，应急管理部及时调度部署，从云南调用直升飞机支援，全力做到打早、打小、打了。经1530名扑火队员和3架直升机奋力扑救，明火于12日9时26分全部扑灭，现已转入清理看守阶段。此次森林火灾过火面积约20公顷，未造成人员伤亡和重要设施损失，起火原因正在核查中');
INSERT INTO `announcement` VALUES ('疑似论文抄袭 北京电影学院成立翟天临事件调查组', '2019-02-12 15:07:17', b'001', '演员翟天临近日被爆出北京电影学院博士研究生在读期间，发表的一篇学术性质文章有疑似抄袭行为。北京电影学院已经对这一事件成立调查组。\r\n\r\n由直播时的一句“知网是什么东西”，翟天临在过去两天里一直占据热搜，被网友戏称是“得罪了全国硕士博士”。由于他的《谈电视剧中“白孝文”的表演创作》一文的查重检测报告显示相似度超过50%、知网上文字重复比为40.4%，总字数2783的文章中重复字数多达1125个。与此文有超高相似度的两篇文献是发表于多年前的《一个有灵魂深度的人物——之白孝文论》和《白孝文人物分析》。因此众多网友对他取得的博士学位提出质疑，并进一步对他被北京大学光华管理学院聘为博士后研究人员提出质疑。\r\n\r\n北京青年报记者2月11日从北京电影学院了解到，学校对此事件高度重视，已经成立调查组并按照相关程序启动调查程序。学校表示高度重视学术道德建设，对学术不端行为持零容忍态度。\r\n\r\n北京青年报记者还注意到，翟天临的《谈电视剧中“白孝文”的表演创作》一文2月10日已经被从知网上撤下。');
INSERT INTO `announcement` VALUES ('第一条添加测试', '2019-02-11 00:00:00', b'111', '第一条添加测试');
INSERT INTO `announcement` VALUES ('系统测试公告', '2019-02-07 00:00:00', b'100', '系统处于测试阶段');

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `ISBN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `press` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pricing` float(255, 2) NOT NULL,
  `number` int(11) NOT NULL,
  `remaining` int(11) NOT NULL,
  `borrow` bit(1) NOT NULL,
  `date` date NOT NULL,
  `introduction` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ISBN`) USING BTREE,
  INDEX `ISBN`(`ISBN`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('20837337', '史上第一混乱(全7册)', '张小花', '黄山书社', '小说', 129.40, 5, 5, b'1', '2019-02-20', '《史上第一混乱1》在网上掀起了搞笑风暴。网友惊呼：小花幽默震天地，《武林外传》都哏屁。另有评论曰：此书之于穿越小说相当于《鹿鼎记》之干武侠小说。\n秦始皇：前世，千古一帝。现世，尊号贏哥，腹诽贏胖子，对人昵称“挂皮”，见任何事都想“统一下哈”，是超级玛丽的死忠。\n荆轲：前世，天下第一刺客。现世，人称二傻，眼睛严重重散光，经常处于思维空白状态。他坚信收音机里说话的是他养的小人。\n项羽：前世，西楚霸王。现世，大个儿，有超强武力值。他的愿望就是开着金杯面包车回垓下找虞姬。\n刘邦：前世，汉高祖。现世，好赌，专贏低保户的买菜钱，审美观独具一格，专好丑女之色。\n李师师：前世，一代名妓。现世，把Helo Kity半袖T恤穿出比基尼效果的美女，彻底颠覆“胸大无脑”这一传统观念，是美貌与智慧并重的典范。\n　　《史上第一混乱2》人家穿越，我只能被穿越\n人家泡妞，我只能被妞……\n在我的第“好几号”当铺里，我接待了名叫荆轲、李白、关羽、秦侩等等一系列客户，发生了一连串让人忍俊不禁的故事。\n本书恶搞气氛浓重，修真、穿越、都市、爱情一个也不能少。所以名之以“史上第一混乱”。\n　　本套丛书还包括：《史上第一混乱3》《史上第一混乱4》《史上第一混乱5》《史上第一混乱6》《史上第一混乱7》。');
INSERT INTO `book` VALUES ('9710000', '科幻世界', '科幻世界', '四川科幻世界杂志社', '杂志', 10.00, 10, 10, b'1', '2019-02-20', '');
INSERT INTO `book` VALUES ('9787020002207', '红楼梦', '曹雪芹', '人民文学出版社', '小说', 59.70, 90, 90, b'1', '2019-02-20', '《红楼梦(人民文学版)(套装上下册)》编辑推荐：如果你还在为了阅读或收藏价格昂贵的中国古典名著而在书架前徘徊，那么现在你不用愁了，该版的《红楼梦》，不仅价格便宜、印刷美观、装帧古朴，收藏、送人都让你特有面子！实为古典小说的佳普及本！国内权威版本！畅销三十余年，行销四百万套。冯其庸先生领衔，中国红学会专家集体校注，人民文学出版社组织专家十余年编校，历经三次修订。2008年新版电视剧《红楼梦》导演李少红指定唯一底本。');
INSERT INTO `book` VALUES ('9787020147694', '就喜欢你看不惯我又干不掉我的样子1', '白茶', '人民文学出版社', '漫画', 40.60, 30, 30, b'1', '2019-02-20', '该书是著名漫画家白茶的代表作《就喜欢你看不惯我又干不掉我的样子》系列*本的增订版。该系列集结了白茶近年所有以“吾皇”为主角的漫画短篇作品，讲述了一只叫“吾皇”的胖猫、一只叫“巴扎黑”的萌狗，以及少年主人的生活趣事。 画风兼具中国传统国画与现代插画之美，文字风格温馨暖萌，又让人捧腹连连。增订版更添了多幅作者新作，丰满了吾皇与少年相遇的前世今生。');
INSERT INTO `book` VALUES ('9787115472588', '鸟哥的Linux私房菜', '鸟哥', '人民邮电出版社', '计算机', 119.00, 50, 49, b'1', '2019-02-12', '《鸟哥的Linux私房菜:基础学习篇》是最具知名度的Linux入门书《鸟哥的Linux私房菜基础学习篇》的最新版，全面而详细地介绍了Linux操作系统。全书分为5个部分：第一部分着重说明Linux的起源及功能，如何规划和安装Linux主机；第二部分介绍Linux的文件系统、文件、目录与磁盘的管理；第三部分介绍文字模式接口shell和管理系统的好帮手shell脚本，另外还介绍了文字编辑器vi和vim的使用方法；第四部分介绍了对于系统安全非常重要的Linux账号的管理，以及主机系统与程序的管理，如查看进程、任务分配和作业管理；第五部分介绍了系统管理员(root)的管理事项，如了解系统运行状况、系统服务，针对登录文件进行解析，对系统进行备份以及核心的管理等。');
INSERT INTO `book` VALUES ('9787121318474', 'Java EE 互联网轻量级框架整合开发：SSM框架(Spring MVC+Spring+MyBatis)和Redis实现', '杨开振 周文吉 梁华辉 谭茂华', '电子工业出版社', '计算机', 119.00, 20, 20, b'1', '2019-02-08', '随着移动互联网的兴起，以Java技术为后台的互联网技术占据了市场的主导地位，而在Java互联网后台开发中，SSM框架（Spring+SpringMVC+MyBatis）成为了主要架构，《Java EE互联网轻量级框架整合开发——SSM框架（Spring MVC+Spring+MyBatis）和Redis实现》以此为焦点从入门到实际工作要求讲述了SSM框架的技术应用；与此同时，为了提高系统性能，NoSQL（尤其是Redis）在互联网系统中已经广泛使用，为了适应这个变化，《Java EE互联网轻量级框架整合开发——SSM框架（Spring MVC+Spring+MyBatis）和Redis实现》通过Spring讲解了有关Redis的技术应用，这样更加贴近实际学习和工作的需要。\r\n《Java EE互联网轻量级框架整合开发——SSM框架（Spring MVC+Spring+MyBatis）和Redis实现》主要分为6个部分，第1部分对Java互联网的框架和主要涉及的模式做初步简介；第2部分讲述MyBatis技术；第3部分讲述Spring基础（包括IoC、AOP和数据库应用），重点讲解Spring数据库事务应用，以满足互联网企业的应用要求；第4部分，讲述SpringMVC框架；第5部分，通过Spring技术的应用，讲解Redis技术；第6部分，讲解SSM+Redis实践应用，通过互联网高并发如抢票、抢红包等场景，使用全注解的方式讲解SSM框架的整合，以及高并发与锁的应用和系统性能优化。\r\n《Java EE互联网轻量级框架整合开发——SSM框架（Spring MVC+Spring+MyBatis）和Redis实现》结合企业的实际需求，从原理到实践全面讲解SSM+Redis技术应用，无论你是Java程序员、SSM应用和研究人员，还是Redis应用人员、互联网开发人员，都可以从《Java EE互联网轻量级框架整合开发——SSM框架（Spring MVC+Spring+MyBatis）和Redis实现》中收获知识。');
INSERT INTO `book` VALUES ('9787302470069', 'Android Studio开发实践 从零基础到App上线', '欧阳燊', '清华大学出版社', '计算机', 129.00, 30, 30, b'1', '2019-02-12', '《Android Studio开发实战：从零基础到App上线》是一部Android开发的实战教程，由浅入深、由基础到高级，带领读者一步一步走进App开发的神奇世界。\r\n全书共分为16章。其中，前8章是基础部分，主要讲解Android Studio的环境搭建、App开发的各种常用控件、App的数据存储方式、如何调试App并将App发布上线；后8章是进阶部分，主要讲解App开发的设备操作、网络通信、事件、动画、多媒体、融合技术、第三方开发包、性能优化等。书中在讲解知识点的同时给出了大量实战范例，方便读者迅速将所学的知识运用到实际开发中。通过本书的学习，读者能够掌握3类主流App的基本开发技术，包括购物App（电子商务）、聊天App（即时通信）、打车App（交通出行）。另外，能够学会开发一些趣味应用，包括简单计算器、房贷计算器、万年历、日程表、手机安全助手、指南针、卫星浑天仪、抠图工具、动感影集、影视播放器、音乐播放器、WIFI共享器等。\r\n本书适用于Android开发的广大从业者、有志于转型App开发的程序员、App开发的业余爱好者，也可作为大中专院校与培训机构的Android课程教材。');
INSERT INTO `book` VALUES ('9787535489081', '就喜欢你看不惯我 又干不掉我的样子2', '白茶', '长江文艺出版社', '漫画', 40.90, 30, 30, b'1', '2019-02-20', '继《就喜欢你看不惯我又干不掉我的样子》狂销80万册后，白茶君携第二部绘本《就喜欢你看不惯我又干不掉我的样子2》踩着吾皇的猫步冷傲登场。本书继续上一部绘本的风格，故事幽默暖心，文字风趣有爱，画风兼具插画及国画之美，可品读，可收藏。傲娇的“吾皇”和蠢萌的“巴扎黑”又多了一个小伙伴儿——没心没肺的哈士奇“爱德华•牛能”，他们之间又将上演怎样的爆笑故事，爆发怎样的热门槽点呢？书中少年除了服务吾皇、巴扎黑之外，又多了一桩心事儿——被老爹逼婚，这位“宅到生活不能自理”的少年为了躲避相亲，更是使出了浑身解数，那画面想想也是醉了……\n吾皇、巴扎黑形象在互联网倍受热捧，与他们相关的信息有近万条的转发量，数量惊人。姚晨、马东、高晓松等等明星都曾转发白茶的微博，以表示对吾皇形象的喜爱和认可。');
INSERT INTO `book` VALUES ('9787536692930', '三体', '刘慈欣', '重庆出版社', '小说', 22.10, 100, 100, b'1', '2019-02-20', '　　文化大革命如火如荼进行的同时，军方探寻外星文明的绝秘计划“红岸工程”取得了突破性进展。但在按下发射键的那一刻，历经劫难的叶文洁没有意识到，她彻底改变了人类的命运。\n　　地球文明向宇宙发出的*声啼鸣，以太阳为中心，以光速向宇宙深处飞驰……\n　　四光年外，“三体文明”正苦苦挣扎——三颗无规则运行的太阳主导下的百余次毁灭与重生逼迫他们逃离母星。而恰在此时，他们接收到了地球发来的信息。\n　　在运用超技术锁死地球人的基础科学之后，三体人庞大的宇宙舰队开始向地球进发……人类的末日悄然来临。');
INSERT INTO `book` VALUES ('9787553625119', '四级词汇词根+联想记忆法', '俞敏洪', '浙江教育出版社', '外语', 32.00, 60, 60, b'1', '2019-02-12', '学习英语,词汇是基础,词汇量的不足会严重影响一个人在听、说、读、写各方面的能力。同时,在应对考试地,如果词汇量不过关,任何应试技巧都犹如隔靴搔痒,收效甚微!\r\n学单词有很多方法,可以通过日常积累,可以通过大量阅读,也可以通过词汇书短期突破,而对于应试而言,第三种方法无疑最真接、最有效。本书旨在介绍系统的词根+联想速记法,让你在短时间内轻松记住四级单词,同时从四级考点出发,全方位解读核心词汇,使你真正掌握重点单词的用法。');
INSERT INTO `book` VALUES ('9787560573700', '钢铁是怎样炼成的', '奥斯特洛夫斯基', '西安交通大学出版社', '小说', 32.70, 70, 70, b'1', '2019-02-20', '《钢铁是怎样炼成的》是一部闪耀着爱国主义、理想主义光芒的半自传励志小说，被罗曼·罗兰誉为“对火热而英勇的生命的一曲颂歌”。\n\n      小说以俄国十月革命为整体背景。主人公保尔·柯察金出身于社会底层，饱受折磨和侮辱，在朱赫莱的影响下，逐渐成长为自觉、无私而坚强的战士。虽双目失明，瘫痪在床，仍以坚强的毅力进行写作。\n\n      保尔·柯察金这一有着“钢铁般意志”的光辉形象，及其向理想与精神的皈依历程，一直成为正直、坚强、自强不息的象征，鼓舞和激励了一代代中国的年轻读者。');

-- ----------------------------
-- Table structure for borrowed_book
-- ----------------------------
DROP TABLE IF EXISTS `borrowed_book`;
CREATE TABLE `borrowed_book`  (
  `number` int(11) NOT NULL AUTO_INCREMENT,
  `ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ISBN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `borrowingDate` date NOT NULL,
  `returnDate` date NOT NULL,
  PRIMARY KEY (`number`) USING BTREE,
  INDEX `ISBN`(`ISBN`) USING BTREE,
  CONSTRAINT `borrowed_book_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `book` (`isbn`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borrowed_book
-- ----------------------------
INSERT INTO `borrowed_book` VALUES (1, '000001', '9787115472588', '2019-02-17', '2019-04-01');

-- ----------------------------
-- Table structure for borrowing_log
-- ----------------------------
DROP TABLE IF EXISTS `borrowing_log`;
CREATE TABLE `borrowing_log`  (
  `number` int(11) NOT NULL AUTO_INCREMENT,
  `ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ISBN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `borrowingDate` date NOT NULL,
  `returnDate` date NOT NULL,
  PRIMARY KEY (`number`) USING BTREE,
  INDEX `ID`(`ID`, `ISBN`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borrowing_log
-- ----------------------------
INSERT INTO `borrowing_log` VALUES (1, '000001', '9787302470069', '2019-02-17', '2019-02-18');
INSERT INTO `borrowing_log` VALUES (2, '000002', '9787121318474', '2019-02-20', '2019-02-20');
INSERT INTO `borrowing_log` VALUES (3, '000002', '9787553625119', '2019-02-20', '2019-02-20');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sex` bit(1) NOT NULL,
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `booknumber` int(11) NOT NULL DEFAULT 10,
  `grade` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('000001', '伊一', '001', b'1', '计算机电子系', 9, '计S171');
INSERT INTO `student` VALUES ('000002', '尔耳', '002', b'0', '外语系', 10, '法S172');
INSERT INTO `student` VALUES ('000003', '零零散散', '003', b'1', '物理系的', 10, '电C1711');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sex` bit(1) NOT NULL,
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `bookNumber` int(11) NOT NULL DEFAULT 20,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('0001', '张三', '001', b'0', '计算机电子系', 20);
INSERT INTO `teacher` VALUES ('0002', '丽丽', '002', b'1', '外语系', 20);

SET FOREIGN_KEY_CHECKS = 1;
