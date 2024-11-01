// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import "forge-std/Script.sol";
import {StakingPool} from "../src/contracts/StakingPool.sol";
import {ProxyAdmin} from "../lib/openzeppelin-contracts/contracts/proxy/transparent/ProxyAdmin.sol";
import {TransparentUpgradeableProxy} from "../lib/openzeppelin-contracts/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";

contract DeployStakingPoolProxyScript is Script {

    function run() external {
        vm.startBroadcast();

        // Deploy Implementation Contract
        StakingPool stakingpool = new StakingPool();

        // Deploy Proxy Admin
        ProxyAdmin proxyAdmin = new ProxyAdmin();

        // Deploy Proxy
        TransparentUpgradeableProxy stakingpoolProxy = new TransparentUpgradeableProxy(address(stakingpool), address(proxyAdmin), "");

        // Initialize the StakingPool contract
        StakingPool(address(stakingpoolProxy)).initialize();
        StakingPool(address(stakingpoolProxy)).initializePoolV2();

        vm.stopBroadcast();

        console.log("STAKINGPOOL IMPLEMENTATION DEPLOYED AT", address(stakingpool));
        console.log("PROXY ADMIN DEPLOYED AT", address(proxyAdmin));
        console.log("STAKINGPOOL PROXY DEPLOYED AT", address(stakingpoolProxy));
        console.log("STAKINGPOOL PROXY OWNER", StakingPool(address(stakingpoolProxy)).owner());
    }
}
