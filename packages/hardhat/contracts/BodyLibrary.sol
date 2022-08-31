pragma solidity ^0.8.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";

// GET LISTED ON OPENSEA: https://testnets.opensea.io/get-listed/step-two

// Defining Library
library Body {
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
                " />",
                "<path",
                '     class="cls-3"',
                '     style="fill:#',
                color3,
                '"',
                '     d="M477,629.75s34.39,69.37,52.46,85.69,30.9,19.23,30.9,19.23,31.78,60.35,56,70.15c3.87,1.57,9.93.55,12.82-.78,2.19-1,4.16-4.43,2.72-8.55C623.28,771,565.57,692.36,550.6,668.42c-17.49-28-52.65-90-52.65-90Z"',
                " />",
                "<path",
                '     class="cls-4"',
                '     style="fill:#',
                color2,
                '"',
                '     d="M506.69,590.31s47.8,105.31,74.61,142.23,31.09,40.8,35,43.52,4.66,4.66,11.27,3.89,9.71-3.89,9.71-7.78-61.4-124.35-69.56-139.51-34.2-71.89-34.2-71.89Z"',
                " />",
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

    function GetFeet(string memory color) public pure returns (string memory) {
        string memory feet = string(
            abi.encodePacked(
                "<path",
                '    class="cls-8"',
                '    style="fill:#',
                color,
                '"',
                '    d="M323.5,489.56s-6.12-1.75-8.74-6.7-3.21-14.58-7.87-16.91-25.36-2.33-30.61,1.17-2,16.61-2,16.61Z"',
                "/>",
                "<path",
                '    class="cls-8"',
                '    style="fill:#',
                color,
                '"',
                '    d="M290.27,479.65s-41-2.77-40.8,4.37-.83,23.73,1.46,28.27,30.54-.11,30.54-.11l-.86-13s-13.42-1-16.4.33c1.57-2.18.83-5.29-.51-5.87,7.62,1.77,16.89.45,16.89.45Z"',
                "/>",
                "<path",
                '    d="M290,521.62s5,5.25,16.61,5.25,13.12-2.34,13.12-2.34L292,518.12Z"',
                "/>",
                "<path",
                '    class="cls-8"',
                '    style="fill:#',
                color,
                '"',
                '    d="M353.23,453.71s5.24,15.74-.59,22.15-12.82,14-25.06,11.66-19.82-1.17-21-5.83-5.82-8.74-10.49-7S275,486.9,273.81,491.45c-1.32,5.25-1,23.32,6,29.3,5.68,4.84,15.73,6,18.07,1.16,4.37-9-5.68-9.18-9.18-13.26,2.48-2.77,1-4.66.15-6.85,2-.87,5.83-3.79,5.1-6.56,14,9.77,24.92,9.77,31.91,10.35s11.8-1.31,9.47,3.94-6.55,15.88-3.64,19.38,8.74,4.66,12.24,1.75,4.81-16,8.89-21.86,7.43-7.29,11.51-12.54,12.83-22.73,12.83-32.64S353.23,453.71,353.23,453.71Z"',
                "/>",
                "<path",
                '    d="M337.35,527.14a1.91,1.91,0,0,0-2,1.55c-.46,2.51-1.41,6.62-3.55,9.46a65.12,65.12,0,0,0-4.33,6.43s11-4.82,12.94-13.35C341.12,528,339,527.25,337.35,527.14Z"',
                "/>",
                "<path",
                '    class="cls-8"',
                '    style="fill:#',
                color,
                '"',
                '    d="M366.05,539s-21.37-2.72-31.09-.39-16.32,10.3-16.32,10.3L351.09,552Z"',
                "/>",
                "<path",
                '    class="cls-8"',
                '    style="fill:#',
                color,
                '"',
                '    d="M389.76,527c-4.28,7.39-5.44,8.55-12.44,8.94s-21.37-3.5-27.59,1.56-24.09,22.92-24.09,27.59,9.32,8.93,10.1,7.77c.47-.71,33.62-17.57,47.41-29.15C392.13,536.13,389.76,527,389.76,527Z"',
                "/>",
                "<path",
                '    class="cls-8"',
                '    style="fill:#',
                color,
                '"',
                '    d="M383.54,493.16c1.16.77,5,33.8,3.5,36.91s-4.28,9.72-11.66,12.44-17.88,4.66-25.26,11.27-19.82,17.87-15.93,23.31,6.6,6.22,6.6,6.22,1.56,3.5,6.61,1.17,9.33-12.83,13.21-15.55,12.45-9.47,21-10.1c10.49-.78,41.19,1.17,41.19,1.17Z"',
                "/>",
                "<path",
                '    d="M332.1,569a1.92,1.92,0,0,1-.14,2.54c-1.81,1.8-4.67,4.9-5.8,8.27A65.15,65.15,0,0,1,323.3,587S321,575.16,327,568.77C329.26,566.35,331.08,567.68,332.1,569Z"',
                "/>",
                "<path",
                '    d="M342,580.09a1.89,1.89,0,0,1,.93,2.35c-.88,2.4-2.17,6.41-1.79,9.95a63.72,63.72,0,0,1,.44,7.75s-7-9.79-4.29-18.1C338.27,578.9,340.48,579.34,342,580.09Z"',
                "/>"
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
                GetFeet(color4),
                "<path",
                '    class="cls-9"',
                '    style="fill:#',
                color2,
                '"',
                '    d="M572.4,597.69c0-9.91-195.86-249.48-195.86-249.48l-7.43,63.21-3.06,26A407.43,407.43,0,0,0,376,477c8.41,27.93,22.52,64.95,43.69,91.57,38.47,48.39,62.37,147.48,54.79,174.88-1.75,9.32,19.24-12.83,22.74-34.39,12.82-8.75,37.3-41.39,37.88-55.38,22.16-4.66,29.73-33.23,29.15-38.47C574.15,610.51,572.4,607.6,572.4,597.69Z"',
                "/>",
                "<path",
                '    class="cls-4"',
                '    style="fill:#',
                color1,
                '"',
                '    d="M370.13,392.51s11.66,88,54.8,114.83c33.8,57.71,70.53,86.85,92.68,92.1-24.48-30.31-28-53.63-26.23-51.3s23.81,45.17,55.28,56.83c6.42-2.62,7.67-7.28,7.67-7.28s6.91,25.06,23.32,33.81c8.16-49,1.75-85.11-7.58-103.18S391.7,316.15,391.7,316.15Z"',
                "/>",
                "<path",
                '    class="cls-3"',
                '    style="fill:#',
                color3,
                '"',
                '    d="M372.46,281.75c1.75-18.65-14.57-22.15-14.57-22.15s-18.65-5.24-36.72,4.67-30.9,39.05-34.39,72.28,23.9,81.6,46.63,102C349.83,453.29,367.47,469.25,376,477,369.12,454.14,370.71,300.41,372.46,281.75Z"',
                "/>",
                "<path",
                '    class="cls-3"',
                '    style="fill:#',
                color3,
                '"',
                '    d="M321.75,210.64s-.39-25.26,16.32-31.09,35-11.27,46.25,4.66,24.87,45.47,9.32,64.12-28.75,20.6-42,16.33-29.92-21.77-29.92-21.77Z"',
                "/>",
                "<path",
                '    class="cls-2"',
                '    style="fill:#',
                color0,
                '"',
                '    d="M557.16,446.71c-8.16-19.82-17.49-32.06-26.23-40.22-8.72-33.12-19-90.37-82.56-115.75-6.67-3.57-15.93-9.77-17-17.15-1.75-11.66,7.58-15.74,9.32-43.13s-25.64-54.8-65.28-69.37-67.81,1-78.89,12.63-5.05,22.93-5.05,22.93l30.31,32.22V210.64s-.39-25.26,16.32-31.09,35-11.27,46.25,4.66,24.87,45.47,9.32,64.12c-9.13,11-17.45,16.15-25.45,17.7a17.74,17.74,0,0,1,2.14,3.17l-.29-.08s3.35,5,2,13.19c-2,11.68-14.5,25.67-18,30.33-23.9,30-25.62,106.49,17.87,151,0-.56-.08-1.1-.13-1.66-3.87-50.18-.27-75.6,16.45-104.43-6.41,94.43,20.4,124.16,20.4,124.16l1.75-24.48L415,478.78s14.57-25.07,16.9-42.56c7,35,28.56,69.95,56,79.28-2.92-22.73-1.17-51.3-1.17-51.3s18.86,62.08,59.08,49.84C558,542,580,541.73,580,541.73S565.32,466.53,557.16,446.71Z"',
                "/>",
                "<path",
                '    class="cls-8"',
                '    style="fill:#',
                color4,
                '"',
                '    d="M285.22,242.89s-7.77,17.1,17.88,24.87,29.53-13.21,29.53-13.21L320.2,229.68Z"',
                "/>",
                "<path",
                '    class="cls-9"',
                '    style="fill:#',
                color2,
                '"',
                '    d="M317.09,236.68s11.27,7.77,9.71,16.71-5.44,14.76-12.43,16.32c9.71,3.11,15.93,1.55,19.82-.39s10.49-10.49,7.38-20.6-9.33-16.32-15.54-19S317.09,236.68,317.09,236.68Z"',
                "/>",
                '<g class="cls-10">',
                "    <path",
                '        class="cls-6"',
                '        d="M377.27,202.46a22.08,22.08,0,0,1-39.63,18.14,22.08,22.08,0,1,0,39.63-18.14Z"',
                "    />",
                "</g>",
                '<g class="cls-11">',
                "    <path",
                '        class="cls-6"',
                '        d="M335.9,237.58a25.75,25.75,0,0,0-9.87-7.9,4.75,4.75,0,0,0-5.4.87l-.43-.87-35,13.21a15.8,15.8,0,0,0,3.06,16.47c7.62-7.32,18.11-13.13,33.85-18.26C321.65,244.5,330.75,242.79,335.9,237.58Z"',
                "    />",
                "</g>",
                "<path",
                '    class="cls-8"',
                '    style="fill:#',
                color4,
                '"',
                '    d="M286.78,196.65s-29.2,11.36-32.65,31.48c-3.31,19.35-4.53,36.6,7.28,53.74a1.86,1.86,0,0,0,3.25-.4c9.11-23.61,20.84-36.6,58.26-47.13C341.57,229.1,314.76,183.24,286.78,196.65Z"',
                "/>",
                "<path",
                '    class="cls-9"',
                '    style="fill:#',
                color2,
                '"',
                '    d="M288.33,192.37s-2.33,3.89-5.05,5.45c22.54,1.55,34.58,23.31,31.48,38.86-1.17,5.44,20.59-1.17,16.71-14s-12.92-25.87-22.15-30.7C301.15,187.71,296.1,188.49,288.33,192.37Z"',
                "/>"
            )
        );

        return body;
    }
}
