function setLayout() {
  var height = $(window).height() - $('header').outerHeight();
  var mainWidth = $(window).width() - $('aside').outerWidth();
  $('.container').height(height);
  $('aside').height(height);
  $('.main').height(height).width(mainWidth);
}

$(function() {
  setLayout();
  $(window).resize(setLayout);
});
