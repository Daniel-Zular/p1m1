// Indica a versão do compilador Solidity. Isso é importante para garantir que o contrato funcione como esperado.
pragma solidity ^0.8.0;

// Declaração do contrato chamado 'SafeRemotePurchase'
contract SafeRemotePurchase {
    // Variáveis de estado
    uint public value; // Armazena o valor da transação
    address payable public seller; // Endereço do vendedor
    address payable public buyer; // Endereço do comprador
    enum State { Created, Locked, Release, Inactive } // Enumeração para o estado do contrato
    State public state; // Variável de estado atual

    // Garante que a função só pode ser chamada em um determinado estado
    modifier inState(State state_) {
        require(state == state_, "Invalid state.");
        _;
    }

    // Eventos para registrar as ações no blockchain
    event Aborted(); // Evento para quando a venda é abortada
    event PurchaseConfirmed(); // Evento para quando a compra é confirmada
    event ItemReceived(); // Evento para quando o item é recebido
    event SellerRefunded(); // Evento para quando o vendedor é reembolsado

    // Função construtora que é chamada na criação do contrato
    // 'payable' permite que a função receba Ether
    constructor() payable {
        seller = payable(msg.sender); // Define o vendedor como a pessoa que implantou o contrato
        value = msg.value / 2; // Define o valor como metade do Ether enviado
        require((2 * value) == msg.value, "Value has to be even."); // Garante que o valor enviado é par
    }

    // Permite ao vendedor abortar a venda e recuperar o Ether antes que a compra seja confirmada
    function abort() public inState(State.Created) {
        emit Aborted(); // Emite o evento Aborted
        state = State.Inactive; // Muda o estado para Inativo
        seller.transfer(address(this).balance); // Transfere todo o Ether do contrato para o vendedor
    }

    // Confirma a compra como comprador
    // 'payable' permite que a função receba Ether
    function confirmPurchase() public inState(State.Created) payable {
        require(msg.value == (2 * value), "Incorrect value."); // Garante que o comprador enviou o Ether correto
        emit PurchaseConfirmed(); // Emite o evento PurchaseConfirmed
        buyer = payable(msg.sender); // Define o comprador como a pessoa que chamou a função
        state = State.Locked; // Muda o estado para Bloqueado
    }

    // Confirma que o comprador recebeu o item e permite que o vendedor seja pago
    function confirmReceived() public inState(State.Locked) {
        emit ItemReceived(); // Emite o evento ItemReceived
        state = State.Release; // Muda o estado para Liberado

        buyer.transfer(value); // Envia metade do Ether para o comprador
    }

    // Permite ao vendedor retirar o Ether restante após a confirmação do comprador
    function refundSeller() public inState(State.Release) {
        emit SellerRefunded(); // Emite o evento SellerRefunded
        state = State.Inactive; // Muda o estado para Inativo

        seller.transfer(3 * value); // Vendedor retira o Ether restante
    }
}
