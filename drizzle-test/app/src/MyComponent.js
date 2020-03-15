import React from "react";
import { newContextComponents } from "@drizzle/react-components";

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
        <p>Hello World</p>
        <p>
          <strong>Stored Value: </strong>
          <ContractData drizzle={drizzle} drizzleState={drizzleState} contract="HelloWorld" method="speak" />
        </p>
      </div>

      <div className="section">
        <h2>SimpleStorage</h2>
        <p>This shows a simple ContractData component with no arguments, along with a form to set its value.</p>
        <p>
          <strong>Stored Value: </strong>
          <ContractData drizzle={drizzle} drizzleState={drizzleState} contract="SimpleStorage" method="storedData" />
        </p>
        <ContractForm drizzle={drizzle} contract="SimpleStorage" method="set" />
      </div>

      <div className="section">
        <h2>Lottery</h2>
        <p>Lottery contract</p>
      </div>

      <div className="section">
        <h2>MyToken</h2>
        <p>
          Here we have a form with custom, friendly labels. Also note the token symbol will not display a loading
          indicator. We've suppressed it with the <code>hideIndicator</code> prop because we know this variable is
          constant.
        </p>
        <p>
          <strong>Total Supply: </strong>
          <ContractData
            drizzle={drizzle}
            drizzleState={drizzleState}
            contract="MyToken"
            method="totalSupply"
            methodArgs={[{ from: drizzleState.accounts[0] }]}
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
        <p>My Game</p>
      </div>
    </div>
  );
};
