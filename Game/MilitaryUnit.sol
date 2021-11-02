pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import "Interface.sol";

contract MilitaryUnit is InterfaceGamingObject {
    uint private Health = 12;
    uint Power = 10;    
    address myaddress;
    
    
    constructor() public {
        // check that contract's public key is set
        require(tvm.pubkey() != 0, 101);
        // Check that message has signature (msg.pubkey() is not zero) and message is signed with the owner's private key
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
    }


    // Modifier that allows function to accept external call only if it was signed
    // with contract owner's public key.
    modifier checkOwnerAndAccept {
        // Check that inbound message was signed with owner's public key.
        // Runtime function that obtains sender's public key.
        require(msg.pubkey() == tvm.pubkey(), 100);

		// Runtime function that allows contract to process inbound messages spending
		// its own resources (it's necessary if contract should process all inbound messages,
		// not only those that carry value with them).
		tvm.accept();
		_;
	} 
    function getHealth() virtual public  view returns(uint){
        tvm.accept();
        return Health;
    }
        
    function getAttackPower() virtual public view returns(uint){
        tvm.accept();
        return Power;
    }
    
    function deleteUnit(address dest, uint128 value, bool bounce) public pure checkOwnerAndAccept {
         // Runtime function that allows to make a transfer with arbitrary settings.
        dest.transfer(1,true, 160);
    }    
    function acceptAttack(uint v) virtual external override{
        tvm.accept();
        Health-= uint(v);
        
    }
    function Attack(address foeaddress)  public {
        tvm.accept();
        InterfaceGamingObject foe = InterfaceGamingObject(foeaddress);
        foe.acceptAttack(Power);
    }
}