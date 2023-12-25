// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

interface IVRC25 {
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
    event Fee(
        address indexed from,
        address indexed to,
        address indexed issuer,
        uint256 value
    );

    function decimals() external view returns (uint8);

    function totalSupply() external view returns (uint256);

    function balanceOf(address owner) external view returns (uint256);

    function issuer() external view returns (address);

    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);

    function estimateFee(uint256 value) external view returns (uint256);

    function transfer(address recipient, uint256 value) external returns (bool);

    function approve(address spender, uint256 value) external returns (bool);

    function transferFrom(
        address from,
        address to,
        uint256 value
    ) external returns (bool);
}
