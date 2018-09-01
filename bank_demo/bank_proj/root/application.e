note
	description: "bank_proj application root class"
	date: "Aug 31 2018"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ES_SUITE

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			add_test (create {TEST_ACCOUNT}.make) -- "initialize and use a object at the same time."

			show_browser
			run_espec
		end

end
