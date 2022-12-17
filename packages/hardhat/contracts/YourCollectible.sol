pragma solidity ^0.8.0;
//SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "base64-sol/base64.sol";

import "./BodyLibrary.sol";
import "./StyleLibrary.sol";
import "hardhat/console.sol";

// GET LISTED ON OPENSEA: https://testnets.opensea.io/get-listed/step-two

abstract contract NFTContract {
    function renderTokenById(uint256 id)
        external
        view
        virtual
        returns (string memory);

    function getDescription(uint256 id)
        external
        view
        virtual
        returns (string memory);

    function transferFrom(
        address from,
        address to,
        uint256 id
    ) external virtual;

    function name() external view virtual returns (string memory);
}

contract YourCollectible is ERC721Enumerable, IERC721Receiver, Ownable {
    using Strings for uint256;
    using Strings for uint160;
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIds;

    uint256 mintDeadline = block.timestamp + 3650 days;

    mapping(uint256 => uint256) bodiesById;

    NFTContract[] public nftContracts;
    mapping(address => bool) nftContractsAvailables;
    mapping(address => mapping(uint256 => uint256)) nftById;

    // all funds go to buidlguidl.eth
    address payable public constant recipient =
        payable(0x54179E1770a780F2F541f23CB21252De12977d3c);

    uint256 public constant limit = 3728;
    uint256 public constant curve = 1002; // price increase 0,4% with each purchase
    uint256 public price = 0.001 ether;
    // the 1154th optimistic parrot cost 0.01 ETH, the 2306th cost 0.1ETH, the 3459th cost 1 ETH and the last ones cost 1.7 ETH

    mapping(uint256 => mapping(uint256 => string)) public colorPallet;

    struct ParrotMeta {
        uint256 colorIndex;
    }

    mapping(uint256 => ParrotMeta) public parrots;

    constructor() ERC721("Parrot", "PRT") {
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

        colorPallet[5][0] = "f9ba08";
        colorPallet[5][1] = "b3ff02";
        colorPallet[5][2] = "ff5e5c";
        colorPallet[5][3] = "aefffb";
        colorPallet[5][4] = "ff9d9c";

        colorPallet[6][0] = "0ecc83";
        colorPallet[6][1] = "5fa9e0";
        colorPallet[6][2] = "dd0aac";
        colorPallet[6][3] = "b3ff02";
        colorPallet[6][4] = "fbcdb8";

        colorPallet[7][0] = "ff4803";
        colorPallet[7][1] = "8cc63f";
        colorPallet[7][2] = "333";
        colorPallet[7][3] = "eef6e2";
        colorPallet[7][4] = "ff0";

        colorPallet[8][0] = "3f0606";
        colorPallet[8][1] = "9b0e00";
        colorPallet[8][2] = "231f20";
        colorPallet[8][3] = "e4e4e4";
        colorPallet[8][4] = "ffdc83";

        colorPallet[9][0] = "ff6990";
        colorPallet[9][1] = "c5f9d0";
        colorPallet[9][2] = "5cb2ff";
        colorPallet[9][3] = "fff35c";
        colorPallet[9][4] = "ffbdc0";

        colorPallet[10][0] = "00dbdb";
        colorPallet[10][1] = "ffbf40";
        colorPallet[10][2] = "fff35c";
        colorPallet[10][3] = "fde1d4";
        colorPallet[10][4] = "b1fcd6";

        colorPallet[11][0] = "9cff55";
        colorPallet[11][1] = "e5005b";
        colorPallet[11][2] = "9c005d";
        colorPallet[11][3] = "f1e8f6";
        colorPallet[11][4] = "ffb93b";

        colorPallet[12][0] = "1e0658";
        colorPallet[12][1] = "ff6990";
        colorPallet[12][2] = "1756bc";
        colorPallet[12][3] = "fff8ea";
        colorPallet[12][4] = "e5005b";

        colorPallet[13][0] = "b1b1b1";
        colorPallet[13][1] = "00dbdb";
        colorPallet[13][2] = "c5f9d0";
        colorPallet[13][3] = "ff0";
        colorPallet[13][4] = "f0f";
    }

    function addNft(address nft) public onlyOwner {
        nftContractsAvailables[nft] = true;
        nftContracts.push(NFTContract(nft));
    }

    function nftContractsCount() public view returns (uint256) {
        return nftContracts.length;
    }

    function getContractsAddress() public view returns (address[] memory) {
        address[] memory addresses = new address[](nftContracts.length);
        for (uint256 i = 0; i < nftContracts.length; i++) {
            addresses[i] = address(nftContracts[i]);
        }
        return addresses;
    }

    function mintItem() public payable returns (uint256) {
        require(block.timestamp < mintDeadline, "DONE MINTING");
        require(msg.value >= price, "NOT ENOUGH");

        price = (price * curve) / 1000;

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

        parrots[id].colorIndex = uint256(
            ((uint8(predictableRandom[3]) << 8) | uint8(predictableRandom[4])) %
                14
        );

        (bool success, ) = recipient.call{value: msg.value}("");
        require(success, "could not send");

        bodiesById[id] = id;

        return id;
    }

    function tokenURI(uint256 id) public view override returns (string memory) {
        require(_exists(id), "!exist");

        string memory name = string(
            abi.encodePacked("Parrot #", id.toString())
        );

        string memory base = string("Parrot");
        string memory image = Base64.encode(bytes(generateSVGofTokenById(id)));

        bool headFound = false;
        bool neckFound = false;
        bool eyeFound = false;
        bool perchFound = false;
        bool backgroundFound = false;
        string memory headType = "";
        string memory neckType = "";
        string memory eyeType = "";
        string memory perchType = "";
        string memory backgroundType = "";

        for (uint256 i = 0; i < nftContracts.length; i++) {
            if (nftById[address(nftContracts[i])][id] > 0) {
                string memory desc = nftContracts[i].getDescription(
                    nftById[address(nftContracts[i])][id]
                );
                string memory nftType = nftContracts[i].name();
                if (
                    keccak256(abi.encodePacked("ParrotHead")) ==
                    keccak256(abi.encodePacked(nftType))
                ) {
                    headFound = true;
                    headType = desc;
                } else if (
                    keccak256(abi.encodePacked("ParrotNeck")) ==
                    keccak256(abi.encodePacked(nftType))
                ) {
                    neckFound = true;
                    neckType = desc;
                } else if (
                    keccak256(abi.encodePacked("ParrotEye")) ==
                    keccak256(abi.encodePacked(nftType))
                ) {
                    eyeFound = true;
                    eyeType = desc;
                } else if (
                    keccak256(abi.encodePacked("ParrotPerch")) ==
                    keccak256(abi.encodePacked(nftType))
                ) {
                    perchFound = true;
                    perchType = desc;
                } else if (
                    keccak256(abi.encodePacked("ParrotBackground")) ==
                    keccak256(abi.encodePacked(nftType))
                ) {
                    backgroundFound = true;
                    backgroundType = desc;
                }
            }
        }

        string memory inBg = "";
        if (backgroundFound)
            inBg = string.concat(inBg, " in  ", backgroundType, " background");
        else inBg = string.concat(inBg, " in ugly background");

        string memory wearing = "";
        if (neckFound || headFound)
            wearing = string.concat(wearing, " wearing ");

        if (neckFound) wearing = string.concat(wearing, neckType);

        if (neckFound && headFound) wearing = string.concat(wearing, " and ");

        if (headFound) wearing = string.concat(wearing, headType);

        string memory eyes = "";
        if (eyeFound) eyes = string.concat(eyes, " with ", eyeType, " eyes");

        string memory perch = "";
        if (perchFound)
            perch = string.concat(perch, " sitting on ", perchType, " perch");

        string memory description = string(
            abi.encodePacked(base, inBg, eyes, perch, wearing)
        );

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
                                '","external_url":"https://yourCollectible.com/token/',
                                id.toString(),
                                '", "owner":"',
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
                '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="300" height="300" viewBox="0 0 880 880">',
                renderTokenById(id),
                "</svg>"
            )
        );
        return svg;
    }

    // Visibility is `public` to enable it being called by other contracts for composition.
    function renderTokenById(uint256 id) public view returns (string memory) {
        uint256 pallet = getPropertiesById(id);

        string memory color0 = colorPallet[pallet][0];
        string memory color1 = colorPallet[pallet][1];
        string memory color2 = colorPallet[pallet][2];
        string memory color3 = colorPallet[pallet][3];
        string memory color4 = colorPallet[pallet][4];

        string memory render = string(
            abi.encodePacked(
                StyleLibrary.GetStyle(),
                '<g class="cls-1">',
                '<g id="Tail">',
                BodyLibrary.GetTail(color0, color1, color3),
                "</g>",
                '<g id="Body">',
                BodyLibrary.GetBody(color0, color1, color2, color3, color4),
                "</g>",
                "</g>"
            )
        );

        for (uint256 i = 0; i < nftContracts.length; i++) {
            if (nftById[address(nftContracts[i])][id] > 0) {
                render = string(
                    abi.encodePacked(
                        render,
                        nftContracts[i].renderTokenById(
                            nftById[address(nftContracts[i])][id]
                        )
                    )
                );
            }
        }

        render = string(
            abi.encodePacked(
                render,
                '<use href="#BGs" />',
                '<use href="#Tail" />',
                '<use href="#Perch" />',
                '<use href="#Body" />',
                '<use href="#Neck" />',
                '<use href="#Head" />',
                '<use href="#Eye" />'
            )
        );

        return render;
    }

    // https://github.com/GNSPS/solidity-bytes-utils/blob/master/contracts/BytesLib.sol#L374
    function _toUint256(bytes memory _bytes) internal pure returns (uint256) {
        require(_bytes.length >= 32, "toUint256_outOfBounds");
        uint256 tempUint;

        assembly {
            tempUint := mload(add(_bytes, 0x20))
        }

        return tempUint;
    }

    function removeNftFromLoogie(address nft, uint256 id) external {
        require(
            msg.sender == ownerOf(id),
            "only the owner can undress a loogie!!"
        );
        require(this.hasNft(nft, id), "the loogie is not wearing this NFT");

        NFTContract nftContract = NFTContract(nft);
        _removeNftFromLoogie(nftContract, id);
    }

    function downgradeLoogie(uint256 id) external {
        require(
            msg.sender == ownerOf(id),
            "only the owner can downgrade a loogie!!"
        );

        // remove nft tokens from Parrot
        for (uint256 i = 0; i < nftContracts.length; i++) {
            if (nftById[address(nftContracts[i])][id] > 0) {
                _removeNftFromLoogie(nftContracts[i], id);
            }
        }

        // // transfer loogie to owner
        // bodies.transferFrom(address(this), ownerOf(id), bodiesById[id]);
        // bodiesById[id] = 0;

        // // burn Parrot
        // _burn(id);
    }

    function _removeNftFromLoogie(NFTContract nftContract, uint256 id)
        internal
    {
        nftContract.transferFrom(
            address(this),
            ownerOf(id),
            nftById[address(nftContract)][id]
        );

        nftById[address(nftContract)][id] = 0;
    }

    function hasNft(address nft, uint256 id) external view returns (bool) {
        require(nftContractsAvailables[nft], "the bodies can't wear this NFT");

        return (nftById[nft][id] != 0);
    }

    function nftId(address nft, uint256 id) external view returns (uint256) {
        require(nftContractsAvailables[nft], "the bodies can't wear this NFT");

        return nftById[nft][id];
    }

    // to receive ERC721 tokens
    function onERC721Received(
        address, /*operator*/
        address from,
        uint256 tokenId,
        bytes calldata fancyIdData
    ) external override returns (bytes4) {
        uint256 fancyId = _toUint256(fancyIdData);

        require(ownerOf(fancyId) == from, "you can only add stuff you own.");
        require(
            nftContractsAvailables[msg.sender],
            "the bodies can't wear this NFT"
        );
        require(
            nftById[msg.sender][fancyId] == 0,
            "the parrot already has this NFT!"
        );

        nftById[msg.sender][fancyId] = tokenId;

        return this.onERC721Received.selector;
    }

    // properties of the token of id
    function getPropertiesById(uint256 id)
        public
        view
        returns (uint256 pallet)
    {
        pallet = parrots[id].colorIndex;
    }
}
