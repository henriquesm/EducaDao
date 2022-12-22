// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

error Numero2MaiorQueNumero1();
error OperacaoInvalida();

contract NovoContrato{
    uint public numero1;
    uint public numero2;

    string public operacao;

    constructor(){
        numero1 = 0;
        numero2 = 0;
        operacao = "soma";
    }


// Função publica
    function mudarOperacao(string memory _operacao, uint _numero1, uint _numero2) public{
        
        if(!compararString(_operacao, "soma") && !compararString(_operacao, "subtracao")) revert OperacaoInvalida();
        // if((_operacao != "soma") && (_operacao != "subtracao")) revert OperacaoInvalida();

        operacao = _operacao;
        numero1 = _numero1;
        numero2 = _numero2;
    }

   function operar() public view returns(uint) {
       if(compararString(operacao, "soma")) return soma();
       if(compararString(operacao, "subtracao")) return subtracao();

       return 0;
   }


// Funções privadas
    function compararString(string memory _a, string memory _b) private pure returns(bool){
        return keccak256(abi.encodePacked(_a)) == keccak256(abi.encodePacked(_b));
    }

    function soma() private view returns(uint){
        return numero1 + numero2;
    }

    function subtracao() private view returns(uint){
        if (numero2 > numero1) revert Numero2MaiorQueNumero1();
        return numero1 - numero2;
    }


}
