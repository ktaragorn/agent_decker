-- todo handle recursion, table of tables
function inspect(table)
	for key, value in ipairs(table) do print(key, value) end
end