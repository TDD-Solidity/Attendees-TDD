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

