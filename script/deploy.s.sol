// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/TokeH.sol";

contract Deploy is Script {
    //function setUp() public {}

    function run() public {
        //uint256 deployerKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast();
        new Civecoin();
        vm.stopBroadcast();
    }
}