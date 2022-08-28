pragma solidity ^0.8.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";

// GET LISTED ON OPENSEA: https://testnets.opensea.io/get-listed/step-two

// Defining Library
library YourLibary {
    function GetStyle() public pure returns (string memory) {
        string memory style = string(
            abi.encodePacked(
                "<defs>",
                "<style>",
                ".cls-1 {",
                "isolation: isolate;",
                "}",
                ".cls-2 {",
                "fill: none;",
                "}",
                "cls-10,",
                ".cls-19,",
                ".cls-20,",
                ".cls-8,",
                ".cls-9 {",
                "stroke: #000;",
                "stroke-miterlimit: 10;",
                "stroke-width: 4.33px;",
                "}",
                ".cls-12,",
                ".cls-17,",
                ".cls-18,",
                ".cls-6 {",
                "mix-blend-mode: multiply;",
                "}",
                ".cls-6 {",
                "opacity: 0.31;",
                "}",
                ".cls-12,",
                ".cls-7 {",
                "fill: #979797;",
                "}",
                ".cls-13,",
                ".cls-8 {",
                "fill: #c9b59f;",
                "}",
                ".cls-9 {",
                "fill: #39b34a;",
                "}",
                ".cls-10 {",
                "fill: #8ac43f;",
                "}",
                ".cls-11 {",
                "fill: #8c6239;",
                "}",
                ".cls-12 {",
                "opacity: 0.2;",
                "}",
                ".cls-17 {",
                "opacity: 0.25;",
                "}",
                ".cls-18 {",
                "opacity: 0.27;",
                "}",
                ".cls-19 {",
                "fill: #8cc63f;",
                "}",
                ".cls-20 {",
                "fill: #fbcdb8;",
                "}",
                ".cls-21 {",
                "fill: #fff;",
                "}",
                ".cls-22 {",
                "fill: #222844;",
                "}",
                "",
                "</style>",
                "<radialGradient",
                ' id="radial-gradient-0"',
                ' cx="868.1"',
                ' cy="-2326.18"',
                ' r="559.49"',
                ' gradientTransform="matrix(0.94, 0, 0, -0.95, -373.49, -1767.37)"',
                ' gradientUnits="userSpaceOnUse"',
                ">",
                '<stop offset="0" stop-color="#c8a5db" />',
                '<stop offset="1" stop-color="#412951" />',
                "</radialGradient>",
                "<radialGradient",
                ' id="radial-gradient-1"',
                ' cx="441.55"',
                ' cy="-1967.44"',
                ' r="443.02"',
                ' gradientTransform="matrix(1, 0, 0, -1, 0, -1522.96)"',
                ' gradientUnits="userSpaceOnUse"',
                ">",
                '<stop offset="0.23" stop-color="#ff4803" />',
                '<stop offset="1" stop-color="#ffb93b" />',
                "</radialGradient>",
                "<radialGradient",
                ' id="radial-gradient-2"',
                ' cx="441.55"',
                ' cy="-1967.44"',
                ' r="443.02"',
                ' gradientTransform="matrix(1, 0, 0, -1, 0, -1522.96)"',
                ' gradientUnits="userSpaceOnUse"',
                ">",
                '<stop offset="0.3" stop-color="#c8a5db" />',
                '<stop offset="1" stop-color="#c5f9d0" />',
                "</radialGradient>",
                "<radialGradient",
                ' id="radial-gradient-3"',
                ' cx="784.61"',
                ' cy="-4296.57"',
                ' r="559.49"',
                ' gradientTransform="matrix(0.95, 0, 0, -0.95, -317.64, -3652.7)"',
                ' gradientUnits="userSpaceOnUse"',
                ">",
                '<stop offset="0" stop-color="#9cff55" />',
                '<stop offset="1" stop-color="#ff0" />',
                "</radialGradient>",
                "<radialGradient",
                ' id="radial-gradient-4"',
                ' cx="930.24"',
                ' cy="-4324.8"',
                ' r="559.49"',
                ' gradientTransform="matrix(0.94, 0, 0, -0.95, -431.16, -3667.14)"',
                ' gradientUnits="userSpaceOnUse"',
                ">",
                '<stop offset="0" stop-color="#93278f" />',
                '<stop offset="0.14" stop-color="#993396" />',
                '<stop offset="0.38" stop-color="#a753a9" />',
                '<stop offset="0.71" stop-color="#bf87c6" />',
                '<stop offset="1" stop-color="#d6bbe4" />',
                "</radialGradient>",
                "<radialGradient",
                ' id="radial-gradient-5"',
                ' cx="992.47"',
                ' cy="-4324.8"',
                ' r="559.49"',
                ' gradientTransform="matrix(0.94, 0, 0, -0.95, -490.4, -3667.14)"',
                ' gradientUnits="userSpaceOnUse"',
                ">",
                '<stop offset="0" stop-color="#395175" />',
                '<stop offset="0.14" stop-color="#345c7d" />',
                '<stop offset="0.39" stop-color="#287a93" />',
                '<stop offset="0.71" stop-color="#14aab7" />',
                '<stop offset="1" stop-color="#00dbdb" />',
                "</radialGradient>",
                "<radialGradient",
                ' id="radial-gradient-6"',
                ' cx="784.61"',
                ' cy="-6334.12"',
                ' r="559.49"',
                ' gradientTransform="matrix(0.95, 0, 0, -0.95, -317.64, -5577.96)"',
                ' gradientUnits="userSpaceOnUse"',
                ">",
                '<stop offset="0" stop-color="#c5f9d0" />',
                '<stop offset="0.05" stop-color="#b7eac4" />',
                '<stop offset="0.23" stop-color="#82b397" />',
                '<stop offset="0.41" stop-color="#568572" />',
                '<stop offset="0.58" stop-color="#346155" />',
                '<stop offset="0.74" stop-color="#1c4841" />',
                '<stop offset="0.88" stop-color="#0d3834" />',
                '<stop offset="1" stop-color="#083330" />',
                "</radialGradient>",
                "<radialGradient",
                ' id="radial-gradient-7"',
                ' cx="930.24"',
                ' cy="-6353.57"',
                ' r="559.49"',
                ' gradientTransform="matrix(0.94, 0, 0, -0.95, -431.16, -5592.4)"',
                ' gradientUnits="userSpaceOnUse"',
                ">",
                '<stop offset="0" stop-color="#db6972" />',
                '<stop offset="0.25" stop-color="#dc6c74" />',
                '<stop offset="0.44" stop-color="#df767b" />',
                '<stop offset="0.61" stop-color="#e48686" />',
                '<stop offset="0.77" stop-color="#ec9d96" />',
                '<stop offset="0.92" stop-color="#f5bbab" />',
                '<stop offset="1" stop-color="#fbcdb8" />',
                "</radialGradient>",
                "<radialGradient",
                ' id="radial-gradient-8"',
                ' cx="992.47"',
                ' cy="-6353.57"',
                ' r="559.49"',
                ' gradientTransform="matrix(0.94, 0, 0, -0.95, -490.4, -5592.4)"',
                ' gradientUnits="userSpaceOnUse"',
                ">",
                '<stop offset="0" stop-color="#006837" />',
                '<stop offset="0.13" stop-color="#0b7339" />',
                '<stop offset="0.35" stop-color="#29903f" />',
                '<stop offset="0.65" stop-color="#5abf48" />',
                '<stop offset="1" stop-color="#9cff55" />',
                "</radialGradient>",
                '"</defs>"'
            )
        );
        return style;
    }

    function GetHead(
        uint256 /* index */
    ) public pure returns (string memory) {
        string memory head = string(
            abi.encodePacked(
                '<g id="Head">',
                "<path",
                ' class="cls-20"',
                ' d="M373.65,154.28a6.57,6.57,0,0,0-4-.51c5.15-4.83,10.35-11.62,4.75-13.09-2.87-.76-9.72,3.76-16.79,9.48.76-.77,1.33-1.37,1.63-1.71,2.72-3.11,12.14-19.89,4.27-21.76-6.39-1.52-15.28,7.38-23.57,18.59,4.37-11.52,8.45-30.42-1.11-27.17-6.43,3.09-12.42,16.39-17.16,30.5.95-11.65.76-24.13-4-29.69-5.68-6.63-13.21,11.65-14.77,24.09s7.77,57.51,7.77,57.51l4.67,1.56s.58-3.86,1.26-8.83c11.37-24.67,46.15-29.64,46.15-29.64S379,157.12,373.65,154.28Z"',
                "/>",
                '<rect class="cls-2" x="187.81" y="49.34" width="388.02" height="222.66" />',
                "</g>"
            )
        );
        return head;
    }

    function GetEye(
        uint256 /* index */
    ) public pure returns (string memory) {
        string memory eye = string(
            abi.encodePacked(
                '<g id="Eye">',
                "<rect",
                ' class="cls-2"',
                ' x="248.95"',
                ' y="182.94"',
                ' width="197.79"',
                ' height="102.55"',
                "/>",
                '<circle class="cls-21"  cx="362.9"  cy="212.31" r="16.71" />',
                "<path",
                ' class="cls-22"',
                ' d="M362.9,197.73a14.58,14.58,0,1,1-14.57,14.58,14.57,14.57,0,0,1,14.57-14.58m0-4.28a18.86,18.86,0,1,0,18.85,18.86,18.88,18.88,0,0,0-18.85-18.86Z"',
                "/>",
                '<circle class="cls-22"  cx="362.9"  cy="212.31" r="6.06" />',
                "</g>"
            )
        );
        return eye;
    }

    function GetNeck(
        uint256 /* index */
    ) public pure returns (string memory) {
        string memory neck = string(
            abi.encodePacked(
                '<g id="Neck">',
                "<rect",
                ' class="cls-2"',
                ' x="171.99"',
                ' y="255.07"',
                ' width="308.73"',
                ' height="247.67"',
                "/>",
                "<path",
                ' class="cls-19"',
                ' d="M351.94,296s69.5-6.38,85.29-19.86c8.49-7.25,14.37,10.71,5.06,16.41-12.66,7.74-54.61,20.79-83.72,19.83C345.86,306.32,351.94,296,351.94,296Z"',
                "/>",
                "<path",
                ' class="cls-19"',
                ' d="M325.3,298.65S305.8,277.33,297.94,277s-7.66,13-7.16,19.36-6.91,13.85-2.41,18.77,25.85,2.73,36.44-5.45S325.3,298.65,325.3,298.65Z"',
                "/>",
                "<path",
                ' class="cls-19"',
                ' d="M342.61,298.64a14,14,0,0,0-13.07-6.88c-9.46.37-15.27,7.19-12.48,15.18s9.11,7.49,14.61,7.74S341.55,304.89,342.61,298.64Z"',
                "/>",
                "<path",
                ' class="cls-19"',
                ' d="M340.36,296.18s39.53-21.84,44.64-13-3.12,17.17-2.58,22.71,7.9,16.87.66,20.48S337.34,311,337.34,311,334.65,300.65,340.36,296.18Z"',
                "/>",
                "</g>"
            )
        );
        return neck;
    }

    function GetPerch(
        uint256 /* index */
    ) public pure returns (string memory) {
        string memory perch = string(
            abi.encodePacked(
                '<g id="Perch">',
                '<rect class="cls-2" x="83.33" y="415.2" width="716.95" height="415.08" />',
                "<polygon",
                ' class="cls-8"',
                ' points="759.32 560.28 720.94 544.84 687.13 564.66 759.32 560.28"',
                "/>",
                "<path",
                ' class="cls-9"',
                ' d="M230,641.8s37.69,26.43,39.25,56.74-2.72,40.8.39,53.24C243.55,727.29,220.62,697.76,230,641.8Z"',
                "/>",
                "<path",
                ' class="cls-10"',
                ' d="M229.56,645.69c.39,4.27,26.81,39.63,10.49,76.94S182.54,796.08,195,822.5C155.34,758,148.34,713.3,175.54,686.1S229.56,645.69,229.56,645.69Z"',
                "/>",
                "<path",
                ' class="cls-11"',
                ' d="M224.47,659.41c-10.33,0-22.15-5.54-28.74-13.46-4.15-5-5.82-10.43-4.84-15.72.91-4.9,8-7.11,14.77-9.25,3-.93,6.32-2,7.29-2.85a17.54,17.54,0,0,0,2.11-2.4c1.77-2.29,4.08-5.27,10.69-9.46-35-6.62-63.47-41.88-64.74-43.46l-.16-.2-.1-.23C160.59,562,157,554,170.34,545c.88-.72,4.45-3,13.78-3,1.75,0,3.62.08,5.58.24,6,.5,9.44,2.89,13.76,5.91,6.43,4.51,15.24,10.68,39.68,15.1a111.59,111.59,0,0,0,19.89,2c11.44,0,19-2.38,27-4.9s16.21-5.12,28.52-5.28h1.05c16.2,0,56.95,4.39,96.35,8.62,37,4,71.87,7.74,84.76,7.74.58,0,1.12,0,1.6,0,22.75-.76,208.54-62,210.41-62.65l.36-.12h.38c1,0,24.84,1.06,42.69,28.18l1.53,2.34L755,540c-13,4.42-35.09,13.6-48,19.07,7.26-.12,17.27-.25,27.51-.25,11.56,0,21.15.16,28.51.47l1.51.07.46,1.45c5.17,16.42,2.52,32.72-2.41,41.59-2.53,4.56-5.75,7.45-9.32,8.37a50.37,50.37,0,0,1-13.2,1.56c-5.34,0-11.89-.55-20.95-1.3-9.4-.78-22.27-1.85-40-2.82-2.18-.12-4.52-.18-7-.18-33.59,0-83.69,11-123.94,19.86-20.49,4.5-38.18,8.39-48.36,9.55A288,288,0,0,1,468.24,639c-33.49,0-67.74-3.94-91.6-10.54-22-6.09-47.49-9.05-77.86-9.05-5.93,0-11.06.1-15.17.19-10.45.22-12.83,4.2-15.85,9.23-1.95,3.26-4.16,7-8.68,9.86a50.72,50.72,0,0,0-9.08,7.52c-3.46,3.45-7,7-16,11.26A22,22,0,0,1,224.47,659.41Z"',
                "/>",
                "<path",
                ' d="M713.36,510.74s23.5.72,40.94,27.21c-19.37,6.6-58.43,23.51-58.43,23.51s18.75-.47,38.62-.47c9.93,0,20.14.11,28.42.47,6.7,21.27,0,44.59-10.21,47.21A48.14,48.14,0,0,1,740,610.16c-10.76,0-26.18-2.22-60.78-4.11-2.27-.12-4.62-.18-7.08-.18-51.54,0-143.25,26.08-172.55,29.42a286.3,286.3,0,0,1-31.38,1.53c-29.4,0-65-3.26-91-10.47-28.37-7.84-57.91-9.13-78.43-9.13-5.9,0-11,.11-15.22.2-18.65.38-14.77,12.43-25.65,19.43S247.81,648.5,233,655.5a20,20,0,0,1-8.57,1.75c-15,0-34-12.78-31.45-26.62,1.08-5.82,17.87-7.77,21.37-10.88s3.5-7,17.88-14.77c-37.31-3.11-69.57-43.52-69.57-43.52s-3.1-6.61,8.94-14.77c0,0,2.86-2.57,12.48-2.57,1.61,0,3.4.07,5.4.24,14,1.16,12.43,13.6,53.24,21a113.13,113.13,0,0,0,20.27,2c23.45,0,31.43-9.88,55.51-10.19h1c31.07,0,154.15,16.35,181.11,16.35q.91,0,1.68,0c23.31-.77,211-62.76,211-62.76m-.63-4.35-.73.24c-64.71,21.38-191.85,62-209.8,62.55l-1.53,0c-12.77,0-47.63-3.75-84.53-7.72-39.46-4.24-80.27-8.63-96.58-8.63h-1.08c-12.63.17-21,2.82-29.14,5.39-7.82,2.47-15.2,4.8-26.31,4.8a109.14,109.14,0,0,1-19.5-2c-24-4.33-32.56-10.35-38.83-14.74-4.4-3.08-8.21-5.74-14.82-6.29-2-.17-3.95-.26-5.76-.26-9.57,0-13.69,2.36-15.06,3.42-14.51,9.91-10.75,19.07-10.27,20.09l.22.46.31.4a160.4,160.4,0,0,0,21.42,21.23c13.53,11.16,26.85,18.49,39.72,21.9a34,34,0,0,0-7.11,7.11,15.24,15.24,0,0,1-1.84,2.11c-.78.61-4.22,1.69-6.49,2.4-7.08,2.23-15.11,4.75-16.26,10.93-1.1,5.94.73,12,5.31,17.49,7,8.39,19.47,14.25,30.4,14.25a24.19,24.19,0,0,0,10.43-2.17c9.33-4.42,13-8.11,16.62-11.68a47.52,47.52,0,0,1,8.73-7.24c4.95-3.18,7.4-7.28,9.37-10.57,3-5,4.79-8,14-8.18,4.11-.08,9.22-.19,15.13-.19,30.17,0,55.45,2.94,77.28,9,24,6.65,58.5,10.61,92.19,10.61a290.11,290.11,0,0,0,31.87-1.55c10.28-1.17,28-5.07,48.57-9.59,40.15-8.82,90.12-19.81,123.49-19.81,2.4,0,4.7.06,6.84.18,17.66,1,30.51,2,39.89,2.82,9.11.75,15.7,1.3,21.13,1.3a52.36,52.36,0,0,0,13.74-1.63c4.15-1.06,7.84-4.32,10.67-9.41,5.15-9.28,7.95-26.26,2.58-43.29l-.91-2.9-3-.13c-7.39-.31-17-.47-28.6-.47-5.68,0-11.28,0-16.39.09,12.4-5.15,27.69-11.33,37.6-14.7l5.29-1.81-3.08-4.67c-18.46-28.05-43.37-29.12-44.42-29.15l-.76,0Z"',
                "/>",
                "<path",
                ' class="cls-12"',
                ' d="M165.74,551.75c-4.94,5.67-3,9.71-3,9.71s32,40.1,69.14,43.47c7.51-3.57,14.39-8.58,21.18-13.42C220.14,591.53,187.58,576,165.74,551.75Z"',
                "/>",
                "<ellipse",
                ' class="cls-13"',
                ' cx="216.43"',
                ' cy="640.73"',
                ' rx="12.01"',
                ' ry="21.94"',
                ' transform="translate(-457.37 582.7) rotate(-66.41)"',
                "/>",
                "<path",
                ' class="cls-12"',
                ' d="M576.48,601.24c-85.54,33.79-178.75,12.36-268,2-15-2.14-33.16-6.42-44.93,5.35-8.84,9.82-14.09,23.23-24.82,31.16,1.14,0,2.29-.07,3.43-.13h0c-1.14.06-2.29.11-3.43.13a33.18,33.18,0,0,1-3,2,33.18,33.18,0,0,0,3-2c-15,.37-29.92-2.32-44.88-1,5.14,13,26.85,22.53,39.14,16.71,14.77-7,14-11.66,24.87-18.65s7-19.05,25.65-19.43,57.13-1.17,93.65,8.93,91.72,12.44,122.42,8.94,129.89-32,179.63-29.24,59.84,6.12,73.44,2.62c7.11-1.82,12.51-13.69,12.87-27.91h-.23C702.06,581.82,637.74,579.78,576.48,601.24Z"',
                "/>",
                "</g>"
            )
        );
        return perch;
    }

    function GetTail(
        string memory color1,
        string memory color2,
        string memory color3
    ) public pure returns (string memory) {
        string memory tail = string(
            abi.encodePacked(
                '<g id="Tail">',
                "<path",
                ' style="fill:#',
                color1,
                '"',
                ' d="M627.91,787.24s12.83,18.48,16.87,19.78,8.65,3.18,14.53,1.62,9-8.46,9.14-12.54-68.36-143.88-68.81-148,3.07-23.23-.51-39.09-32.68-73.35-32.68-73.35l-31,38.68Z"',
                "/>",
                "<path",
                ' style="fill:#',
                color3,
                '"',
                ' d="M484.92,636.28s34.4,69.36,52.47,85.68,30.89,19.24,30.89,19.24,31.78,60.35,56,70.14c3.87,1.57,9.93.56,12.82-.78,2.19-1,4.16-4.42,2.72-8.54-8.54-24.47-66.25-103.13-81.22-127.08-17.48-28-52.65-90-52.65-90Z"',
                "/>",
                "<path",
                ' style="fill:#',
                color2,
                '"',
                ' d="M514.65,596.83s47.8,105.31,74.61,142.23,31.09,40.8,35,43.52,4.66,4.67,11.27,3.89,9.71-3.89,9.71-7.77-61.4-124.35-69.56-139.51-34.19-71.89-34.19-71.89Z"',
                "/>",
                '<g class="cls-6">',
                "<path",
                ' class="cls-7"',
                ' d="M591.6,636.28A23.71,23.71,0,0,0,597,633a47.42,47.42,0,0,1,3.26,4.83c.6-8,1.1-19-1.11-28.82-3.59-15.86-32.68-73.35-32.68-73.35L484.92,636.28S517,701,535.48,720.11c12.4-13.51,26.53-34.78,27-45.36C584.6,670.08,592.18,641.52,591.6,636.28Z"',
                "/>",
                "</g>",
                "</g>"
            )
        );
        return tail;
    }

    function GetFeet(string memory color) public pure returns (string memory) {
        string memory feet = string(
            abi.encodePacked(
                '<g id="feet">',
                "<path",
                ' style="fill:#',
                color,
                '"',
                ' d="M331,496.09s-6.12-1.75-8.75-6.71-3.2-14.57-7.87-16.9-25.35-2.33-30.6,1.16-2,16.62-2,16.62Z"',
                "/>",
                "<path",
                ' style="fill:#',
                color,
                '"',
                ' d="M297.81,486.18s-41-2.77-40.8,4.37-.83,23.72,1.45,28.27S289,518.7,289,518.7l-.85-13.05s-13.42-1-16.41.33c1.58-2.17.83-5.29-.5-5.87,7.61,1.77,16.89.45,16.89.45Z"',
                "/>",
                "<path",
                ' d="M297.52,528.15s5,5.24,16.61,5.24,13.12-2.33,13.12-2.33l-27.69-6.41Z"',
                "/>",
                "<path",
                ' style="fill:#',
                color,
                '"',
                ' d="M360.76,460.24s5.25,15.74-.58,22.15-12.82,14-25.06,11.66-19.82-1.17-21-5.83-5.83-8.75-10.49-7-21.16,12.2-22.3,16.76c-1.31,5.25-1,23.32,6,29.29,5.67,4.85,15.73,6,18.07,1.17,4.37-9-5.69-9.18-9.18-13.26,2.47-2.77,1-4.67.14-6.85,2-.88,5.83-3.79,5.1-6.56,14,9.76,24.92,9.76,31.92,10.35s11.8-1.32,9.47,3.93-6.56,15.88-3.64,19.38,8.74,4.67,12.24,1.75,4.81-16,8.89-21.86,7.43-7.28,11.51-12.53,12.82-22.73,12.82-32.64S360.76,460.24,360.76,460.24Z"',
                "/>",
                "<path",
                ' d="M344.89,533.67a1.89,1.89,0,0,0-2,1.54c-.47,2.51-1.41,6.62-3.55,9.46a62.23,62.23,0,0,0-4.33,6.44s11-4.82,12.94-13.36C348.65,534.52,346.53,533.77,344.89,533.67Z"',
                "/>",
                "<path",
                ' style="fill:#',
                color,
                '"',
                ' d="M373.59,545.54s-21.38-2.72-31.09-.39-16.32,10.3-16.32,10.3l32.45,3.1Z"',
                "/>",
                "<path",
                ' style="fill:#',
                color,
                '"',
                ' d="M397.29,533.49c-4.27,7.38-5.44,8.55-12.43,8.94s-21.38-3.5-27.59,1.55-24.1,22.93-24.1,27.59,9.33,8.94,10.11,7.77c.47-.7,33.62-17.56,47.41-29.14C399.67,542.66,397.29,533.49,397.29,533.49Z"',
                "/>",
                "<path",
                ' style="fill:#',
                color,
                '"',
                ' d="M391.08,499.68c1.16.78,5.05,33.81,3.49,36.92s-4.27,9.71-11.66,12.43S365,553.7,357.66,560.3s-19.82,17.88-15.94,23.32,6.61,6.22,6.61,6.22,1.55,3.49,6.61,1.16,9.32-12.82,13.21-15.54,12.45-9.47,21-10.11c10.49-.77,41.19,1.17,41.19,1.17Z"',
                "/>",
                "</g>"
            )
        );

        return feet;
    }

    function GetBody(
        string memory color0,
        string memory color1,
        string memory color2,
        string memory color3,
        string memory color4
    ) public pure returns (string memory) {
        string memory body = string(
            abi.encodePacked(
                '<g id="Body">',
                GetFeet(color4),
                "<path",
                ' d="M339.63,575.5a1.9,1.9,0,0,1-.14,2.53c-1.8,1.8-4.66,4.91-5.8,8.28a63.38,63.38,0,0,1-2.85,7.21s-2.27-11.83,3.7-18.23C336.79,572.88,338.62,574.21,339.63,575.5Z"',
                "/>",
                "<path",
                ' d="M349.48,586.61a1.9,1.9,0,0,1,.94,2.36c-.88,2.4-2.17,6.41-1.79,9.95a62,62,0,0,1,.43,7.74s-7-9.79-4.29-18.09C345.81,585.42,348,585.87,349.48,586.61Z"',
                "/>",
                "<path",
                ' style="fill:#',
                color2,
                '"',
                ' d="M579.94,604.22c0-9.91-195.86-249.49-195.86-249.49L376.64,418l-3.05,26a407.71,407.71,0,0,0,9.94,39.57c8.41,27.93,22.52,65,43.69,91.58,38.47,48.38,62.37,147.48,54.79,174.87-1.75,9.33,19.23-12.82,22.73-34.39,12.83-8.74,37.31-41.39,37.89-55.38,22.15-4.66,29.73-33.22,29.15-38.47C581.69,617,579.94,614.12,579.94,604.22Z"',
                "/>",
                "<path",
                ' style="fill:#',
                color1,
                '"',
                ' d="M377.67,399s11.66,88,54.79,114.83c33.81,57.71,70.53,86.86,92.68,92.1-24.48-30.31-28-53.62-26.23-51.29s23.81,45.17,55.29,56.82c6.41-2.62,7.67-7.27,7.67-7.27s6.9,25,23.31,33.8c8.16-49,1.75-85.1-7.57-103.17S399.24,322.67,399.24,322.67Z"',
                "/>",
                "<path",
                ' style="fill:#',
                color3,
                '"',
                ' d="M376.64,418c-6.57-36.44-14.69-86.53-11.8-97,4.67-16.9,13.41-14,15.16-32.64s-14.57-22.15-14.57-22.15-18.66-5.25-36.73,4.66-30.89,39.06-34.39,72.28,23.9,81.61,46.64,102c16.42,14.74,34.05,30.69,42.58,38.41a407.71,407.71,0,0,1-9.94-39.57Z"',
                "/>",
                "<path",
                ' style="fill:#',
                color3,
                '"',
                ' d="M329.29,217.16s-.39-25.25,16.32-31.08,35-11.27,46.24,4.66,24.87,45.47,9.33,64.12-28.76,20.6-42,16.32-29.92-21.76-29.92-21.76Z"',
                "/>",
                "<path",
                ' style="fill:#',
                color0,
                '"',
                ' d="M564.69,453.24c-8.16-19.82-17.48-32.06-26.23-40.23-8.71-33.12-19-90.37-82.56-115.75-6.66-3.57-15.92-9.77-17-17.14-1.74-11.66,7.58-15.74,9.33-43.14s-25.65-54.79-65.29-69.36-67.81,1-78.88,12.63-5,22.92-5,22.92l30.31,32.23V217.16s-.39-25.25,16.32-31.08,35-11.27,46.24,4.66,24.87,45.47,9.33,64.12c-9.13,11-17.46,16.14-25.45,17.69a18.11,18.11,0,0,1,2.14,3.17l-.29-.08s3.35,5,2,13.19c-2,11.68-14.5,25.67-18,30.34-23.9,30-25.62,106.48,17.87,151-.05-.57-.09-1.11-.13-1.66-3.87-50.19-.27-75.61,16.45-104.43-6.41,94.43,20.4,124.16,20.4,124.16l1.75-24.49,4.66,21.57s14.58-25.06,16.91-42.55c7,35,28.56,70,56,79.28-2.92-22.74-1.17-51.3-1.17-51.3s18.86,62.07,59.08,49.83c12.24,28,34.19,27.7,34.19,27.7S572.85,473.05,564.69,453.24Z"',
                "/>",
                "<path",
                ' style="fill:#',
                color4,
                '"',
                ' d="M292.76,249.42s-7.77,17.1,17.87,24.87,29.54-13.21,29.54-13.21l-12.44-24.87Z"',
                "/>",
                "<path",
                ' style="fill:#',
                color2,
                '"',
                ' d="M324.62,243.2s11.27,7.77,9.72,16.71-5.44,14.77-12.44,16.32c9.72,3.11,15.94,1.56,19.82-.39s10.49-10.49,7.39-20.59-9.33-16.32-15.55-19S324.62,243.2,324.62,243.2Z"',
                "/>",
                '<g class="cls-17">',
                "<path",
                ' class="cls-7"',
                ' d="M384.81,209a22.08,22.08,0,0,1-39.63,18.14A22.08,22.08,0,1,0,384.81,209Z"',
                "/>",
                "</g>",
                '<g class="cls-18">',
                "<path",
                ' class="cls-7"',
                ' d="M343.44,244.11a25.85,25.85,0,0,0-9.88-7.9,4.72,4.72,0,0,0-5.39.87l-.44-.87-35,13.21a15.8,15.8,0,0,0,3.06,16.47c7.62-7.33,18.11-13.14,33.84-18.27C329.19,251,338.29,249.31,343.44,244.11Z"',
                "/>",
                "</g>",
                "<path",
                ' style="fill:#',
                color4,
                '"',
                ' d="M294.31,203.17s-29.19,11.36-32.64,31.48c-3.32,19.35-4.54,36.6,7.28,53.75a1.85,1.85,0,0,0,3.24-.41c9.12-23.6,20.85-36.6,58.26-47.12C349.11,235.62,322.29,189.77,294.31,203.17Z"',
                "/>",
                "<path",
                ' style="fill:#',
                color2,
                '"',
                ' d="M295.87,198.9s-2.33,3.89-5.05,5.44c22.53,1.55,34.58,23.32,31.47,38.86-1.16,5.44,20.6-1.16,16.71-14s-12.91-25.86-22.15-30.7C308.69,194.24,303.64,195,295.87,198.9Z"',
                "/>",
                "</g>"
            )
        );

        return body;
    }
}
