/* global jQuery */
/* global $ */
jQuery(function() {  
 $('.setting>a').click(function(e) {
    e.stopPropagation();
    if($(this).next('ul').is(':visible')){
         $(this).removeClass('on').next('ul').fadeOut(300);
     }else{
         $(this).addClass('on').next('ul').fadeIn(300);
     };
     return false;
  })
  $('body').click(function(e){
      var setting = $('.setting>a').next('ul');
      if(setting.css('display') == 'block'){
          if(!setting.has(e.target).length){
              setting.fadeOut(300).prev().removeClass('on');
          };
      };
  });
})