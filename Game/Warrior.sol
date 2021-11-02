
pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import "MilitaryUnit.sol";

contract Warrior is MilitaryUnit{ 
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
//0:25d27bd871bd129fba0ecb9b1126e692c9450bdd241545eb8f90332767f2b940 