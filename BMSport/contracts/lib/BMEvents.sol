pragma solidity 0.4.25;

/// @title Events used in FomoSport
contract BMEvents {

    event onGameCreated(
        uint256 indexed gameID,
        uint256 timestamp
    );

    event onGameActivated(
        uint256 indexed gameID,
        uint256 startTime,
        uint256 timestamp
    );

    event onGamePaused(
        uint256 indexed gameID,
        bool paused,
        uint256 timestamp
    );

    event onChangeCloseTime(
        uint256 indexed gameID,
        uint256 closeTimestamp,
        uint256 timestamp
    );

    event onPurchase(
        uint256 indexed gameID,
        uint256 indexed playerID,
        address playerAddress,
        bytes32 playerName,
        uint256 teamID,
        uint256 ethIn,
        uint256 keysBought,
        uint256 affID,
        uint256 timestamp
    );

    event onComment(
        uint256 indexed gameID,
        uint256 indexed playerID,
        address playerAddress,
        bytes32 playerName,
        uint256 ethIn,
        string comment,
        uint256 timestamp
    );

    event onWithdraw(
        uint256 indexed gameID,
        uint256 indexed playerID,
        address playerAddress,
        bytes32 playerName,
        uint256 ethOut,
        uint256 timestamp
    );

    event onGameEnded(
        uint256 indexed gameID,
        uint256 winningTeamID,
        string comment,
        uint256 timestamp
    );

    event onGameCancelled(
        uint256 indexed gameID,
        string comment,
        uint256 timestamp
    );

    event onFundCleared(
        uint256 indexed gameID,
        uint256 fundCleared,
        uint256 timestamp
    );
}
