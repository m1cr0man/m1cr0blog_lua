-- Includes
local post = require "../models/post"

local posts = {}

function posts.index(page)
	-- Get all blog posts from the DB
    page:render("index", {blog_posts = post.get_all()})
	return 200
end

function posts.add(page)
	page:render("post_add")
	return 200
end

function posts.create(page)
	-- Stop if there's no data
	if #page.POST < 1 or not page.POST.body then
		page:redirect("/admin/posts/add", {err = "Invalid request"})
		return 400
	end

	-- Add the post
	post.create(page.POST.body)

	page:redirect("/admin/posts")

	return 200
end

function posts.delete(page)
	-- Stop if there's no data
	if #page.GET < 1 or not page.POST.id then
		page:redirect("/admin/posts", {err = "Invalid request"})
		return 400
	end

	-- Add the post
	post.create(page.POST.body)

	page:redirect("/admin/posts")

	return 200
end

return posts
