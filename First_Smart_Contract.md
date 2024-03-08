
# Escrevendo seu Primeiro Contrato Inteligente em Solidity

Este guia passo a passo ajudará você a escrever seu primeiro contrato inteligente em Solidity. Vamos criar um contrato simples que permite armazenar e recuperar um valor.

## Passo 1: Configurar o Ambiente

Se ainda não configurou seu ambiente de desenvolvimento, volte ao arquivo 'Solidity_Basics.md' e siga as instruções. Estaremos usando o Remix IDE para este exemplo.

## Passo 2: Escrever o Contrato

Crie um novo arquivo no Remix e nomeie-o como `SimpleStorage.sol`. Copie e cole o seguinte código Solidity nele:

```solidity
pragma solidity ^0.8.0;

contract SimpleStorage {
    uint storedData; // Variável de estado para armazenar um número

    // Função para definir o valor de 'storedData'
    function set(uint x) public {
        storedData = x;
    }

    // Função para recuperar o valor de 'storedData'
    function get() public view returns (uint) {
        return storedData;
    }
}
```

## Passo 3: Compilar o Contrato

No Remix, clique em 'Solidity Compiler' na barra lateral esquerda e depois no botão 'Compile SimpleStorage.sol'. Certifique-se de que não há erros de compilação.

## Passo 4: Testar o Contrato

Depois de compilar, vá para a aba 'Deploy & Run Transactions'. Escolha o ambiente que deseja usar (JavaScript VM, Injected Web3, ou Web3 Provider) e clique em 'Deploy' para implantar seu contrato.

Uma vez implantado, você verá seu contrato em 'Deployed Contracts'. Aqui você pode interagir com seu contrato usando as funções 'set' e 'get'. Tente definir um número usando 'set' e depois recuperá-lo com 'get'.

## Conclusão

Parabéns! Você acabou de escrever e testar seu primeiro contrato inteligente em Solidity. Agora você pode começar a explorar mais funcionalidades e casos de uso de contratos inteligentes.

