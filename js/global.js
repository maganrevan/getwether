$(document).ready(function () {
    setInterval(function () {
        timer();
    }, 1000);
});

var timer = function () {
    $elem = $("#timer");

    if ($elem.find(".timerValue").length === 0) {
        $elem.append("<label for='timerValue'>Zeit bis zum nächsten Request</label><input class='timerValue form-control' disabled value='0' />");
    }

    if ($elem.find(".timerValue").val() === "0") {
        $elem.find(".timerValue").val(10);

        getValue();
    }

    $elem.find(".timerValue").val(parseInt($elem.find(".timerValue").val()) - 1);
};

var getValue = function () {
    $city = $("#city").val();
    
    if($city === ""){
        $city = "Berlin";
    }
    
    $.ajax({
        url: "/lib/get.php?city=" + $city
    }).done(function(data){
        $(".table tbody tr").remove();
        for($i = 0; $i < data.length; $i++){
            console.log(data[$i].connection_api_value.main.temp);
            $(".table tbody").append(
                "<tr><td>"+data[$i].connection_api_value.main.temp+"°C</td><td>"+data[$i].connection_api_value.weather[0].description+"</td><td>"+data[$i].date+"</td><tr>"    
                );
        }
        if(data.connection_api_value === null){
            $("#error .alert-danger").show();
        }
        else{
            $("#error .alert-danger").hide();
        }
    });
};