
$(document).ready(function(){
 var item_num = $('nav li').length + 1;
 var btn_state = true;

 $('nav li').hover(function(){
   $(this).addClass('hover');
 },function(){
   $(this).removeClass('hover');
 });

 $('nav li').on('click',function(){
   if(btn_state){
     btn_state = !btn_state;
     $('nav li').removeClass('currentPage');
     $(this).addClass('currentPage');

     var i = $('nav li').index(this);
     $('article').removeClass('show');
     $('article').addClass('hide');
     $('article').eq(i).addClass('show');

     setTimeout(function(){
       btn_state = !btn_state;
     },500);
   }
 });


});
