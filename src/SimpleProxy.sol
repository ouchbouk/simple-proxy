// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;
import {Proxy} from "@openzeppelin/contracts/proxy/Proxy.sol";
contract SimpleProxy is Proxy {
    address public implementation;

    function setImplementation(address implementation_) public {
        implementation = implementation_;
    }

    function _implementation() internal view override returns (address) {
        return implementation;
    }

    receive() external payable {}
}
