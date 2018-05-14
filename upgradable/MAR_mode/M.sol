pragma solidity ^0.4.21;

// @title MAR mode: Module-Agnostic Rendering Mode (Module)
// @author Jeff Hu
// @dev This smart contract is an atomic callable stub
contract M {
    bool public value = false;
    
    function setTrue() public {
        value = true;
    }
    
    function setFalse() public {
        value = false;
    }
}