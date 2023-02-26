pragma solidity ^0.8.17;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";

// GET LISTED ON OPENSEA: https://testnets.opensea.io/get-listed/step-two

// Defining Library
library BodyLibrary {
    function GetTail(
        string memory color1,
        string memory color2,
        string memory color3
    ) public pure returns (string memory) {
        string memory tail = string(
            abi.encodePacked(
                "<path",
                '     class="cls-2"',
                '     style="fill:#',
                color1,
                '"',
                '     d="M619.94,780.71s12.83,18.49,16.88,19.78,8.64,3.19,14.52,1.62,9-8.46,9.15-12.54-68.36-143.87-68.81-148,3.06-23.23-.52-39.09-32.67-73.35-32.67-73.35l-31,38.68Z"',
                " />"
                "<path",
                '     class="cls-3"',
                '     style="fill:#',
                color3,
                '"',
                '     d="M477,629.75s34.39,69.37,52.46,85.69,30.9,19.23,30.9,19.23,31.78,60.35,56,70.15c3.87,1.57,9.93.55,12.82-.78,2.19-1,4.16-4.43,2.72-8.55C623.28,771,565.57,692.36,550.6,668.42c-17.49-28-52.65-90-52.65-90Z"',
                " />"
                "<path",
                '     class="cls-4"',
                '     style="fill:#',
                color2,
                '"',
                '     d="M506.69,590.31s47.8,105.31,74.61,142.23,31.09,40.8,35,43.52,4.66,4.66,11.27,3.89,9.71-3.89,9.71-7.78-61.4-124.35-69.56-139.51-34.2-71.89-34.2-71.89Z"',
                " />"
                '<g class="cls-5">',
                "    <path",
                '     class="cls-6"',
                '     d="M583.63,629.75A23.59,23.59,0,0,0,589,626.5a46.48,46.48,0,0,1,3.26,4.84c.6-8,1.1-19-1.12-28.83-3.58-15.86-32.67-73.35-32.67-73.35L477,629.75s32.08,64.71,50.56,83.83c12.4-13.51,26.53-34.77,27-45.36C576.64,663.56,584.22,635,583.63,629.75Z"',
                "     />",
                "</g>"
            )
        );
        return tail;
    }

    function GetFeet(
        string memory /*color*/
    ) public pure returns (string memory) {
        string memory feet = string(abi.encodePacked());
        return feet;
    }

    function GetBody(
        string memory, /* color0*/
        string memory, /* color1*/
        string memory, /* color2*/
        string memory, /* color3*/
        string memory color4
    ) public pure returns (string memory) {
        string memory body = string(abi.encodePacked(GetFeet(color4)));
        body = string(abi.encodePacked(body, ""));

        return body;
    }
}
