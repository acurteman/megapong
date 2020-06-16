extends CanvasLayer

var p1Score = 0
var p2Score = 0
var count = 0

func _ready():
	$p1ScoreBoard.text = str(p1Score)
	$p2ScoreBoard.text = str(p2Score)
	$Countdown.visible = false

func scoreP1():
	p1Score += 1
	$p1ScoreBoard.text = str(p1Score)

func scoreP2():
	p2Score += 1
	$p2ScoreBoard.text = str(p2Score)

# Start coundown timer
func countDown(time):
	count = time
	$Countdown.text = str(count)
	$Countdown.visible = true
	$Timer.start()

# Continue countown timer until count runs out
func _on_Timer_timeout():
	count -= 1
	if count > 0:
		$Countdown.text = str(count)
		$Timer.start()
	else:
		$Countdown.visible = false
