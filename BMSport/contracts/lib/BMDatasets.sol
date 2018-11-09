pragma solidity 0.4.25;

// datasets
library BMDatasets {

    struct Game {
        string name;                     // game name
        uint256 numberOfTeams;           // number of teams
        uint256 gameStartTime;           // game start time (> 0 means activated)

        bool paused;                     // game paused
        bool ended;                      // game ended
        bool canceled;                   // game canceled
        uint256 winnerTeam;              // winner team        
        uint256 withdrawDeadline;        // deadline for withdraw fund
        string gameEndComment;           // comment for game ending or canceling
        uint256 closeTime;               // betting close time
    }

    struct GameStatus {
        uint256 totalEth;                // total eth invested
        uint256 totalWithdrawn;          // total withdrawn by players
        uint256 winningVaultInst;        // current "instant" winning vault
        uint256 winningVaultFinal;       // current "final" winning vault        
        bool fundCleared;                // fund already cleared
    }

    struct Team {
        bytes32 name;       // team name
        uint256 keys;       // number of keys
        uint256 eth;        // total eth for the team
        uint256 mask;       // mask of this team
        uint256 dust;       // dust for winning vault
    }

    struct Player {
        uint256 eth;        // total eth for the game
        bool withdrawn;     // winnings already withdrawn
    }

    struct PlayerTeam {
        uint256 keys;       // number of keys
        uint256 eth;        // total eth for the team
        uint256 mask;       // mask for this team
    }

    struct PlayerComment {
        uint256 playerID;
        bytes32 playerName;
        uint256 ethIn;
        string comment;
    }
}

