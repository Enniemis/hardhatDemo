pragma solidity ^0.8.9;

contract UpgradeableProxy {
    address private _implementation; //当前实现合约的地址
    address private _admin; //管理员地址

    constructor(address implementation_, address admin_) {
        _implementation = implementation_;
        _admin = admin_;
    }

    function implementation() public view returns (address) {
        return _implementation;
    }

    function admin() public view returns (address) {
        return _admin;
    }
    // 合约的地址升级为新的地址 管理员可以调
    function upgradeImplementation(address newImplementation) public {
        require(msg.sender == _admin, "Only the admin can upgrade the implementation");
        _implementation = newImplementation;
    }

    // 常量函数 
    function constantFunction() public pure returns (uint256) {
        return 42;
    }

    uint256 private _stateVariable; //私有状态变量
    // 函数读取其值
    function getStateVariable() public view returns (uint256) {
        return _stateVariable;
    }
    // 设置值，管理员可以调
    function setStateVariable(uint256 newValue) public {
        require(msg.sender == _admin, "Only the admin can set the state variable");
        _stateVariable = newValue;
    }
}
