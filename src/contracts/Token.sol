// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is  ERC20 {
  address public minter;

  //add minter changed event
  event MinterChanged(address indexed from , address to);

  constructor() public payable ERC20("DesiDeFi", "DSDF") {
    minter =  msg.sender;
  }

  //Add pass minter role function

    function passMinterRole(address dbank) public returns (bool){
    require(msg.sender==minter, 'Msg sender does not have minter role.' );
    minter = dbank;
		emit MinterChanged(msg.sender, dbank);
    return true;
	}

  function mint(address account, uint256 amount) public {
    //check if msg.sender have minter role
    require(msg.sender==minter, 'Msg sender does not have minter role.' );
		_mint(account, amount);
	}
}