-- Includes
local valua = require "valua"
local access = require "sailor.access"
local credentials = require "conf.credentials"

-- Set credentials
access.settings({default_login = credentials.username, default_password = credentials.password})

local admin = {}

function admin.index(page)
	if access.is_guest() then
		return page:redirect("admin/login")
	end

	return page:render("index")
end

function admin.login(page)
	-- Setup verification
	local verify_input = valua:new().type("string").alnum().len(3, 255)

	-- In this case, assume we just opened the login page
	if not page.POST.username then
		return page:render("login")

	-- Attempt login
	elseif
	  not verify_input(page.POST.username)
	  or not verify_input(page.POST.password)
	  or not access.login(page.POST.username, page.POST.password)
	then
		return page:render("login", {err = select(2, access.login(page.POST.username, page.POST.password))})
	end

	return page:redirect("admin")
end

function admin.logout(page)
	access.logout()
	return page:render("logout")
end

return admin
