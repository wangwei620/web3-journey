#!/bin/bash

# Web3开发环境自动搭建脚本
# 适用于Java开发者转Web3后端开发

set -e

echo "🚀 开始搭建Web3开发环境..."

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 检查系统类型
OS="$(uname -s)"
case "${OS}" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    *)          MACHINE="UNKNOWN:${OS}"
esac

echo -e "${BLUE}检测到系统: ${MACHINE}${NC}"

# 1. 检查Java环境
echo -e "\n${YELLOW}1. 检查Java环境...${NC}"
if command -v java &> /dev/null; then
    JAVA_VERSION=$(java -version 2>&1 | head -n 1 | cut -d'"' -f2)
    echo -e "${GREEN}✓ Java已安装: ${JAVA_VERSION}${NC}"
else
    echo -e "${RED}✗ Java未安装，请先安装Java 11+${NC}"
    exit 1
fi

# 2. 安装Node.js (如果未安装)
echo -e "\n${YELLOW}2. 检查Node.js环境...${NC}"
if command -v node &> /dev/null; then
    NODE_VERSION=$(node --version)
    echo -e "${GREEN}✓ Node.js已安装: ${NODE_VERSION}${NC}"
else
    echo -e "${BLUE}正在安装Node.js...${NC}"
    if [ "$MACHINE" = "Mac" ]; then
        # macOS使用Homebrew
        if command -v brew &> /dev/null; then
            brew install node
        else
            echo -e "${RED}请先安装Homebrew或手动安装Node.js${NC}"
            exit 1
        fi
    else
        # Linux使用NodeSource
        curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
        sudo apt-get install -y nodejs
    fi
fi

# 3. 安装全局npm包
echo -e "\n${YELLOW}3. 安装Web3开发工具...${NC}"
npm install -g ganache-cli
npm install -g @openzeppelin/contracts

# 4. 创建项目目录
echo -e "\n${YELLOW}4. 创建项目结构...${NC}"
PROJECT_NAME="my-web3-project"
mkdir -p $PROJECT_NAME
cd $PROJECT_NAME

# 5. 初始化Hardhat项目
echo -e "\n${YELLOW}5. 初始化Hardhat项目...${NC}"
npm init -y
npm install --save-dev hardhat
npm install --save-dev @nomicfoundation/hardhat-toolbox
npm install --save-dev @openzeppelin/contracts

# 6. 创建Hardhat配置
echo -e "\n${YELLOW}6. 创建配置文件...${NC}"
cat > hardhat.config.js << 'EOF'
require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.19",
  networks: {
    localhost: {
      url: "http://127.0.0.1:8545",
      gas: 2100000,
      gasPrice: 8000000000
    },
    sepolia: {
      url: "https://sepolia.infura.io/v3/YOUR-PROJECT-ID",
      accounts: ["YOUR-PRIVATE-KEY"]
    }
  }
};
EOF

# 7. 创建示例合约
echo -e "\n${YELLOW}7. 创建示例合约...${NC}"
mkdir -p contracts
cat > contracts/HelloWorld.sol << 'EOF'
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HelloWorld {
    string public message;
    address public owner;
    
    event MessageChanged(string newMessage);
    
    constructor(string memory _initialMessage) {
        message = _initialMessage;
        owner = msg.sender;
    }
    
    function setMessage(string memory _newMessage) public {
        require(msg.sender == owner, "Only owner can change message");
        message = _newMessage;
        emit MessageChanged(_newMessage);
    }
    
    function getMessage() public view returns (string memory) {
        return message;
    }
}
EOF

# 8. 创建部署脚本
echo -e "\n${YELLOW}8. 创建部署脚本...${NC}"
mkdir -p scripts
cat > scripts/deploy.js << 'EOF'
const hre = require("hardhat");

async function main() {
    const HelloWorld = await hre.ethers.getContractFactory("HelloWorld");
    const helloWorld = await HelloWorld.deploy("Hello, Web3!");
    
    await helloWorld.deployed();
    
    console.log("HelloWorld deployed to:", helloWorld.address);
    console.log("Initial message:", await helloWorld.getMessage());
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
EOF

# 9. 创建测试文件
echo -e "\n${YELLOW}9. 创建测试文件...${NC}"
mkdir -p test
cat > test/HelloWorld.js << 'EOF'
const { expect } = require("chai");

describe("HelloWorld", function () {
    let helloWorld;
    let owner;
    
    beforeEach(async function () {
        [owner] = await ethers.getSigners();
        const HelloWorld = await ethers.getContractFactory("HelloWorld");
        helloWorld = await HelloWorld.deploy("Hello, Web3!");
    });
    
    it("Should return the initial message", async function () {
        expect(await helloWorld.getMessage()).to.equal("Hello, Web3!");
    });
    
    it("Should change message when called by owner", async function () {
        await helloWorld.setMessage("New message");
        expect(await helloWorld.getMessage()).to.equal("New message");
    });
    
    it("Should fail when non-owner tries to change message", async function () {
        const [, nonOwner] = await ethers.getSigners();
        await expect(
            helloWorld.connect(nonOwner).setMessage("Hack attempt")
        ).to.be.revertedWith("Only owner can change message");
    });
});
EOF

# 10. 创建Java Maven项目结构
echo -e "\n${YELLOW}10. 创建Java项目结构...${NC}"
mkdir -p java-backend/{src/main/{java/com/example/{controller,service,model},resources},src/test/java}

# 11. 创建Maven pom.xml
cat > java-backend/pom.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 
         http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    
    <groupId>com.example</groupId>
    <artifactId>web3-backend</artifactId>
    <version>1.0.0</version>
    <packaging>jar</packaging>
    
    <properties>
        <maven.compiler.source>11</maven.compiler.source>
        <maven.compiler.target>11</maven.compiler.target>
        <spring.boot.version>2.7.0</spring.boot.version>
        <web3j.version>4.9.8</web3j.version>
    </properties>
    
    <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
            <version>${spring.boot.version}</version>
        </dependency>
        
        <dependency>
            <groupId>org.web3j</groupId>
            <artifactId>core</artifactId>
            <version>${web3j.version}</version>
        </dependency>
        
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-test</artifactId>
            <version>${spring.boot.version}</version>
            <scope>test</scope>
        </dependency>
    </dependencies>
    
    <build>
        <plugins>
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
                <version>${spring.boot.version}</version>
            </plugin>
        </plugins>
    </build>
</project>
EOF

# 12. 创建Java应用主类
cat > java-backend/src/main/java/com/example/Web3Application.java << 'EOF'
package com.example;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Web3Application {
    public static void main(String[] args) {
        SpringApplication.run(Web3Application.class, args);
    }
}
EOF

# 13. 创建启动脚本
echo -e "\n${YELLOW}11. 创建启动脚本...${NC}"
cat > start-ganache.sh << 'EOF'
#!/bin/bash
echo "启动本地以太坊节点..."
ganache-cli --deterministic --accounts 10 --host 0.0.0.0 --port 8545
EOF
chmod +x start-ganache.sh

cat > run-tests.sh << 'EOF'
#!/bin/bash
echo "编译合约..."
npx hardhat compile

echo "运行测试..."
npx hardhat test

echo "部署到本地网络..."
npx hardhat run scripts/deploy.js --network localhost
EOF
chmod +x run-tests.sh

# 14. 创建README文件
cat > README.md << 'EOF'
# Web3开发项目模板

## 快速开始

### 1. 启动本地区块链节点
```bash
./start-ganache.sh
```

### 2. 编译和测试合约
```bash
./run-tests.sh
```

### 3. 启动Java后端
```bash
cd java-backend
mvn spring-boot:run
```

## 项目结构
```
my-web3-project/
├── contracts/          # Solidity智能合约
├── scripts/            # 部署脚本
├── test/              # 合约测试
├── java-backend/      # Java Spring Boot后端
└── README.md
```

## 下一步
1. 学习Solidity语法
2. 完善Java后端集成
3. 开发前端界面
4. 部署到测试网络
EOF

# 15. 创建.gitignore
cat > .gitignore << 'EOF'
node_modules/
artifacts/
cache/
.env
*.log
target/
.DS_Store
.vscode/
.idea/
EOF

echo -e "\n${GREEN}🎉 Web3开发环境搭建完成！${NC}"
echo -e "\n${BLUE}项目位置: $(pwd)${NC}"
echo -e "\n${YELLOW}下一步操作:${NC}"
echo -e "1. ${GREEN}启动本地区块链:${NC} ./start-ganache.sh"
echo -e "2. ${GREEN}运行测试:${NC} ./run-tests.sh"
echo -e "3. ${GREEN}开发Java后端:${NC} cd java-backend && mvn spring-boot:run"
echo -e "\n${BLUE}访问学习资源:${NC}"
echo -e "- 查看完整路线图: cat ../java-to-web3-roadmap.md"
echo -e "- 查看快速入门: cat ../quick-start-guide.md"
echo -e "\n${GREEN}祝您学习愉快！🚀${NC}"