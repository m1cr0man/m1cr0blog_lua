-- Includes
local valua = require "valua"
local access = require "sailor.access"

-- Set access defaults
-- access.settings({default_login = 'm1cr0man', default_password = 'gamer8526'})

local admin = {}

function admin.index(page)
	if access.is_guest() then
		return page:print(access.is_guest())
	end

	return page:render("index")
end

function admin.login(page)
	-- Setup verification
	-- local verify_input = valua:new().type("string").alnum().len(3, 255)

	-- -- In this case, assume we just opened the login page
	-- if not page.POST.username then
	-- 	return page:render("login", {err = "wat"})

	-- -- Attempt login
	-- elseif
	--   not verify_input(page.POST.username)
	--   or not verify_input(page.POST.password)
	--   or not access.login(page.POST.username, page.POST.password)
	-- then
	-- 	return page:render("login", {err = select(2, access.login(page.POST.username, page.POST.password))})
	-- end

	-- return page:redirect("admin")
	if not access.is_guest() or access.login(page.POST.username, page.POST.password) then
		return page:redirect("admin")
	end
	return page:render("login")
end

function admin.logout(page)
	access.logout()
	return page:render("logout")
end

return admin
