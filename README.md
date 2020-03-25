# TD ESGI

Documentation :  
Solidity : https://solidity.readthedocs.io/en/v0.5.15/  
Remix (TD 1): https://remix-ide.readthedocs.io/en/latest/  
Truffle (TD 2): https://www.trufflesuite.com/

## TD 1 - Solidity

Nothing to install, just go to https://remix.ethereum.org/ and start the exercises :

### Exercice 1 : Hello world

1- In remix, create an **HelloWorld.sol** smart contract with a **speak** function that simply returns the string "Hello ESGI"

2- Create another contract **HelloWorld_test.sol** that will test the output of the **HelloWorld.sol** contract. Check how to write unit tests in Remix on https://remix-ide.readthedocs.io/en/latest/unittesting.html

3- Deploy the contract on the Javascript VM. Call the speak function.

4- Deploy the contract on the Ropsten test network using Metamask (select Injected web3 in Remix). You will need to hold a Ether balance in Ropsten to deploy. To get test Ethers, use https://faucet.ropsten.be/

### Exercice 2 : Simple Storage

1- Create a **SimpleStorage.sol** smart contract that stores a number.

2- Create a **get** function that returns this number.

3- Create a **set** function that sets the number to a given value.

4- Create a **SimpleStorage_test.sol** contract that will test your getter and setter functions.

### Exercice 3 : Lottery

1- Create a **Lottery.sol** contract that stores an array of players.

2- Create an **enter** function that requires a new player to pay a participation fee and then adds him to list of players.

3- Create a **pickWinner** function that will randomly select a winner in the list of players and send him all the funds.

4- Modify the contract so only the creator of the contract can call the pickWinner function.

5- Create a **Lottery_test.sol** contract that will test your Lottery functions.

### Exercice 4 : MyToken

1- Create a **MyToken.sol** contract that will create your token. Choose a name, symbol and total supply for your token, and stores user's balances.

2- Create a **transfer** function that transfer tokens from one user to another. Make sure the sender has sufficient funds.

3- Create a **MyToken_test.sol** contract that will test your Token transfer.

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

1- Install all the requirements above. For this TP, we are going to use the Truffle suite. Quickly read the website https://www.trufflesuite.com/ to understand its 3 main components : Truffle, Ganache and Drizzle

2- Install and run Ganache. Play with it a little to understand how it works. Then git clone the boilerpplate application under _TP2-Dapp_. Inside, run _npm install_ to install the truffle dependencies, then _cd app_ which is the frontend and _npm install_ again to install the frontend dependencies.

3- Back in Ganache, under contracts, you should see "NO PROJECTS IN WORKSPACE", click "Link truffle projects" and select the folder containing **truffle-config.js**.
In the source code under contracts, notice the HelloWorld.sol smart contract from the previous TD in the folder **contracts**. To compile it, run **truffle compile** in the terminal. Notice the HelloWorld contract now appears in Ganache under the Contracts tab as **Not Deployed**
To deploy it, run **truffle migrate --reset** in the terminal. Notice in ganache that the Current Block Number has increased and that HelloWorld now shows a deployement address. Now run the frontend from the app folder. On http://localhost:3000/ you should see your active account and balance (corresponding to first account in Ganache Accounts).

4- In **app/src/MyComponent.js**, below the active account, implement a react component to shows the return of the HelloWorld contract. For this, use Drizzle react components : https://www.trufflesuite.com/docs/drizzle/react/react-components

PS: For fast recompiling and deploying, use the concatenated command below :

```
 truffle compile && truffle migrate --reset && npm start
```

4- Dans le dossier **test**, ecrire les tests en Solidity avec truffle, puis ecrire les meme tests mais en Javascript.

### Exercice 2 : Simple Storage

1- Copy/paste the **SimpleStorage.sol** file from the previous TP in TP1-Solidity to your app contracts. Compile and deploy it using Truffle. Check its address in Ganache.

2- In **app/src/MyComponent.js**, below the HelloWorld component, implement a react component to shows the current value held by storedData.

3- Implement a form component to call the **set** function. Notice that drizzle automatically update the frontend view when the stored data changes.

4- Dans le dossier **test**, ecrire les tests en Solidity avec truffle, puis ecrire les meme tests mais en Javascript.

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

### Exercice 5 : ShipBattle(ERC721)

1- Copy/paste the **ShipBattle.sol** file from the previous TP in TP1-Solidity to your app contracts. Take the ERC721 implementation from OpenZepellin. Compile and deploy it using Truffle. Check its address in Ganache.

2- In **app/src/MyComponent.js**, below the MyToken component, implement a react component to shows the list of items.

3- Implement a form component to call the **createShip** function.

4- Implement a form component to call the **transferShip** function.

5- Display the number of created ships from **getShipCount**

6- Display the LATEST CREATED ship name using **getShipName**. Notice the componant craches if there is no ship created yet. For this, you need to modify the **render** method of **getShipCount** in question 5 in order to display **getShipName** only if there is at least one ship created.

7- Display the LATEST CREATED ship attributes code using **getShipCode**

8- Display the LATEST CREATED ship illustration using the provided custom react component `<Card shipCode={shipCode} />` where shipCode is string representing the non-fungible token, such as "112343" or "001342".

9- Continue adding functions of your choice to the smart contract and to the Dapp. There is a simple example of ships battle. Maybe implement it in the Dapp with an illustration, or modify the battle so that the winner wins attributes and the looser looses attributes, etc... This exercise is open-ended, develop what you want :)

Stop at 16h and proceed to the evaluation project.

### Evaluation

You have 2 hours from 16h to 18h to create a Dapp of your choice. At 18h, please send your Dapp to BETA@OCTO.com. You will then have 10 minutes to present your project. You will be evaluated on your project on a 10 points scale.
