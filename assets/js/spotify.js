$(document).ready(function () {
    var settings = {
        "async": true,
        "crossDomain": true,
        "headers": {
            "Access-Control-Allow-Origin": "*",
            "Cache-Control": "no-cache",
            "Content-Type": "application/x-www-form-urlencoded"
        },
        "method": "GET",
        "url": "https://spotify.fedor.me/"
    };

    setInterval(function () {
        $.ajax(settings).done(function (response) {
            if (response.is_playing) {
                var contents = "Right now, I'm listening to <strong>" + response.item.name + "</strong> by ";
                contents += "<strong>" + response.item.artists[0].name + "</strong>";
                if (response.item.artists.length == 2) {
                    contents += " and <strong>" + response.item.artists[1].name + "</strong>";
                } else if (response.item.artists.length > 2) {
                    for (var artistNum = 1; artistNum < response.item.artists.length; artistNum++) {
                        if (artistNum == response.item.artists.length - 1) {
                            contents += ", and <strong>" + response.item.artists[artistNum].name + "</strong>";
                        } else {
                            contents += ", <strong>" + response.item.artists[artistNum].name + "</strong>";
                        }
                    }
                }
                contents += ". Listen to it <a href=" + response.item.external_urls.spotify + ">here</a>.";
                $('.listeningto').html(`<body><br/><br/>${contents}</body>`);
            } else {
                $('.listeningto').html("");
            }
        });
    }, 2000);
});