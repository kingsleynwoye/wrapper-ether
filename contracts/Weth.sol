pragma solidity ^0.7.3;

import "@openzeppelin/contracts/token/ERC20/IER20.sol"; // Interface for openzepelin

contract Weth is ERC20 {
    constructor() ERC20('Wrapper Ether', 'WETH') {}

    function desposit() external payable {
        _mint(msg.sender, msg.value);
    }

    function withdraw(uint amount) external {
        require(balanceOf(msg.sender) >= amount, 'balance too low');
        _burn(msg.sender, amount);
        msg.sender.transfer(amount)
    }
}