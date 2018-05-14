pragma solidity ^0.4.21;

contract Client {
    address public S_addr;       // The deployed address of the server S
    string public S_func;   // The target function signature of server S
    bool public success = false; 
    
    
    // Address Storage (stores server addresses)
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
    function renderServerData(string _addrByte, string _funcByte) public {
        success = false;
        S_addr = getAddressValue(_addrByte);
        S_func = getStringValue(_funcByte);
    }
    
    
    // Execute the target modules's function
    function exec() public returns (bool) {
        if(S_addr.call(bytes4(keccak256(S_func))) == true)
            success = true;
        else success = false;
        
        return success;
    }
    
    function exec_1(uint _value) public returns (bool) {
        return S_addr.call(bytes4(keccak256(S_func)), _value);
    }
    
    
    
    // Receiver
    uint received_uint = 0;
    
    function receiveUint(uint256 _value) public {
        received_uint = _value;
    }
    
    function getReceivedUint() public view returns (uint) {
        return received_uint;
    }
}
