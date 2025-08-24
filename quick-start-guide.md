# Web3开发快速入门指南

## 🚀 环境搭建（30分钟完成）

### 1. 基础工具安装

#### Node.js环境
```bash
# 安装Node.js (推荐使用nvm)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
source ~/.bashrc
nvm install --lts
nvm use --lts

# 验证安装
node --version
npm --version
```

#### Java环境（您已有）
```bash
# 确认Java版本（推荐Java 11+）
java -version
javac -version
```

### 2. 区块链开发工具

#### Hardhat框架
```bash
# 创建新项目
mkdir my-web3-project
cd my-web3-project
npm init -y
npm install --save-dev hardhat

# 初始化Hardhat项目
npx hardhat
# 选择 "Create a JavaScript project"
```

#### Web3j库（Java集成）
```xml
<!-- Maven依赖 -->
<dependency>
    <groupId>org.web3j</groupId>
    <artifactId>core</artifactId>
    <version>4.9.8</version>
</dependency>
```

#### MetaMask钱包
1. 访问 [MetaMask官网](https://metamask.io/)
2. 安装浏览器插件
3. 创建钱包并保存助记词
4. 添加测试网络（Sepolia、Goerli）

### 3. 测试环境

#### 本地区块链节点
```bash
# 安装Ganache CLI
npm install -g ganache-cli

# 启动本地节点
ganache-cli --deterministic --accounts 10 --host 0.0.0.0
```

#### 获取测试ETH
- Sepolia Faucet: https://sepoliafaucet.com/
- Goerli Faucet: https://goerlifaucet.com/

---

## 📝 第一个智能合约（30分钟实战）

### 1. 创建合约文件
```solidity
// contracts/HelloWorld.sol
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
```

### 2. 编译和部署脚本
```javascript
// scripts/deploy.js
async function main() {
    const HelloWorld = await ethers.getContractFactory("HelloWorld");
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
```

### 3. 测试用例
```javascript
// test/HelloWorld.js
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
});
```

### 4. 运行命令
```bash
# 编译合约
npx hardhat compile

# 运行测试
npx hardhat test

# 部署到本地网络
npx hardhat run scripts/deploy.js --network localhost

# 部署到测试网
npx hardhat run scripts/deploy.js --network sepolia
```

---

## ☕ Java Web3j集成（30分钟实战）

### 1. Maven项目配置
```xml
<!-- pom.xml -->
<project>
    <dependencies>
        <dependency>
            <groupId>org.web3j</groupId>
            <artifactId>core</artifactId>
            <version>4.9.8</version>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
            <version>2.7.0</version>
        </dependency>
    </dependencies>
</project>
```

### 2. 生成Java合约包装类
```bash
# 使用Web3j CLI生成Java类
web3j generate solidity -b build/contracts/HelloWorld.json -o src/main/java -p com.example.contracts
```

### 3. Spring Boot服务类
```java
// src/main/java/com/example/service/BlockchainService.java
@Service
public class BlockchainService {
    
    private static final String PRIVATE_KEY = "YOUR_PRIVATE_KEY";
    private static final String CONTRACT_ADDRESS = "YOUR_CONTRACT_ADDRESS";
    
    private final Web3j web3j;
    private final Credentials credentials;
    
    public BlockchainService() {
        this.web3j = Web3j.build(new HttpService("http://localhost:8545"));
        this.credentials = Credentials.create(PRIVATE_KEY);
    }
    
    public String deployContract(String initialMessage) throws Exception {
        HelloWorld contract = HelloWorld.deploy(
            web3j, 
            credentials, 
            new DefaultGasProvider(),
            initialMessage
        ).send();
        
        return contract.getContractAddress();
    }
    
    public String getMessage(String contractAddress) throws Exception {
        HelloWorld contract = HelloWorld.load(
            contractAddress, 
            web3j, 
            credentials, 
            new DefaultGasProvider()
        );
        
        return contract.getMessage().send();
    }
    
    public String setMessage(String contractAddress, String newMessage) throws Exception {
        HelloWorld contract = HelloWorld.load(
            contractAddress, 
            web3j, 
            credentials, 
            new DefaultGasProvider()
        );
        
        TransactionReceipt receipt = contract.setMessage(newMessage).send();
        return receipt.getTransactionHash();
    }
}
```

### 4. REST控制器
```java
// src/main/java/com/example/controller/BlockchainController.java
@RestController
@RequestMapping("/api/blockchain")
public class BlockchainController {
    
    @Autowired
    private BlockchainService blockchainService;
    
    @PostMapping("/deploy")
    public ResponseEntity<String> deployContract(@RequestParam String message) {
        try {
            String address = blockchainService.deployContract(message);
            return ResponseEntity.ok(address);
        } catch (Exception e) {
            return ResponseEntity.status(500).body("Error: " + e.getMessage());
        }
    }
    
    @GetMapping("/message/{address}")
    public ResponseEntity<String> getMessage(@PathVariable String address) {
        try {
            String message = blockchainService.getMessage(address);
            return ResponseEntity.ok(message);
        } catch (Exception e) {
            return ResponseEntity.status(500).body("Error: " + e.getMessage());
        }
    }
    
    @PostMapping("/message/{address}")
    public ResponseEntity<String> setMessage(
            @PathVariable String address, 
            @RequestParam String message) {
        try {
            String txHash = blockchainService.setMessage(address, message);
            return ResponseEntity.ok(txHash);
        } catch (Exception e) {
            return ResponseEntity.status(500).body("Error: " + e.getMessage());
        }
    }
}
```

---

## 🎯 第一周学习任务

### Day 1-2: 环境搭建
- [ ] 安装所有开发工具
- [ ] 创建MetaMask钱包
- [ ] 获取测试ETH
- [ ] 运行Hello World合约

### Day 3-4: Solidity基础
- [ ] 学习数据类型和变量
- [ ] 理解函数和修饰符
- [ ] 掌握事件和日志
- [ ] 练习简单合约

### Day 5-7: Java集成
- [ ] 配置Web3j环境
- [ ] 生成合约包装类
- [ ] 实现基础CRUD操作
- [ ] 创建REST API

---

## 📚 推荐学习顺序

### 第一阶段：基础概念（1-2周）
1. **区块链原理**
   - 观看视频：3Blue1Brown的"区块链"
   - 阅读：《区块链技术指南》前3章

2. **以太坊基础**
   - 官方文档：ethereum.org
   - 实践：使用MetaMask进行转账

### 第二阶段：智能合约（2-3周）
1. **Solidity语言**
   - 在线教程：CryptoZombies
   - 官方文档：docs.soliditylang.org
   - 实践：完成5个小项目

2. **开发工具**
   - Remix IDE在线编程
   - Hardhat本地开发
   - 测试驱动开发

### 第三阶段：后端集成（2-3周）
1. **Web3j使用**
   - 官方文档学习
   - 合约交互实践
   - 事件监听开发

2. **项目实战**
   - 代币发行平台
   - 投票系统
   - NFT市场

---

## 🔧 常用代码片段

### 获取账户余额
```java
BigInteger balance = web3j.ethGetBalance(address, DefaultBlockParameterName.LATEST)
    .send().getBalance();
```

### 发送ETH交易
```java
TransactionReceipt receipt = Transfer.sendFunds(
    web3j, credentials, toAddress, 
    BigDecimal.valueOf(0.1), Convert.Unit.ETHER
).send();
```

### 监听合约事件
```java
contract.messageChangedEventFlowable(DefaultBlockParameterName.EARLIEST, 
    DefaultBlockParameterName.LATEST)
    .subscribe(event -> {
        System.out.println("New message: " + event.newMessage);
    });
```

---

## 🐛 常见问题解决

### 1. Gas费用过高
```javascript
// 在hardhat.config.js中配置gas价格
module.exports = {
  networks: {
    localhost: {
      gas: 2100000,
      gasPrice: 8000000000
    }
  }
};
```

### 2. 私钥安全
```java
// 使用环境变量存储私钥
String privateKey = System.getenv("PRIVATE_KEY");
Credentials credentials = Credentials.create(privateKey);
```

### 3. 网络连接问题
```java
// 添加连接池和重试机制
OkHttpClient.Builder builder = new OkHttpClient.Builder()
    .connectTimeout(30, TimeUnit.SECONDS)
    .readTimeout(30, TimeUnit.SECONDS);
    
HttpService httpService = new HttpService("http://localhost:8545", builder.build());
Web3j web3j = Web3j.build(httpService);
```

---

## 🚀 下一步学习方向

### 立即开始（今天）
1. 搭建开发环境
2. 部署第一个合约
3. 集成Java后端

### 本周目标
1. 理解区块链基本概念
2. 掌握Solidity基础语法
3. 实现简单的DApp

### 本月目标
1. 开发完整项目
2. 学习DeFi基础
3. 参与开源项目

---

> 🎉 **恭喜！** 您已经准备好开始Web3之旅了。记住：实践是最好的老师，多写代码，多思考，多交流！

---

*快速入门指南*
*适用于有Java经验的开发者*