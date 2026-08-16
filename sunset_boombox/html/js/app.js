
var audioPlayers = [];

window.addEventListener('message', (event) => {
	let data = event.data
	// Check if audio player exist for given id and create it
	if (!audioPlayers[data.id]) {
		audioPlayers[data.id] = new Audio();
		audioPlayers[data.id].autoplay = true;
		audioPlayers[data.id].controls = false;
		audioPlayers[data.id].preload = 'none';
	}

    // Check for playSound transaction
    if (data.type == 'play') {
    	play(data.id, data.url, data.volume, data.time);
    }
    if (data.type == 'stop') {
	    stop(data.id);
		audioPlayers[data.id] = null;
    }
	if (data.type == 'volume') {
		setVolume(data.id, data.volume);
	}
	if (data.type == 'time') {
		setTime(data.id, data.time);
	}
})

function play(id, url, volume, time) {
	audioPlayers[id].loop = true
	audioPlayers[id].src = url;
	audioPlayers[id].volume = volume;
	audioPlayers[id].onloadedmetadata = function() {
		if (audioPlayers[id].duration > 30 * 60){
			stop(id);
		} else{
			setTime(id, time%audioPlayers[id].duration)
		}
	}
}

function stop(id) {
	audioPlayers[id].loop = false
	audioPlayers[id].onloadedmetadata = null
    audioPlayers[id].src = 'data:audio/wav;base64,UklGRiQAAABXQVZFZm10IBAAAAABAAEAVFYAAFRWAAABAAgAZGF0YQAAAAA=';
}

function setVolume(id, volume) {
    audioPlayers[id].volume = volume;
}

function setTime(id, time) {
    audioPlayers[id].currentTime = time;
}