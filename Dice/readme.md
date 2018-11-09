# 可读取数据

* totalWeiWon
  
        赢取的总金额wei为单位

* totalWeiWagered
  
        累计下注金额wei为单位

* totalBets

        累计投注次数

* maxNumber
  
        最大下注点数
* minNumber
  
        最小下注点数

* minBet

        最小下注金额 wei，考虑到手续费，赢取比例和庄家初始资金而定 如 太小还不够Oraclize的手续费，太高庄家初始资金不够则玩家无法下注

* houseEdge
  
        庄家上风（抽水）
* houseEdgeDivisor
  
        庄家上风（抽水）除数

    `实际抽水结果是 （houseEdge/houseEdgeDivisor）`

* maxProfitAsPercentOfHouse
  
        最大获利占庄稼的百分比
* maxProfitDivisor
  
        最大获利的除数

    `实际可赢取数额占庄家余额的比例（maxProfitAsPercentOfHouse/maxProfitDivisor），防止一次偶然，榨干庄家`

* contractBalance
  
        合约余额

* maxPendingPayouts
  
        待支出金额，记录所有未开奖的奖励金额，由于交易都是异步的防止超支，同时callback也可能失败，这个数也作为退款保护条件使用

* maxProfit
  
        可分配利益，余额扣除待支出项目乘上最大获利占庄稼的百分比

* payoutsPaused
  
        暂停兑付（拒绝 开奖，提现）
* gamePaused
  
        游戏暂停（拒绝 下注）

* gasForOraclize
  
        Oraclize回调的gaslimit，低了会回调失败，高了会多花钱，因为是提前支付给Oraclize，想实报实销需走Oraclize线下支付

* playerGetPendingTxByAddress
  
        按地址查询用户是否有待提现金额（由于 随机失败、转账失败 引起的）

* treasury

        财务管理员地址
* owner
  
        超级管理员地址

# 用户操作接口
* playerRollDice
```
    权限限制：任意人

    转帐金额 表示下注金额 

    合约参数：rollUnder uint256 表示下注点数

    玩家下注
```
    

* playerWithdrawPendingTransactions
```
    权限限制：任意人

    合约参数：无

    玩家可通过这个接口取回自己的待提现金额（随机失败<外部原因>，转账失败<可能gas不足时>时产生）
```
    

# 管理员设置
* 直接转账
```
    权限限制：treasury

    转帐金额 全部进入庄家余额，并更新相关状态

    合约参数：无

    给庄家充余额
```

* ownerSetTreasury
```
    权限限制：owner

    合约参数：newTreasury address 新的财务管理员地址

    指定财务管理员
```

* ownerChangeOwner
```
    权限限制：owner

    合约参数：newOwner address 新的超级管理员地址

    转移owner权限
```

* ownerPausePayouts
```
    权限限制：owner

    合约参数：newPayoutStatus bool 新兑付状态

    启停兑付（是否拒绝 开奖，提现）
```

* ownerPauseGame
```
    权限限制：owner

    合约参数：newStatus bool 新游戏状态
    
    启停游戏（是否拒绝 下注）
```


* ownerSetMinBet
```
    权限限制：owner

    合约参数：newMinimumBet uint256 新的最小下注金额 单位 wei
    
    设置最小下注金额
```

* ownerSetHouseEdge
```
    权限限制：owner

    合约参数：newHouseEdge uint256 新的抽水比例

    设置抽水比例，参考读取数据部分的说明
    实际抽水结果是 （houseEdge/houseEdgeDivisor）
```


* ownerSetMaxProfitAsPercentOfHouse
```
    权限限制：owner

    合约参数：newMaxProfitAsPercent uint256 新的赢取比例

    设置单次赢取庄家余额的比例
    实际可赢取数额占庄家余额的比例（maxProfitAsPercentOfHouse/maxProfitDivisor），防止一次偶然，榨干庄家
```

* ownerUpdateContractBalance
```
    权限限制：owner

    合约参数：newContractBalanceInWei uint256 新的合约逻辑余额

    设置合约逻辑余额（逻辑上的余额，不知是为了修复BUG还是实现超卖而留，若超卖容易落下口实）
```

* ownerTransferEther
```
    权限限制：owner

    合约参数：
            sendTo address 收款地址
            amount uint 转账金额 wei为单位

    将合约余额（庄上的钱）转指定的金额给指定的地址
```

* ownerRefundPlayer
```
    权限限制：owner
    合约参数：
            originalPlayerBetId bytes32 投注id
            sendTo address 收款地址
            originalPlayerProfit uint256 原始收益
            originalPlayerBetValue uint256 原始下注金额

    退款，发生在callback未发生时，应由客服检查event log后操作，若callback发生过，只是结算失败，需让用户通过playerWithdrawPendingTransactions提现
```


* ownerSetOraclizeSafeGas
```
    权限限制：owner

    合约参数：newSafeGasToOraclize 新的 gaslimit

    设置Oraclize回调的gaslimit
```

* ownerSetCallbackGasPrice
```
    权限限制：owner

    合约参数：newCallbackGasPrice 新的 gasPrice

    设置Oraclize回调的gasprice
```

* __callback（有两个，含义是一样的，是Oraclize库导出的，分别对应带证明和不带证明的版本）
```
    权限限制：Oraclize

    合约参数：文档忽略，只有Oraclize能回调

    随机源回调，用于开奖
```

* ownerkill
```
    权限限制：owner

    合约参数：无
    
    销毁合约，余额转给owner
```


