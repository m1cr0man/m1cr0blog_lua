-- Includes
local json = require "dkjson"
local date = require "pl.Date"
local path = require "pl.path"
local file = require "pl.file"

local post = {}
local blogs_path = path.join("..", "pub", "blogs.json")

local function load_existing_data()
	if path.exists(blogs_path) then
		return json.decode(file.read(blogs_path))
	end
	return {}
end

function post.get_all()
	return load_existing_data()
end

function post.create(title, textbody)

	-- Load any existing blog data
	local data = load_existing_data()

	-- Append the new blog post
	-- Get the date in ISO 8601 format
	local timestamp = tostring(date())
	table.insert(data, 1, {
		timestamp = timestamp,
		textbody = textbody,
		folder_id = #data + 1,
		title = title
	})

	-- Write the new data
	file.write(blogs_path, json.encode(data))

	return true
end

function post.update(title, textbody, id)

	-- Load any existing blog data
	local data = load_existing_data()

	-- Update the blog post, preserve the date
	data[id].textbody = textbody
	data[id].title = title

	-- Write the new data
	file.write(blogs_path, json.encode(data))

	return true
end

function post.remove(id)

	-- Load any existing blog data
	local data = load_existing_data()

	-- Remove the blog post, but without shifting other elements
	data[id] = nil

	-- Write the new data
	file.write(blogs_path, json.encode(data))

	return true
end

return post
