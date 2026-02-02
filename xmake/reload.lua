
task("reload")

set_menu({
	-- Settings menu usage
	usage = "xmake reload",
	description = "Shortcut for xmake project -k vsxmake",
	options =
	{
		-- Set k mode as key-only bool parameter
		{"y", "autodownload", "k", nil, "If set, automatically download packages" },
	}
})

on_run(function ()
	import("core.project.task")
	import("core.base.option")

	local autodownload = option.get("autodownload")
	if autodownload then
		task.run("project", {kind = "vsxmake"}, "-y")
	else
		task.run("project", {kind = "vsxmake"})
	end

	print("xmake reload ... ok")
end)
