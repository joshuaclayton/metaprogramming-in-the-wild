$(document).bind('deck.change', function(e, from, to) {
  $.deck('getSlide', from).find('> audio').each(function() {
    this.pause && this.pause();
  });
  $.deck('getSlide', to).find('> audio').each(function() {
    this.play && this.play();
  });
});
