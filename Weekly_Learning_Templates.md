# Web开发转行 - 每周学习执行模板

## 📅 第1周学习模板: Web开发基础

### Day 1-2: Web开发概述

#### 学习目标
- 了解Web开发技术栈
- 搭建本地开发环境
- 理解Web开发基本概念

#### 具体任务清单
```
上午 (3小时):
├── 09:00-10:00: 了解Web开发技术栈
│   ├── 前端技术: HTML, CSS, JavaScript
│   ├── 后端技术: Node.js, Python, Java
│   └── 数据库: MySQL, MongoDB, Redis
├── 10:00-11:00: 安装开发工具
│   ├── VS Code编辑器
│   ├── Chrome浏览器
│   └── Git版本控制
└── 11:00-12:00: 创建GitHub账号和仓库

下午 (3小时):
├── 14:00-15:00: 学习Web开发基本概念
│   ├── 客户端和服务器
│   ├── HTTP协议
│   └── 浏览器工作原理
├── 15:00-16:00: 搭建本地开发环境
│   ├── 创建项目文件夹
│   ├── 配置VS Code
│   └── 安装必要插件
└── 16:00-17:00: 创建第一个HTML文件
```

#### 学习资源
```
必读资料:
├── MDN Web Docs - Web开发入门
├── W3Schools - HTML教程
└── freeCodeCamp - 响应式Web设计

实践平台:
├── CodePen - 在线代码编辑器
├── JSFiddle - 快速原型开发
└── GitHub - 代码托管平台

推荐工具:
├── VS Code - 代码编辑器
├── Chrome DevTools - 浏览器开发工具
└── Git - 版本控制系统
```

#### 今日成果
- [ ] 完成开发环境搭建
- [ ] 创建GitHub账号和仓库
- [ ] 编写第一个HTML文件
- [ ] 提交代码到GitHub

---

### Day 3-4: HTML5基础

#### 学习目标
- 掌握HTML5文档结构
- 熟练使用语义化标签
- 理解HTML5新特性

#### 具体任务清单
```
上午 (3小时):
├── 09:00-10:00: HTML5文档结构
│   ├── DOCTYPE声明
│   ├── html, head, body标签
│   └── meta标签和字符编码
├── 10:00-11:00: 语义化标签
│   ├── header, nav, main, section
│   ├── article, aside, footer
│   └── 语义化的重要性
└── 11:00-12:00: 文本元素
│   ├── 标题标签 (h1-h6)
│   ├── 段落标签 (p)
│   └── 列表标签 (ul, ol, li)

下午 (3小时):
├── 14:00-15:00: 链接和图片
│   ├── 超链接 (a标签)
│   ├── 图片 (img标签)
│   └── 相对路径和绝对路径
├── 15:00-16:00: 表单元素基础
│   ├── form标签
│   ├── input标签类型
│   └── label标签
└── 16:00-17:00: 实践项目: 个人简历页面
```

#### 实践项目: 个人简历页面
```html
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>我的个人简历</title>
</head>
<body>
    <header>
        <h1>张三</h1>
        <p>Web开发工程师</p>
    </header>
    
    <nav>
        <ul>
            <li><a href="#about">关于我</a></li>
            <li><a href="#experience">工作经验</a></li>
            <li><a href="#skills">技能</a></li>
            <li><a href="#contact">联系方式</a></li>
        </ul>
    </nav>
    
    <main>
        <section id="about">
            <h2>关于我</h2>
            <p>我是一名正在学习Web开发的转行者...</p>
        </section>
        
        <section id="experience">
            <h2>工作经验</h2>
            <ul>
                <li>2020-2023: 原行业工作经验</li>
                <li>2024: 开始学习Web开发</li>
            </ul>
        </section>
        
        <section id="skills">
            <h2>技能</h2>
            <ul>
                <li>HTML5</li>
                <li>CSS3</li>
                <li>JavaScript (学习中)</li>
            </ul>
        </section>
        
        <section id="contact">
            <h2>联系方式</h2>
            <p>邮箱: example@email.com</p>
            <p>电话: 123-456-7890</p>
        </section>
    </main>
    
    <footer>
        <p>&copy; 2024 张三. 保留所有权利.</p>
    </footer>
</body>
</html>
```

#### 学习资源
```
必读资料:
├── MDN - HTML5基础教程
├── W3Schools - HTML5教程
└── HTML5权威指南 (书籍)

实践练习:
├── CodePen - HTML练习
├── freeCodeCamp - HTML基础认证
└── MDN - HTML练习

推荐工具:
├── VS Code - HTML语法高亮
├── Live Server - 本地服务器
└── HTML Validator - 代码验证
```

#### 今日成果
- [ ] 掌握HTML5基本语法
- [ ] 完成个人简历页面
- [ ] 理解语义化标签
- [ ] 提交代码到GitHub

---

### Day 5-7: HTML5进阶

#### 学习目标
- 掌握表单元素和验证
- 理解多媒体元素
- 熟练使用表格和列表

#### 具体任务清单
```
Day 5: 表单元素进阶
├── 上午: 表单元素详解
│   ├── input类型: text, email, password, number
│   ├── textarea和select
│   └── 表单验证属性
├── 下午: 实践项目: 联系表单
└── 晚上: 复习和巩固

Day 6: 多媒体和表格
├── 上午: 多媒体元素
│   ├── 音频 (audio标签)
│   ├── 视频 (video标签)
│   └── 图片优化
├── 下午: 表格元素
│   ├── table, tr, td, th
│   ├── 表格样式和布局
│   └── 实践项目: 课程表
└── 晚上: 项目优化

Day 7: 项目实战和总结
├── 上午: 综合项目开发
├── 下午: 项目优化和部署
└── 晚上: 周总结和下周规划
```

#### 实践项目: 联系表单
```html
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>联系我们</title>
</head>
<body>
    <header>
        <h1>联系我们</h1>
        <p>请填写下面的表单，我们会尽快回复您</p>
    </header>
    
    <main>
        <form action="/submit" method="POST">
            <fieldset>
                <legend>个人信息</legend>
                
                <label for="name">姓名:</label>
                <input type="text" id="name" name="name" required>
                
                <label for="email">邮箱:</label>
                <input type="email" id="email" name="email" required>
                
                <label for="phone">电话:</label>
                <input type="tel" id="phone" name="phone">
            </fieldset>
            
            <fieldset>
                <legend>留言信息</legend>
                
                <label for="subject">主题:</label>
                <select id="subject" name="subject" required>
                    <option value="">请选择主题</option>
                    <option value="general">一般咨询</option>
                    <option value="support">技术支持</option>
                    <option value="feedback">意见反馈</option>
                </select>
                
                <label for="message">留言内容:</label>
                <textarea id="message" name="message" rows="5" required></textarea>
            </fieldset>
            
            <fieldset>
                <legend>订阅信息</legend>
                <label>
                    <input type="checkbox" name="newsletter" value="yes">
                    订阅我们的新闻通讯
                </label>
            </fieldset>
            
            <button type="submit">提交表单</button>
            <button type="reset">重置表单</button>
        </form>
    </main>
</body>
</html>
```

#### 学习资源
```
必读资料:
├── MDN - HTML表单指南
├── W3Schools - HTML表单教程
└── HTML5表单验证

实践练习:
├── CodePen - 表单练习
├── freeCodeCamp - 表单项目
└── MDN - 表单练习

推荐工具:
├── HTML Form Validator
├── Browser Developer Tools
└── Accessibility Checker
```

#### 本周成果
- [ ] 掌握HTML5基础语法
- [ ] 完成3个实践项目
- [ ] 理解语义化标签
- [ ] 熟练使用表单元素
- [ ] 建立GitHub仓库

---

## 📅 第2周学习模板: CSS3基础

### Day 8-10: CSS选择器和盒模型

#### 学习目标
- 掌握CSS选择器
- 理解盒模型概念
- 熟练使用CSS布局

#### 具体任务清单
```
Day 8: CSS基础语法
├── 上午: CSS语法和选择器
│   ├── CSS语法规则
│   ├── 类选择器和ID选择器
│   ├── 元素选择器和组合选择器
│   └── 伪类选择器
├── 下午: 实践项目: 样式化个人简历
└── 晚上: 复习和练习

Day 9: 盒模型详解
├── 上午: 盒模型概念
│   ├── content, padding, border, margin
│   ├── 盒模型计算
│   └── box-sizing属性
├── 下午: 实践项目: 制作卡片组件
└── 晚上: 项目优化

Day 10: 布局基础
├── 上午: 布局属性
│   ├── display属性
│   ├── position定位
│   └── float浮动
├── 下午: 实践项目: 制作导航栏
└── 晚上: 综合练习
```

#### 实践项目: 样式化个人简历
```css
/* 基础样式 */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Arial', sans-serif;
    line-height: 1.6;
    color: #333;
    background-color: #f4f4f4;
}

/* 头部样式 */
header {
    background-color: #2c3e50;
    color: white;
    text-align: center;
    padding: 2rem 0;
}

header h1 {
    font-size: 2.5rem;
    margin-bottom: 0.5rem;
}

header p {
    font-size: 1.2rem;
    opacity: 0.9;
}

/* 导航样式 */
nav {
    background-color: #34495e;
    padding: 1rem 0;
}

nav ul {
    list-style: none;
    display: flex;
    justify-content: center;
    gap: 2rem;
}

nav a {
    color: white;
    text-decoration: none;
    padding: 0.5rem 1rem;
    border-radius: 4px;
    transition: background-color 0.3s;
}

nav a:hover {
    background-color: #2c3e50;
}

/* 主要内容样式 */
main {
    max-width: 800px;
    margin: 2rem auto;
    padding: 0 1rem;
}

section {
    background-color: white;
    margin-bottom: 2rem;
    padding: 2rem;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

section h2 {
    color: #2c3e50;
    margin-bottom: 1rem;
    border-bottom: 2px solid #3498db;
    padding-bottom: 0.5rem;
}

section ul {
    list-style-position: inside;
    margin-left: 1rem;
}

section li {
    margin-bottom: 0.5rem;
}

/* 页脚样式 */
footer {
    background-color: #2c3e50;
    color: white;
    text-align: center;
    padding: 1rem 0;
    margin-top: 2rem;
}
```

#### 学习资源
```
必读资料:
├── MDN - CSS基础教程
├── W3Schools - CSS教程
└── CSS权威指南 (书籍)

实践练习:
├── CodePen - CSS练习
├── CSS-Tricks - CSS技巧
└── freeCodeCamp - CSS认证

推荐工具:
├── Chrome DevTools
├── CSS Validator
└── Color Picker
```

#### 今日成果
- [ ] 掌握CSS基本语法
- [ ] 理解盒模型概念
- [ ] 完成样式化简历
- [ ] 熟练使用选择器

---

### Day 11-13: CSS样式和布局

#### 学习目标
- 掌握颜色和背景
- 理解字体和文本样式
- 熟练使用定位布局

#### 具体任务清单
```
Day 11: 颜色和背景
├── 上午: 颜色值和背景属性
│   ├── 颜色表示方法
│   ├── 背景颜色和图片
│   ├── 背景定位和重复
│   └── 渐变背景
├── 下午: 实践项目: 制作渐变背景
└── 晚上: 复习和练习

Day 12: 字体和文本
├── 上午: 字体和文本属性
│   ├── font-family字体族
│   ├── font-size字体大小
│   ├── text-align文本对齐
│   └── line-height行高
├── 下午: 实践项目: 制作文章排版
└── 晚上: 项目优化

Day 13: 定位布局
├── 上午: 定位属性
│   ├── static, relative, absolute
│   ├── fixed, sticky
│   └── z-index层级
├── 下午: 实践项目: 制作导航栏
└── 晚上: 综合练习
```

#### 实践项目: 制作导航栏
```html
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>响应式导航栏</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
        }

        .navbar {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 1rem 0;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .nav-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 2rem;
        }

        .logo {
            color: white;
            font-size: 1.5rem;
            font-weight: bold;
            text-decoration: none;
        }

        .nav-menu {
            display: flex;
            list-style: none;
            gap: 2rem;
        }

        .nav-menu a {
            color: white;
            text-decoration: none;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            transition: all 0.3s ease;
        }

        .nav-menu a:hover {
            background-color: rgba(255,255,255,0.2);
            transform: translateY(-2px);
        }

        .hamburger {
            display: none;
            flex-direction: column;
            cursor: pointer;
        }

        .hamburger span {
            width: 25px;
            height: 3px;
            background-color: white;
            margin: 3px 0;
            transition: 0.3s;
        }

        /* 响应式设计 */
        @media (max-width: 768px) {
            .nav-menu {
                position: fixed;
                left: -100%;
                top: 70px;
                flex-direction: column;
                background-color: #667eea;
                width: 100%;
                text-align: center;
                transition: 0.3s;
                box-shadow: 0 10px 27px rgba(0,0,0,0.05);
            }

            .nav-menu.active {
                left: 0;
            }

            .hamburger {
                display: flex;
            }
        }

        /* 主要内容 */
        .main-content {
            margin-top: 80px;
            padding: 2rem;
            min-height: 100vh;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="nav-container">
            <a href="#" class="logo">我的网站</a>
            
            <ul class="nav-menu">
                <li><a href="#home">首页</a></li>
                <li><a href="#about">关于</a></li>
                <li><a href="#services">服务</a></li>
                <li><a href="#portfolio">作品</a></li>
                <li><a href="#contact">联系</a></li>
            </ul>
            
            <div class="hamburger">
                <span></span>
                <span></span>
                <span></span>
            </div>
        </div>
    </nav>

    <main class="main-content">
        <h1>欢迎来到我的网站</h1>
        <p>这是一个响应式导航栏的示例。</p>
    </main>

    <script>
        // 移动端菜单切换
        const hamburger = document.querySelector('.hamburger');
        const navMenu = document.querySelector('.nav-menu');

        hamburger.addEventListener('click', () => {
            hamburger.classList.toggle('active');
            navMenu.classList.toggle('active');
        });

        // 点击菜单项后关闭菜单
        document.querySelectorAll('.nav-menu a').forEach(n => n.addEventListener('click', () => {
            hamburger.classList.remove('active');
            navMenu.classList.remove('active');
        }));
    </script>
</body>
</html>
```

#### 学习资源
```
必读资料:
├── MDN - CSS颜色和背景
├── CSS-Tricks - 布局技巧
└── Google Fonts - 字体资源

实践练习:
├── CodePen - 布局练习
├── Flexbox Froggy - Flexbox游戏
└── Grid Garden - Grid布局游戏

推荐工具:
├── ColorZilla - 颜色选择器
├── CSS Grid Generator
└── Flexbox Generator
```

#### 今日成果
- [ ] 掌握颜色和背景属性
- [ ] 熟练使用字体和文本样式
- [ ] 完成响应式导航栏
- [ ] 理解定位布局

---

### Day 14: 项目实战

#### 学习目标
- 综合运用HTML和CSS
- 制作完整的个人作品集网站
- 掌握项目开发流程

#### 项目要求
```
项目名称: 个人作品集网站
技术栈: HTML5 + CSS3
功能要求:
├── 响应式设计
├── 导航菜单
├── 个人介绍
├── 技能展示
├── 项目展示
└── 联系方式

设计要求:
├── 现代简洁的设计风格
├── 良好的用户体验
├── 移动端适配
└── 代码规范
```

#### 项目结构
```
portfolio-website/
├── index.html
├── css/
│   ├── style.css
│   ├── responsive.css
│   └── animations.css
├── images/
│   ├── profile.jpg
│   ├── project1.jpg
│   ├── project2.jpg
│   └── project3.jpg
├── js/
│   └── main.js
└── README.md
```

#### 开发流程
```
上午 (3小时):
├── 09:00-10:00: 项目规划和设计
├── 10:00-11:00: HTML结构编写
└── 11:00-12:00: CSS基础样式

下午 (3小时):
├── 14:00-15:00: 响应式设计
├── 15:00-16:00: 动画和交互
└── 16:00-17:00: 测试和优化

晚上 (2小时):
├── 19:00-20:00: 代码审查和优化
└── 20:00-21:00: 部署和文档编写
```

#### 项目代码示例
```html
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>张三 - Web开发工程师</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/responsive.css">
    <link rel="stylesheet" href="css/animations.css">
</head>
<body>
    <!-- 导航栏 -->
    <nav class="navbar">
        <div class="nav-container">
            <a href="#" class="logo">张三</a>
            <ul class="nav-menu">
                <li><a href="#home">首页</a></li>
                <li><a href="#about">关于</a></li>
                <li><a href="#skills">技能</a></li>
                <li><a href="#projects">项目</a></li>
                <li><a href="#contact">联系</a></li>
            </ul>
            <div class="hamburger">
                <span></span>
                <span></span>
                <span></span>
            </div>
        </div>
    </nav>

    <!-- 首页 -->
    <section id="home" class="hero">
        <div class="hero-content">
            <h1>你好，我是张三</h1>
            <p>Web开发工程师 | 全栈开发者</p>
            <div class="hero-buttons">
                <a href="#projects" class="btn btn-primary">查看作品</a>
                <a href="#contact" class="btn btn-secondary">联系我</a>
            </div>
        </div>
    </section>

    <!-- 关于我 -->
    <section id="about" class="about">
        <div class="container">
            <h2>关于我</h2>
            <div class="about-content">
                <div class="about-text">
                    <p>我是一名正在学习Web开发的转行者，对前端和后端开发都有浓厚的兴趣。</p>
                    <p>通过5个月的系统学习，我已经掌握了HTML5、CSS3、JavaScript等核心技术。</p>
                    <p>我热爱编程，喜欢解决技术问题，并且具备良好的学习能力和团队协作精神。</p>
                </div>
                <div class="about-image">
                    <img src="images/profile.jpg" alt="张三的照片">
                </div>
            </div>
        </div>
    </section>

    <!-- 技能 -->
    <section id="skills" class="skills">
        <div class="container">
            <h2>技能专长</h2>
            <div class="skills-grid">
                <div class="skill-card">
                    <h3>前端开发</h3>
                    <ul>
                        <li>HTML5</li>
                        <li>CSS3</li>
                        <li>JavaScript</li>
                        <li>React</li>
                    </ul>
                </div>
                <div class="skill-card">
                    <h3>后端开发</h3>
                    <ul>
                        <li>Node.js</li>
                        <li>Express</li>
                        <li>MongoDB</li>
                        <li>RESTful API</li>
                    </ul>
                </div>
                <div class="skill-card">
                    <h3>开发工具</h3>
                    <ul>
                        <li>Git</li>
                        <li>VS Code</li>
                        <li>Chrome DevTools</li>
                        <li>Postman</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <!-- 项目展示 -->
    <section id="projects" class="projects">
        <div class="container">
            <h2>项目展示</h2>
            <div class="projects-grid">
                <div class="project-card">
                    <img src="images/project1.jpg" alt="项目1">
                    <div class="project-info">
                        <h3>个人作品集网站</h3>
                        <p>使用HTML5和CSS3开发的响应式个人作品集网站</p>
                        <div class="project-tech">
                            <span>HTML5</span>
                            <span>CSS3</span>
                            <span>JavaScript</span>
                        </div>
                        <div class="project-links">
                            <a href="#" class="btn btn-small">查看演示</a>
                            <a href="#" class="btn btn-small">源代码</a>
                        </div>
                    </div>
                </div>
                <!-- 更多项目卡片 -->
            </div>
        </div>
    </section>

    <!-- 联系方式 -->
    <section id="contact" class="contact">
        <div class="container">
            <h2>联系我</h2>
            <div class="contact-content">
                <div class="contact-info">
                    <h3>联系方式</h3>
                    <p><strong>邮箱:</strong> example@email.com</p>
                    <p><strong>电话:</strong> 123-456-7890</p>
                    <p><strong>地址:</strong> 北京市朝阳区</p>
                </div>
                <form class="contact-form">
                    <input type="text" placeholder="您的姓名" required>
                    <input type="email" placeholder="您的邮箱" required>
                    <textarea placeholder="您的留言" rows="5" required></textarea>
                    <button type="submit" class="btn btn-primary">发送消息</button>
                </form>
            </div>
        </div>
    </section>

    <!-- 页脚 -->
    <footer class="footer">
        <div class="container">
            <p>&copy; 2024 张三. 保留所有权利.</p>
        </div>
    </footer>

    <script src="js/main.js"></script>
</body>
</html>
```

#### 学习资源
```
项目参考:
├── Awwwards - 优秀网站设计
├── Dribbble - 设计灵感
└── Behance - 作品集参考

开发工具:
├── VS Code - 代码编辑器
├── Chrome DevTools - 调试工具
└── GitHub Pages - 免费托管

学习资料:
├── MDN - Web开发文档
├── CSS-Tricks - CSS技巧
└── freeCodeCamp - 项目练习
```

#### 本周成果
- [ ] 掌握CSS3基础语法
- [ ] 理解盒模型和布局
- [ ] 完成个人作品集网站
- [ ] 掌握响应式设计
- [ ] 建立项目开发流程

---

## 📊 学习进度追踪模板

### 每日学习记录
```
日期: _______
学习内容: 第___周 - [具体内容]
学习时长: ___小时
掌握程度: ⭐⭐⭐⭐⭐ (1-5星)

今日收获:
- 新学知识点: ______
- 实践项目: ______
- 遇到的问题: ______
- 解决方案: ______

明日计划:
- 学习重点: ______
- 实践目标: ______
- 需要复习: ______
```

### 周度学习总结
```
第___周学习总结

技术掌握:
├── HTML/CSS: ___/10
├── JavaScript: ___/10
├── React: ___/10
├── Node.js: ___/10
└── 数据库: ___/10

项目完成:
├── 小项目: ___个
├── 大项目: ___个
├── 代码行数: ___行
└── GitHub提交: ___次

学习效果:
- 理论理解: ___/10
- 实践能力: ___/10
- 问题解决: ___/10
- 学习效率: ___/10

下周目标:
- 技术重点: ______
- 项目计划: ______
- 能力提升: ______
```

### 月度转行报告
```
第___月转行报告

总体进展:
├── 计划完成度: ___%
├── 技术栈掌握: ___个
├── 项目完成: ___个
└── 代码量: ___行

能力提升:
├── 前端开发: +___%
├── 后端开发: +___%
├── 全栈开发: +___%
└── 项目经验: +___%

转行准备:
- 技术深度: ___/10
- 实践能力: ___/10
- 项目经验: ___/10
- 就业准备: ___/10

下月计划:
- 学习重点: ______
- 项目目标: ______
- 就业准备: ______
```

---

*这份每周学习执行模板将帮助您系统性地执行Web开发转行计划。建议根据个人情况适当调整学习进度和重点。*

**坚持学习，成功转行！** 🚀