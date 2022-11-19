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
                    "    </style>",
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
        } else if (index == 6) {
            perch = string(
                abi.encodePacked(
                    "<defs>",
                    "  <style>",
                    "    .cls-perch-2 {",
                    "      fill: #ff6990;",
                    "    }"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "    .cls-perch-15,",
                    "    .cls-perch-16,",
                    "    .cls-perch-19,",
                    "    .cls-perch-2,",
                    "    .cls-perch-4 {",
                    "      stroke: #000;",
                    "      stroke-miterlimit: 10;",
                    "    }"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "    .cls-perch-2,",
                    "    .cls-perch-4 {",
                    "      stroke-width: 4.33px;",
                    "    }",
                    "    .cls-perch-4 {",
                    "      fill: #c5f9d0;",
                    "    }"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "    .cls-perch-7 {",
                    "      fill: #ffbf40;",
                    "    }",
                    "    .cls-perch-8 {",
                    "      fill: #fad279;",
                    "    }"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "    .cls-perch-9 {",
                    "      fill: #92c3d3;",
                    "    }",
                    "    .cls-perch-10 {",
                    "      fill: #acd9ef;",
                    "    }",
                    "    .cls-perch-11 {",
                    "      fill: #81bee2;",
                    "    }"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "    .cls-perch-12 {",
                    "      fill: #5fa9e0;",
                    "    }",
                    "    .cls-perch-13 {",
                    "      fill: #5cb2ff;",
                    "    }",
                    "    .cls-perch-14 {",
                    "      fill: #bde6ff;",
                    "    }"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "    .cls-perch-15 {",
                    "      fill: #e5005b;",
                    "    }",
                    "    .cls-perch-15,",
                    "    .cls-perch-16,",
                    "    .cls-perch-19 {",
                    "      stroke-width: 4px;",
                    "    }"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "    .cls-perch-16 {",
                    "      fill: none;",
                    "    }",
                    "    .cls-perch-17 {",
                    "      fill: #ff8db0;",
                    "    }",
                    "    .cls-perch-18 {",
                    "      fill: #fff;",
                    "    }"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "    .cls-perch-19 {",
                    "      fill: #ffd252;",
                    "    }",
                    "    .cls-perch-20 {",
                    "      fill: #fb8525;",
                    "    }",
                    "  </>",
                    "</defs>"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    '<g id="Scepter" data-name="Scepter">',
                    "  <rect",
                    '    class="cls-perch-7"',
                    '    x="573.15"',
                    '    y="457.07"',
                    '    width="49.05"',
                    '    height="308"',
                    '    transform="translate(-93.61 1113.81) rotate(-81.66)"',
                    "  />"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "  <path",
                    '    d="M450.56,566.68l300.77,44.21-6.54,44.57L444,611.25l6.53-44.57m-3.38-4.54-.58,4-6.53,44.57-.58,4,3.95.58,300.77,44.21,4,.58.58-4,6.53-44.57.58-4-4-.58L451.14,562.72l-4-.58Z"',
                    "  />",
                    "  <polygon",
                    '    class="cls-perch-8"',
                    '    points="624.03 592.48 662.02 643.28 615.39 636.45 577.4 585.65 624.03 592.48"',
                    "  />"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "  <polygon",
                    '    class="cls-perch-8"',
                    '    points="666.36 598.69 704.35 649.49 685.2 646.68 647.21 595.88 666.36 598.69"',
                    "  />",
                    "  <path",
                    '    class="cls-perch-9"',
                    '    d="M120.93,539.56l34.55,62.75h0a69.67,69.67,0,0,0,35.67-51.16Z"',
                    "  />"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "  <path",
                    '    class="cls-perch-10"',
                    '    d="M155.48,602.31l-28.12-66L72.57,590.16C83,606,126.08,623.11,155.48,602.31Z"',
                    "  />",
                    "  <path",
                    '    class="cls-perch-11"',
                    '    d="M125.46,539.83,73,589.42h0a69.65,69.65,0,0,1-19.49-59.24Z"',
                    "  />"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "  <path",
                    '    class="cls-perch-12"',
                    '    d="M121.5,541.18l50.16-49.27h0a69.65,69.65,0,0,1,19.49,59.24Z"',
                    "  />",
                    "  <path",
                    '    class="cls-perch-13"',
                    '    d="M171.66,491.91,122,541,88.76,479.76C120.49,460.27,161.11,475.29,171.66,491.91Z"',
                    "  />"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "  <path",
                    '    class="cls-perch-10"',
                    '    d="M123.14,541.42,88.76,479.76h0a69.62,69.62,0,0,0-35.67,51.16Z"',
                    "  />",
                    "  <polygon",
                    '    class="cls-perch-14"',
                    '    points="146.17 516.81 162.26 546.92 138.21 571.14 98.06 565.26 81.98 535.15 106.03 510.92 146.17 516.81"',
                    "  />"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "  <polygon",
                    '    class="cls-perch-15"',
                    '    points="446.17 566.91 439.46 610.36 256.99 586.62 263.69 543.17 446.17 566.91"',
                    "  />",
                    "  <path",
                    '    class="cls-perch-2"',
                    '    d="M435.45,560.57,428,611.66c-.89,6,3.93,11.71,10.74,12.71h0c6.82,1,13.07-3.07,13.95-9.09l7.49-51.09c.88-6-3.93-11.71-10.75-12.71h0C442.57,550.48,436.33,554.55,435.45,560.57Z"',
                    "  />"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "  <path",
                    '    class="cls-perch-2"',
                    '    d="M253.13,534.73l-7.48,51.09c-.89,6,3.93,11.71,10.74,12.71h0c6.82,1,13.06-3.07,13.95-9.09l7.48-51.09c.89-6-3.92-11.71-10.74-12.71h0C260.26,524.64,254,528.71,253.13,534.73Z"',
                    "  />",
                    '  <circle class="cls-perch-15" cx="756.46" cy="634.64" r="28.46" />'
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    '  <circle class="cls-perch-16" cx="123.31" cy="541.39" r="70.68" />',
                    "  <ellipse",
                    '    class="cls-perch-17"',
                    '    cx="767.53"',
                    '    cy="625.37"',
                    '    rx="7.08"',
                    '    ry="14.89"',
                    '    transform="translate(-221.62 583.18) rotate(-36.73)"',
                    "  />"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "</g>",
                    "<path",
                    '  class="cls-perch-2"',
                    '  d="M722.71,603.56l-7.49,51.09c-.89,6,3.93,11.71,10.74,12.71h0c6.82,1,13.06-3.07,13.95-9.09l7.49-51.09c.88-6-3.93-11.71-10.75-12.71h0C729.83,593.47,723.59,597.54,722.71,603.56Z"',
                    "/>"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "<circle",
                    '  class="cls-perch-18"',
                    '  cx="91.42"',
                    '  cy="476.86"',
                    '  r="24.86"',
                    '  transform="translate(-266.64 148.91) rotate(-36.66)"',
                    "/>"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "<circle",
                    '  class="cls-perch-18"',
                    '  cx="132.42"',
                    '  cy="570.4"',
                    '  r="15.23"',
                    '  transform="translate(-93.08 29.99) rotate(-9.58)"',
                    "/>"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "<polygon",
                    '  class="cls-perch-19"',
                    '  points="155.72 623.19 180.13 626.77 246.12 582.56 252.66 537.99 202.13 476.7 177.71 473.12 155.72 623.19"',
                    "/>"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "<rect",
                    '  class="cls-perch-20"',
                    '  x="105.73"',
                    '  y="539.11"',
                    '  width="147.71"',
                    '  height="21.92"',
                    '  transform="translate(-390.71 647.98) rotate(-81.66)"',
                    "/>"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "<path",
                    '  class="cls-perch-4"',
                    '  d="M222.36,499.73a8.41,8.41,0,1,1-9.54,7.1A8.4,8.4,0,0,1,222.36,499.73Z"',
                    "/>"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "<path",
                    '  class="cls-perch-4"',
                    '  d="M218,531.37a8.41,8.41,0,1,1-9.55,7.1A8.42,8.42,0,0,1,218,531.37Z"',
                    "/>"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "<path",
                    '  class="cls-perch-4"',
                    '  d="M213.67,563a8.41,8.41,0,1,1-9.54,7.11A8.41,8.41,0,0,1,213.67,563Z"',
                    "/>",
                    "<path",
                    '  class="cls-perch-4"',
                    '  d="M209.33,594.65a8.41,8.41,0,1,1-9.55,7.11A8.43,8.43,0,0,1,209.33,594.65Z"',
                    "/>"
                )
            );
        } else if (index == 7) {
            perch = string(
                abi.encodePacked(
                    "<defs>",
                    "  <style>",
                    "    .cls-perch-1 {",
                    "      isolation: isolate;",
                    "    }"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "    .cls-perch-10,",
                    "    .cls-perch-11,",
                    "    .cls-perch-12,",
                    "    .cls-perch-13,",
                    "    .cls-perch-14,",
                    "    .cls-perch-15,"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "    .cls-perch-16,",
                    "    .cls-perch-4,",
                    "    .cls-perch-7,",
                    "    .cls-perch-8,",
                    "    .cls-perch-9 {",
                    "      stroke: #000;",
                    "      stroke-miterlimit: 10;",
                    "    }"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "    .cls-perch-17 {",
                    "      fill: #9b0e00;",
                    "    }",
                    "    .cls-perch-7 {",
                    "      fill: #230d09;",
                    "    }",
                    "    .cls-perch-10,",
                    "    .cls-perch-11,",
                    "    .cls-perch-12,"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "    .cls-perch-13,",
                    "    .cls-perch-14,",
                    "    .cls-perch-15,",
                    "    .cls-perch-16,",
                    "    .cls-perch-7,",
                    "    .cls-perch-8,",
                    "    .cls-perch-9 {",
                    "      stroke-width: 3px;",
                    "    }"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "    .cls-perch-8 {",
                    "      fill: #724322;",
                    "    }",
                    "    .cls-perch-9 {",
                    "      fill: #683d1f;",
                    "    }"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "    .cls-perch-10 {",
                    "      fill: url(#New_Gradient_Swatch_1);",
                    "    }",
                    "    .cls-perch-11 {",
                    "      fill: #845c38;",
                    "    }"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "    .cls-perch-12 {",
                    "      fill: url(#New_Gradient_Swatch_1-2);",
                    "    }",
                    "    .cls-perch-13 {",
                    "      fill: url(#linear-gradient);",
                    "    }"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "    .cls-perch-14 {",
                    "      fill: #1a4937;",
                    "    }",
                    "    .cls-perch-15 {",
                    "      fill: #245141;",
                    "    }"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "    .cls-perch-16 {",
                    "      fill: #446b5d;",
                    "    }",
                    "    .cls-perch-18 {",
                    "      fill: url(#New_Gradient_Swatch_1-3);",
                    "    }",
                    "  </style>"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "  <linearGradient",
                    '    id="New_Gradient_Swatch_1"',
                    '    x1="311.53"',
                    '    y1="745.84"',
                    '    x2="788.39"',
                    '    y2="745.84"',
                    '    gradientUnits="userSpaceOnUse"',
                    "  >"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    '    <stop offset="0" stop-color="#ffd252" />',
                    '    <stop offset="1" stop-color="#dba952" />',
                    "  </linearGradient>",
                    "  <linearGradient"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    '    id="New_Gradient_Swatch_1-2"',
                    '    x1="119.73"',
                    '    y1="801.65"',
                    '    x2="314.26"',
                    '    y2="801.65"',
                    '    xlink:href="#New_Gradient_Swatch_1"',
                    "  />",
                    "  <linearGradient"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    '    id="linear-gradient"',
                    '    x1="249.4"',
                    '    y1="723.29"',
                    '    x2="609.55"',
                    '    y2="518.83"',
                    '    gradientUnits="userSpaceOnUse"',
                    "  >"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    '    <stop offset="0" stop-color="#2b644a" />',
                    '    <stop offset="1" stop-color="#32464a" />',
                    "  </linearGradient>",
                    "  <linearGradient",
                    '    id="New_Gradient_Swatch_1-3"',
                    '    x1="303.31"',
                    '    y1="659.73"',
                    '    x2="289.14"'
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    '    y2="592.44"',
                    '    xlink:href="#New_Gradient_Swatch_1"',
                    "  />",
                    "</defs>",
                    '<g class="cls-perch-1">'
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "  <path",
                    '    class="cls-perch-7"',
                    '    d="M740.64,603.25l43.84,37.39L308.59,771.17,121,749.8,125,682Z"',
                    "  />",
                    "  <path",
                    '    class="cls-perch-8"',
                    '    d="M780.12,634.64,306.26,763.41,130,742.41,137,626.13,128.34,629l-7.06,120.62,187.55,21.37L787.56,640.49a.25.25,0,0,0,.09-.44Z"',
                    "  />"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "  <path",
                    '    class="cls-perch-9"',
                    '    d="M787.88,641.3l-1.76,69.08L315.31,856.16a.64.64,0,0,1-.84-.57L308.26,771l479.2-130A.33.33,0,0,1,787.88,641.3Z"',
                    "  />",
                    "  <polygon",
                    '    class="cls-perch-10"',
                    '    points="788.39 654.35 787.75 694.04 313.8 837.34 311.53 788.84 788.39 654.35"',
                    "  />"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "  <path",
                    '    class="cls-perch-11"',
                    '    d="M308.59,771.17,314.16,856a.51.51,0,0,1-.57.54l-189.5-24.4-3-82.36Z"',
                    "  />",
                    "  <polygon",
                    '    class="cls-perch-12"',
                    '    points="311.53 788.84 314.25 837.34 121.37 813.36 119.73 765.96 311.53 788.84"',
                    "  />"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "</g>",
                    '<g class="cls-perch-1">',
                    "  <path",
                    '    class="cls-perch-13"',
                    '    d="M138.11,587.71l127.42-37.1h.08s419.75-8.14,419.8-8.09l90.9,80.42c.18.16-466.91,109-466.91,109h-.11L127.47,705.17a.31.31,0,0,1-.26-.33L137.9,588A.29.29,0,0,1,138.11,587.71Z"',
                    "  />",
                    "  <polygon",
                    '    class="cls-perch-14"',
                    '    points="776.86 623.2 784.1 634.75 310.62 751.43 309.35 731.95 776.86 623.2"',
                    "  />"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "  <path",
                    '    class="cls-perch-15"',
                    '    d="M309.35,732l1.27,19.48L115.18,720.59a0,0,0,0,1,0-.06l12-15.4Z"',
                    "  />",
                    "  <path",
                    '    class="cls-perch-16"',
                    '    d="M128.81,597.25,115.19,719.91a.2.2,0,0,0,.35.14l11.65-14.92s10-116.85,10-116.8Z"',
                    "  />"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "</g>",
                    "<polygon",
                    '  class="cls-perch-17"',
                    '  points="232.82 646.77 188.29 651.38 186.59 616.22 227.81 611.95 223.82 584.24 260.48 580.44 265.58 608.03 395.1 594.6 411.87 628.21 272 642.71 278.25 676.43 237.69 680.63 232.82 646.77"',
                    "/>"
                )
            );
            perch = string(
                abi.encodePacked(
                    perch,
                    "<path",
                    '  d="M258.71,582.8l5.11,27.59,130-13.48,14.71,29.47L269.45,640.79l6.24,33.73-36.15,3.74-4.87-33.86L190.34,649l-1.49-30.83,41.42-4.29-4-27.71,32.43-3.36m3.53-4.72-4,.41-32.43,3.37-4.48.46.64,4.46L225.35,610l-36.94,3.83-4.08.42.2,4.09L186,649.2l.22,4.57,4.55-.47L231,649.13l4.29,29.75.59,4.11,4.13-.43,36.16-3.74,4.66-.48-.85-4.61-5.39-29.11L409,630.68l6.22-.64-2.8-5.59L397.71,595l-1.34-2.69-3,.31-126,13.07L263,582l-.73-3.93Z"',
                    "/>",
                    "<polygon",
                    '  class="cls-perch-18"',
                    '  points="197.12 625.15 239.29 620.78 235.3 593.08 252.1 591.34 257.21 618.92 389.06 605.25 396.13 619.43 259.91 633.55 266.16 667.27 246.27 669.33 241.4 635.47 197.84 639.98 197.12 625.15"',
                    "/>"
                )
            );
        } else {
            perch = string(abi.encodePacked());
        }

        return perch;
    }
}
