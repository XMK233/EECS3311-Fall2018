note
	description: "Test the ACCOUNT class. "
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TEST_ACCOUNT

inherit
	ES_TEST

create
	make

feature -- Collect all tests for ACCOUNT

	make
		-- Add test cases for account
		do
			add_boolean_case (agent test_account_creation)
			add_boolean_case (agent test_account_withdraw)

			-- preconditions for withdraw
			add_violation_case_with_tag ("not_too_big", agent test_account_withdraw_precondition_not_too_weak)
			add_boolean_case (agent test_account_withdraw_precondition_not_too_strong)
			--" "agent" just like a pointer in C. Using this, you can use test_account_creation just like a boolean value. "

			-- post-conditions for withdraw
			add_boolean_case (agent test_account_withdraw_postcondition_not_too_weak)

			-- specification test
			add_boolean_case (agent test_transaction_value_and_date)
		end

feature -- Test cases for ACCOUNT

	test_account_creation: BOOLEAN -- "return type"
		-- test the creation of an account
		local
			acc: ACCOUNT
			acc2: ACCOUNT

		do
			comment ("t0: test the creation of an account") -- "always to put this before test."
			-- instantiate a new ACCOUNT object using a creation instruction
			-- initial credit 10 for the new account credit
			create acc.make (10) -- initialize an object
			--"if you use "create acc.make(XX)" you initialized an object. if you don't use the "create", the you will change an existed object."
			--"you must use "create" first before you further use"
			Result := acc.balance = 0 and acc.credit = 20
			-- "In Eiffel, "Result" is return value. You can set "Result" for multiple times, but only the last one counts. The default value will be false. "
			check Result end

			create acc2.make (1000) -- initialize an object
			Result := acc2.balance = 0 and acc2.credit = 1000
			check Result end
		end

	test_account_withdraw: BOOLEAN
		-- Test the withdrawal of an account.
		local
			acc: ACCOUNT
		do
			comment("t1: test the withdraw of an account")
			create acc.make (10)
			Result := acc.balance = 0 and acc.credit = 10
			check Result end

			acc.withdraw (5)
			Result := acc.balance = -5 and acc.credit = 10
			check Result end
		end

	test_account_withdraw_precondition_not_too_weak
		-- Test to see if the precondition of
		-- withdraw is too weak,
		-- such that it allows values that can
		-- cause the violation
		-- of the invariant.
		local
			acc : ACCOUNT
		do
			comment ("t2: test if withdraw's precondition is too weak")
			create acc.make (10)
			check acc.balance = 0 and acc.credit = 10 end

			acc.withdraw(11)
		end

	test_account_withdraw_precondition_not_too_strong: BOOLEAN
		-- Test to see if the precondition of
		-- withdraw is too strong,
		-- such that it allows values that
		-- would not break the system integrity (i.e., invariant)
		local
			acc : ACCOUNT
		do
			comment ("t3: test if withdraw's precondition is too strong")
			create acc.make (10)
			Result := acc.balance = 0 and acc.credit = 10
			check Result end

			acc.withdraw(10)
			Result := acc.balance = -10 and acc.credit = 10
			check Result end
		end

	test_account_withdraw_postcondition_not_too_weak: BOOLEAN
		-- Test to see if the postcondition of
		-- withdraw is too weak,
		-- such that it tolerates a wrong implementation
		local
			acc : ACCOUNT
		do
			comment ("t4: test if withdraw's postcondition is too weak")
			create acc.make (10)
			Result := acc.balance = 0 and acc.credit = 10
			check Result end

			acc.withdraw(6)
			Result := acc.balance = -6 and acc.credit = 10
			check Result end
		end

feature -- Specification Test

	test_transaction_value_and_date: BOOLEAN
		-- Test deposit and withdraw transactions on dates.
		local
			a : ACCOUNT
			today, tomorrow: DATE
			w1, w2, w3: TRANSACTION
			today_withdrawals: ARRAY[TRANSACTION]
		do
			comment("t5: test transaction value and date")
			-- create today
			create today.make_now

			--create tommorrow
			create tomorrow.make_now
			tomorrow.day_forth

			-- initializa an account of zero credit
			create a.make (0)

			a.deposit (5500)
			a.withdraw_on_date (400, tomorrow)
			a.withdraw (1000)
			a.withdraw (4000)

			Result := a.balance = 100 and a.withdrawals_today = 5000
			check Result end

			today_withdrawals := a.withdrawals_on (today)
			Result := today_withdrawals.count = 2
			check Result end

			create w1.make (1000, today)
			create w2.make (4000, today)
			create w3.make (400, tomorrow)
			Result :=
				today_withdrawals.has (w1) and
				today_withdrawals.has (w2) and
				not today_withdrawals.has (w3)
			check Result end
		end

end
