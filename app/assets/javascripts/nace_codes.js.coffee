# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

`function prepareList() {
  $('#list').find('li:has(ul)')
  	.click( function(event) {
  		if (this == event.target) {
  			$(this).toggleClass('expanded');
  			$(this).children('ul').toggle('medium');
  		}
  		event.stopPropagation();
  	})
  	.addClass('collapsed')
  	.children('ul').hide();
  };`

`$(document).ready( function() {
    prepareList()
});`