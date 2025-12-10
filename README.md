## XDYou HM

XDYou HM 是 [traintime_pda](https://github.com/BenderBlog/traintime_pda) 项目（又名 XDYou）的原生鸿蒙移植版，目前正处在开发阶段。

### 项目结构规划

~~~plaintext
xdyou_hm/
├── AppScope/                  		# 应用全局配置
│   ├── app.json5              		# 应用配置（名称、版本、权限等）
│   └── resources/             		# 应用级资源（全局字符串、图片等）
├── entry/                     		# 主应用模块（Entry Ability）
│   ├── src/main/
│   │   ├── ets/               		# ArkTS代码目录
│   │   │   ├── ability/       		# 应用入口
│   │   │   │   └── MainAbility.ts  # 主Ability，管理页面路由
│   │   │   ├── pages/         		# 主页面
│   │   │   │   ├── Index.ets  		# 首页（整合各功能入口）
│   │   │   │   ├── LoginPage.ets   # 登录页面
│   │   │   │   ├── classtable/     # 课程表相关页面
│   │   │   │   ├── library/        # 图书馆相关页面
│   │   │   │   ├── exam/           # 考试相关页面
│   │   │   │   ├── sports/         # 体育信息页面
│   │   │   │   └── campusServices/ # 校园服务页面（电费等）
│   │   │   ├── model/        		# 数据模型
│   │   │   │   ├── classtable.ts   # 课程表数据模型
│   │   │   │   ├── exam.ts         # 考试数据模型
│   │   │   │   └── ...
│   │   │   ├── service/       	 	# 业务服务
│   │   │   │   ├── api/         	# 网络请求（封装鸿蒙http）
│   │   │   │   ├── storage/     	# 本地存储（Preferences、数据库）
│   │   │   │   └── auth/        	# 认证服务
│   │   │   ├── common/      	 	# 公共工具
│   │   │   │   ├── logger.ts    	# 日志工具（适配鸿蒙HiLog）
│   │   │   │   ├── utils.ts     	# 通用工具函数
│   │   │   │   └── constants.ts 	# 常量定义
│   │   │   └── components/    	 	# 公共UI组件
│   │   │       ├── Button.ets   	# 自定义按钮
│   │   │       ├── Card.ets     	# 卡片组件
│   │   │       └── ...
│   │   ├── resources/          	# 模块内资源
│   │   └── module.json5     		# 模块配置
│   └── build-profile.json5     	# 构建配置
├── feature/                    	# 功能模块（按需拆分为Feature Ability）
│   ├── classtable/            	 	# 课程表模块
│   │   ├── src/main/ets/
│   │   │   ├── ability/        	# 课程表Ability
│   │   │   ├── pages/          	# 课程详情页、编辑页等
│   │   │   ├── model/          	# 课程表数据处理
│   │   │   └── components/     	# 课程表专用组件（如时间表视图）
│   │   └── module.json5
│   ├── library/                	# 图书馆模块
│   ├── exam/                   	# 考试模块
│   └── ...
├── shared/                     	# 共享模块（公共依赖）
│   ├── src/main/ets/
│   │   ├── model/              	# 跨模块数据模型（如用户信息）
│   │   ├── utils/              	# 通用工具类
│   │   └── constants/          	# 全局常量
│   └── module.json5
├── widget/                     	# 桌面小组件
│   ├── src/main/ets/
│   │   ├── ClasstableWidget.ets  	# 课程表小组件
│   │   └── model/                	# 小组件数据模型
│   └── module.json5
├── distributed/                	# 分布式能力模块
│   ├── src/main/ets/
│   │   ├── dataSync.ts          	# 分布式数据同步
│   │   └── deviceManager.ts     	# 设备管理
│   └── module.json5
├── build-profile.json5         	# 项目构建配置
└── hvigorfile.ts               	# 构建脚本
~~~

### 目前的工作

- [ ] 基础网络设施建设
- [ ] UI界面的设计和制作
- [ ] 课表业务逻辑的设计和相关数据模型的设计

### 目前该项目与原项目的一些不同之处

- [ ] 支持后台自动定时抓取数据
- [ ] 支持鸿蒙原生的分布式数据共享存储
- [ ] 支持鸿蒙系统的光效API
- [ ] 主页面板在不同屏幕下的网格布局设计
- [ ] 新增自定义的课程的数据结构应与通过网络抓取的数据的数据结构不同，以完成上述的分布式存储和更加细致的课程时间设置

### 接下来一段时间的计划安排

- [ ] 成绩查询模块移植
- [ ] 考试安排查询模块的移植
- [ ] 图书馆信息查询模块的移植
- [ ] 宿舍电量查询模块的移植
- [ ] 体育信息查看模块的移植
- [ ] 校园网余量查询模块的移植
- [ ] 国际化支持
- [ ] 鸿蒙原子化服务卡片支持

### 开源协议

目前准备延续原项目的 MPL 2.0 协议。

### 贡献说明

相关的贡献说明请看(CONTRIBUTION.md)[./CONTRIBUTION.md]
