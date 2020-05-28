pragma solidity ^0.4.18;

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

import "./Owned.sol";

contract Delegated is Owned{
    address public caller;

    event ProxyTransferred(address indexed _from, address indexed _to);

    function Delegated() public {
        caller = msg.sender;
    }

    modifier onlyDelegate {
        require(msg.sender == caller);
        _;
    }

    function transferProxy(address _newProxy) public onlyOwner {
        caller = _newProxy;
    }
}
