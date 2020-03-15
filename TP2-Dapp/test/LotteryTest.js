let lottery;
let accounts;

beforeEach(async () => {
  accounts = await web3.eth.getAccounts();
  lottery = await new web3.eth.Contract(abi)
    .deploy({data: bytecode.object})
    .send({from: accounts[0], gas: '1000000'}});
});

describe('Lottery Contract', () => {
  it('deploys contract', () => {
    assert.ok(lottery.options.address);
  });

  it('Allows 1 account to enter', async () => {
    await lottery.methods.enter().send({
      from: accounts[0],
      value: web3.utils.toWei('0.02', 'ether')
    });

    const players = await lottery.methods.getPlayers().call({
      from: accounts[0]
    });

    assert.ok(accounts[0], players[0]);
    assert.ok(1, players.length);
  });


  it('Allows multiple accounts to enter', async () => {
    let conta = 0;
    for(let account of accounts) {
      await lottery.methods.enter().send({
        from: account,
        value: web3.utils.toWei('0.02', 'ether')
      });

      const players = await lottery.methods.getPlayers().call({
        from: account
      });

      assert.equal(account, players[conta]);
      assert.equal(conta + 1, players.length);
      conta++;
    }
  });

  it('Requires a minimun ammount to enter', async () => {
    try{
      await lottery.methods.enter().send({
        from: accounts[0],
        value: 200
      });
      assert(false);
    } cat