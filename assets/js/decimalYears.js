var birthday = new Date(1997, 10, 11, 6, 15, 0, 0);

$(document).ready(function () {
    setInterval(calculateDecimalYear, 75);
});

function calculateDecimalYear() {
    var now = Date.now();
    var decimalYears = (now - birthday) / 31556952000;
    $('.decimalAge').html("I'm " + decimalYears.toFixed(9) + " years old., but I have some experience already. :)");
}