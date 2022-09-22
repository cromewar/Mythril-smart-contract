from threading import activeCount
from brownie import ReentrancyIssue
from scripts.helpful_scripts import get_account


def deploy_reentrancy():
    acount = get_account()
    amount = 1000000000000000000
    reentrancy = ReentrancyIssue.deploy({"from": acount})
    tx = reentrancy.deposit({"from": acount, "value": amount})
    tx.wait(1)
    print(f"The new Balance is: {reentrancy.getBalance()}")
    tx2 = reentrancy.withdraw(amount, {"from": acount})
    tx2.wait(1)
    print(f"the funds are withdrawn, new balance is: {reentrancy.getBalance()}")


def main():
    deploy_reentrancy()
