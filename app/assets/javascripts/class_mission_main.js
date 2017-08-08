// $(function(){
// 	 //미션 목록 펼치고 닫혀지는 부분
//     var class_misson = $('.class_misson');
//     var class_misson_a =  $('.class_misson_a');
// 	class_misson_a.first().children().children().children('.misson_title').children().children('span').addClass('on');
//     class_misson_a.on('click',function(e){
//         e.preventDefault();
//         var t = $(this);
//         var m = $(this).next('div');
// 	   if(m.is(':visible')){
// 			m.slideUp(500);
// 		}else{
// // 			document.FMissionList.mission_idx.value = t.parent().attr('id').replace('mission_','');
// 			m.slideDown(500,function(){
// 				var top = t.offset().top;
// 				$('html,body').animate({
// 					scrollTop:top-70
// 				});
// 			}).parent().siblings().children('div').slideUp(500);
// 			t.children().children().children('.misson_title').children().children('span').addClass('on');
// 		}
//     });
// });