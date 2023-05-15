// SPDX-License-Identifier: LGPL-3.0-or-later
pragma solidity ^0.7.6;

import "../OtterAllowListAuthentication.sol";

contract OtterAllowListAuthenticationV2 is OtterAllowListAuthentication {
    function newMethod() external pure returns (uint256) {
        return 1337;
    }
}
