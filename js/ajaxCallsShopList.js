$(window).load(function () {
    /*loadShops();

    $(".refresh").on("click", function () {
        loadShops();
    });*/
});

var loadShops = function () {
    $(".shop").each(function () {
        var $elem = $(this);
        if ($elem.find(".fa-cog").length === 0) {
            $elem.append(
                    "<i class='fa fa-cog fa-spin fa-3x fa-fw'></i> <span class='sr-only'>Loading...</span>"
                    );
        } else {
            $elem.find(".fa-cog").show();
        }
        $.ajax({
            url: "/lib/get.php?list=1&kShopID=" + $elem.find(".shopKey").val(),
            context: document.body
        }).done(function (data) {
            if ($elem.find(".shopItem").length > 0) {
                $elem.find(".shopItem").remove();
            }
            $elem.append($(data).find(".shopItem"));
            $elem.find(".fa-cog").hide("slow");
        });
    });
};