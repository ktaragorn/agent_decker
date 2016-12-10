class AlarmCard extends Card
  max: 50
  draw: (ctx) ->
    reset_alarm
  modify_alarm: (change) ->
    @alarm += change
  reset_alarm: ->
    @alarm = 0
  alarm_triggered: ->
    @alarm >= @max
