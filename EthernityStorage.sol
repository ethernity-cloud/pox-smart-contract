pragma solidity ^0.5.17;

/**
 * Copyright (C) 2018, 2019, 2020 Ethernity HODL UG
 *
 * This file is part of ETHERNITY PoX SC.
 *
 * ETHERNITY PoE SC is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

import "./Models.sol";
import "./StandardToken.sol";

contract EthernityStorage is StandardToken {

    constructor() public{
        name = "Ethernity Token";
        symbol = "ETNY";
        decimals = 18;

        _totalSupply = 1000000000 * 10 ** uint(decimals);
        balances[owner] = _totalSupply;
        emit Transfer(address(0), owner, _totalSupply);
    }

    modifier onlyOwner() {
        require(
            msg.sender == owner,
            "Only owner can call this function."
        );
        _;
    }

    address public implementation;
    address public implementationPro;

    address[] internal versions;
    address[] internal versionsPro;
    mapping(address => bool) usersPro;

    uint128 internal baseLockDate = 1688169599; // Fri Jun 30 2023 23:59:59 GMT+0000
    uint128 constant internal twoYears = 63072000;
    uint128 constant internal oneYear = 31536000;
    uint128 constant internal sixMonths = 15780000;

    mapping(address => uint128) lockTime;

    mapping(address => uint256) attestation;
    mapping(address => uint256) aggregation;
    mapping(address => uint256) proposal;

    uint16 constant internal HOURS_IN_SECONDS = 3600;
    uint8 constant internal MAX_CPU = 255;
    uint8 constant internal MAX_MEMORY = 255;
    uint8 constant internal MAX_STORAGE = 255;
    uint8 constant internal MAX_BANDWIDTH = 255;
    uint8 constant internal MAX_INSTANCES = 10;

    Models.DORequest[] internal doRequestsList;
    Models.DPRequest[] internal dpRequestsList;
    Models.Order[] internal orders;

    mapping(address => uint256[]) usersDORequests;
    mapping(address => uint256[]) usersDPRequests;
    mapping(address => uint256[]) usersOrders;
}
