// SPDX-License-Identifier: LGPL-3.0-or-later
pragma solidity ^0.7.6;
pragma abicoder v2;

import "../libraries/OtterInteraction.sol";

contract OtterInteractionTestInterface {
    // solhint-disable-next-line no-empty-blocks
    receive() external payable {}

    function executeTest(OtterInteraction.Data calldata interaction) external {
        OtterInteraction.execute(interaction);
    }

    function selectorTest(OtterInteraction.Data calldata interaction)
        external
        pure
        returns (bytes4)
    {
        return OtterInteraction.selector(interaction);
    }
}
