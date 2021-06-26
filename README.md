# Attendees TDD

Code from the EthbuildersNYC meetup event on 6-25-2021

<br/>

In this session let's write some Solidity smart contracts that manages some "attendees" for an event.

Let's build a system where:

## _Non-Admin Users can..._

-  declare their attendance!

-  get their own attendance status.

- when declaring their attendace, users submit their name to be displayed and their t-shirt size (valid options are small, medium, large, extra large, and double extra large. If no t-shirt size is provided, use "large" as the default.)


## _Admin User(s) can..._

- query for all attendee addresses

- query for all banned addresses

- ban a user

- ask if a specific address is banned or not 

<br/>

## BONUSES

Bonus 1 - Randomly Choose a Non-Banned Attendee

0.014 ETH!!

Hint: Use An Oracle /   Chainlink Provably Random  
Function


---

Bonus 2 - Give Attendees Something!

0.014ETH!!

Do an Airdrop where you give away some ERC20 / ERC721 /  ERC-whatever tokens!

Hint: Use or build something like OpenZeppelin’s  “SplitPayment”

---

Rules: it has to work, and it has to have unit tests!

First person to solve each bonus and post it EthBuildersNYC "general" channel gets the prize!

Must be posted on or before 7/9/2021!
