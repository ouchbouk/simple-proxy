// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {SimpleProxy} from "../src/SimpleProxy.sol";
import {Implementation} from "../src/Implementation.sol";
contract SimpleProxyTest is Test {
    SimpleProxy sp;
    Implementation implementation;
    function setUp() public {
        sp = new SimpleProxy();
        implementation = new Implementation();
        sp.setImplementation(address(implementation));
    }

    function testAddressWasSet() public {
        assertEq(address(implementation), sp.implementation());
    }

    function testProxyAdd() public {
        (bool success, bytes memory data) = address(sp).call(
            abi.encodeWithSelector(Implementation.add.selector, 2, 2)
        );
        uint result = abi.decode(data, (uint));
        assertTrue(success);
        assertEq(4, result);
    }
}
