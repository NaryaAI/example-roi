// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "src/ROIToken.sol";
import "@pwnednomore/contracts/templates/UnprotectedOwnership.sol";

contract ROITokenTest is UnprotectedOwnershipTest {
    address OWNER = makeAddr("OWNER");
    ROIToken roi;

    function deploy() public override {
        vm.createSelectFork("https://rpc.ankr.com/bsc");

        vm.prank(OWNER);
        roi = new ROIToken();
    }

    function getOwner() public override returns (address) {
        return roi.owner();
    }
}
