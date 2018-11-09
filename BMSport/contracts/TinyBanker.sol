pragma solidity ^0.4.25;

import "./lib/Ownable.sol";
import "./lib/SafeMath.sol";

// 这是个简化版的Banker，只是为了对接接口，正式使用待议

contract TinyBanker is Ownable {
    using SafeMath for uint256;

    event RefundValue(address, uint256 value);
    event DepositValue(address investor, uint256 value);

    address public wallet;

    constructor(address _wallet)
        public
    {
        require(_wallet != address(0));
        wallet = _wallet;
    }

    mapping (address => uint256) public deposited;

    function deposit(address investor) public payable {
        emit DepositValue(investor, msg.value);
    }

    function setWallet(address _wallet) onlyOwner public  {
        require(_wallet != address(0));
        wallet = _wallet;
    }

    function withDraw(address investor) onlyOwner public {
        wallet.transfer(address(this).balance);
        emit RefundValue(wallet, address(this).balance);
    }
}
