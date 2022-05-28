function Get_date_time()
	local date_table = os.date("*t")
	local ms = string.match(tostring(os.clock()), "%d%.(%d+)")
	local hour, minute, second = date_table.hour, date_table.min, date_table.sec
	local year, month, day = date_table.year, date_table.month, date_table.day -- date_table.wday to date_table.day
	local result = string.format("%d-%d-%d_%d:%d:%d:%s", year, month, day, hour, minute, second, ms)

	return result
end
