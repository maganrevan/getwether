/*$(window).load(function(){
    $(".shopWrapper").each(function(){
        var $elem = $(this);
        $.ajax({
            url: "/lib/get.php?kPlugin="+$elem.find(".pluginKey").val()+"&kShopID="+$elem.find(".shopKey").val(),
            context: document.body
        }).done(function(data){
            $elem.find(".shop").hide("slow");
            $elem.append($(data).find(".pluginItem"));
        });
    });
});*/