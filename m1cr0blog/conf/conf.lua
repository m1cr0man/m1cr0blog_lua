local conf = {
	sailor = {
		app_name = 'm1cr0blog',
		default_static = nil, -- If defined, default page will be a rendered lp as defined.
							  -- Example: 'maintenance' will render /views/maintenance.lp
		default_controller = 'posts',
		default_action = 'index',
		theme = 'pure',
		layout = 'main',
		route_parameter = 'r',
		default_error404 = 'error/404',
		enable_autogen = false,
		friendly_urls = true,
		max_upload = 1024 * 1024 * 10,
		environment = "development",
		hide_stack_trace = false
	},

	db = {
		development = {
			driver = '',
			host = '',
			user = '',
			pass = '',
			dbname = ''
		}
	},

	smtp = {
		server = '',
		user = '',
		pass = '',
		from = ''
	},

	lua_at_client = {
		vm = "starlight", -- starlight is default. Other options are moonshine, lua51js and luavmjs. They need to be downloaded.
	},

	debug = {
		inspect = false
	}
}

return conf
