# TD ESGI

Documentation :  
Solidity : https://solidity.readthedocs.io/en/v0.5.16/index.html  
Remix : https://remix-ide.readthedocs.io/en/latest/
Truffle : https://www.trufflesuite.com/

## TD 1 - Solidity

Nothing to install, just go to https://remix.ethereum.org/ and start the exercises :

### Exercice 1 : Hello world

1- In remix, create an **HelloWorld.sol** smart contract that simply returns the string "Hello ESGI"

2- Create another contract **HelloWorldTest.sol** that will test the output of the **HelloWorld.sol** contract.

3- Deploy the contract on a testnet.

### Exercice 2 : Simple Storage

1- Create a **SimpleStorage.sol** smart contract that stores a number.

2- Create a **get** function that returns this number.

3- Create a **set** function that sets the number to a given value.

4- Create a **SimpleStorageTest.sol** contract that will test your getter and setter functions.

### Exercice 3 : Lottery

1- Create a **Lottery.sol** contract that stores an array of players.

2- Create an **enter** function that requires a new player to pay a participation fee and then adds him to list of players.

3- Create a **pickWinner** function that will randomly select a winner in the list of players and send him all the funds.

4- Modify the contract so only the creator of the contract can call the pickWinner function.

5- Create a **LotteryTest.sol** contract that will test your Lottery functions.

### Exercice 4 : MyToken

1- Create a **MyToken.sol** contract that will create your token. Choose a name, symbol and total supply for your token, and stores user's balances.

2- Create a **transfer** function that transfer tokens from one user to another. Make sure the sender has sufficient funds.

3- Create a **MyTokenTest.sol** contract that will test your Token transfer.

### Exercice 5 : MyToken(ERC20)

1- Modify **MyToken.sol** to import OpenZeppelin's implementation of a standard token (called ERC20) instead of your custom implementation.

2- Deploy your token on a testnet. Add your token to Metamask. Give your contract address to a collegue of your so he can add it to Metamask too. Make a transfer of token from your Metamask to his.

### Exercice 6 : MyGame(ERC721)

1- Create a **MyGame.sol** contract that imports OpenZeppelin's implementation of a standard non-fungible token (called ERC721).

2- Define a ERC721 token as an Item with a name, level and rarity.

3- Create a function **createItem** that instanciates a new Item and give it to a user.

4- Create a function **transferItem** that allows users to transfer Items between each others.

### Exercice 7 : ShipBattle(ERC721)

1- Create a **ShipBattle.sol** contract that implements ERC721. Create a ship factory that creates ships with random attributes of your choice. Create a battle function and implements it as you want. Define other functions, etc... This exercise is open-ended, develop what you want :)

Stop at 16h and proceed to the evaluation project.

### Evaluation

You have 2 hours from 16h to 18h to create a smart contract of your choice. At 18h, please send your smart contract to BETA@OCTO.com. You will then have 10 minutes to present your project. You will be evaluated on your project on a 10 points scale.

## TD 2 - Dapp

Before starting this TP, please install the following :  
VSCode : https://code.visualstudio.com/  
Node : https://nodejs.org/en/  
Git : https://git-scm.com/  
Ganache : https://www.trufflesuite.com/ganache  
Truffle : npm install -g truffle  
Chrome : https://chrome.google.com  
Metamask : https://chrome.google.com/webstore/detail/metamask/nkbihfbeogaeaoehlefnkodbefgpgknn

### Exercice 1 : Hello world

1- Install all the requirements above. For this TP, we are going to user the Truffle suite. Quickly read the website https://www.trufflesuite.com/ to understand its 3 main components : Truffle, Ganache and Drizzle

2- Install and run Ganache. Play with it a little to understand how it works. Then git clone the boilerpplate application under _TP2-Dapp_. Inside, run _npm install_ to install the truffle dependencies, then _cd app_ which is the frontend and _npm install_ again to install the frontend dependencies. In Ganache, go to Settings, then under Truffle Projects, add the current project.

Then back in Ganache, under contracts, notice the HelloWorld contract is there as **Not Deployed**
In the source code under contracts, notice the HelloWorld.sol smart contract from the previous TD in the folder **contracts**. To compile it, run **truffle compile** in the terminal.
To deploy it, run **truffle migrate --reset** in the terminal. Notice in ganache that the Current Block Number has increased and that HelloWorld now shows a deployement address. Now run the frontend from the app folder. On http://localhost:3000/ you should see your active account and balance (corresponding to first account in Ganache Accounts).

3- In **app/src/MyComponent.js**, below the active account, implement a react component to shows the return of the HelloWorld contract. For this, use Drizzle react components : https://www.trufflesuite.com/docs/drizzle/react/react-components

PS: For fast recompiling and deploying, use the concatenated command below :

```
 truffle compile && truffle migrate --reset && npm start
```

### Exercice 2 : Simple Storage

1- Copy/paste the **SimpleStorage.sol** file from the previous TP in TP1-Solidity to your app contracts. Compile and deploy it using Truffle. Check its address in Ganache.

2- In **app/src/MyComponent.js**, below the HelloWorld component, implement a react component to shows the current value held by storedData.

3- Implement a form component to call the **set** function. Notice that drizzle automatically update the frontend view when the stored data changes.

### Exercice 3 : Lottery

1- Copy/paste the **Lottery.sol** file from the previous TP in TP1-Solidity to your app contracts. Compile and deploy it using Truffle. Check its address in Ganache.

2- In **app/src/MyComponent.js**, below the SimpleStorage component, implement a react component to shows the current players.

3- Implement a form component to call the **enter** function.

4- Implement a form component to call the **enter** function as another player address.

5- Implement a form component to call the **pickWinner** function.

### Exercice 4 : MyToken(ERC20)

1- Copy/paste the **MyToken.sol** file from the previous TP in TP1-Solidity to your app contracts. Take the ERC20 implementation from OpenZepellin. Compile and deploy it using Truffle. Check its address in Ganache.

2- In **app/src/MyComponent.js**, below the Lottery component, implement a react component to shows the coin's total supply.

3- Implement a data component showing your current balance.

4- Implement a data component showing the current balance of another ganache wallet.

5- Implement a form component to call the **transfer** function.

### Exercice 5 : MyGame(ERC721)

1- Copy/paste the **MyGame.sol** file from the previous TP in TP1-Solidity to your app contracts. Take the ERC721 implementation from OpenZepellin. Compile and deploy it using Truffle. Check its address in Ganache.

2- In **app/src/MyComponent.js**, below the MyToken component, implement a react component to shows the list of items.

- Implement a form component to call the **createItem** function.

- Implement a form component to call the **transferItem** function.

### Exercice 6 : ShipBattle(ERC721)

1- Create a **ShipBattle.sol** contract that implements ERC721. Create a ship factory that creates ships with random attributes of your choice. Create a battle function and implements it as you want. Define other functions, etc... This exercise is open-ended, develop what you want :)

Stop at 16h and proceed to the evaluation project.

### Evaluation

You have 2 hours from 16h to 18h to create a Dapp of your choice. At 18h, please send your Dapp to BETA@OCTO.com. You will then have 10 minutes to present your project. You will be evaluated on your project on a 10 points scale.
