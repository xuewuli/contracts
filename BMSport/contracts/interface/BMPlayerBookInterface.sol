pragma solidity 0.4.25;

interface BMPlayerBookInterface {
    function pIDxAddr_(address _addr) external returns (uint256);
    function pIDxName_(bytes32 _name) external returns (uint256);

    function getPlayerID(address _addr) external returns (uint256);
    function getPlayerName(uint256 _pID) external view returns (bytes32);
    function getPlayerLAff(uint256 _pID) external view returns (uint256);
    function setPlayerLAff(uint256 _pID, uint256 _lAff) external;
    function getPlayerAffT2(uint256 _pID) external view returns (uint256);
    function getPlayerAddr(uint256 _pID) external view returns (address);
    function getPlayerHasAff(uint256 _pID) external view returns (bool);
    function getNameFee() external view returns (uint256);
    function getAffiliateFee() external view returns (uint256);
    function depositAffiliate(uint256 _pID) external payable;
}

