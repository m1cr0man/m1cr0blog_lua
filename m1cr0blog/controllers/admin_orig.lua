-- Includes
local access = require "sailor.access"
local valua = require "valua"
local sailor = require "sailor"

-- Set access defaults
access.settings({default_login = 'm1cr0man', default_password = 'gamer8526'})

local admin = {}

function admin.index(page)
	page:send(require("pl.pretty").write(sailor.r.headers_out))
	if access.is_guest() then
		page:redirect("admin/login")
		return 403
	end

	page:render("index")
	return 200
end

function admin.login(page)
	-- Setup verification
	local verify_input = valua:new().type("string").alnum().len(3, 255)

	-- In this case, assume we just opened the login page
	if not page.POST.username then
		page:render("login")
		return 400

	-- Attempt login
	elseif
	  not verify_input(page.POST.username)
	  or not verify_input(page.POST.password)
	  or not access.login(page.POST.username, page.POST.password)
	then
		page:render("login", {err = select(2, access.login(page.POST.username, page.POST.password))})
		return 400
	end

	page:redirect("admin")
	-- page:render("login", {err = require("pl.pretty").write(sailor.r)})
	return 200
end

function admin.logout(page)
	access.logout()
	page:render("logout")
	return 200
end

return admin
