pragma solidity ^0.8.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";

// GET LISTED ON OPENSEA: https://testnets.opensea.io/get-listed/step-two

// Defining Library
library Perch2Library {
    function GetPerch(uint256 index) public pure returns (string memory) {
        string memory perch;

        if (index == 4) {
            perch = string(
                abi.encodePacked(
                    "<defs>",
                    "    <style>",
                    "        .cls-perch-7 {",
                    "            stroke: #000;",
                    "            stroke-miterlimit: 10;",
                    "            fill: #a56734;",
                    "            stroke-width: 4.48px;",
                    "        }"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "    </style>",
                    "</defs>",
                    "<path",
                    '    class="cls-perch-7"',
                    '    d="M771.61,612.1c-9.46-.91-492.82-45.26-518.91-46.35-33.46-.44-48.28,59.2-90.23,59-40.13,1.42-82.15-33.81-78.45-75,3.82-74.49,141.84-73.57,104.6,12.32-19,50-90.85,13.32-55.21-25.5h0c9.56-9.6,24.29,5.5,14.59,14.83-1.68,1.64-4.37,4.75-3.59,7.06,1,3,6.54,6.83,13.65,7.82,8.74-2.22,24.5-29.93,10.34-44.33-7.6-7.25-22.82-8.53-37-3.11-30,10.19-34.34,46.1-13.57,66.23,70.42,60.76,71.83-38.53,135.69-40.06,26.79,1.15,481.4,42.75,520.13,46.44C786.69,592.72,785.45,613.34,771.61,612.1Z"',
                    "/>"
                )
            );
        } else if (index == 5) {
            perch = string(
                abi.encodePacked(
                    "<defs>",
                    "    <style>",
                    "        .cls-perch-13,",
                    "        .cls-perch-7,",
                    "        .cls-perch-9 {",
                    "            stroke: #000;",
                    "            stroke-miterlimit: 10;",
                    "        }"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "        .cls-perch-7 {",
                    "            stroke-width: 4.33px;",
                    "        }",
                    "        .cls-perch-7,",
                    "        .cls-perch-9 {",
                    "            fill: #f9cc3d;",
                    "        }"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "        .cls-perch-8 {",
                    "            fill: #f7931e;",
                    "        }",
                    "        .cls-perch-9 {",
                    "            stroke-width: 4.67px;",
                    "        }"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "        .cls-perch-10 {",
                    "            fill: #ededed;",
                    "        }"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "        .cls-perch-11 {",
                    "            fill: #fff;",
                    "        }",
                    "        .cls-perch-12 {",
                    "            fill: #a7b5bc;",
                    "        }"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "        .cls-perch-13 {",
                    "            fill: #1b2b30;",
                    "            stroke-width: 4px;",
                    "        }",
                    "</defs>"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "<path",
                    '    class="cls-perch-7"',
                    '    d="M106.63,548.61S96.8,655,162.41,667.21c83.85,15.64,98.93-101.78,98.93-101.78l-14.73,7.91s-20,74.24-77.51,64.83c-58.32-9.55-48-83.77-48-83.77Z"',
                    "/>"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "<path",
                    '    class="cls-perch-8"',
                    '    d="M159.51,659.16c-50.95-22.07-45.79-87.29-44.9-110l-6-2.22c-7.08,63.34,21.17,140.52,91.82,115C187.57,666.52,174.16,665.51,159.51,659.16Z"',
                    "/>"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "<ellipse",
                    '    class="cls-perch-9" cx="280.43" cy="565.85" rx="55.03" ry="14.56"',
                    '    transform="translate(-336.37 701.41) rotate(-76.03)"',
                    "/>"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "<path",
                    '    class="cls-perch-8"',
                    '    d="M278.16,599.09c-12.32-1.8,1.12-64.73,10.35-82.13-7,5.7-15.37,23.58-20.87,45.69-10.89,39.63-3.74,79.35,15.46,34.28C281.23,598.46,279.74,599.48,278.16,599.09Z"',
                    "/>"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "<path",
                    '    class="cls-perch-10"',
                    '    d="M501.81,650.82c-70.06,0-141.4-19.84-212-59l-1.63-.91.65-1.74c4.05-10.91,7.51-25.73,9.72-41.71l.32-2.3,2.28.48a426.55,426.55,0,0,0,88.47,9.26A423.6,423.6,0,0,0,535.7,529.21c47.84-17.51,90.72-43.09,127.46-76l1.32-1.19,1.42,1.07c21.35,16,46.11,24.17,73.6,24.17,22.64,0,46.35-5.48,70.48-16.28l6.28-2.81-3.54,5.9C776.67,524.12,731,570.87,677.05,603c-53.28,31.72-112.23,47.81-175.23,47.81Z"',
                    "/>"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "<path",
                    '    d="M664.6,454.8c22.89,17.19,48.58,24.6,74.9,24.6,23.82,0,48.15-6.07,71.36-16.46-72.58,120.94-184.19,185.71-309,185.71-67.8,0-139.51-19.1-211-58.69,4.77-12.85,8-28.66,9.84-42.16a428.14,428.14,0,0,0,88.92,9.3c100.18,0,199.76-34.85,275-102.3m-.24-5.6-2.65,2.38c-36.53,32.74-79.18,58.18-126.75,75.6a421.57,421.57,0,0,1-145.37,25.59,423.51,423.51,0,0,1-88-9.21l-4.55-1-.64,4.6c-2.2,15.84-5.61,30.49-9.61,41.26l-1.3,3.48,3.26,1.81c35.49,19.66,71.77,34.65,107.82,44.58A397.45,397.45,0,0,0,501.81,653a348.93,348.93,0,0,0,91.9-12.16,340.49,340.49,0,0,0,84.45-36c54.29-32.33,100.18-79.33,136.41-139.71l7.08-11.8L809.09,459c-23.84,10.67-47.26,16.09-69.59,16.09-27,0-51.33-8-72.3-23.74l-2.84-2.14Z"',
                    "/>"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "<path",
                    '    class="cls-perch-11"',
                    '    d="M599.88,633.14c3.06-.87,12.69-3.86,14.44-4.46l51.6-173.47q-8.46,7.2-17.25,13.89Z"',
                    "/>"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "<path",
                    '    class="cls-perch-11"',
                    '    d="M560,626.45a321.92,321.92,0,0,0,32.11-6.79L634.94,479a410.11,410.11,0,0,1-37.39,24.52Z"',
                    "/>"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "<path",
                    '    class="cls-perch-12"',
                    '    d="M290,590c111.15,60.16,217.86,74.23,312.48,44.49,74.19-23.33,127.86-70.45,159.81-105.88A408.5,408.5,0,0,0,810.86,463h0S643.21,682.61,290,590Z"',
                    "/>"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "<path",
                    '    class="cls-perch-13"',
                    '    d="M108.42,509.39l165.35,29.69c11.72,7.61.73,42.39-9.69,44.46L106.77,552.92C99.14,531.13,93.69,530.41,108.42,509.39Z"',
                    "/>"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "<polygon",
                    '    points="107.21 541.66 274.38 572.31 264.08 583.54 104.65 551.75 107.21 541.66"',
                    "/>"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "<path",
                    '    class="cls-perch-7"',
                    '    d="M61.48,498.82c36.47-26.54,76.65,25.95,41.58,54.23C66.63,579.6,26.4,527.1,61.48,498.82Z"',
                    "/>"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "<path",
                    '    class="cls-perch-8"',
                    '    d="M50.16,522a31.58,31.58,0,0,1,17.25-24.16c-31.44,22.73-2.74,70.9,32.18,54.21C78.33,568.1,45.72,548.3,50.16,522Z"',
                    "/>"
                )
            );
        } else {
            perch = string(abi.encodePacked());
        }

        return perch;
    }
}
