
pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import "MilitaryUnit.sol";

contract Archer is MilitaryUnit{ 
    uint private Health = 3;
    
    
    function getHealth() public override view returns(uint) {   
         tvm.accept();     
         return Health;
    }   
    
    function getAttackPower() public override view returns(uint){
        tvm.accept();
        return Power;
    }
}