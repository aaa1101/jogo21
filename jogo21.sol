pragma solidity ^0.4.17;

contract Jogo21{
    
    struct Jogador{
        bool jogoAtivo;
        uint maoJogador;
        uint valorAposta; 
    }
    
    mapping(address => Jogador) jogadores;
    
    function Jogo21() public payable{
        require(msg.value == 10 ether);
    }
    
    modifier restrincaoJogo{
        require(jogadores[msg.sender].jogoAtivo);
        _;
    }
    
    
    function IniciarPartida() public payable{
        require(!jogadores[msg.sender].jogoAtivo);
        require(msg.value <= .001 ether);
        require(msg.value >= 100 wei);
     
        var jogos = jogadores[msg.sender];
        jogos.jogoAtivo = true;
        jogos.maoJogador = GerarCarta() + GerarCarta();
        jogos.valorAposta = msg.value;
    }
    
    
    //function ListarJogadores(address ins) view public returns (bool, uint, uint) {
        //return (jogadores[ins].jogoAtivo, jogadores[ins].maoJogador, jogadores[ins].valorAposta);
    //}
    
    //function VerificarBalanca() public view returns(uint){
        //return this.balance;
    //}
    
    
    function OlharMao() restrincaoJogo public view returns(uint){
        return jogadores[msg.sender].maoJogador;
    }
    
    
    function GerarCarta() private view returns(uint carta){
        carta = uint(keccak256(now, jogadores[msg.sender].maoJogador, jogadores[msg.sender].valorAposta));
        
        carta %= 14;
        if(carta == 0) carta = 1;
        if(carta > 13) carta = GerarCarta();
        if(carta >= 11 && carta <= 13) carta = 10; //considerando J, Q, K
    }
    
    
    function PedirCarta() restrincaoJogo public{
        jogadores[msg.sender].maoJogador += GerarCarta();
    }
    
    
    function FinalizarPartida() restrincaoJogo public{
       var jogo = jogadores[msg.sender];
       
       if(jogo.maoJogador <= 5) {msg.sender.transfer(jogo.valorAposta/4);}
       if(jogo.maoJogador > 5 && jogo.maoJogador <= 10) {msg.sender.transfer(jogo.valorAposta/2);}
       if(jogo.maoJogador > 10 && jogo.maoJogador <= 15) {msg.sender.transfer(jogo.valorAposta);}
       if(jogo.maoJogador > 15 && jogo.maoJogador <= 20) {msg.sender.transfer(jogo.valorAposta + (jogo.valorAposta/2));}
       if(jogo.maoJogador == 21) {msg.sender.transfer(jogo.valorAposta*2);}
       
       jogo.jogoAtivo = false;
       jogo.maoJogador = 0;
       jogo.valorAposta = 0;
   }
   
}