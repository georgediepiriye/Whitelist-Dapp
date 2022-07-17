//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Whitelist {
    // Max number of whitelisted addresses allowed
    uint8 public maxWhitelistedAddresses;

    // numAddressesWhitelisted would be used to keep track of how many addresses have been whitelisted
    uint8 public numAddressesWhitelisted;

    //create a mapping of whitelistedAddress
    //if the address is whitelistd we set it to true if not then false
    mapping(address => bool) whitelistedAddresses;

    // Setting the Max number of whitelisted addresses
    // User will put the value at the time of deployment
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    //add address to whitelist
    function addAddressToWhitelist() public {
        //check if the user has already been whitelisted
        require(
            !whitelistedAddresses[msg.sender],
            "Sender already whitelisted"
        );
        //check if number of whitelisted addresses is less than the inputed maximum number
        require(
            numAddressesWhitelisted < maxWhitelistedAddresses,
            "More addresses cant be added"
        );

        //set the address that called the function to be whitelisted
        whitelistedAddresses[msg.sender] = true;

        //increase the number of whitelisted addresses by 1
        numAddressesWhitelisted += 1;
    }
}
