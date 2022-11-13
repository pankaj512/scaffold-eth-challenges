pragma solidity ^0.8.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";

// GET LISTED ON OPENSEA: https://testnets.opensea.io/get-listed/step-two

// Defining Library
library HeadLibrary {
    function GetHead(uint256 index) public pure returns (string memory) {
        string memory head;

        if (index == 1) {
            head = string(
                abi.encodePacked(
                    "<defs>",
                    "    <style>",
                    "        .cls-head-head-4 {",
                    "            stroke: #000;",
                    "            stroke-miterlimit: 10;",
                    "            stroke-width: 4.33px;",
                    "        }",
                    "        .cls-head-head-4 {",
                    "            fill: #fbcdb8;",
                    "        }"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    "    </style>",
                    "</defs>",
                    "<path",
                    '    class="cls-head-head-4"',
                    '    d="M365,147.52a6.53,6.53,0,0,0-4-.5c5.15-4.83,10.35-11.62,4.74-13.1-2.86-.75-9.71,3.77-16.79,9.48.76-.77,1.34-1.36,1.64-1.7,2.72-3.11,12.14-19.89,4.27-21.77-6.39-1.52-15.28,7.39-23.57,18.6,4.37-11.53,8.44-30.43-1.11-27.18-6.44,3.09-12.43,16.39-17.16,30.51.95-11.65.76-24.13-4-29.7-5.69-6.63-13.22,11.66-14.77,24.09S302,193.77,302,193.77l4.66,1.55s.58-3.86,1.27-8.83c11.36-24.66,46.14-29.64,46.14-29.64S370.35,150.36,365,147.52Z"',
                    "/>"
                )
            );
        } else if (index == 2) {
            head = string(
                abi.encodePacked(
                    "<defs>",
                    "    <style>",
                    "        .cls-head-head-11,",
                    "        .cls-head-head-15,",
                    "        .cls-head-head-4 {",
                    "            stroke: #000;",
                    "            stroke-miterlimit: 10;",
                    "            stroke-width: 4.33px;",
                    "        }"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    "        .cls-head-head-4 {",
                    "            fill: #00dbdb;",
                    "        }",
                    "        .cls-head-head-11 {",
                    "            fill: #1a1a1a;",
                    "        }",
                    "        .cls-head-head-15 {",
                    "            fill: #333;",
                    "        }",
                    "    </style>",
                    "</defs>"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    '<rect class="cls-head-head-15" x="284.89" y="169.45" width="50" height="16.07" />',
                    "<path",
                    '    class="cls-head-head-11"',
                    '    d="M394.42,127.35c-40.88-21-83.85-7.33-96.43,9.43-3.79,5.06-6.24,11.45-7.82,17.9A30.92,30.92,0,0,1,330,184.47q0,.54,0,1.08l94.95,1.25C425.73,183.25,433.24,147.26,394.42,127.35Z"',
                    "/>"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    "<path",
                    '    class="cls-head-head-11"',
                    '    d="M522.63,156.35c3.67,57.12-97.47,30.92-97.47,30.92,0,.18,1.57-11.53,2.1-15.73C479.14,168.92,519,99.23,522.63,156.35Z"',
                    "/>",
                    "<path",
                    '    class="cls-head-head-4"',
                    '    d="M293.89,169.45s7.33-34.33-16.51-55.81A96.66,96.66,0,0,0,248.3,96.08s47.68-4.45,56.86,16-.27,66.29-.27,66.29Z"',
                    "/>"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    "<path",
                    '    class="cls-head-head-4"',
                    '    d="M288.39,174.43c-.53-.79-8.65-40.62-55.55-30.92,22-19.13,40.87-18.08,51.35-14.15,15.68,5.88,12.64,44.36,12.64,44.36"',
                    "/>",
                    "<path",
                    '    class="cls-head-head-4"',
                    '    d="M303.06,173.9c1.57-2.36-1.31-40.35,24.11-43s29.34,4.72,29.34,4.72-39.56,4.71-38.78,39.56Z"',
                    "/>"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    "<path",
                    '    class="cls-head-head-15"',
                    '    d="M284.89,169.45H313a4.88,4.88,0,0,1,4.88,4.88v6.3a4.88,4.88,0,0,1-4.88,4.88H284.89a0,0,0,0,1,0,0V169.45A0,0,0,0,1,284.89,169.45Z"',
                    "/>",
                    '<ellipse cx="350.75" cy="114.23" rx="11" ry="5.17" />'
                )
            );
        } else if (index == 3) {
            head = string(
                abi.encodePacked(
                    "<defs>",
                    "    <style>",
                    "        .cls-head-head-2 {",
                    "            fill: #d7de21;",
                    "        }",
                    "        .cls-head-head-16,",
                    "        .cls-head-head-17,",
                    "        .cls-head-head-2 {",
                    "            stroke: #000;",
                    "            stroke-miterlimit: 10;",
                    "        }"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    "        .cls-head-head-2 {",
                    "            stroke-width: 4.33px;",
                    "        }",
                    "        .cls-head-head-17 {",
                    "            fill: #00dbdb;",
                    "        }",
                    "        .cls-head-head-16 {",
                    "            fill: none;",
                    "        }"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    "        .cls-head-head-16 {",
                    "            stroke-width: 8.66px;",
                    "        }",
                    "        .cls-head-head-17 {",
                    "            stroke-width: 4.54px;",
                    "        }",
                    "    </style>",
                    "</defs>"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    "<path",
                    '    class="cls-head-head-16"',
                    '    d="M411.42,187.27s5.5,52.66-13.36,66.81c31.44-5.5,40.87-16.51,55-32.23"',
                    "/>",
                    "<path",
                    '    class="cls-head-head-17"',
                    '    d="M322.93,131.23s32.52-69.5,113-24.9c56.56,31.33,51.77,62.46,40.34,97.37-3,9.25-7.62,22.48-11.25,33.36-2.61,7.81-17.52,8.89-23,2.75-3.51-3.93,2.77-34.55-2.28-39.18-14.61-13.39-24.56,19.16-34.65-2.36C376.3,136.8,319.87,151.08,322.93,131.23Z"',
                    "/>"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    '<line class="cls-head-head-16" x1="332.03" y1="141.67" x2="328.1" y2="156.61" />',
                    "<path",
                    '    class="cls-head-head-2"',
                    '    d="M419.08,126.25,404,149.69a.59.59,0,0,0,.3.87L426.53,158a.58.58,0,0,1,.34.79L417,180.31a1.71,1.71,0,0,0,2.66,2l38.16-32.13a.58.58,0,0,0-.18-1L435.86,142a.57.57,0,0,1-.24-.94L446,129.93a.57.57,0,0,0-.36-1l-26-3A.61.61,0,0,0,419.08,126.25Z"',
                    "/>",
                    "<ellipse",
                    '    cx="370.28"',
                    '    cy="131.89"',
                    '    rx="12.58"',
                    '    ry="7.32"',
                    '    transform="translate(82.64 399.79) rotate(-62.57)"',
                    "/>"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    "<ellipse",
                    '    cx="343.42"',
                    '    cy="121.58"',
                    '    rx="12.58"',
                    '    ry="5.78"',
                    '    transform="translate(54.8 343.88) rotate(-57.1)"',
                    "/>"
                )
            );
        } else if (index == 4) {
            head = string(
                abi.encodePacked(
                    "<defs>",
                    "    <style>",
                    "        .cls-head-head-9 {",
                    "            stroke: #000;",
                    "            stroke-miterlimit: 10;",
                    "        }",
                    "        .cls-head-head-9 {",
                    "            stroke-width: 4.33px;",
                    "        }"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    "        .cls-head-head-14 {",
                    "            fill: #ff0;",
                    "        }",
                    "        .cls-head-head-9 {",
                    "            fill: #9c005d;",
                    "        }",
                    "    </style>",
                    "</defs>"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    "<path",
                    '    class="cls-head-head-9"',
                    '    d="M522.78,50.64c-15.26-2.18-58.85,8.72-100.26,13.08-28.06,3-92.14,47.94-130.55,76.63,55.77,1.91,109.54,12.54,165.77,20.7.38.06.75.09,1.12.13.42-25.33-3.64-58.35-3.64-66.95C455.22,94.23,538,52.82,522.78,50.64Z"',
                    "/>",
                    "<path",
                    '    class="cls-head-head-14"',
                    '    d="M420.56,86l11.23-2.91,8.76,7.6.7-11.58,9.94-6-10.8-4.25L439.26,64c-2.53.35-5.05.69-7.58,1l-1.28,1.56-6.87-.6-1.28.14c-.89.09-1.83.25-2.79.42l5.62,8.82Z"',
                    "/>"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    "<polygon",
                    '    class="cls-head-head-14"',
                    '    points="431.44 104.6 422.47 111.96 411.33 108.75 415.56 119.55 409.06 129.16 420.64 128.47 427.77 137.62 430.7 126.39 441.6 122.44 431.83 116.19 431.44 104.6"',
                    "/>",
                    "<polygon",
                    '    class="cls-head-head-14"',
                    '    points="392.95 92.97 388.89 85.47 385.4 93.26 377.01 94.8 383.34 100.52 382.21 108.98 389.61 104.73 397.31 108.42 395.55 100.06 401.44 93.88 392.95 92.97"',
                    "/>"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    "<path",
                    '    class="cls-head-head-14"',
                    '    d="M487.18,60.49l-6.94,4.95-8-2.92,2.56,8.14-5.25,6.73,8.53.08,1.17,1.72c3.95-2.1,8.15-4.37,12.36-6.7L486.89,69Z"',
                    "/>",
                    "<path",
                    '    class="cls-head-head-9"',
                    '    d="M464.84,138.54a605,605,0,0,0-81.64-18.25c-19.25-3-37.93-5-55.63-6.17C251,109.13,193,120.7,189.36,144.4c-3,19.29,30.78,41.79,83.65,59.41,4.21-2.76,10.22-6,10-6,2.72-1.55,6.16-6,6.7-6.23-.59-4.37.68-19.14,15.42-25.21A260.68,260.68,0,0,1,368,167.79c30.51,5.81,41,12,48,16.41,16.08,13.61,25.38,29.94,24.34,46.26-.05.86,115.45.17,120.3-28.62C564.18,181.14,524.64,156.64,464.84,138.54Z"',
                    "/>"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    "<polygon",
                    '    class="cls-head-head-14"',
                    '    points="240.29 160.46 228.74 159.43 221.34 168.37 218.75 157.06 207.97 152.78 217.92 146.83 218.66 135.25 227.4 142.88 238.63 140 234.08 150.66 240.29 160.46"',
                    "/>",
                    "<polygon",
                    '    class="cls-head-head-14"',
                    '    points="423.96 171.94 416.83 162.8 405.25 163.49 411.75 153.88 407.51 143.08 418.66 146.29 427.62 138.93 428.01 150.52 437.79 156.76 426.88 160.72 423.96 171.94"',
                    "/>"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    "<polygon",
                    '    class="cls-head-head-14"',
                    '    points="524.84 203.5 513.78 200.01 504.64 207.16 504.53 195.56 494.91 189.07 505.91 185.38 509.1 174.24 516.01 183.55 527.6 183.15 520.87 192.6 524.84 203.5"',
                    "/>",
                    "<polygon",
                    '    class="cls-head-head-14"',
                    '    points="268.12 182.6 261.94 177.67 254.38 179.97 257.16 172.57 252.64 166.09 260.54 166.45 265.31 160.15 267.4 167.76 274.87 170.35 268.27 174.7 268.12 182.6"',
                    "/>"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    "<polygon",
                    '    class="cls-head-head-14"',
                    '    points="472.49 179.25 466.32 174.32 458.76 176.61 461.54 169.21 457.02 162.73 464.92 163.09 469.69 156.79 471.78 164.41 479.25 167 472.65 171.35 472.49 179.25"',
                    "/>",
                    "<polygon",
                    '    class="cls-head-head-14"',
                    '    points="326.99 153.5 316.24 149.14 306.56 155.53 307.37 143.96 298.31 136.73 309.56 133.93 313.64 123.07 319.78 132.91 331.37 133.44 323.9 142.31 326.99 153.5"',
                    "/>"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    "<polygon",
                    '    class="cls-head-head-14"',
                    '    points="373.85 152.15 367.18 146.83 359.01 149.3 362.01 141.31 357.14 134.31 365.66 134.7 370.81 127.9 373.08 136.13 381.14 138.92 374.02 143.62 373.85 152.15"',
                    "/>",
                    "<polygon",
                    '    class="cls-head-head-14"',
                    '    points="466.67 216.49 461.9 209.42 453.37 209.34 458.62 202.61 456.05 194.47 464.07 197.39 471.02 192.44 470.73 200.97 477.58 206.04 469.38 208.4 466.67 216.49"',
                    "/>"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    "<polygon",
                    '    class="cls-head-head-14"',
                    '    points="272.7 150.83 267.92 143.76 259.39 143.68 264.64 136.96 262.08 128.82 270.1 131.73 277.04 126.78 276.75 135.31 283.61 140.38 275.41 142.74 272.7 150.83"',
                    "/>"
                )
            );
        } else if (index == 5) {
            head = string(
                abi.encodePacked(
                    "<defs>",
                    "    <style>",
                    "        .cls-head-20,",
                    "        .cls-head-21 {",
                    "            stroke: #000;",
                    "        }",
                    "        .cls-head-20,",
                    "        .cls-head-21,",
                    "        .cls-head-22 {",
                    "            stroke-miterlimit: 10;",
                    "        }"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    "        .cls-head-20 {",
                    "            stroke-width: 4.33px;",
                    "        }",
                    "        .cls-head-21,",
                    "        .cls-head-22 {",
                    "            stroke-width: 4px;",
                    "        }"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    "        .cls-head-19,",
                    "        .cls-head-20 {",
                    "            fill: lime;",
                    "        }",
                    "        .cls-head-21 {",
                    "            fill: #101c20;",
                    "        }"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    "        .cls-head-22 {",
                    "            fill: none;",
                    "        }",
                    "        .cls-head-22 {",
                    "            stroke: #faaf40;",
                    "        }",
                    "    </style>",
                    "</defs>"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    "<path",
                    '    class="cls-head-19"',
                    '    d="M537.42,271.6c-1.9-3.78-5.27-8.32-11.23-13-6.14-4.81-14.31-4.86-23-4.92-12.41-.07-26.47-.16-38.59-14.14-15.6-18-17.95-32.7-18.2-38.58l12.76,4.57c3.89,18.39,24.36,21.32,41.89,21.79,18.4.49,31.59,7.44,36.19,19.07C539.87,253,538.74,263.89,537.42,271.6Z"',
                    "/>",
                    "<path",
                    '    d="M448.91,204.15l8.45,3c2,7.88,7.18,13.71,15.36,17.34,6.88,3.06,15.87,4.64,28.31,5,17.5.47,30,6.92,34.23,17.7,1.78,4.49,1.64,11.62.87,18.27a47.62,47.62,0,0,0-8.61-8.55c-6.72-5.27-15.25-5.32-24.28-5.38-12.53-.08-25.49-.16-37-13.39-12.79-14.76-16.41-27.16-17.37-34m-4.57-6.23S441.76,216.45,463,241s47.95,8.45,61.84,19.34S537.65,281,537.65,281s6.27-23.7,1.64-35.42-17.71-19.89-38.14-20.43-37.33-4.63-40-21.25l-16.76-6Z"',
                    "/>"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    "<path",
                    '    class="cls-head-19"',
                    '    d="M487.54,231.05c-10.35,0-17.25-1.43-20.5-4.25-8.48-7.34-18.17-31.68-18.58-32.71l-.4-1,4.18-6.62.54-.27c.34-.17,3.58-1.7,9.91-1.7a55.22,55.22,0,0,1,16.78,2.94c8.55,2.76,13.69,7.14,18.22,11,4.7,4,8.75,7.49,15.76,8.52a44,44,0,0,0,6.41.46,63.79,63.79,0,0,0,21.6-4.13l4.64-1.92-1.79,4.69c-.22.56-5.37,13.71-17.23,18.92C519.58,228.26,501.47,231.05,487.54,231.05Z"',
                    "/>",
                    "<path",
                    '    d="M462.69,186.65a52.72,52.72,0,0,1,16.12,2.83c16.89,5.45,19.61,17.43,34.33,19.61a45.2,45.2,0,0,0,6.71.48,65.5,65.5,0,0,0,22.44-4.29s-4.91,12.8-16.08,17.71c-7,3-24.47,5.89-38.68,5.89-8.6,0-16-1-19.07-3.71-8.18-7.09-18-31.88-18-31.88l3.27-5.17s2.95-1.47,8.95-1.47m0-4.33h0c-6.69,0-10.24,1.6-10.88,1.93l-1.08.54-.65,1L446.82,191l-1.18,1.86.81,2c1,2.63,10.45,26,19.17,33.55,3.71,3.21,10.88,4.77,21.91,4.77,14.43,0,32.56-2.81,40.42-6.26,12.68-5.57,18.15-19.53,18.38-20.12l3.6-9.41-9.3,3.86a61.63,61.63,0,0,1-20.78,4,41.05,41.05,0,0,1-6.08-.43c-6.39-.94-10-4.07-14.68-8s-10-8.54-18.95-11.43a57.37,57.37,0,0,0-17.45-3Z"',
                    "/>"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    "<path",
                    '    class="cls-head-20"',
                    '    d="M390.63,117.58c15.91,3.79,51.57,29.44,53.71,80.34.23,5.49-152.77-21-152.77-21s-5.32-7.52-1.37-22.34,18.28-36.05,28.58-36.85C344.75,115.74,375.39,114,390.63,117.58Z"',
                    "/>",
                    "<path",
                    '    class="cls-head-20"',
                    '    d="M432.6,185.48c-1.53,8.86,3.83,24.48,15.72,16.86,7.05-4.53,9.05-22.17-.43-24.79Z"',
                    "/>"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    "<path",
                    '    class="cls-head-21"',
                    '    d="M490.17,150.23s2,19.16-48.64,34.31c.6,3.84-141.13-21.52-153-31.28-15.86-13.09-33.69-55.6-33.69-55.6s28.35-23.43,39.06-20,9.59,26.2,18.12,24.88S325.4,87.24,336.55,83,490.17,150.23,490.17,150.23Z"',
                    "/>",
                    "<path",
                    '    class="cls-head-22"',
                    '    d="M259.5,104.21S282.11,86.5,289.19,88.4c10.34,2.79,8.72,26.16,19.89,27.52,12.49,1.52,22.61-24.52,36.51-21.52S481,161.15,481,161.15"',
                    "/>"
                )
            );
        } else if (index == 6) {
            head = string(
                abi.encodePacked(
                    "<defs>",
                    "  <style>",
                    "    .cls-head-2 {",
                    "      fill: #ff6990;",
                    "    }"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    "    .cls-head-15,",
                    "    .cls-head-2,",
                    "    .cls-head-22,",
                    "    .cls-head-28,",
                    "    .cls-head-31 {",
                    "      stroke: #000;",
                    "      stroke-miterlimit: 10;",
                    "    }"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    "    .cls-head-2,",
                    "    .cls-head-22 {",
                    "      stroke-width: 4.33px;",
                    "    }",
                    "    .cls-head-28 {",
                    "      fill: #ffbf40;",
                    "    }"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    "    .cls-head-22 {",
                    "      fill: #5cb2ff;",
                    "    }",
                    "    .cls-head-15 {",
                    "      fill: #e5005b;",
                    "    }"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    "    .cls-head-15,",
                    "    .cls-head-28,",
                    "    .cls-head-31 {",
                    "      stroke-width: 4px;",
                    "    }"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    "    .cls-head-20 {",
                    "      fill: #fb8525;",
                    "    }",
                    "    .cls-head-31 {",
                    "      fill: #e6e7e8;",
                    "    }",
                    "  </style>",
                    "</defs>"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    "<path",
                    '  class="cls-head-15"',
                    '  d="M454.52,134.44c9.33,47.91-134.29-15-149.61-10.11C281.54,23.51,480.83,50,454.52,134.44Z"',
                    "/>"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    "<path",
                    '  class="cls-head-28"',
                    '  d="M479,102.17c-7.55-2-13.21,7.84-8,13.4l-29.65,22.77-4.21-40.15c21.29.64,1.75-29.64-6.42-9.87a8.24,8.24,0,0,0,5.16,9.52l-31,24.4-12-55.7c9.83,1.06,12.23-14.26,2.45-16.21-9.63-2.39-14.08,12.41-4.72,15.7l-34.73,45.18L338.34,75.9c9.86,1.09,12.33-14.23,2.51-16.22-10.23-2.46-14.07,13.59-3.81,16l-21,34.48L299,76.87c7.08-2.8,6.11-14.11-1.52-15.55-11.79-2.61-13.6,16.77-1.42,16.23l3.09,35.8-4.82,24.43c.66-1.51,157.35,38.44,155.16,33.12,1.15-14.53,15.82-41.54,23.86-53.47C484,123.13,490.92,104.87,479,102.17Z"',
                    "/>"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    "<path",
                    '  class="cls-head-2"',
                    '  d="M391.78,122.49c-2.09,9.27-14.64,14.34-14.64,14.34s-9.17-10-7.08-19.23,14.63-14.34,14.63-14.34S393.87,113.22,391.78,122.49Z"',
                    "/>",
                    "<path",
                    '  class="cls-head-22"',
                    '  d="M344.22,114.3c-.28,7-8.67,12.3-8.67,12.3s-7.95-6-7.68-12.95,8.67-12.31,8.67-12.31S344.49,107.32,344.22,114.3Z"',
                    "/>"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    "<path",
                    '  class="cls-head-22"',
                    '  d="M429.32,137.5C426.68,144,417,146.11,417,146.11s-5.43-8.33-2.8-14.79,12.35-8.61,12.35-8.61S432,131,429.32,137.5Z"',
                    "/>"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    "<polygon",
                    '  class="cls-head-20"',
                    '  points="449.91 160.84 447.2 172.86 296.1 139.73 298.45 127.64 449.91 160.84"',
                    "/>"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    "<path",
                    '  class="cls-head-31"',
                    '  d="M454.63,188h0a13.2,13.2,0,0,1-15.77,10L293.15,165.21a13.19,13.19,0,0,1-10-15.57h0a13.19,13.19,0,0,1,15.81-10.17l145.72,32.79A13.19,13.19,0,0,1,454.63,188Z"',
                    "/>"
                )
            );
        } else if (index == 7) {
            head = string(
                abi.encodePacked(
                    "<defs>",
                    "  <style>",
                    "    .cls-head-36 {",
                    "      stroke: #000;",
                    "      stroke-miterlimit: 10;",
                    "      fill: none;"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    "      stroke-width: 3px;",
                    "    }",
                    "    .cls-head-34 {",
                    "      fill: #333;",
                    "    }",
                    "    .cls-head-35 {",
                    "      fill: #e6e6e6;",
                    "    }"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    "  </style>",
                    "</defs>",
                    "<path",
                    '  class="cls-head-34"',
                    '  d="M416,194.2c-48.66-71.61-99.17-1.45-115.61-19.7-7.37-8.19-1.93-21.75,3.05-21.34,3.69-24.3,22.11-21.8,22.11-21.8,7.54-17.68,28.69-19.44,49.22-11.63,24.15,0,48.79,13.91,47.55,28.12,22.49,14.21,18.21,53.25,22.81,73C445.37,221.76,431.73,219.36,416,194.2Z"',
                    "/>"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    "<path",
                    '  class="cls-head-35"',
                    '  d="M442.85,200.92c.23,3.79-1.15,8.81-.64,12.61-6.38-18.73-7.09-39.61-23.88-53.47-29.7-24.52-80.92-23.16-106.8,15.8,9.26-27.79,32.31-56.72,61.57-46.86C415.36,135.21,444.67,155,442.85,200.92Z"',
                    "/>"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    "<path",
                    '  class="cls-head-35"',
                    '  d="M322.16,131.18c4.63-.28-8.18,14.44-14.72,45.49C303.67,163.54,299,136.63,322.16,131.18Z"',
                    "/>",
                    "<path",
                    '  class="cls-head-36"',
                    '  d="M309.18,180.09c-1.73-18.68,12.54-50.28,27.83-61.15,12.58-9,27.56.38,42.94,1.65,11.47,1,23.41,2.76,34.42,12.94,5.53,5.12,6.25,8.53,8,14.05"',
                    "/>"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    "<path",
                    '  class="cls-head-36"',
                    '  d="M310.44,178c28.63-33.59,42.68-34.14,62.75-34.09s36.41,6.45,50.26,21,9.92,33.86,19.08,54"',
                    "/>"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    "<path",
                    '  class="cls-head-36"',
                    '  d="M307.72,179.94c-1.93-6.15-4-13.71-4.09-20.16-.27-26.42,13.71-29.15,21-28.42"',
                    "/>"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    "<path",
                    '  class="cls-head-36"',
                    '  d="M308.44,180.76c-5.12-3.16-9.12-6.23-11.62-11.71s.86-13.6,6.72-15"',
                    "/>"
                )
            );
            head = string(
                abi.encodePacked(
                    head,
                    "<path",
                    '  class="cls-head-36"',
                    '  d="M308.7,180.89s-.05,0,0,0c7-18.19,19.75-42.68,37.37-50.89,14.92-7,29.73.21,52.86,4.95,10.26,2.1,25.19,12.92,31.94,20.92,15.22,18.07,9.63,52.87,14.59,65,0,0-13.65-.45-23.69-18.14a115.53,115.53,0,0,0-17.9-24.26c-12.22-12.35-30.28-18.06-47.62-17C339.39,162.49,310.41,179.86,308.7,180.89Z"',
                    "/>"
                )
            );
        } else {
            head = string(abi.encodePacked());
        }
        return head;
    }
}
