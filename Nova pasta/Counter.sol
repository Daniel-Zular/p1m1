
pragma solidity ^0.8.0;

contract Counter {
    uint public count; // Uma variável de estado para armazenar o contador

    // Função para incrementar o contador
    function increment() public {
        count += 1;
    }

    // Função para decrementar o contador
    function decrement() public {
        require(count > 0, "Counter: decrement overflow"); // Garante que o contador não fique negativo
        count -= 1;
    }
}
