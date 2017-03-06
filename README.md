# Bank Tech Test

This is a mock test test, introduced by Makers Academy during the week of the course. The test is suggesting to write a program that will perform simple operations with a bank account.

#### Requirements

* User is able to interact with the code via a REPL;
* Deposits, withdrawals;
* Account statement (date, amount, balance) printing;
* Data to be stored in memory (no need to have a database).

#### Acceptance Criteria

**Given** a client makes a deposit of 1000 on 10-01-2012
**And** a deposit of 2000 on 13-01-2012
**And** a withdrawal of 500 on 14-01-2012
**When** she prints her bank statement
**Then** she would see:

```
date       || credit || debit   || balance
14/01/2012 ||        || 500.00  || 2500.00
13/01/2012 || 2000.00||         || 3000.00
10/01/2012 || 1000.00||         || 1000.00
```

## Run / installation instructions
#### Getting started

```
$ git clone git@github.com:kateloschinina/bank_tech_test.git
$ bundle
```

#### Usage

[TBD]

#### Running tests

[TBD]

## About the program
#### User Stories
```
As a client of a bank,
So that I can put money on my bank account
I would like to be able to deposit my account.
```
```
As a client of a bank,
So that I can get some money from my bank account
I would like to be able to make a withdrawal from my account.
```
```
As a client of a bank,
So that I know what was going on with my account
I would like to be able to print my bank statement, that will show all my transactions, dates of these transactions, and track my balance.
```
```
As a client of a bank,
So that I can focus on the latest transactions
I want bank statement to show my transactions in reverse chronological order.
```
#### Domain model diagram

```
    Client           Account           Transaction              Printer
-------------------------------------------------------------------------------
(1) ------deposit------>|
                        |------create------->|
                                             |
                        |<-credit_to_balance-|
    <------confirm------|

(2) ------withdraw----->|
                        |------create------->|
                                             |
                        |<-debit_from_balance-|             
    <------confirm------|

(3) -----------------------------print----------------------------->|
                                                                    |
                        |<-------------get_transactions-------------|
                        |
                        |-------------------sort------------------->|
                                                                    |
    <----------------------output_transactions----------------------|

```

#### Edge cases

[TBD]

#### Usage examples

[TBD]
