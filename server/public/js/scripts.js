$.ajax({
    url: "/",
    success: function(data){
        $('body').load('/site/pages/about.html body');
    }
});


function buttonClick(e) {
   if (!e) e = window.event;
   e.stopPropagation();
   // do what you want
}



//$(document).ready(function(){
//    $("header").click(function(){
//        $(this).slideUp();
//    });
//});

$(document).ready(function(){
    $(".contact-btn").click(function(e){
        e.stopPropagation();
        //alert("Hello")
    });
});

$(document).ready(function(){
    $("#mail-button").click(function(e){
        e.stopPropagation();
        alert("Hello")
    });
});





//$(function(){
// $('#search').on('keyup', function(e){
//   if(e.keyCode === 13) {
//     var parameters = { search: $(this).val() };
//       $.get( '/searching',parameters, function(data) {
//        $('#whatevr').html(data);
//     });
//    };
// });
//});


