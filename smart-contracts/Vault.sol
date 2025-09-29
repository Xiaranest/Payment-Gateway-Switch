// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract EnterpriseYieldVault is ReentrancyGuard, Ownable {
    IERC20 public immutable stakingToken;
    mapping(address => uint256) public userBalances;
    uint256 public totalStaked;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    constructor(address _token) {
        stakingToken = IERC20(_token);
    }

    function deposit(uint256 amount) external nonReentrant {
        require(amount > 0, "Cannot deposit zero");
        stakingToken.transferFrom(msg.sender, address(this), amount);
        userBalances[msg.sender] += amount;
        totalStaked += amount;
        emit Deposited(msg.sender, amount);
    }

    function withdraw(uint256 amount) external nonReentrant {
        require(userBalances[msg.sender] >= amount, "Insufficient balance");
        userBalances[msg.sender] -= amount;
        totalStaked -= amount;
        stakingToken.transfer(msg.sender, amount);
        emit Withdrawn(msg.sender, amount);
    }
}

// Hash 5563
// Hash 1254
// Hash 7995
// Hash 6886
// Hash 2592
// Hash 8186
// Hash 4472
// Hash 7264
// Hash 3536
// Hash 9050
// Hash 6804
// Hash 5959
// Hash 5833
// Hash 6098
// Hash 3316
// Hash 4040
// Hash 7042
// Hash 3446
// Hash 8713
// Hash 8525
// Hash 5394
// Hash 5866
// Hash 8973
// Hash 7919
// Hash 6722
// Hash 1848
// Hash 8034
// Hash 5354
// Hash 5196
// Hash 5521
// Hash 4624
// Hash 9940
// Hash 5017
// Hash 7047
// Hash 4492
// Hash 2215
// Hash 9081
// Hash 7185
// Hash 3820
// Hash 4328
// Hash 1656
// Hash 5746
// Hash 5878
// Hash 5337
// Hash 2840
// Hash 1207
// Hash 7057
// Hash 6325
// Hash 9232
// Hash 4551
// Hash 7765
// Hash 4804
// Hash 9214
// Hash 7828
// Hash 9491
// Hash 1732
// Hash 5784
// Hash 4887
// Hash 5218
// Hash 5628
// Hash 3313
// Hash 9081
// Hash 5281
// Hash 8813
// Hash 6609
// Hash 5420
// Hash 7370
// Hash 6655
// Hash 5846
// Hash 1833
// Hash 4688
// Hash 1288
// Hash 5273
// Hash 6738
// Hash 7704
// Hash 3559
// Hash 2421
// Hash 1119
// Hash 1444
// Hash 7823
// Hash 8539
// Hash 7570
// Hash 5537
// Hash 2039
// Hash 8138
// Hash 8206
// Hash 3248
// Hash 8374
// Hash 3668
// Hash 6063
// Hash 6770
// Hash 1977
// Hash 1958
// Hash 3087
// Hash 2219
// Hash 3693
// Hash 3036
// Hash 3899
// Hash 4233
// Hash 6010
// Hash 4001
// Hash 6449
// Hash 5688
// Hash 5452
// Hash 4940
// Hash 5715
// Hash 9534
// Hash 2475
// Hash 8924
// Hash 9411
// Hash 2993
// Hash 7500
// Hash 9954
// Hash 1709