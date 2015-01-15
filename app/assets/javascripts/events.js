ready = function () {
  $(function() {
    console.log("yo");
    var $cn_list    = $('#event-list');
    console.log($cn_list);
    var $items      = $cn_list.find('.event-field');
    var $cn_preview = $('#event-preview');
    var current     = 1;
    console.log($items);
    $items.each(function(i){
      var $item = $(this);
      $item.data('idx',i+1);
      $item.bind({
        mouseenter: function(e) {
          // Hover event handler
          console.log("hei");
        // Hover event handler
          var $this       = $(this);
          $cn_list.find('.selected').removeClass('selected');
          $this.addClass('selected');
          var idx         = $(this).data('idx');
          var $current    = $cn_preview.find('.event_content:nth-child('+current+')');
          var $next       = $cn_preview.find('.event_content:nth-child('+idx+')');
          console.log("YO : " +  $current);
          $current.addClass('event_hidden');
          $next.removeClass('event_hidden');
          current = idx;        
        },
        mouseleave: function(e) {
          // Hover event handler
        },
        click: function(e) {
          // Click event handler
        },
        blur: function(e) {
          // Blur event handler
        }
      });
    });
  });
}
$(document).ready(ready);
$(document).on('page:load', ready);




       