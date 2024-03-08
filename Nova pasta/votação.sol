// Especifica a versão do compilador. Isto é crucial para garantir que o contrato seja compilado com a versão correta que suporta os recursos usados.
pragma solidity ^0.8.0;

// Declaração do contrato chamado 'Voting'
contract Voting {
    // Variáveis de estado e tipos de dados
    struct Candidate {
        uint id; // ID único do candidato
        uint voteCount; // Total de votos recebidos
    }

    address public admin; // Endereço do administrador do contrato (quem o implantou)
    mapping(uint => Candidate) public candidates; // Mapeamento de ID do candidato para detalhes do candidato
    mapping(address => bool) public voters; // Registro de endereços que já votaram
    uint public candidatesCount; // Contador de candidatos

    // Eventos que serão emitidos em determinadas ações
    event ElectionUpdated(string action, uint candidateId);

    // Modificador para restringir certas funções ao administrador
    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can call this function.");
        _;
    }

    // Construtor para configurar o contrato inicialmente
    constructor() {
        admin = msg.sender; // Define o administrador do contrato
    }

    // Função para adicionar um novo candidato. Somente o admin pode adicionar candidatos.
    function addCandidate() public onlyAdmin {
        candidatesCount += 1; // Incrementa o contador de candidatos
        candidates[candidatesCount] = Candidate(candidatesCount, 0); // Adiciona o novo candidato
        emit ElectionUpdated("Candidate Added", candidatesCount); // Emite um evento
    }

    // Função que permite a um eleitor votar em um candidato.
    function vote(uint candidateId) public {
        require(!voters[msg.sender], "You have already voted."); // Verifica se o eleitor já votou
        require(candidateId > 0 && candidateId <= candidatesCount, "Invalid candidate ID."); // Verifica a validade do ID do candidato

        voters[msg.sender] = true; // Registra o endereço do eleitor para evitar múltiplos votos
        candidates[candidateId].voteCount += 1; // Incrementa o contador de votos do candidato
        emit ElectionUpdated("Vote Casted", candidateId); // Emite um evento
    }

    // Função para obter o número total de votos de um candidato.
    function getVoteCount(uint candidateId) public view returns (uint) {
        require(candidateId > 0 && candidateId <= candidatesCount, "Invalid candidate ID."); // Verifica a validade do ID do candidato
        return candidates[candidateId].voteCount; // Retorna o total de votos do candidato
    }
}
