// SPDX-License-Identifier: LGPL-3.0-or-later
pragma solidity ^0.7.6;

/// @title Otter Allow List Storage Reader
/// @author Otter Developers
contract AllowListStorageReader {
    address private manager;
    mapping(address => bool) private solvers;

    function areSolvers(address[] calldata prospectiveSolvers)
        external
        view
        returns (bool)
    {
        for (uint256 i = 0; i < prospectiveSolvers.length; i++) {
            if (!solvers[prospectiveSolvers[i]]) {
                return false;
            }
        }
        return true;
    }
}
