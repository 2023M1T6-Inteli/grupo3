extends Control


func sertanejoInicia():
	$sertanejo.play()
	
func rockInicia():
	$rock.play()
	
func sertanejoPara():
	$sertanejo.stop()

func rockPara():
	$rock.stop()

func mudo():
	$sertanejo.stream_paused = true
	$rock.stream_paused = true

func audivel():
	$sertanejo.stream_paused= false
	$rock.stream_paused = false

func click():
	$clickMouse.play()
