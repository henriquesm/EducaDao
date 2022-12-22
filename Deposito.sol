// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";

error ValorAbaixoDoPedido();
error SaldoZerado();

contract Deposito is Ownable{
    uint256 private decimal = 10 ** 18;
    uint256 public valor = 1;

    function receber() public payable {
        if ( msg.value < (1 * decimal) ) revert ValorAbaixoDoPedido();

    }

    function saldo() public view returns(uint256){
        return address(this).balance;
    }

    function retirada() public onlyOwner{
        if (saldo() == 0) revert SaldoZerado();

        payable(msg.sender).transfer(saldo());

    }
}

