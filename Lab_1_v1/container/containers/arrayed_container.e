note
	description: "A linear container implemented via an array."
	author: "Jackie and You"
	date: "$Date$"
	revision: "$Revision$"

class
	ARRAYED_CONTAINER

create
	make

feature {NONE} ----------------------------------- Implementation of container via an array

	imp : ARRAY[STRING]

feature ------------------------------------------------------------------------- Queries

	count: INTEGER --Done-- -- Your task
	  -- Number of items currently stored in the container.
      -- It is up to you to either implement 'count' as an attribute,
      -- or to implement 'count' as a query (uniform access principle).
	do
		Result := imp.count
	end

	valid_index (i: INTEGER): BOOLEAN
			-- Is 'i' a valid index of current container?
		do
			-- Your task --done
			Result := i >= imp.lower and i <= imp.upper

		ensure
			size_unchanged:  -- Your task  --done
				imp.count = (old imp.twin).count
			result_correct:  -- Your task  --done
				--(not (i < imp.lower)) and (not (i > imp.upper))
				not (i < imp.lower or i > imp.upper)
			no_elements_changed: -- Your task --done --problematic
				across
					1 |..| imp.count as j
				all
					j.item = j.item implies imp [j.item] ~ (old imp.twin) [j.item]
				end
		end

	get_at (i: INTEGER): STRING
			-- Return the element stored at index 'i'.
		require
			valid_index: -- Your task --done -- problematic
				valid_index(i)
		do
			-- Your task --done
			Result := imp.item (i)
		ensure
			size_unchanged:  -- Your task --done
				imp.count = (old imp.twin).count
			result_correct: True -- Your task -- unknown
			no_elements_changed:  -- Your task --done
				across
					1 |..| imp.count as j
				all
					j.item = j.item implies imp [j.item] ~ (old imp.twin) [j.item]
				end
		end

feature ---------------------------------------------------------------- Constructors

	make
			-- Initialize an empty container.
		do
			-- This implementation is correct, just given to you.
			create {ARRAY[STRING]} imp.make_empty
		ensure
			empty_container: --Done-- -- Your task
				imp.is_empty
		end


feature ----------------------------------------------------------- Commands

	assign_at (i: INTEGER; s: STRING)
			-- Change the value at position 'i' to 's'.
		require
			valid_index: True -- Your task
		do
			imp [i] := s
			-- Uncomment this to produce a wrong implementation
--			if i > 1 then
--				imp [1] := s
--			end
		ensure
			size_unchanged: imp.count = (old imp.twin).count
			item_assigned: imp [i] ~ s
			others_unchanged:
				across
					1 |..| imp.count as j
				all
					j.item /= i implies imp [j.item] ~ (old imp.twin) [j.item]
				end
		end

	insert_at (i: INTEGER; s: STRING)
			-- Insert value 's' into index 'i'.
		require
			valid_index: True -- Your task
		do
			-- Your task
		ensure
			size_changed: True -- Your task
			inserted_at_i: True -- Your task
			left_half_the_same: True -- Your task
			right_half_the_same: True -- Your task
		end

	delete_at (i: INTEGER)
			-- Delete element stored at index 'i'.
		require
			valid_index: True -- Your task
		do
			-- Your task
		ensure
			size_changed: True -- Your task
			left_half_the_same: True -- Your task
			right_half_the_same: True -- Your task
		end

	insert_last (s: STRING)
			-- Insert 's' as the last element of the container.
		do
			-- Your task
		ensure
			size_changed: True -- Your task
			last_inserted: True -- Your task
			others_unchanged: True -- Your task
		end

	remove_first
			-- Remove first element from the container.
		require
			not_empty: True -- Your task
		do
			-- Your task
		ensure
			size_changed: True -- Your task
			others_unchanged: True -- Your task
		end

invariant
	-- Size of container and size of implementation array always match.
	consistency: imp.count = count
end
