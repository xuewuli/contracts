## 说明
https://fomosports.me/nba-18-19

* 合约拆解，便于编辑

* 去除代码中常量指定的多个dev地址，改用Ownable
* *将常量指定的PlayerBook关联改为构造指定
* 将常量指定的收取分成地址改为owner可指定
* 实现简单的TinyBanker，作为不可见的收取分成的合约的替代品

## 使用

### 安装依赖
    npm install 
### 合并代码，合并代码为3个需要部署的合约，可以用remix部署，输出目录为flattener
    npm run flat

### 编译（是truffle的默认行为，没有处理后续部署、升迁）
    npm run compile

### 测试网部署

    TinyBanker
    https://ropsten.etherscan.io/address/0xe5391219df18c8fc72b35c68fe16ca4ee228a9e1#code

    PlayerBook
    https://ropsten.etherscan.io/address/0x3714accb0cd513c85962936eaeac18f4213978d5#code

    Sport
    https://ropsten.etherscan.io/address/0xd952f8f8a758c85c6adea5d487c9aaf35de847c3#code