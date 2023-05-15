// SPDX-License-Identifier: LGPL-3.0-or-later
pragma solidity ^0.7.6;
pragma abicoder v2;

import "../interfaces/IERC20.sol";
import "../libraries/OtterSafeERC20.sol";

contract OtterSafeERC20TestInterface {
    using OtterSafeERC20 for IERC20;

    function transfer(
        IERC20 token,
        address to,
        uint256 value
    ) public {
        token.safeTransfer(to, value);
    }

    function transferFrom(
        IERC20 token,
        address from,
        address to,
        uint256 value
    ) public {
        token.safeTransferFrom(from, to, value);
    }
}
