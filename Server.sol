pragma solidity ^0.4.21;

contract Server {
    uint public value = 0;
    
    function increment() public {
        value = value + 1;
    }
    
    function incrementReturn() public returns (bool) {
        value = value + 1;
        // Response call: uint receiver
        return msg.sender.call.gas(20000000)(bytes4(keccak256("receiveUint(uint256)")),value);
    }
    
    // function incrementReturnAddr(address _target) public returns (bool) {
    //     value = value + 1;
    //     // Response call: uint receiver
    //     return _target.call.gas(20000000)(bytes4(keccak256("receiveUint(uint256)")),value);
    // }
    
    function getValue() public constant returns (uint) {
        return value;
    }
}