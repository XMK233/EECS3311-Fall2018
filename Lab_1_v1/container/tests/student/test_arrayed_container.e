note
	description: "Summary description for {TEST_ARRAYED_CONTAINER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TEST_ARRAYED_CONTAINER

inherit
	ES_TEST

create
	make

feature -- Collect all tests for ARRAY_CONTAINER

	make
		-- Add test cases for account
		do
			add_boolean_case (agent test_make)

			add_boolean_case (agent test_count)

			add_boolean_case (agent test_valid_index)

			add_boolean_case (agent test_get_at)
			add_violation_case_with_tag ("valid_index", agent test_get_at_precondition_violation)

			add_boolean_case (agent test_assign_at)
--			add_violation_case_with_tag ("others_unchanged", agent test_assign_at_postcondition_violation)

			add_boolean_case (agent test_insert_at)

			add_boolean_case (agent test_delete_at)

			add_boolean_case (agent test_insert_last)

			add_boolean_case (agent test_remove_first)

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

			Result := arr.count = 4
			check Result end

			Result := (arr.get_at (1) ~ "s1") and
						(arr.get_at (2) ~ "s2") and
						(arr.get_at (3) ~ "s3") and
						(arr.get_at (4) ~ "s4")
			check Result end
		end

	test_get_at : BOOLEAN
		local
			arr : ARRAYED_CONTAINER
			s : STRING
		do
			comment("test get_at feature")

			create arr.make
			arr.insert_last ("s1")
			arr.insert_last ("s2")
			arr.insert_last ("s3")
			s := arr.get_at (1)

			Result := s ~ "s1"
			check Result end

			Result := arr.count = 3
			check Result end

			Result := (arr.get_at (1) ~ "s1") and
						(arr.get_at (2) ~ "s2") and
						(arr.get_at (3) ~ "s3")
			check Result end
		end

	test_get_at_precondition_violation
		local
			arr : ARRAYED_CONTAINER
			s : STRING
		do
			comment("let's violate the precondition of get_at")

			create arr.make
			arr.insert_last ("s1")
			arr.insert_last ("s2")
			s := arr.get_at (0)
		end

	test_assign_at: BOOLEAN
		local
			arr : ARRAYED_CONTAINER
		do
			comment ("test assign_at")

			create arr.make
			arr.insert_last ("s1")
			arr.insert_last ("s2")
			arr.assign_at (1, "sx")

			Result := arr.get_at (1) ~ "sx"
			check Result end

			Result := arr.count = 2
			check Result end

			Result := arr.get_at (2) ~ "s2"
			check Result end
		end

	test_assign_at_postcondition_violation
		local
			arr : ARRAYED_CONTAINER
		do
			comment ("let's violate the post condition of assign_at: others_unchanged")

			create arr.make
			arr.insert_last ("s1")
			arr.insert_last ("s2")

			arr.assign_at (2, "s3")
		end

	test_insert_at: BOOLEAN
		local
			arr : ARRAYED_CONTAINER
		do
			comment ("test insert_at")

			create arr.make
			arr.insert_last ("s1")
			arr.insert_last ("s2")
			arr.insert_last ("s3")
			arr.insert_last ("s4")
			arr.insert_at (3, "sx")

			Result := arr.get_at (3) ~ "sx"
			check Result end

			Result := arr.count = 5
			check Result end

			Result := (arr.get_at (1) ~ "s1") and
						(arr.get_at (2) ~ "s2") and
						(arr.get_at (4) ~ "s3") and
						(arr.get_at (5) ~ "s4")
			check Result end
		end

	test_delete_at: BOOLEAN
		local
			arr : ARRAYED_CONTAINER
		do
			comment ("test delete_at")

			create arr.make
			arr.insert_last ("s1")
			arr.insert_last ("s2")
			arr.insert_last ("s3")
			arr.insert_last ("s4")
			arr.insert_last ("s5")
			arr.delete_at (3)

			Result := arr.get_at (3) ~ "s4"
			check Result end

			Result := arr.count = 4
			check Result end

			Result := (arr.get_at (1) ~ "s1") and
						(arr.get_at (2) ~ "s2") and
						(arr.get_at (3) ~ "s4") and
						(arr.get_at (4) ~ "s5")
			check Result end
		end

	test_insert_last: BOOLEAN
		local
			arr : ARRAYED_CONTAINER
		do
			comment ("test insert_last")

			create arr.make
			arr.insert_last ("s1")
			arr.insert_last ("s2")

			arr.insert_last ("s3")

			Result := arr.count = 3
			check Result end

			Result := arr.get_at (3) ~ "s3"
			check Result end

			Result := (arr.get_at (1) ~ "s1") and
						(arr.get_at (2) ~ "s2")
			check Result end
		end

	test_remove_first: BOOLEAN
		local
			arr : ARRAYED_CONTAINER
		do
			comment ("test remove_first")

			create arr.make
			arr.insert_last ("s1")
			arr.insert_last ("s2")
			arr.insert_last ("s3")
			arr.remove_first

			Result := arr.count = 2
			check Result end

			Result := (arr.get_at (1) ~ "s2") and
						(arr.get_at (2) ~ "s3")
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
