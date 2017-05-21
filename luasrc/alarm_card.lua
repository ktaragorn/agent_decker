AlarmCard = class(Card, function(a, data)
	Card.init(a, data)
	a:reset_alarm()
	a.alarm_threshold = 50
end)

function AlarmCard:alarm_triggered()
	return a.alarm_level >= a.alarm_threshold
end

function AlarmCard:reset_alarm()
	self.alarm_level = 0
end

function AlarmCard:increase_alarm(change )
	self.alarm_level = self.alarm_level+ change
end

function AlarmCard:draw()
	Card.draw(self)
	love.graphics.print(self.alarm_level, 100, 100)
end

function AlarmCard:mousepressed(x,y)
	print(1)
	if Card.mousepressed(self) then
		self:increase_alarm(1)
	end
end