// SPDX-License-Identifier: LGPL-3.0-or-later
pragma solidity ^0.7.6;
pragma abicoder v2;

import "../libraries/OtterTransfer.sol";

contract OtterTransferTestInterface {
    function fastTransferFromAccountTest(
        IVault vault,
        OtterTransfer.Data calldata transfer,
        address recipient
    ) external {
        OtterTransfer.fastTransferFromAccount(vault, transfer, recipient);
    }

    function transferFromAccountsTest(
        IVault vault,
        OtterTransfer.Data[] calldata transfers,
        address recipient
    ) external {
        OtterTransfer.transferFromAccounts(vault, transfers, recipient);
    }

    function transferToAccountsTest(
        IVault vault,
        OtterTransfer.Data[] memory transfers
    ) external {
        OtterTransfer.transferToAccounts(vault, transfers);
    }

    // solhint-disable-next-line no-empty-blocks
    receive() external payable {}
}
