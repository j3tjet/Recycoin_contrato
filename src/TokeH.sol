// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20Burnable} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import {ERC20Permit} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
import {AccessControl} from "@openzeppelin/contracts/access/AccessControl.sol";

contract Civecoin is ERC20, ERC20Burnable, ERC20Permit, AccessControl {

    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    bytes32 public constant BURNER_ROLE = keccak256("BURNER_ROLE");

    constructor() ERC20("Civecoin", "CVC") ERC20Permit("Civecoin") {

        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }

    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        _mint(to, amount);
    }

    function burnFrom(address account, uint256 amount) public override onlyRole(BURNER_ROLE) 
    {
        _burn(account, amount);
    }

    function registrarMinter(address cuenta) public onlyRole(DEFAULT_ADMIN_ROLE) {
        _grantRole(MINTER_ROLE, cuenta);
    }

    function registrarBurner(address cuenta) public onlyRole(DEFAULT_ADMIN_ROLE) {
        _grantRole(BURNER_ROLE, cuenta);
    }

    function revocarMinter(address cuenta) public onlyRole(DEFAULT_ADMIN_ROLE) {
        _revokeRole(MINTER_ROLE, cuenta);
    }

    function revocarBurner(address cuenta) public onlyRole(DEFAULT_ADMIN_ROLE) {
        _revokeRole(BURNER_ROLE, cuenta);
    }
}
