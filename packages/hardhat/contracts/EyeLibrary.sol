pragma solidity ^0.8.17;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";

// GET LISTED ON OPENSEA: https://testnets.opensea.io/get-listed/step-two

// Defining Library
library EyeLibrary {
    function GetEye(uint256 index) public pure returns (string memory) {
        string memory eye;

        if (index == 0) {
            eye = string(
                abi.encodePacked(
                    "<defs>",
                    "    <style>",
                    "        .cls-eye-1 {",
                    "            fill: #fff;",
                    "        }",
                    "    </style>",
                    "</defs>",
                    "<path",
                    '    class="cls-eye-1"',
                    '    d="M353.2,223.34a16.81,16.81,0,0,1-13.51-6.84l-.79-1.08.62-1.25c.29-.56.68-1.33,12.43-9.82s12.21-8.52,13-8.52h.61l.89.54.25.34a16.75,16.75,0,0,1-3.61,23.39A16.58,16.58,0,0,1,353.2,223.34Z"',
                    "/>",
                    "<path",
                    '    d="M364.94,198h0a14.57,14.57,0,1,1-23.5,17.23c-.41-.56,22.91-17.23,23.5-17.23m0-4.33h0c-1.61,0-1.9,0-14.25,8.93-12.17,8.8-12.56,9.55-13.09,10.6a4.36,4.36,0,0,0,.33,4.56,19,19,0,0,0,15.28,7.76,18.9,18.9,0,0,0,15.23-30.08l-.5-.68-.72-.45-1-.64Z"',
                    "/>",
                    '<circle cx="351.35" cy="211.58" r="6.06" />'
                )
            );
        } else if (index == 1) {
            eye = string(abi.encodePacked());
        } else if (index == 2) {
            eye = string(abi.encodePacked());
        } else if (index == 3) {
            eye = string(abi.encodePacked());
        } else if (index == 4) {
            eye = string(abi.encodePacked());
        }
        return eye;
    }
}
