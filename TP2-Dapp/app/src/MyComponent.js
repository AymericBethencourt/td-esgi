import React from "react";
import { newContextComponents } from "@drizzle/react-components";
import { Card } from "../src/ships/Card/Card.controller";

const { AccountData, ContractData, ContractForm } = newContextComponents;

export default ({ drizzle, drizzleState }) => {
  // destructure drizzle and drizzleState from props
  return (
    <div className="App">
      <div className="section">
        <h2>Active Account</h2>
        <AccountData drizzle={drizzle} drizzleState={drizzleState} accountIndex={0} units="ether" precision={3} />
      </div>
      <div className="section">
        <h2>HelloWorld</h2>
        <p>
          Return of the <b>speak</b> function:&nbsp;
          <ContractData drizzle={drizzle} drizzleState={drizzleState} contract="HelloWorld" method="speak" />
        </p>
      </div>
      <div className="section">
        <h2>SimpleStorage</h2>
        <p>
          Value of <b>storedData</b>:&nbsp;
          <ContractData drizzle={drizzle} drizzleState={drizzleState} contract="SimpleStorage" method="storedData" />
        </p>
        <p>
          Return of <b>get</b>:&nbsp;
          <ContractData drizzle={drizzle} drizzleState={drizzleState} contract="SimpleStorage" method="get" />
        </p>
        <p>
          Call function <b>set</b>
        </p>
        <ContractForm drizzle={drizzle} contract="SimpleStorage" method="set" />
      </div>
      <div className="section">
        <h2>Lottery</h2>
        <p>
          Value of <b>manager</b>:&nbsp;
          <ContractData drizzle={drizzle} drizzleState={drizzleState} contract="Lottery" method="manager" />
        </p>
        <p>
          Value of <b>players</b>:&nbsp;
          <ContractData drizzle={drizzle} drizzleState={drizzleState} contract="Lottery" method="getPlayers" />
        </p>
        <p>
          Call function <b>enter</b>
        </p>
        <ContractForm drizzle={drizzle} contract="Lottery" method="enter" sendArgs={{ value: 1000000000000000000 }} />
        <p>
          Call function <b>enter</b> as {drizzleState.accounts[1]}
        </p>
        <ContractForm
          drizzle={drizzle}
          contract="Lottery"
          method="enter"
          sendArgs={{ from: drizzleState.accounts[1], value: 1000000000000000000 }}
        />
        <p>
          Call function <b>pickWinner</b>
        </p>
        <ContractForm drizzle={drizzle} contract="Lottery" method="pickWinner" />
      </div>
      <div className="section">
        <h2>MyToken</h2>
        <p>
          <strong>Total Supply: </strong>
          <ContractData
            drizzle={drizzle}
            drizzleState={drizzleState}
            contract="MyToken"
            method="totalSupply"
            //methodArgs={[{ from: drizzleState.accounts[0] }]}
          />{" "}
          <ContractData
            drizzle={drizzle}
            drizzleState={drizzleState}
            contract="MyToken"
            method="symbol"
            hideIndicator
          />
        </p>
        <p>
          <strong>My Balance: </strong>
          <ContractData
            drizzle={drizzle}
            drizzleState={drizzleState}
            contract="MyToken"
            method="balanceOf"
            methodArgs={[drizzleState.accounts[0]]}
          />{" "}
          <ContractData
            drizzle={drizzle}
            drizzleState={drizzleState}
            contract="MyToken"
            method="symbol"
            hideIndicator
          />
        </p>
        <p>
          <strong>Balance of {drizzleState.accounts[1]}:</strong>
          <ContractData
            drizzle={drizzle}
            drizzleState={drizzleState}
            contract="MyToken"
            method="balanceOf"
            methodArgs={[drizzleState.accounts[1]]}
          />{" "}
          <ContractData
            drizzle={drizzle}
            drizzleState={drizzleState}
            contract="MyToken"
            method="symbol"
            hideIndicator
          />
        </p>
        <h3>Send Tokens</h3>
        <ContractForm
          drizzle={drizzle}
          contract="MyToken"
          method="transfer"
          labels={["To Address", "Amount to Send"]}
        />
      </div>
      <div className="section">
        <h2>My Game</h2>
        <p>
          Value of <b>getItemCount</b>
        </p>
        <ContractData
          drizzle={drizzle}
          drizzleState={drizzleState}
          contract="MyGame"
          method="getItemCount"
          //methodArgs={[{ from: drizzleState.accounts[0] }]}
        />
        <p>
          Call function <b>createItem</b>
        </p>
        <ContractForm drizzle={drizzle} contract="MyGame" method="createItem" sendArgs={{ gas: 3000000 }} />
        <p>
          Call function <b>transferItem</b>
        </p>
        <ContractForm drizzle={drizzle} contract="MyGame" method="transferItem" />
      </div>
      <div className="section">
        <h2>ShipBattle</h2>
        <p>
          Value of <b>getShipCount</b>
        </p>
        <ContractData
          drizzle={drizzle}
          drizzleState={drizzleState}
          contract="ShipBattle"
          method="getShipCount"
          //methodArgs={[{ from: drizzleState.accounts[0] }]}
        />
        <p>
          Call function <b>createShip</b>
        </p>
        <ContractForm drizzle={drizzle} contract="ShipBattle" method="createShip" sendArgs={{ gas: 3000000 }} />
        <p>
          Call function <b>transferShip</b>
        </p>
        <ContractForm drizzle={drizzle} contract="ShipBattle" method="transferShip" />
        {/* <p>
          Call function <b>getShipName(0)</b>
        </p>
        <ContractData
          drizzle={drizzle}
          drizzleState={drizzleState}
          contract="ShipBattle"
          method="getShipName"
          methodArgs={[0]}
        />
        <p>
          Call function <b>getShipCode(0)</b>
        </p>
        <ContractData
          drizzle={drizzle}
          drizzleState={drizzleState}
          contract="ShipBattle"
          method="getShipCode"
          methodArgs={[0]}
        />
        <p>
          RENDER Call function <b>getShipCode(0)</b>
        </p>
        <ContractData
          drizzle={drizzle}
          drizzleState={drizzleState}
          contract="ShipBattle"
          method="getShipCode"
          methodArgs={[0]}
          render={e => {
            console.log(e);
            return <div />;
          }}
        />
        <Card shipCode="101301" /> */}
      </div>
    </div>
  );
};
