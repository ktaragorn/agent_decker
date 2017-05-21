-- todo handle recursion, table of tables
function inspect(table)
	for key, value in ipairs(table) do print(key, value) end
end

--http://stackoverflow.com/a/17120745
function swap(array, index1, index2)
    array[index1], array[index2] = array[index2], array[index1]
end

function shuffle(array)
    local counter = #array
    while counter > 1 do
        local index = math.random(counter)
        swap(array, index, counter)
        counter = counter - 1
    end
end