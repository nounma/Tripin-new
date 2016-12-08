var offset = $("header").height(); // or 0

  $(document).on("click", "a[href*=#]:not([href=#])", function(event){
    var hash = this.hash;
    var $target = $(hash);

     if($target.length){
      $("html,body").stop().animate({
        scrollTop: $target.offset().top - offset
      }, 1000, function(){
        if(history.pushState) {
          history.pushState(null, null, hash);
        }
      });

      event.preventDefault();
  }
});
