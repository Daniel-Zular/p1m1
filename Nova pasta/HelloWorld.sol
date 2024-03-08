
// Define a versão do compilador Solidity. Isto garante que o contrato não seja compilado
// com uma versão do compilador mais recente que pode introduzir alterações incompatíveis.
pragma solidity ^0.8.0;

// Declara um novo contrato chamado 'HelloWorld'
contract HelloWorld {
    // Declara uma variável de estado 'greeting' do tipo string. Variáveis de estado são armazenadas permanentemente no storage do contrato.
    string public greeting;

    // A função constructor é chamada uma vez quando o contrato é implantado. Ela inicializa a variável 'greeting'.
    constructor() {
        greeting = "Hello, World!";
    }

    // Função 'setGreeting' que permite modificar a variável 'greeting'.
    function setGreeting(string memory _greeting) public {
        greeting = _greeting;
    }

    // Função 'getGreeting' que retorna o valor atual da variável 'greeting'.
    function getGreeting() public view returns (string memory) {
        return greeting;
    }
}
