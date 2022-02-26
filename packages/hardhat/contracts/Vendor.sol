pragma solidity 0.8.4; //Do not change the solidity version as it negativly impacts submission grading
// SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/access/Ownable.sol";
import "./YourToken.sol";

contract Vendor is Ownable {
    event BuyTokens(address buyer, uint256 amountOfETH, uint256 amountOfTokens);
    event SellTokens(
        address seller,
        uint256 amountOfToken,
        uint256 amountOfEth
    );

    YourToken public yourToken;
    uint256 public constant tokensPerEth = 100;

    constructor(address tokenAddress) {
        yourToken = YourToken(tokenAddress);
    }

    // ToDo: create a payable buyTokens() function:
    function buyTokens() public payable {
        require(msg.sender != address(0), "Zero address caller !!");
        uint256 tokenToSend = msg.value * tokensPerEth;
        yourToken.transfer(msg.sender, tokenToSend);
        emit BuyTokens(msg.sender, msg.value, tokenToSend);
    }

    // ToDo: create a withdraw() function that lets the owner withdraw ETH
    function withdraw() public {
        require(msg.sender == owner(), "Not the owner !!");
        (bool succuss, ) = msg.sender.call{value: address(this).balance}("");
        require(succuss, "withdrawal failed");
    }

    // ToDo: create a sellTokens() function:
    // function sellTokens() public {
    //     uint256 tokenToSell = yourToken.allowance(msg.sender, address(this));
    //     require(tokenToSell > 0, "First approve the sales of your token!!");
    //     sellTokens(tokenToSell);
    // }

    function sellTokens(uint256 token) public {
        uint256 sellAmount = token / tokensPerEth;
        (bool succuss, ) = msg.sender.call{value: sellAmount}("");
        require(succuss, "selling failed, try again!!");
        yourToken.transferFrom(msg.sender, address(this), token);
        emit SellTokens(msg.sender, token, sellAmount);
    }
}
