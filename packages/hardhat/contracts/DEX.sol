// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

/**
 * @title DEX Template
 * @author stevepham.eth and m00npapi.eth
 * @notice Empty DEX.sol that just outlines what features could be part of the challenge (up to you!)
 * @dev We want to create an automatic market where our contract will hold reserves of both ETH and 🎈 Balloons. These reserves will provide liquidity that allows anyone to swap between the assets.
 * NOTE: functions outlined here are what work with the front end of this branch/repo. Also return variable names that may need to be specified exactly may be referenced (if you are confused, see solutions folder in this repo and/or cross reference with front-end code).
 */
contract DEX {
    /* ========== GLOBAL VARIABLES ========== */

    using SafeMath for uint256; //outlines use of SafeMath for uint256 variables
    IERC20 token; //instantiates the imported contract

    uint256 public totalLiquidity; //base liquidity, value above it is fee collected I guess?
    mapping(address => uint256) public liquidity;

    /* ========== EVENTS ========== */

    /**
     * @notice Emitted when ethToToken() swap transacted
     */
    event EthToTokenSwap(
        address user,
        string trade,
        uint256 inputETH,
        uint256 outputToken
    );

    /**
     * @notice Emitted when tokenToEth() swap transacted
     */
    event TokenToEthSwap(
        address user,
        string trade,
        uint256 inputToken,
        uint256 outputETH
    );

    /**
     * @notice Emitted when liquidity provided to DEX and mints LPTs.
     */
    event LiquidityProvided(
        address depositor,
        uint256 liquidityMinter,
        uint256 inputETH,
        uint256 inputToken
    );

    /**
     * @notice Emitted when liquidity removed from DEX and decreases LPT count within DEX.
     */
    event LiquidityRemoved(
        address withdrawer,
        uint256 liquidityMinter,
        uint256 outputETH,
        uint256 outputToken
    );

    /* ========== CONSTRUCTOR ========== */

    constructor(address token_addr) {
        token = IERC20(token_addr); //specifies the token address that will hook into the interface and be used through the variable 'token'
    }

    /* ========== MUTATIVE FUNCTIONS ========== */

    /**
     * @notice initializes amount of tokens that will be transferred to the DEX itself from the erc20 contract mintee (and only them based on how Balloons.sol is written). Loads contract up with both ETH and Balloons.
     * @param tokens amount to be transferred to DEX
     * @return totalLiquidity is the number of LPTs minting as a result of deposits made to DEX contract
     * NOTE: since ratio is 1:1, this is fine to initialize the totalLiquidity (wrt to balloons) as equal to eth balance of contract.
     */
    function init(uint256 tokens) public payable returns (uint256) {
        token.transferFrom(msg.sender, address(this), tokens);
        liquidity[msg.sender] = msg.value;
        totalLiquidity = address(this).balance;
        return totalLiquidity;
    }

    /**
     * @notice returns yOutput, or yDelta for xInput (or xDelta)
     * @dev Follow along with the [original tutorial](https://medium.com/@austin_48503/%EF%B8%8F-minimum-viable-exchange-d84f30bd0c90) Price section for an understanding of the DEX's pricing model and for a price function to add to your contract. You may need to update the Solidity syntax (e.g. use + instead of .add, * instead of .mul, etc). Deploy when you are done.
     */
    function price(
        uint256 xInput,
        uint256 xReserves,
        uint256 yReserves
    ) public pure returns (uint256 yOutput) {
        uint256 xInputWithFee = xInput * 997; //! 0.3% fee
        uint256 newXReserve = (xReserves * 1000) + xInputWithFee;
        yOutput = (yReserves * xInputWithFee) / newXReserve;
    }

    /**
     * @notice returns liquidity for a user.
     * NOTE: this is not needed typically due to the `liquidity()` mapping variable being public and having a getter as a result. This is left though as it is used within the front end code (App.jsx).
     * NOTE: if you are using a mapping liquidity, then you can use `return liquidity[lp]` to get the liquidity for a user.
     * NOTE: if you will be submitting the challenge make sure to implement this function as it is used in the tests.
     */
    function getLiquidity(address lp) public view returns (uint256) {}

    /**
     * @notice sends Ether to DEX in exchange for $BAL
     */
    function ethToToken() public payable returns (uint256 tokenOutput) {
        require(msg.value > 0, "Please provide some ETH");
        uint256 eth_reserve = address(this).balance - msg.value; // subtrack the eth so that eth reserver doesn't count this value
        uint256 token_reserve = token.balanceOf(address(this));
        tokenOutput = price(msg.value, eth_reserve, token_reserve);
        bool succuss = token.transfer(msg.sender, tokenOutput);
        require(succuss, "ETH to Token swap failed");
        emit EthToTokenSwap(
            msg.sender,
            "ETH to Token Swap",
            msg.value,
            tokenOutput
        );
    }

    /**
     * @notice sends $BAL tokens to DEX in exchange for Ether
     */
    function tokenToEth(uint256 tokenInput) public returns (uint256 ethOutput) {
        require(tokenInput > 0, "Please provide some tokens");
        uint256 eth_reserve = address(this).balance;
        uint256 token_reserve = token.balanceOf(address(this));
        ethOutput = price(tokenInput, token_reserve, eth_reserve);
        bool succuss = token.transferFrom(
            msg.sender,
            address(this),
            tokenInput
        );
        require(succuss, "Token to ETH swap failed");
        (bool passed, ) = msg.sender.call{value: ethOutput}("");
        require(passed, "selling failed, try again!!");
        emit TokenToEthSwap(
            msg.sender,
            "Token to ETH Swap",
            tokenInput,
            ethOutput
        );
    }

    /**
     * @notice allows deposits of $BAL and $ETH to liquidity pool
     * NOTE: parameter is the msg.value sent with this function call. That amount is used to determine the amount of $BAL needed as well and taken from the depositor.
     * NOTE: user has to make sure to give DEX approval to spend their tokens on their behalf by calling approve function prior to this function call.
     * NOTE: Equal parts of both assets will be removed from the user's wallet with respect to the price outlined by the AMM.
     */
    function deposit() public payable returns (uint256 tokensDeposited) {
        uint256 eth_reserve = address(this).balance - msg.value;
        uint256 token_reserve = token.balanceOf(address(this));

        uint256 tokenToDeposit = (msg.value * token_reserve) / eth_reserve + 1;

        require(
            token.balanceOf(msg.sender) >= tokenToDeposit,
            "Not enough token please buy some"
        );

        require(
            token.transferFrom(msg.sender, address(this), tokenToDeposit),
            "Deposit failed, try again"
        );

        totalLiquidity += msg.value;
        tokensDeposited = tokenToDeposit;
        liquidity[msg.sender] += msg.value;
        emit LiquidityProvided(
            msg.sender,
            msg.value,
            msg.value,
            tokensDeposited
        );
    }

    /**
     * @notice allows withdrawal of $BAL and $ETH from liquidity pool
     * NOTE: with this current code, the msg caller could end up getting very little back if the liquidity is super low in the pool. I guess they could see that with the UI.
     */
    function withdraw(uint256 amount)
        public
        returns (uint256 eth_amount, uint256 token_amount)
    {
        require(
            amount <= liquidity[msg.sender],
            "Could not withdraw, try lower amount"
        );

        uint256 eth_reserve = address(this).balance;
        uint256 token_reserve = token.balanceOf(address(this));

        uint256 token_stake = (amount * eth_reserve) / token_reserve;
        require(
            token.transfer(msg.sender, token_stake),
            "Token withdraw failed, try again"
        );
        (bool succuss, ) = msg.sender.call{value: amount}("");
        require(succuss, "Eth withdraw failed, try again");

        liquidity[msg.sender] -= amount;
        totalLiquidity -= amount;
        eth_amount = amount;
        token_amount = token_stake;
        emit LiquidityRemoved(msg.sender, amount, eth_amount, token_amount);
    }
}
