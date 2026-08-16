$(function() {

    var meterVisible = false;

    $('#greenlight').hide();
    $('#redlight').hide();

    window.addEventListener("message", function(event) {
        console.log(JSON.stringify(event.data.data));
        if (event.data.type == 'update_meter'){
            updateMeterAttributes(event.data.data);
        }
    });

    function showMeter() {
        $('#meter').show();
    }

    function hideMeter() {
        $('#meter').hide();
    }

    function updateMeterAttributes(attributes) {
        if (attributes) {
            meterVisible = attributes['visible'];
            refreshMeterDisplay();
            $('.meter-field.fare').text(attributes['distance']);
            $('.meter-field.rate').text(attributes['price']);
            $('.meter-field.state').text(attributes['priceLabel']);
        }
    }

    function updateLight(){
        if(moving){
            $('#greenlight').show();
            $('#redlight').hide();
        }else{
            $('#redlight').show();
            $('#greenlight').hide();
        }
    }

    function refreshMeterDisplay(){
        toggleMeterVisibility();
        //updateLight();
    }

    function toggleMeterVisibility(){
        if(meterVisible){
            showMeter();
        } else {
            hideMeter();
        }
    }

});
