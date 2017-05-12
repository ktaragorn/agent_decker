require 'luasrc/class'

AlarmCard = class(Card, function(a, data)
	Card.init(a, data)
	a.reset_alarm()
	a.alarm_threshold = 50
end)

function AlarmCard:alarm_triggered()
	return a.alarm_level >= a.alarm_threshold
end

function AlarmCard:reset_alarm()
	self.alarm_level = 0
end

function AlarmCard:increase_alarm(change )
	self.alarm_level += change
end