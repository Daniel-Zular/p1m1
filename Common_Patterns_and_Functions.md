
# Padrões Comuns e Funções em Solidity

Este documento visa fornecer uma visão geral dos padrões comuns e funções úteis em Solidity que você pode usar ao desenvolver contratos inteligentes.

## Padrões Comuns

### 1. Padrão Check-Effects-Interaction

Esse padrão é recomendado para mitigar os riscos de reentrância em funções que alteram o estado. A ideia é:

1. **Checar**: Verificar todas as condições.
2. **Efeitos**: Ajustar todos os estados.
3. **Interação**: Chamar funções externas (por exemplo, transferências de Ether).

### 2. Padrão de Bloqueio de Estado

Utilizado para evitar chamadas entre contratos que possam alterar o estado. Você pode 'travar' um contrato durante uma operação crítica para garantir que o estado não mude até que a operação esteja completa.

### 3. Padrão de Factory

Usado para criar novas instâncias de contratos a partir de um contrato existente. Isso pode ser útil para criar contratos com lógica semelhante, mas estados independentes.

## Funções Úteis

### 1. Transferências de Ether

Solidity oferece várias maneiras de transferir Ether entre endereços, como `.send()`, `.transfer()`, e `.call()`. É importante entender as diferenças entre elas, principalmente em termos de segurança.

### 2. Modificadores

Modificadores são uma maneira de reutilizar a lógica de validação antes de executar funções. Por exemplo, um modificador `onlyOwner` pode ser usado para restringir o acesso a certas funções apenas ao proprietário do contrato.

### 3. Eventos

Eventos permitem que você registre transações na blockchain, facilitando a indexação e a busca posterior. Eles são cruciais para interfaces de usuário que reagem a mudanças de contrato.

## Exemplo de Código

Aqui está um exemplo que utiliza o padrão Check-Effects-Interaction e um modificador:

```solidity
pragma solidity ^0.8.0;

contract SafeRemotePurchase {
    uint public value;
    address payable public seller;
    address payable public buyer;

    enum State { Created, Locked, Inactive }
    State public state;

    modifier condition(bool _condition) {
        require(_condition);
        _;
    }

    modifier onlyBuyer() {
        require(msg.sender == buyer, "Only buyer can call this.");
        _;
    }

    modifier onlySeller() {
        require(msg.sender == seller, "Only seller can call this.");
        _;
    }

    modifier inState(State _state) {
        require(state == _state, "Invalid state.");
        _;
    }

    // Ensure the `msg.value` is an even number.
    constructor() payable {
        seller = payable(msg.sender);
        value = msg.value / 2;
        require((2 * value) == msg.value, "Value has to be even.");
    }

    // Omitting further logic for brevity
}
```

**Nota**: Este exemplo é apenas para fins ilustrativos. Certifique-se de entender cada parte do código antes de usá-lo em produção.

