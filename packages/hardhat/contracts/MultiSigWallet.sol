pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol";
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
import "./MultiSigFactory.sol";

contract MultiSigWallet {
    using ECDSA for bytes32;
    MultiSigFactory private multiSigFactory;

    // events for contact
    event Deposit(address indexed from, uint256 amount, string message);
    event Withdraw(
        address indexed from,
        address indexed to,
        uint256 amount,
        string message
    );
    event Signer(address indexed owner, bool added);
    event UpdateMinSignature(
        address indexed owner,
        uint256 newMinSignatueCount
    );

    // external events to contact
    event ExecuteTransaction(
        address indexed owner,
        address to,
        uint256 value,
        bytes data,
        uint256 nonce,
        bytes32 txHash,
        bytes txResult
    );

    // states of contact
    uint256 public minSignature;
    mapping(address => bool) public owners;
    uint256 public chainID;
    uint256 public nonce;

    modifier contactItself() {
        require(msg.sender == address(this), "Outside caller not allowed");
        _;
    }

    modifier onlyOwner() {
        require(owners[msg.sender], "Not owner");
        _;
    }

    constructor(
        uint256 _chainID,
        address[] memory _owners,
        uint256 _minSignatue,
        address _factory
    ) payable {
        require(_minSignatue > 0, "Signature count should be greater than 0");
        multiSigFactory = MultiSigFactory(_factory);
        minSignature = _minSignatue;
        for (uint256 index = 0; index < _owners.length; index++) {
            require(
                _owners[index] != address(0),
                "Owner can't be zero address"
            );
            require(
                owners[_owners[index]] != true,
                "Already an owner of wallet"
            );
            owners[_owners[index]] = true;
            emit Signer(_owners[index], true);
        }
        chainID = _chainID;
        emit UpdateMinSignature(msg.sender, _minSignatue);
    }

    // add a new signer to wallet, only contact should call it
    function addSigner(address _address) public contactItself {
        require(_address != address(0), "Owner can't be zero address");
        require(owners[_address] != true, "Already an owner of wallet");
        owners[_address] = true;
        emit Signer(_address, true);
    }

    // remove an existing signer from wallet, only contact should call it
    function removeSigner(address _address) public contactItself {
        require(_address != address(0), "Can't be zero address");
        require(owners[_address] == true, "Not a owner of wallet");
        delete owners[_address];
        emit Signer(_address, false);
    }

    // update minimum signature required, only contact should call it
    function updateMinSignature(uint256 _newSignatureCount)
        public
        contactItself
    {
        require(
            _newSignatureCount > 0,
            "New signature count should be greater than 0"
        );
        minSignature = _newSignatureCount;
        emit UpdateMinSignature(msg.sender, _newSignatureCount);
    }

    function transferFund(address payable _receiver, uint256 _amount)
        public
        contactItself
    {
        require(address(this).balance > _amount, "Not sufficient balance");
        (bool success, ) = _receiver.call{value: _amount}("");
        require(success, "fund transfer failed");
        emit Withdraw(msg.sender, _receiver, _amount, "Fund withdrawn");
    }

    // get the tranasaction hash that needs to be executed
    function getTransactionHash(
        uint256 _nonce,
        address _to,
        uint256 _value,
        bytes memory _data
    ) public view returns (bytes32) {
        bytes32 txHash = keccak256(
            abi.encodePacked(address(this), chainID, _nonce, _to, _value, _data)
        );
        return txHash;
    }

    // recover the message signer given the hash and signed message
    function recoverSigner(bytes32 _hash, bytes memory messageSignature)
        public
        pure
        returns (address)
    {
        address signer = _hash.toEthSignedMessageHash().recover(
            messageSignature
        );
        return signer;
    }

    // execute the given transcation i.e call contract function through calldata
    function executeTransaction(
        address _to,
        uint256 _value,
        bytes memory _data,
        bytes[] memory _signatures
    ) public returns (bytes memory) {
        // get the hash of transaction i.e to, value, nonce, data
        // then get the signer from the signatues using this hash
        // one owner can sign only once
        // and then verify if the signer is owner or not
        // if the signer is owner then count the signer as valid
        // and if count of signer is greater or equal to min sinature required
        // the send the transaction to the contract
        // and if the execution goes through then increase the nonce
        require(
            owners[msg.sender] == true,
            "Only wallet owner can execute transaction"
        );
        bytes32 txHash = getTransactionHash(nonce, _to, _value, _data);
        uint256 currentTxSigners = 0;
        address duplicateCheck;
        for (uint256 index = 0; index < _signatures.length; index++) {
            address signer = recoverSigner(txHash, _signatures[index]);
            require(
                signer > duplicateCheck,
                "Duplicate signer, can't sign more than once"
            );
            duplicateCheck = signer;
            if (owners[signer]) {
                currentTxSigners += 1;
            }
        }

        require(
            currentTxSigners >= minSignature,
            "Not enough signer for this transaction, get more signer"
        );

        (bool succuss, bytes memory result) = _to.call{value: _value}(_data);

        require(succuss, "transcation execution failed");
        ++nonce;
        emit ExecuteTransaction(
            msg.sender,
            _to,
            _value,
            _data,
            nonce,
            txHash,
            result
        );
        return result;
    }

    receive() external payable {
        emit Deposit(msg.sender, msg.value, "Thanks for contribution!!");
    }

    fallback() external payable {
        emit Deposit(msg.sender, msg.value, "Thanks for contribution!!");
    }
}
