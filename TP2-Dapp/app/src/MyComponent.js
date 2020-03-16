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
        <p>
          Return of the <b>speak</b> function:&nbsp;
          <ContractData drizzle={drizzle} drizzleState={drizzleState} contract="HelloWorld" method="speak" />
        </p>
      </div>
    </div>
  );
};