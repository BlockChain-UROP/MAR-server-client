contract ITokenLedger {
    function generateTokens(uint256 _amount) {}
}

contract TokenLedger {

  uint256 total_supply;
  mapping (address => uint256) balances;

  function generateTokens(uint256 _amount)
  {
    if(_amount == 0) throw;
    if (total_supply + _amount < _amount) throw;

    total_supply += _amount;
    balances[msg.sender] += _amount;
  }
}
