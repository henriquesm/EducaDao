// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

error Numero2MaiorQueNumero1();
error OperacaoInvalida();

contract NovoContrato{


    constructor(){

    }

// Função publica
    function mudarOperacao(string memory _operacao, uint _numero1, uint _numero2) public pure returns(uint){
        
        if(!compararString(_operacao, "soma") && !compararString(_operacao, "subtracao")) revert OperacaoInvalida();

       if(compararString(_operacao, "soma")) return soma(_numero1, _numero2);
       if(compararString(_operacao, "subtracao")) return subtracao(_numero1, _numero2);

       return 0;
    }

// Funções privadas
    function compararString(string memory _a, string memory _b) private pure returns(bool){
        return keccak256(abi.encodePacked(_a)) == keccak256(abi.encodePacked(_b));
    }

    function soma(uint _numero1, uint _numero2) private pure returns(uint){
        return _numero1 + _numero2;
    }

    function subtracao(uint _numero1, uint _numero2) private pure returns(uint){
        if (_numero2 > _numero1) revert Numero2MaiorQueNumero1();
        return _numero1 - _numero2;
    }


}
