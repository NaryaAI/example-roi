// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "src/ROIToken.sol";
import "@pwnednomore/contracts/invariants/UnprotectedOwnershipTest.sol";

contract ROITokenTest is UnprotectedOwnershipTest {
    ROIToken roi;

    function deploy() public override {
        vm.createSelectFork("https://rpc.ankr.com/bsc");

        address owner = makeAddr("OWNER");
        vm.prank(owner);
        roi = new ROIToken();
    }

    function init() public override {
        initOwner();
    }

    function getOwner() public view override returns (address) {
        return roi.owner();
    }
}
