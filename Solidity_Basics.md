
# Fundamentos de Solidity

## O que é Solidity?

Solidity é uma linguagem de programação orientada a contratos, usada para desenvolver contratos inteligentes que funcionam na Ethereum Blockchain. Foi desenvolvida pelo Ethereum Project, e é a linguagem mais popular para escrever smart contracts.

## Por que usar Solidity?

- **Interoperabilidade**: Solidity permite que contratos interajam com outros contratos e endereços na rede Ethereum.
- **Segurança**: Proporciona um ambiente seguro para a execução de contratos, essencial para transações financeiras e outros casos de uso sensíveis.
- **Customizável**: Permite a criação de contratos personalizados para diversos fins.

## Ambiente de Desenvolvimento

Para começar a programar com Solidity, você precisará configurar um ambiente de desenvolvimento. Uma das maneiras mais fáceis de começar é usar o Remix IDE, uma IDE baseada em navegador para Solidity que não requer instalação.

- Acesse [Remix IDE](https://remix.ethereum.org/)
- Crie um novo arquivo e selecione Solidity como linguagem
- Comece a escrever seu contrato inteligente

## Estrutura Básica de um Contrato em Solidity

Um contrato em Solidity é semelhante a uma classe em outras linguagens de programação. Contém estados (variáveis) e funções que podem modificar esses estados. Abaixo está um exemplo simples de um contrato em Solidity:

```solidity
pragma solidity ^0.8.0;

contract SimpleStorage {
    uint storedData; // Variável de estado que armazena um número

    // Função para definir o valor de 'storedData'
    function set(uint x) public {
        storedData = x;
    }

    // Função para obter o valor atual de 'storedData'
    function get() public view returns (uint) {
        return storedData;
    }
}
```

**Nota**: `pragma solidity ^0.8.0;` especifica a versão do compilador Solidity que este contrato requer. `uint` é um tipo de dados que representa um número inteiro sem sinal. `public` torna a função acessível de fora do contrato.

## Compilando e Testando

Depois de escrever seu contrato, você pode compilá-lo e implantá-lo no Remix para testar seu funcionamento. A compilação é feita automaticamente ou você pode fazer manualmente clicando no botão de compilação. Para implantar, vá para a aba 'Deploy & Run Transactions' e clique em 'Deploy'.

## Próximos Passos

Depois de entender esses conceitos básicos, você está pronto para começar a explorar mais sobre Solidity e o desenvolvimento de contratos inteligentes. No próximo arquivo, abordaremos como escrever seu primeiro contrato inteligente.

