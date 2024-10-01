# Aiken

Resources:
- https://github.com/aiken-lang/awesome-aiken


## https://aiken-lang.org/fundamentals/eutxo Thesises

- Technically speaking, an input's "serial number" is the hash digest of the transaction that emitted the output it refers to and the position of the output within that transaction
- You will often need to convert back-and-forth between bech32-encoded strings and hex-encoded strings. A great command-line tool for working with bech32 can be found at [input-output-hk/bech32](https://github.com/input-output-hk/bech32#bech32-command-line). Use it!
- asymmetric cryptography - where one generates credentials as a public (verification) and private (signing) key pair.
- In the address, we store only a hash digest of the verification key for conciseness and to avoid revealing it too early (even though it is public material).

### Output Consists of

- Quantity of Assets
- Condition of spending. Either:
  - a verification key hash digest; or
  - a script hash digest.

### Two ways of spending

1. When spending from an address, one must reveal the public key and show a signature of the entire transaction as witnesses (a.k.a proofs)
2. Similarly to the first form, the entire script must be provided as a witness by any transaction spending from a script address, as well as any other elements required by the script.


### Stake

In Cardano, the stake can be delegated to registered entities called stake pools. By delegating, one indicates that the stake associated with an output should be counted as if it belonged to the delegatee, increasing their chance of producing a block. In return, the delegatee agrees to share a portion of their block-producing rewards with the delegator.

While the payment credentials control how to spend an output, delegation credentials control two separate operations:

- how to publish a delegation certificate (e.g. to delegate stake to a stake pool);
- how to withdraw rewards associated with the stake credentials.

Like payment credentials, delegation credentials comes in two forms: as verification key hash digest or as script hash digest.

## Datum & Redeemer

**Datum:** We mentioned the datum earlier without calling it a datum when we said that outputs contained a value, an address and a data payload. This is what the datum is, a free payload that developers can use to attach data to script execution. When a script is executed in a spending scenario, it receives not only the transaction as context but also the datum associated with the output being spent.

**Redeemer:** this is a piece of data attached to the spending input. This is typically used to provide an input to the script from the spender. For example, your validator can use a function to 'apply' the redeemer contents to the datum and verify that it gets the same result as what the output UTXO datum is set to.

**Context:** this is a piece of data that represents information about the spending transaction. This is used to make assertions about the way the output is being sent (such as “Bob signed it”).

A datum is set when the output is created. In contrast, the redeemer is provided only when spending the output. Datums act as local states, and redeemers are user inputs provided in the transaction itself.

Links:
- https://developers.cardano.org/docs/smart-contracts/


## Script

### Purpose

- `spend` UTxOs
- `publish`: control the publication of delegation certificates
- `withdraw`: How to withdraw consensus rewards
- `mint`. The mint purpose refers to scripts that are executed to validate whether user-defined assets can be minted (i.e. created) or burned (i.e. destroyed). The rules that govern the creation or destruction of an asset are defined as a script. We often refer to such scripts as minting policies.

Each purpose, therefore, indicates for what purpose a script is being executed. During validation, that information is passed to the script alongside the transaction and the redeemer. Note that only scripts executed with the spend purpose are given a datum. This is because they can leverage the data payload present in outputs, unlike the other purposes that do not get this opportunity.

