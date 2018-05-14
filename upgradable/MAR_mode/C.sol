pragma solidity ^0.4.21;

// @title MAR mode: Module-Agnostic Rendering Mode (Core)
// @author Jeff Hu
// @dev This smart contract is modularized via a module agnostic execution scheme
contract C {
    
    address public M_addr;       // The deployed address of the module M
    string public M_func;   // The target function signature of module M
    bool public success = false; 
    
    
    // Address Storage (stores module addresses)
    mapping(string => address) AddressStorage;

    function getAddressValue(string record) constant public returns (address) { 
        return AddressStorage[record];
    }

    function setAddressValue(string record, address value) public {
        AddressStorage[record] = value;
    }
    
    
    // String Storage (stores function signatures)
    mapping(string => string) StringStorage;

    function getStringValue(string record) constant public returns (string) {
        return StringStorage[record];
    }

    function setStringValue(string record, string value) public {
        StringStorage[record] = value;
    }
    
    
    // Render target that is to-be-called
    function renderModule(string _addrByte, string _funcByte) public {
        success = false;
        M_addr = getAddressValue(_addrByte);
        M_func = getStringValue(_funcByte);
    }
    
    
    // Execute the target modules's function
    function exec() public returns (bool) {
        if(M_addr.call(bytes4(keccak256(M_func))) == true)
            success = true;
        else success = false;
        
        return success;
    }
}
