#!/usr/bin/env io

Account := Object clone do(
	balance := 0.0
	deposit := method(v,  balance = balance + v)
	show := method(write("Account balance: $", balance, "\n"))
)

"Inital: " print
Account show

"Depositing $10\n" print
Account deposit(10.0)

"Final: " print
Account show
