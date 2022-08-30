pragma solidity ^0.8.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";

// GET LISTED ON OPENSEA: https://testnets.opensea.io/get-listed/step-two

// Defining Library
library Style {
    function GetStyle() public pure returns (string memory) {
        string memory style = string(
            abi.encodePacked(
                "<defs>",
                "   <style>",
                "       .cls-1 {",
                "           isolation: isolate;",
                "       }",
                "       .cls-2,",
                "       .cls-3,",
                "       .cls-4,",
                "       .cls-8,",
                "       .cls-9 {",
                "           stroke: #000;",
                "           stroke-miterlimit: 10;",
                "       }",
                "       .cls-2,",
                "       .cls-3,",
                "       .cls-4,",
                "       .cls-8,",
                "       .cls-9 {",
                "           stroke-width: 4.33px;",
                "       }",
                "       .cls-10,",
                "       .cls-11,",
                "       .cls-5 {",
                "           mix-blend-mode: multiply;",
                "       }",
                "       .cls-5 {",
                "           opacity: 0.31;",
                "       }",
                "       .cls-6 {",
                "           fill: #979797;",
                "       }",
                "       .cls-10 {",
                "           opacity: 0.25;",
                "       }",
                "       .cls-11 {",
                "           opacity: 0.27;",
                "       }",
                "   </style>",
                "   <radialGradient",
                '       id="radial-gradient-0"',
                '       cx="868.1"',
                '       cy="-2326.18"',
                '       r="559.49"',
                '       gradientTransform="matrix(0.94, 0, 0, -0.95, -373.49, -1767.37)"',
                '       gradientUnits="userSpaceOnUse"',
                "   >",
                '       <stop offset="0" stop-color="#c8a5db" />',
                '       <stop offset="1" stop-color="#412951" />',
                "   </radialGradient>",
                "   <radialGradient",
                '       id="radial-gradient-1"',
                '       cx="441.55"',
                '       cy="-1967.44"',
                '       r="443.02"',
                '       gradientTransform="matrix(1, 0, 0, -1, 0, -1522.96)"',
                '       gradientUnits="userSpaceOnUse"',
                "   >",
                '       <stop offset="0.23" stop-color="#ff4803" />',
                '       <stop offset="1" stop-color="#ffb93b" />',
                "   </radialGradient>",
                "   <radialGradient",
                '       id="radial-gradient-2"',
                '       cx="441.55"',
                '       cy="-1967.44"',
                '       r="443.02"',
                '       gradientTransform="matrix(1, 0, 0, -1, 0, -1522.96)"',
                '       gradientUnits="userSpaceOnUse"',
                "   >",
                '       <stop offset="0.3" stop-color="#c8a5db" />',
                '       <stop offset="1" stop-color="#c5f9d0" />',
                "   </radialGradient>",
                "   <radialGradient",
                '       id="radial-gradient-3"',
                '       cx="784.61"',
                '       cy="-4296.57"',
                '       r="559.49"',
                '       gradientTransform="matrix(0.95, 0, 0, -0.95, -317.64, -3652.7)"',
                '       gradientUnits="userSpaceOnUse"',
                "   >",
                '       <stop offset="0" stop-color="#9cff55" />',
                '       <stop offset="1" stop-color="#ff0" />',
                "   </radialGradient>",
                "   <radialGradient",
                '       id="radial-gradient-4"',
                '       cx="930.24"',
                '       cy="-4324.8"',
                '       r="559.49"',
                '       gradientTransform="matrix(0.94, 0, 0, -0.95, -431.16, -3667.14)"',
                '       gradientUnits="userSpaceOnUse"',
                "   >",
                '       <stop offset="0" stop-color="#93278f" />',
                '       <stop offset="0.14" stop-color="#993396" />',
                '       <stop offset="0.38" stop-color="#a753a9" />',
                '       <stop offset="0.71" stop-color="#bf87c6" />',
                '       <stop offset="1" stop-color="#d6bbe4" />',
                "   </radialGradient>",
                "   <radialGradient",
                '       id="radial-gradient-5"',
                '       cx="992.47"',
                '       cy="-4324.8"',
                '       r="559.49"',
                '       gradientTransform="matrix(0.94, 0, 0, -0.95, -490.4, -3667.14)"',
                '       gradientUnits="userSpaceOnUse"',
                "   >",
                '       <stop offset="0" stop-color="#395175" />',
                '       <stop offset="0.14" stop-color="#345c7d" />',
                '       <stop offset="0.39" stop-color="#287a93" />',
                '       <stop offset="0.71" stop-color="#14aab7" />',
                '       <stop offset="1" stop-color="#00dbdb" />',
                "   </radialGradient>",
                "   <radialGradient",
                '       id="radial-gradient-6"',
                '       cx="784.61"',
                '       cy="-6334.12"',
                '       r="559.49"',
                '       gradientTransform="matrix(0.95, 0, 0, -0.95, -317.64, -5577.96)"',
                '       gradientUnits="userSpaceOnUse"',
                "   >",
                '       <stop offset="0" stop-color="#c5f9d0" />',
                '       <stop offset="0.05" stop-color="#b7eac4" />',
                '       <stop offset="0.23" stop-color="#82b397" />',
                '       <stop offset="0.41" stop-color="#568572" />',
                '       <stop offset="0.58" stop-color="#346155" />',
                '       <stop offset="0.74" stop-color="#1c4841" />',
                '       <stop offset="0.88" stop-color="#0d3834" />',
                '       <stop offset="1" stop-color="#083330" />',
                "   </radialGradient>",
                "   <radialGradient",
                '       id="radial-gradient-7"',
                '       cx="930.24"',
                '       cy="-6353.57"',
                '       r="559.49"',
                '       gradientTransform="matrix(0.94, 0, 0, -0.95, -431.16, -5592.4)"',
                '       gradientUnits="userSpaceOnUse"',
                "   >",
                '       <stop offset="0" stop-color="#db6972" />',
                '       <stop offset="0.25" stop-color="#dc6c74" />',
                '       <stop offset="0.44" stop-color="#df767b" />',
                '       <stop offset="0.61" stop-color="#e48686" />',
                '       <stop offset="0.77" stop-color="#ec9d96" />',
                '       <stop offset="0.92" stop-color="#f5bbab" />',
                '       <stop offset="1" stop-color="#fbcdb8" />',
                "   </radialGradient>",
                "   <radialGradient",
                '       id="radial-gradient-8"',
                '       cx="992.47"',
                '       cy="-6353.57"',
                '       r="559.49"',
                '       gradientTransform="matrix(0.94, 0, 0, -0.95, -490.4, -5592.4)"',
                '       gradientUnits="userSpaceOnUse">',
                "   >",
                '       <stop offset="0" stop-color="#006837" />',
                '       <stop offset="0.13" stop-color="#0b7339" />',
                '       <stop offset="0.35" stop-color="#29903f" />',
                '       <stop offset="0.65" stop-color="#5abf48" />',
                '       <stop offset="1" stop-color="#9cff55" />',
                "   </radialGradient>",
                "</defs>"
            )
        );
        return style;
    }
}
