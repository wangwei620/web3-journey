# DeFi学习执行指南
## 每周详细任务和代码实践

### 🎯 学习重点
- **专注DeFi协议开发**
- **掌握Solidity智能合约**
- **理解DeFi核心机制**
- **实践项目驱动学习**

---

## 第1周：DeFi生态系统入门

### 每日任务安排
```
周一：DeFi概念学习 + 使用Uniswap
周二：Compound借贷体验 + 分析协议
周三：Aave协议分析 + 闪电贷体验
周四：DeFi数据平台使用 + TVL分析
周五：DeFi协议白皮书阅读
周六：DeFi项目调研 + 社区参与
周日：总结 + 下周计划
```

### 实践任务详解

#### 1. Uniswap使用体验
```javascript
// 使用Web3.js连接Uniswap
const Web3 = require('web3');
const web3 = new Web3('https://mainnet.infura.io/v3/YOUR_KEY');

// Uniswap V2 Router地址
const UNISWAP_V2_ROUTER = '0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D';

// 代币地址
const WETH = '0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2';
const USDC = '0xA0b86a33E6441b8C4C8C8C8C8C8C8C8C8C8C8C8C';

// 获取兑换路径
async function getSwapPath() {
    const router = new web3.eth.Contract(UNISWAP_V2_ROUTER_ABI, UNISWAP_V2_ROUTER);
    const path = [WETH, USDC];
    return path;
}
```

#### 2. Compound借贷体验
```javascript
// Compound协议交互
const COMPOUND_COMPTROLLER = '0x3d9819210A31b4961b30EF54bE2aeD79B9c9Cd3B';

// 获取借贷利率
async function getBorrowRate(asset) {
    const comptroller = new web3.eth.Contract(COMPTROLLER_ABI, COMPOUND_COMPTROLLER);
    const borrowRate = await comptroller.methods.getBorrowRate(asset).call();
    return borrowRate;
}
```

### 考核标准
- [ ] 能够解释DeFi的核心价值
- [ ] 熟练使用Uniswap进行代币交换
- [ ] 理解Compound借贷机制
- [ ] 分析DeFi协议TVL数据

---

## 第2周：智能合约基础

### 每日任务安排
```
周一：Solidity语法学习
周二：ERC20代币开发
周三：合约安全基础
周四：Gas优化技巧
周五：合约测试编写
周六：项目实战
周日：代码审查
```

### 实践任务详解

#### 1. ERC20代币合约
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    constructor(string memory name, string memory symbol) 
        ERC20(name, symbol) 
    {
        _mint(msg.sender, 1000000 * 10**decimals());
    }
    
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
```

#### 2. 合约安全练习
```solidity
// 安全的转账合约
contract SecureTransfer {
    mapping(address => uint256) public balances;
    
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }
    
    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        require(amount > 0, "Amount must be positive");
        
        balances[msg.sender] -= amount;
        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Transfer failed");
    }
}
```

### 考核标准
- [ ] 掌握Solidity基础语法
- [ ] 能够编写安全的ERC20代币
- [ ] 理解合约安全漏洞
- [ ] 掌握Gas优化技巧

---

## 第3周：AMM自动做市商

### 每日任务安排
```
周一：AMM原理学习
周二：恒定乘积公式实现
周三：Uniswap V2分析
周四：流动性管理
周五：无常损失计算
周六：AMM合约开发
周日：测试和优化
```

### 实践任务详解

#### 1. 简单AMM合约
```solidity
contract SimpleAMM {
    IERC20 public tokenA;
    IERC20 public tokenB;
    uint256 public reserveA;
    uint256 public reserveB;
    
    constructor(address _tokenA, address _tokenB) {
        tokenA = IERC20(_tokenA);
        tokenB = IERC20(_tokenB);
    }
    
    // 添加流动性
    function addLiquidity(uint256 amountA, uint256 amountB) public {
        tokenA.transferFrom(msg.sender, address(this), amountA);
        tokenB.transferFrom(msg.sender, address(this), amountB);
        
        reserveA += amountA;
        reserveB += amountB;
    }
    
    // 恒定乘积公式计算兑换数量
    function getAmountOut(uint256 amountIn, uint256 reserveIn, uint256 reserveOut) 
        public pure returns (uint256 amountOut) 
    {
        require(amountIn > 0, "INSUFFICIENT_INPUT_AMOUNT");
        require(reserveIn > 0 && reserveOut > 0, "INSUFFICIENT_LIQUIDITY");
        
        uint256 amountInWithFee = amountIn * 997; // 0.3% 手续费
        uint256 numerator = amountInWithFee * reserveOut;
        uint256 denominator = (reserveIn * 1000) + amountInWithFee;
        amountOut = numerator / denominator;
    }
    
    // 代币交换
    function swap(address tokenIn, uint256 amountIn) public {
        require(tokenIn == address(tokenA) || tokenIn == address(tokenB), "INVALID_TOKEN");
        
        bool isTokenA = tokenIn == address(tokenA);
        (IERC20 tokenInContract, IERC20 tokenOutContract, uint256 reserveIn, uint256 reserveOut) = 
            isTokenA ? (tokenA, tokenB, reserveA, reserveB) : (tokenB, tokenA, reserveB, reserveA);
        
        tokenInContract.transferFrom(msg.sender, address(this), amountIn);
        
        uint256 amountOut = getAmountOut(amountIn, reserveIn, reserveOut);
        require(amountOut > 0, "INSUFFICIENT_OUTPUT_AMOUNT");
        
        tokenOutContract.transfer(msg.sender, amountOut);
        
        // 更新储备量
        if (isTokenA) {
            reserveA += amountIn;
            reserveB -= amountOut;
        } else {
            reserveB += amountIn;
            reserveA -= amountOut;
        }
    }
}
```

#### 2. 无常损失计算
```javascript
// 计算无常损失
function calculateImpermanentLoss(priceRatio) {
    const sqrtPriceRatio = Math.sqrt(priceRatio);
    const impermanentLoss = (2 * sqrtPriceRatio) / (1 + priceRatio) - 1;
    return impermanentLoss * 100; // 返回百分比
}

// 示例：价格变化50%
const priceRatio = 1.5; // 价格上涨50%
const il = calculateImpermanentLoss(priceRatio);
console.log(`无常损失: ${il.toFixed(2)}%`);
```

### 考核标准
- [ ] 理解AMM核心机制
- [ ] 实现基础AMM合约
- [ ] 计算无常损失
- [ ] 分析流动性收益

---

## 第4周：借贷协议

### 每日任务安排
```
周一：借贷协议原理
周二：Compound协议分析
周三：利率模型设计
周四：清算机制实现
周五：风险控制机制
周六：借贷合约开发
周日：测试和优化
```

### 实践任务详解

#### 1. 简单借贷合约
```solidity
contract SimpleLending {
    mapping(address => uint256) public deposits;
    mapping(address => uint256) public borrows;
    mapping(address => uint256) public collateral;
    
    uint256 public totalDeposits;
    uint256 public totalBorrows;
    uint256 public utilizationRate;
    uint256 public borrowRate;
    
    // 存款
    function deposit() public payable {
        deposits[msg.sender] += msg.value;
        totalDeposits += msg.value;
        updateUtilizationRate();
    }
    
    // 借款
    function borrow(uint256 amount) public {
        require(collateral[msg.sender] >= amount * 2, "Insufficient collateral");
        require(totalDeposits >= totalBorrows + amount, "Insufficient liquidity");
        
        borrows[msg.sender] += amount;
        totalBorrows += amount;
        updateUtilizationRate();
        
        payable(msg.sender).transfer(amount);
    }
    
    // 更新利用率
    function updateUtilizationRate() public {
        if (totalDeposits > 0) {
            utilizationRate = (totalBorrows * 10000) / totalDeposits;
            // 简单利率模型：利用率越高，利率越高
            borrowRate = utilizationRate / 100; // 基础利率
        }
    }
    
    // 清算检查
    function checkLiquidation(address user) public view returns (bool) {
        uint256 collateralValue = collateral[user];
        uint256 borrowValue = borrows[user];
        return collateralValue < borrowValue * 2; // 抵押率低于200%
    }
    
    // 清算
    function liquidate(address user) public {
        require(checkLiquidation(user), "User not liquidatable");
        
        uint256 borrowAmount = borrows[user];
        uint256 collateralAmount = collateral[user];
        
        // 清算人获得抵押品
        collateral[user] = 0;
        borrows[user] = 0;
        
        payable(msg.sender).transfer(collateralAmount);
    }
}
```

#### 2. 利率模型
```solidity
contract InterestRateModel {
    uint256 public baseRate;
    uint256 public multiplier;
    uint256 public jumpMultiplier;
    uint256 public kink;
    
    constructor(
        uint256 _baseRate,
        uint256 _multiplier,
        uint256 _jumpMultiplier,
        uint256 _kink
    ) {
        baseRate = _baseRate;
        multiplier = _multiplier;
        jumpMultiplier = _jumpMultiplier;
        kink = _kink;
    }
    
    function getBorrowRate(uint256 cash, uint256 borrows, uint256 reserves) 
        public view returns (uint256) 
    {
        uint256 util = utilizationRate(cash, borrows, reserves);
        
        if (util <= kink) {
            return baseRate + (util * multiplier) / 1e18;
        } else {
            uint256 normalRate = baseRate + (kink * multiplier) / 1e18;
            uint256 excessUtil = util - kink;
            return normalRate + (excessUtil * jumpMultiplier) / 1e18;
        }
    }
    
    function utilizationRate(uint256 cash, uint256 borrows, uint256 reserves) 
        public pure returns (uint256) 
    {
        uint256 total = cash + borrows - reserves;
        if (total == 0) return 0;
        return (borrows * 1e18) / total;
    }
}
```

### 考核标准
- [ ] 理解借贷协议机制
- [ ] 实现基础借贷功能
- [ ] 设计利率模型
- [ ] 实现清算机制

---

## 第5周：流动性挖矿

### 每日任务安排
```
周一：流动性挖矿原理
周二：奖励代币设计
周三：质押机制实现
周四：收益计算优化
周五：挖矿合约开发
周六：前端界面开发
周日：测试和部署
```

### 实践任务详解

#### 1. 流动性挖矿合约
```solidity
contract LiquidityMining {
    IERC20 public rewardToken;
    IERC20 public lpToken;
    
    uint256 public rewardPerBlock;
    uint256 public startBlock;
    uint256 public endBlock;
    
    uint256 public totalStaked;
    uint256 public lastUpdateBlock;
    uint256 public rewardPerTokenStored;
    
    mapping(address => uint256) public userRewardPerTokenPaid;
    mapping(address => uint256) public rewards;
    mapping(address => uint256) public staked;
    
    constructor(
        address _rewardToken,
        address _lpToken,
        uint256 _rewardPerBlock,
        uint256 _startBlock,
        uint256 _duration
    ) {
        rewardToken = IERC20(_rewardToken);
        lpToken = IERC20(_lpToken);
        rewardPerBlock = _rewardPerBlock;
        startBlock = _startBlock;
        endBlock = _startBlock + _duration;
    }
    
    // 质押LP代币
    function stake(uint256 amount) public {
        require(amount > 0, "Cannot stake 0");
        require(block.number >= startBlock, "Mining not started");
        require(block.number <= endBlock, "Mining ended");
        
        updateReward(msg.sender);
        
        staked[msg.sender] += amount;
        totalStaked += amount;
        
        lpToken.transferFrom(msg.sender, address(this), amount);
    }
    
    // 解除质押
    function unstake(uint256 amount) public {
        require(amount > 0, "Cannot unstake 0");
        require(staked[msg.sender] >= amount, "Insufficient staked");
        
        updateReward(msg.sender);
        
        staked[msg.sender] -= amount;
        totalStaked -= amount;
        
        lpToken.transfer(msg.sender, amount);
    }
    
    // 领取奖励
    function claimReward() public {
        updateReward(msg.sender);
        
        uint256 reward = rewards[msg.sender];
        if (reward > 0) {
            rewards[msg.sender] = 0;
            rewardToken.transfer(msg.sender, reward);
        }
    }
    
    // 更新奖励
    function updateReward(address user) public {
        rewardPerTokenStored = rewardPerToken();
        lastUpdateBlock = block.number;
        
        if (user != address(0)) {
            rewards[user] = earned(user);
            userRewardPerTokenPaid[user] = rewardPerTokenStored;
        }
    }
    
    // 计算每代币奖励
    function rewardPerToken() public view returns (uint256) {
        if (totalStaked == 0) {
            return rewardPerTokenStored;
        }
        
        uint256 blocksSinceLastUpdate = block.number - lastUpdateBlock;
        uint256 reward = blocksSinceLastUpdate * rewardPerBlock;
        
        return rewardPerTokenStored + (reward * 1e18) / totalStaked;
    }
    
    // 计算用户收益
    function earned(address user) public view returns (uint256) {
        uint256 currentRewardPerToken = rewardPerToken();
        uint256 userRewardPerTokenPaid = userRewardPerTokenPaid[user];
        
        return (staked[user] * (currentRewardPerToken - userRewardPerTokenPaid)) / 1e18 + rewards[user];
    }
}
```

### 考核标准
- [ ] 理解挖矿机制
- [ ] 实现挖矿合约
- [ ] 优化收益分配
- [ ] 设计用户界面

---

## 🎯 学习建议

### 每日学习时间
- **理论学习**：2小时
- **代码实践**：3小时
- **项目开发**：1小时

### 学习方法
1. **先理解原理，再写代码**
2. **多看开源项目源码**
3. **多参与社区讨论**
4. **注重代码质量和安全**

### 成功标准
- 能够独立开发DeFi协议
- 理解DeFi核心机制
- 掌握智能合约安全
- 通过技术面试

---

**专注DeFi，成为DeFi协议开发专家！** 🚀