pragma solidity ^0.8.0;
//SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "base64-sol/base64.sol";

import "./YourLibary.sol";
import "hardhat/console.sol";

// GET LISTED ON OPENSEA: https://testnets.opensea.io/get-listed/step-two

contract YourCollectible is ERC721Enumerable, Ownable {
    using Strings for uint256;
    using Strings for uint160;
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIds;

    uint256 mintDeadline = block.timestamp + 3650 days;

    string[5][] public colorPallets;
    // bytes3[9] public backgroundColors;

    //! Properties types
    string[5] public heads;
    string[5] public eyes;
    string[5] public necks;
    string[5] public perches;

    //! Parrot Properties
    // mapping(uint256 => string) public headType;
    // mapping(uint256 => string) public eyeType;
    // mapping(uint256 => string) public neckType;
    // mapping(uint256 => string) public perchType;

    constructor() ERC721("Parrot", "PRT") {
        // heads = ["", "Floof", "Helmet", "Punk Hat", "Wizard Hat"];
        // eyes = ["Angry", "Basic Eye", "Glasses", "Monocle", "Cross"];
        // necks = [
        //     "",
        //     "Bowtie",
        //     "Checker Necktie",
        //     "Orb Pendant",
        //     "Spike Collar"
        // ];
        // perches = [
        //     "Birch Branch",
        //     "Bones",
        //     "Oka Branch",
        //     "Skateboard",
        //     "Staff"
        // ];

        colorPallets.push(["056b68", "93278f", "4d4d4d", "1756bc", "d7de21"]);
        colorPallets.push(["9b0e00", "fbcdb8", "00dbdb", "000ff0", "dd0aac"]);
        colorPallets.push(["222844", "059ca0", "1a1a1a", "9c005d", "006837"]);
        colorPallets.push(["f7f8e7", "e8fdec", "f0f0f0", "dcffc3", "eef6e2"]);
        colorPallets.push(["ffb93b", "ff4803", "acf43b", "c8a5db", "00dbdb"]);
    }

    function mintItem() public returns (uint256) {
        require(block.timestamp < mintDeadline, "DONE MINTING");
        _tokenIds.increment();

        uint256 id = _tokenIds.current();
        _mint(msg.sender, id);

        // bytes32 predictableRandom = keccak256(
        //     abi.encodePacked(
        //         blockhash(block.number - 1),
        //         msg.sender,
        //         address(this),
        //         block.chainid,
        //         id
        //     )
        // );

        // headType[id] = heads[getPalletType(id)];
        // eyeType[id] = eyes[getPalletType(id)];
        // neckType[id] = necks[getPalletType(id)];
        // perchType[id] = perches[getPalletType(id)];

        return id;
    }

    function tokenURI(uint256 id) public view override returns (string memory) {
        require(_exists(id), "!exist");

        string memory name = string(
            abi.encodePacked("Parrot #", id.toString())
        );
        string memory description = string(
            abi.encodePacked("This Cool Parrot")
        );
        string memory image = Base64.encode(bytes(generateSVGofTokenById(id)));

        // (
        //     string memory head,
        //     string memory eye,
        //     string memory neck,
        //     string memory perch
        // ) = getPropertiesById(id);

        return
            string(
                abi.encodePacked(
                    "data:application/json;base64,",
                    Base64.encode(
                        bytes(
                            abi.encodePacked(
                                '{"name":"',
                                name,
                                '","description":"',
                                description,
                                '","external_url":"https://ohpandas.com/token/',
                                id.toString(),
                                '","attributes":[{"trait_type":"head","value":"#',
                                // head,
                                // '"},{"trait_type":"eye","value":"#',
                                // eye,
                                // '"},{"trait_type":"neck","value":"#',
                                // neck,
                                // '"},{"trait_type":"perch","value":"#',
                                // perch,
                                '"}], "owner":"',
                                (uint160(ownerOf(id))).toHexString(20),
                                '","image": "',
                                "data:image/svg+xml;base64,",
                                image,
                                '"}'
                            )
                        )
                    )
                )
            );
    }

    // function generateSVGofTokenById(uint256 id) internal view returns (string memory) {
    function generateSVGofTokenById(uint256 id)
        internal
        view
        returns (string memory)
    {
        string memory svg = string(
            abi.encodePacked(
                '<svg xmlns="http://www.w3.org/2000/svg" width="300" height="300" viewBox="0 0 880 880">',
                YourLibary.GetStyle(),
                renderTokenById(id),
                "</svg>"
            )
        );
        return svg;
    }

    // properties of the token of id
    function getPropertiesById(uint256 id)
        public
        view
        returns (
            string memory head,
            string memory eye,
            string memory neck,
            string memory perch
        )
    {
        // head = headType[id];
        // eye = eyeType[id];
        // neck = neckType[id];
        // perch = perchType[id];
    }

    function getPalletType(uint256 id)
        public
        view
        returns (uint256 palletType)
    {
        bytes32 predictableRandom = keccak256(
            abi.encodePacked(
                id,
                blockhash(block.number - 1),
                msg.sender,
                address(this)
            )
        );
        palletType = uint256(uint8(predictableRandom[0])) % 5;
    }

    function getBackgroundId(uint256 id)
        public
        view
        returns (uint256 backgroundId)
    {
        bytes32 predictableRandom = keccak256(
            abi.encodePacked(
                id,
                blockhash(block.number - 1),
                msg.sender,
                address(this)
            )
        );
        backgroundId = uint256(uint8(predictableRandom[1])) % 9;
    }

    // Visibility is `public` to enable it being called by other contracts for composition.
    function renderTokenById(uint256 id) public view returns (string memory) {
        // (
        //     string memory head,
        //     string memory eye,
        //     string memory neck,
        //     string memory perch
        // ) = getPropertiesById(id);

        uint256 palletType = getPalletType(id);
        uint256 backgroundId = getBackgroundId(id);

        console.log(palletType);
        console.log(backgroundId);

        string memory render = string(
            abi.encodePacked(
                '<g class="cls-1">',
                '<g id="BGs">',
                '<rect style="fill: url(#radial-gradient-',
                backgroundId.toString(),
                ')" x="-6.2" y="-0.06" width="883.11" height="888.96" />',
                "</g>",
                '<g id="Tail">',
                YourLibary.GetTail(
                    colorPallets[0][palletType],
                    colorPallets[1][palletType],
                    colorPallets[3][palletType]
                ),
                "</g>",
                '<g id="Perch">',
                YourLibary.GetPerch(),
                "</g>",
                '<g id="Body">',
                YourLibary.GetFeet(colorPallets[4][palletType]),
                "<path",
                ' d="M339.63,575.5a1.9,1.9,0,0,1-.14,2.53c-1.8,1.8-4.66,4.91-5.8,8.28a63.38,63.38,0,0,1-2.85,7.21s-2.27-11.83,3.7-18.23C336.79,572.88,338.62,574.21,339.63,575.5Z"',
                "/>",
                "<path",
                ' d="M349.48,586.61a1.9,1.9,0,0,1,.94,2.36c-.88,2.4-2.17,6.41-1.79,9.95a62,62,0,0,1,.43,7.74s-7-9.79-4.29-18.09C345.81,585.42,348,585.87,349.48,586.61Z"',
                "/>",
                "<path",
                ' style="fill:#',
                colorPallets[2][palletType],
                '"',
                ' d="M579.94,604.22c0-9.91-195.86-249.49-195.86-249.49L376.64,418l-3.05,26a407.71,407.71,0,0,0,9.94,39.57c8.41,27.93,22.52,65,43.69,91.58,38.47,48.38,62.37,147.48,54.79,174.87-1.75,9.33,19.23-12.82,22.73-34.39,12.83-8.74,37.31-41.39,37.89-55.38,22.15-4.66,29.73-33.22,29.15-38.47C581.69,617,579.94,614.12,579.94,604.22Z"',
                "/>",
                "<path",
                ' style="fill:#',
                colorPallets[1][palletType],
                '"',
                ' d="M377.67,399s11.66,88,54.79,114.83c33.81,57.71,70.53,86.86,92.68,92.1-24.48-30.31-28-53.62-26.23-51.29s23.81,45.17,55.29,56.82c6.41-2.62,7.67-7.27,7.67-7.27s6.9,25,23.31,33.8c8.16-49,1.75-85.1-7.57-103.17S399.24,322.67,399.24,322.67Z"',
                "/>",
                "<path",
                ' style="fill:#',
                colorPallets[3][palletType],
                '"',
                ' d="M376.64,418c-6.57-36.44-14.69-86.53-11.8-97,4.67-16.9,13.41-14,15.16-32.64s-14.57-22.15-14.57-22.15-18.66-5.25-36.73,4.66-30.89,39.06-34.39,72.28,23.9,81.61,46.64,102c16.42,14.74,34.05,30.69,42.58,38.41a407.71,407.71,0,0,1-9.94-39.57Z"',
                "/>",
                "<path",
                ' style="fill:#',
                colorPallets[3][palletType],
                '"',
                ' d="M329.29,217.16s-.39-25.25,16.32-31.08,35-11.27,46.24,4.66,24.87,45.47,9.33,64.12-28.76,20.6-42,16.32-29.92-21.76-29.92-21.76Z"',
                "/>",
                "<path",
                ' style="fill:#',
                colorPallets[0][palletType],
                '"',
                ' d="M564.69,453.24c-8.16-19.82-17.48-32.06-26.23-40.23-8.71-33.12-19-90.37-82.56-115.75-6.66-3.57-15.92-9.77-17-17.14-1.74-11.66,7.58-15.74,9.33-43.14s-25.65-54.79-65.29-69.36-67.81,1-78.88,12.63-5,22.92-5,22.92l30.31,32.23V217.16s-.39-25.25,16.32-31.08,35-11.27,46.24,4.66,24.87,45.47,9.33,64.12c-9.13,11-17.46,16.14-25.45,17.69a18.11,18.11,0,0,1,2.14,3.17l-.29-.08s3.35,5,2,13.19c-2,11.68-14.5,25.67-18,30.34-23.9,30-25.62,106.48,17.87,151-.05-.57-.09-1.11-.13-1.66-3.87-50.19-.27-75.61,16.45-104.43-6.41,94.43,20.4,124.16,20.4,124.16l1.75-24.49,4.66,21.57s14.58-25.06,16.91-42.55c7,35,28.56,70,56,79.28-2.92-22.74-1.17-51.3-1.17-51.3s18.86,62.07,59.08,49.83c12.24,28,34.19,27.7,34.19,27.7S572.85,473.05,564.69,453.24Z"',
                "/>",
                "<path",
                ' style="fill:#',
                colorPallets[4][palletType],
                '"',
                ' d="M292.76,249.42s-7.77,17.1,17.87,24.87,29.54-13.21,29.54-13.21l-12.44-24.87Z"',
                "/>",
                "<path",
                ' style="fill:#',
                colorPallets[palletType][2],
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
                // ' style="fill:#',
                // colorPallets[4][palletType],
                // '"',
                ' d="M294.31,203.17s-29.19,11.36-32.64,31.48c-3.32,19.35-4.54,36.6,7.28,53.75a1.85,1.85,0,0,0,3.24-.41c9.12-23.6,20.85-36.6,58.26-47.12C349.11,235.62,322.29,189.77,294.31,203.17Z"',
                "/>",
                "<path",
                ' style="fill:#',
                colorPallets[2][palletType],
                '"',
                ' d="M295.87,198.9s-2.33,3.89-5.05,5.44c22.53,1.55,34.58,23.32,31.47,38.86-1.16,5.44,20.6-1.16,16.71-14s-12.91-25.86-22.15-30.7C308.69,194.24,303.64,195,295.87,198.9Z"',
                "/>",
                "</g>",
                '<g id="Neck">',
                YourLibary.GetNeck(),
                "</g>",
                '<g id="Head">',
                YourLibary.GetHead(),
                "</g>",
                '<g id="Eye">',
                YourLibary.GetEye(),
                "</g>",
                "</g>"
            )
        );

        return render;
    }
}
