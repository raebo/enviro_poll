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
`var ready = function() {
    prepareList()
};`
`$(document).ready(ready);`
`$(document).on('page:load', ready);`