note
	description: "Summary description for {TEST_ARRAYED_CONTAINER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TEST_ARRAYED_CONTAINER

inherit
	ES_TEST

feature -- Collect all tests for ARRAY_CONTAINER

	make
		-- Add test cases for account
		do
			add_boolean_case (agent test_make)
			add_boolean_case (agent test_count)
			add_boolean_case (agent test_valid_index)
--			add_boolean_case (agent test_account_creation)
--			add_violation_case_with_tag ("not_too_big", agent test_account_withdraw_precondition_not_too_weak)
		end
----
feature -- Test cases for ACCOUNT
	test_make: BOOLEAN
		local
			arr : ARRAYED_CONTAINER
		do
			comment("test the creation of an array_container")
			create arr.make
			Result := arr.count = 0
			check Result end
		end

	test_count: BOOLEAN
		local
			arr : ARRAYED_CONTAINER
		do
			comment("test the counting feature")

			create arr.make
			arr.insert_last ("s1")
			arr.insert_last ("s2")
			arr.insert_last ("s3")
			arr.insert_last ("s4")

			Result := arr.count = 4
			check Result end
		end

	test_valid_index: BOOLEAN
		local
			arr : ARRAYED_CONTAINER
		do
			comment("test valid_index feature")

			create arr.make
			arr.insert_last ("s1")
			arr.insert_last ("s2")
			arr.insert_last ("s3")
			arr.insert_last ("s4")

			Result := (not arr.valid_index (0)) and
						arr.valid_index (1) and
						arr.valid_index (2) and
						arr.valid_index (3) and
						arr.valid_index (4) and
					   (not arr.valid_index (5))
			check Result end
		end

--	test_account_creation: BOOLEAN -- "return type"
--		-- test the creation of an account
--		local
--			acc: ACCOUNT
--			acc2: ACCOUNT

--		do
--			comment ("t0: test the creation of an account")
--			-- instantiate a new ACCOUNT object using a creation instruction
--			-- initial credit 10 for the new account credit
--			create acc.make (10) -- initialize an object
--			Result := acc.balance = 0 and acc.credit = 20
--			check Result end
--		end

--	test_account_withdraw_precondition_not_too_weak
--			-- Test to see if the precondition of
--			-- withdraw is too weak,
--			-- such that it allows values that can
--			-- cause the violation
--			-- of the invariant.
--		local
--			acc : ACCOUNT
--		do
--			comment ("t2: test if withdraw's precondition is too weak")
--			create acc.make (10)
--			check acc.balance = 0 and acc.credit = 10 end

--			acc.withdraw(11) -- in this place the precondition is violated.
--		end

end
