// SPDX-License-Identifier: LGPL-3.0-or-later
pragma solidity ^0.7.6;

import "../OtterAllowListAuthentication.sol";
import "../libraries/EIP1967.sol";

contract OtterAllowListAuthenticationTestInterface is
    OtterAllowListAuthentication
{
    constructor(address owner) {
        EIP1967.setAdmin(owner);
    }
}
