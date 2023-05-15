// SPDX-License-Identifier: LGPL-3.0-or-later
pragma solidity ^0.7.6;
pragma abicoder v2;

import "../OtterSettlement.sol";
import "../libraries/OtterInteraction.sol";
import "../libraries/OtterTrade.sol";
import "../libraries/OtterTransfer.sol";

contract OtterSettlementTestInterface is OtterSettlement {
    constructor(OtterAuthentication authenticator_, IVault vault)
        OtterSettlement(authenticator_, vault)
    // solhint-disable-next-line no-empty-blocks
    {

    }

    function setFilledAmount(bytes calldata orderUid, uint256 amount) external {
        filledAmount[orderUid] = amount;
    }

    function computeTradeExecutionsTest(
        IERC20[] calldata tokens,
        uint256[] calldata clearingPrices,
        OtterTrade.Data[] calldata trades
    )
        external
        returns (
            OtterTransfer.Data[] memory inTransfers,
            OtterTransfer.Data[] memory outTransfers
        )
    {
        (inTransfers, outTransfers) = computeTradeExecutions(
            tokens,
            clearingPrices,
            trades
        );
    }

    function computeTradeExecutionMemoryTest() external returns (uint256 mem) {
        RecoveredOrder memory recoveredOrder;
        OtterTransfer.Data memory inTransfer;
        OtterTransfer.Data memory outTransfer;

        // NOTE: Solidity stores the free memory pointer at address 0x40. Read
        // it before and after calling `processOrder` to ensure that there are
        // no memory allocations.
        // solhint-disable-next-line no-inline-assembly
        assembly {
            mem := mload(0x40)
        }

        // solhint-disable-next-line not-rely-on-time
        recoveredOrder.data.validTo = uint32(block.timestamp);
        computeTradeExecution(recoveredOrder, 1, 1, 0, inTransfer, outTransfer);

        // solhint-disable-next-line no-inline-assembly
        assembly {
            mem := sub(mload(0x40), mem)
        }
    }

    function executeInteractionsTest(
        OtterInteraction.Data[] calldata interactions
    ) external {
        executeInteractions(interactions);
    }

    function freeFilledAmountStorageTest(bytes[] calldata orderUids) external {
        this.freeFilledAmountStorage(orderUids);
    }

    function freePreSignatureStorageTest(bytes[] calldata orderUids) external {
        this.freePreSignatureStorage(orderUids);
    }
}
