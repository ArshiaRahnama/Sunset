var state = true;
$(document).ready(function () {
    first();
});

const first = () => {
    $('#myvideo').prop('volume', 0.1);
}

setTimeout(async() => {
    secend();
}, 10000);

const secend = () => {
    var myvideo = document.getElementById("myvideo");
    var myaudio = document.getElementById("myaudio");
    var myplayList = [];
    fetch('https://raw.githubusercontent.com/AhmadZare/SunCo_LoadScreen_Music/main/Music.json')
    .then(res => res.json())
    .then(json => {
        var rndIntmusic = Math.floor(Math.random() * json.length);
        console.log(rndIntmusic);
        myaudio.src = json[rndIntmusic];
        myaudio.volume = 0.1;
        myaudio.load();
        myaudio.play();
    })

    myvideo.src = "video/secend.mp4";
    myvideo.play();
}

document.addEventListener("keydown", function (e) {
    if (e.keyCode == 32) {
        if (state) {
            state = false;
            myaudio.volume = 0.0;
            $('#myvideo').prop('volume', 0.0);
        } else {
            state = true;
            myaudio.volume = 0.1;
            $('#myvideo').prop('volume', 0.1);
        }
    }
});