note
	description: "[
	the requirements of the bank.
	multi-line
	]"
	author: "Minke Xiu copy Jackie Wang"
	date: "$Date$"
	revision: "$Revision$"
	actioin: ""

class
	ACCOUNT

create -- Declare the list of the possible features that can be used as constructors
	make

feature -- Attributes

	balance : INTEGER
			-- Return the net value of current account
			-- calculated based on "deposits" and "withdrawals"

		do
			from
				deposits.start
			until
				deposits.after
			loop
				Result := Result + deposits.item.value
				deposits.forth
			end

			from
				withdrawals.start
			until
				withdrawals.after
			loop
				Result := Result - withdrawals.item.value
				withdrawals.forth
			end
		end

	credit  : INTEGER

	deposits: LIST[TRANSACTION]
		-- history of deposits
	withdrawals: LIST[TRANSACTION]
		-- history of withdrawals


feature -- Constructor
	make (a_credit : INTEGER)
		-- Initialize an account with "a_credit" for credit and 0 for balance
		do
			-- suitable if "balance" is implementing by storage (attributes)		
--			balance := 0
			credit := a_credit - 1
			create {LINKED_LIST[TRANSACTION]} deposits.make
			create {LINKED_LIST[TRANSACTION]} withdrawals.make
		ensure
			zero_balance:
				balance = 0
			credit_properly_set:
				credit = a_credit
			empty_deposits:
				deposits.is_empty
			empty_withdrawals:
				withdrawals.count = 0

		end

feature -- Commands

	withdraw (a: INTEGER)
		-- Withdraw an amount "a" from current account.
		require
			not_too_small:
				a > 0
			--not_too_big: -- too strong!!
			--	a < balance + credit
			not_too_big:
				a <= balance + credit
		local
			t: TRANSACTION
			d: DATE
		do
			-- suitable if "balance" is implementing by storage (attributes)
--			balance := balance - a

			create d.make_now
			create t.make (a, d)
			withdrawals.extend (t)

--			-- e.g., say balance = 0, credit = 5
--			-- a = 3, then credit will become 3
--			if balance < 0 then
--				credit := -balance
--			end

		ensure
			balance_set:
				balance = old balance - a
			credit_set:
				credit = old credit
			withdrawals_extended:
				withdrawals.count = old withdrawals.count + 1
			deposits_unchanged:
				deposits.count = old deposits.count
		end

	deposit(a: INTEGER)
		-- deposit an amount "a" into current account.
		require
			not_too_small:
				a > 0
		local
			t: TRANSACTION
			d: DATE
		do
			-- suitable if "balance" is implementing by storage (attributes)
--			balance := balance + a

			create d.make_now
			create t.make (a, d)
			deposits.extend (t)
		ensure
			balance_set:
				balance = old balance + a
			credit_set:
				credit = old credit
			deposits_extended:
				deposits.count = old deposits.count + 1
			withdraws_unchanged:
				withdrawals.count = old withdrawals.count
		end

	withdraw_on_date (a: INTEGER; d: DATE)
		-- Withdraw an amount "a" from current account on date "d".
		require
			not_too_small:
				a > 0
			not_too_big:
				a <= balance + credit
		local
			t: TRANSACTION
		do
			-- suitable if "balance" is implementing by storage (attributes)
--			balance := balance - a
			create t.make (a, d)
			withdrawals.extend (t)

		ensure
			balance_set:
				balance = old balance - a
			credit_set:
				credit = old credit
			withdrawals_extended:
				withdrawals.count = old withdrawals.count + 1
			deposits_unchanged:
				deposits.count = old deposits.count
		end

feature -- Queries
	withdrawals_on(d: DATE): ARRAY[TRANSACTION]
			-- Return the list of withdraws done on date "d".
		local
			t: TRANSACTION
			i: INTEGER
		do
			create Result.make_empty

			-- to make sure when, e.g., calling Result.has(t)
			-- "t" is considered as contained in the array iff
			-- the date and value of "t" match any of the stored transactions
			-- in Result.
			Result.compare_objects
			check Result.object_comparison end
			from
				i := 1
				withdrawals.start
			until
				withdrawals.after
			loop
				t := withdrawals.item

				if t.date ~ d then
					Result.force (t, i)
					i := i + 1
				end
				withdrawals.forth
			end
		ensure
			-- for all the tr: withdrawals @ tr.date = d iff Result.has(tr)
		end

	withdrawals_today: INTEGER
			-- Return the amount of withdraws done today
		local
			today: DATE
			today_withdrawals: ARRAY[TRANSACTION]
			i : INTEGER
			t : TRANSACTION
		do
			create today.make_now
			today_withdrawals := withdrawals_on (today)
			Result := 0
			from
				i := today_withdrawals.lower
			until
				i > today_withdrawals.upper
			loop
				t := today_withdrawals[i]
				Result := Result + t.value
				i := i + 1
			end
		ensure
			state_unchanged:
				balance = old balance and credit = old credit
		end

invariant
	credit_non_negative:
		credit >= 0
	balance_not_exceeding_credit:
		balance + credit >= 0

end
