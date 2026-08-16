window.addEventListener('message', function(event) {
    var data = event.data
    switch (data.type) {
        case 'open':
            $('.eye').fadeIn(100);
            $('.eye').attr('src','img/eye.svg');
            break;
        case 'close':
            closeMenu()
            $('.eye').fadeOut(100);
            break;
        case 'validTarget':
            $('.eye').attr('src','img/eye2.svg');
            openMenu(data.data);
            break;
        case 'leftTarget':
            $('.eye').attr('src','img/eye.svg');
            closeMenu()
            break;
    }
})

function toggleObjective() {
    $('.eye').fadeToggle(10);
}

function openMenu(menu) {
    $('.buttons').fadeIn(100);

    for (let [key, value] of Object.entries(menu)) {
        if (value.doesShow){
            let index = parseInt(key) + 1;

            $('.buttons').append('<div class="button" id="button_' + index + '"><p>' + value.label + '</p></div>')
        }
    }

    $(".button").on("click", function() {
        let index = this.id.replace('button_', '')

        $.post('https://sunset_target/selectTarget', JSON.stringify({index: index}))
        closeMenu()
    });
}

function closeMenu() {
    $('.buttons').fadeOut(100);
    
    setTimeout(() => {
        $('.buttons').empty();
    }, 100);
}

$(function() {
    $(document).on('keyup', function(e) {
        if (e.key == 'Escape') {
            $.post('https://sunset_target/closeTarget');
            closeMenu()
        }
    });

    $(window).resize(function() {
        changeRes()
    });
})
    
function changeRes() {
    $('html').css("zoom", window.screen.availWidth / 1920);
}
