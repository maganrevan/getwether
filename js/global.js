$(document).ready(function () {
    $(".subBody").each(function () {
        if ($("select[name=month]").find("option[value=" + $(this).attr("data-month") + "]").length === 0) {
            var elem = $(this);
            $("select[name=month]").append($("<option>", {
                value: elem.attr("data-month"),
                text: elem.attr("data-month")
            }));

        }

        if ($("select[name=year]").find("option[value=" + $(this).attr("data-year") + "]").length === 0) {
            var elem = $(this);
            $("select[name=year]").append($("<option>", {
                value: elem.attr("data-year"),
                text: elem.attr("data-year")
            }));

        }
    });

    $("select[name=month]").html($("select[name=month] option").sort(function (a, b) {
        return a.text == b.text ? 0 : a.text < b.text ? -1 : 1
    }));

    $("select[name=year]").html($("select[name=year] option").sort(function (a, b) {
        return a.text == b.text ? 0 : a.text < b.text ? -1 : 1
    }));

    $(".refresh-all").on("click", function () {
        if (confirm("M\u00f6chten Sie wirklich alle Shopdaten Syncen? Dies kann einen Moment dauern und andere User der Seite beeintr\u00e4chtigen.")) {
            $(".loader").show();
            $.ajax({
                url: "/lib/get.php?all=shops",
                context: document.body
            }).done(function () {
                $(".loader").hide();
                alert("Daten wurden aktualsiert");
            });
        }
    });

    $(".refresh-cache").on("click", function () {
        if (confirm("M\u00f6chten Sie wirklich den kompletten Templatecache l&ouml;schen? Dies kann einen Moment dauern und andere User der Seite beeintr\u00e4chtigen.")) {
            $(".loader").show();
            $.ajax({
                url: "/lib/clearCache.php",
                context: document.body
            }).done(function () {
                $(".loader").hide();
                alert("Daten wurden aktualsiert");
            });
        }
    });

    $("input[name=search]").on("keyup", function () {
        try {
            clearTimeout(timer);
            var data = {};
            $(this).parents("form").serializeArray().map(function (x) {
                data[x.name] = x.value;
            });

            var timer = setTimeout(function () {
                if (data.shoptype !== "" || data.monitoring !== "" || data.status !== "" || data.search !== "") {
                    $(".shop").show();
                    $(".shop:not(" + ((data.shoptype !== "") ? "[data-shoptype='" + data.shoptype + "']" : "") + ((data.search !== "") ? "[data-search*='" + data.search + "']" : "") + ((data.monitoring !== "") ? "[data-monitoring='" + data.monitoring + "']" : "") + ((data.status !== "") ? "[data-status='" + data.status + "']" : "") + ")").hide();
                } else {
                    $(".shop").show();
                }
            }, 100);
        } catch (err) {
            console.log(err);
        }

    });

    $(".filterbar select").on("change", function () {
        var data = {};
        $(this).parents("form").serializeArray().map(function (x) {
            data[x.name] = x.value;
        });
        if (data.shoptype !== "" || data.monitoring !== "" || data.status !== "" || data.search !== "") {
            $(".shop").show();
            $(".shop:not(" + ((data.shoptype !== "") ? "[data-shoptype='" + data.shoptype + "']" : "") + ((data.search !== "") ? "[data-search*='" + data.search + "']" : "") + ((data.monitoring !== "") ? "[data-monitoring='" + data.monitoring + "']" : "") + ((data.status !== "") ? "[data-status='" + data.status + "']" : "") + ")").hide();
        } else {
            $(".shop").show();
        }
    });

    $(".filterbarHome select").on("change", function () {
        var data = {};
        $(this).parents("form").serializeArray().map(function (x) {
            data[x.name] = x.value;
        });
        console.log(data);
        if (data.shoptype !== "" || data.month !== "" || data.year !== "") {
            $(".subBody").show();
            console.log(".subBody:not(" + ((data.shoptype !== "") ? "[data-shoptype='" + data.shoptype + "']" : "") + ((data.month !== "") ? "[data-month='" + data.month + "']" : "") + ((data.year !== "") ? "[data-year='" + data.year + "']" : "") + ")");
            $(".subBody:not(" + ((data.shoptype !== "") ? "[data-shoptype='" + data.shoptype + "']" : "") + ((data.month !== "") ? "[data-month='" + data.month + "']" : "") + ((data.year !== "") ? "[data-year='" + data.year + "']" : "") + ")").hide();
        } else {
            $(".subBody").show();
        }
    });
});