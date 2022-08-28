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

    mapping(uint256 => mapping(uint256 => string)) public colorPallet;

    struct ParrotMeta {
        uint256 bgIndex;
        uint256 colorIndex;
        uint256 headIndex;
        uint256 neckIndex;
        uint256 eyeIndex;
        uint256 perchIndex;
    }

    mapping(uint256 => ParrotMeta) public parrots;

    //! Properties types
    string[5] public heads;
    string[5] public eyes;
    string[5] public necks;
    string[5] public perches;

    constructor() ERC721("Parrot", "PRT") {
        heads = ["", "floof", "punk hat", "wizard hat", "helmet"];
        eyes = ["red", "glasses", "angry", "monocle", "cross"];
        necks = ["", "bow tie", "spike collar", "amulet", "ska tie"];
        perches = [
            "birch branch",
            "oka branch",
            "bones",
            "staff",
            "skateboard"
        ];

        //   056b68 9b0e00 222844 f7f8e7 ffb93b   -- set 1

        //   93278f fbcdb8 059ca0 e8fdec ff4803   -- set 2

        //   4d4d4d 00dbdb 1a1a1a f0f0f0 acf43b   -- set 3

        //   1756bc 000ff0 9c005d dcffc3 c8a5db   -- set 4

        //   d7de21 dd0aac 006837 eef6e2 00dbdb   -- set 5

        colorPallet[0][0] = "056b68";
        colorPallet[0][1] = "9b0e00";
        colorPallet[0][2] = "222844";
        colorPallet[0][3] = "f7f8e7";
        colorPallet[0][4] = "ffb93b";

        colorPallet[1][0] = "93278f";
        colorPallet[1][1] = "fbcdb8";
        colorPallet[1][2] = "059ca0";
        colorPallet[1][3] = "e8fdec";
        colorPallet[1][4] = "ff4803";

        colorPallet[2][0] = "4d4d4d";
        colorPallet[2][1] = "00dbdb";
        colorPallet[2][2] = "1a1a1a";
        colorPallet[2][3] = "f0f0f0";
        colorPallet[2][4] = "acf43b";

        colorPallet[3][0] = "1756bc";
        colorPallet[3][1] = "000ff0";
        colorPallet[3][2] = "9c005d";
        colorPallet[3][3] = "dcffc3";
        colorPallet[3][4] = "c8a5db";

        colorPallet[4][0] = "d7de21";
        colorPallet[4][1] = "dd0aac";
        colorPallet[4][2] = "006837";
        colorPallet[4][3] = "eef6e2";
        colorPallet[4][4] = "00dbdb";
    }

    function mintItem() public returns (uint256) {
        require(block.timestamp < mintDeadline, "DONE MINTING");
        _tokenIds.increment();

        uint256 id = _tokenIds.current();
        _mint(msg.sender, id);

        bytes32 predictableRandom = keccak256(
            abi.encodePacked(
                id,
                blockhash(block.number - 1),
                msg.sender,
                address(this)
            )
        );

        parrots[id].bgIndex = uint256((uint8(predictableRandom[0])) % 5);
        parrots[id].colorIndex = uint256((uint8(predictableRandom[1])) % 5);
        parrots[id].headIndex = uint256((uint8(predictableRandom[2])) % 5);
        parrots[id].neckIndex = uint256((uint8(predictableRandom[3])) % 5);
        parrots[id].eyeIndex = uint256((uint8(predictableRandom[4])) % 5);
        parrots[id].perchIndex = uint256((uint8(predictableRandom[5])) % 5);

        return id;
    }

    // Visibility is `public` to enable it being called by other contracts for composition.
    function renderTokenById(uint256 id) public view returns (string memory) {
        uint256 head = parrots[id].headIndex;
        uint256 eye = parrots[id].eyeIndex;
        uint256 neck = parrots[id].neckIndex;
        uint256 perch = parrots[id].perchIndex;
        uint256 palletType = parrots[id].colorIndex;
        uint256 backgroundId = parrots[id].bgIndex;

        string memory color0 = colorPallet[palletType][0];
        string memory color1 = colorPallet[palletType][1];
        string memory color2 = colorPallet[palletType][2];
        string memory color3 = colorPallet[palletType][3];
        string memory color4 = colorPallet[palletType][4];

        string memory render = string(
            abi.encodePacked(
                '<g class="cls-1">',
                '<g id="BGs">',
                '<rect style="fill: url(#radial-gradient-',
                backgroundId.toString(),
                ')" x="-6.2" y="-0.06" width="883.11" height="888.96" />',
                "</g>",
                '<g id="Tail">',
                YourLibary.GetTail(color0, color1, color3),
                "</g>",
                '<g id="Perch">',
                YourLibary.GetPerch(perch),
                "</g>",
                '<g id="Body">',
                YourLibary.GetBody(color0, color1, color2, color3, color4),
                "</g>",
                '<g id="Neck">',
                YourLibary.GetNeck(neck),
                "</g>",
                '<g id="Head">',
                YourLibary.GetHead(head),
                "</g>",
                '<g id="Eye">',
                YourLibary.GetEye(eye),
                "</g>",
                "</g>"
            )
        );

        return render;
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

    function tokenURI(uint256 id) public view override returns (string memory) {
        require(_exists(id), "!exist");

        (
            string memory head,
            string memory neck,
            string memory eye,
            string memory perch
        ) = getPropertiesById(id);

        string memory name = string(
            abi.encodePacked("Parrot #", id.toString())
        );

        string memory wearing = "";
        if (
            keccak256(abi.encodePacked(neck)) !=
            keccak256(abi.encodePacked("")) ||
            keccak256(abi.encodePacked(head)) != keccak256(abi.encodePacked(""))
        ) wearing = string.concat(wearing, "wearing");

        if (
            keccak256(abi.encodePacked(neck)) != keccak256(abi.encodePacked(""))
        ) wearing = string.concat(wearing, neck, " and ");

        if (
            keccak256(abi.encodePacked(head)) != keccak256(abi.encodePacked(""))
        ) wearing = string.concat(wearing, head);

        string memory description = string(
            abi.encodePacked(
                " Parrot with ",
                eye,
                " eyes sitting on ",
                perch,
                " perch ",
                wearing
            )
        );
        string memory image = Base64.encode(bytes(generateSVGofTokenById(id)));

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
                                '","attributes":[{"trait_type":"head","value":"',
                                head,
                                '"},{"trait_type":"neck","value":"',
                                neck,
                                '"},{"trait_type":"eye","value":"',
                                eye,
                                '"},{"trait_type":"perch","value":"',
                                perch,
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

    // properties of the token of id
    function getPropertiesById(uint256 id)
        public
        view
        returns (
            string memory head,
            string memory neck,
            string memory eye,
            string memory perch
        )
    {
        head = heads[parrots[id].headIndex];
        neck = necks[parrots[id].neckIndex];
        eye = eyes[parrots[id].eyeIndex];
        perch = perches[parrots[id].perchIndex];
    }
}
