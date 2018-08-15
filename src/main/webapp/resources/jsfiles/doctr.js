
 $(document).ready(function(){

	$(".tostep2").click(function(){
   // if (form.valid() == true){
   // 			current_fs = $('.step2');
   // 			next_fs = $('.step1');
   // 			next_fs.show();
   // 			current_fs.hide();
   // 		}

  // if ($(".step1 input").valid()){
  // $(".step2").show(500);
  // $(".step1").hide(500);
 });
 });
// if ($(".active_inp").valid()) {
//  $('.form1').hide();
//  $('.form2').show();
//       }
// function validate() {
//     var isValid = true;
//     var form1 = document.getElementById('step1');
//
//     if (form1.input.value == '') {
//         isValid = false;
//     }
//     if (isValid) {
//         document.getElementById('step2').style.display='block';
//         return false;
//     }
// }


$(document).ready(function () {

    var navListItems = $('div.setup-panel div a'),
        allWells = $('.setup-content'),
        allNextBtn = $('.nextBtn');

    allWells.hide();

    navListItems.click(function (e) {
        e.preventDefault();
        var $target = $($(this).attr('href')),
            $item = $(this);

        if (!$item.hasClass('disabled')) {
            navListItems.removeClass('btn-danger').addClass('btn-default');
            $item.addClass('btn-danger');
            allWells.hide();
            $target.show();
            $target.find('input:eq(0)').focus();
        }
    });

    allNextBtn.click(function () {
        var curStep = $(this).closest(".setup-content"),
            curStepBtn = curStep.attr("id"),
            nextStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().next().children("a"),
            curInputs = curStep.find("input[type='text'],input[type='url']"),
            isValid = true;

        $(".form-group").removeClass("has-error");
        for (var i = 0; i < curInputs.length; i++) {
            if (!curInputs[i].validity.valid) {
                isValid = false;
                $(curInputs[i]).closest(".form-group").addClass("has-error");
            }
        }

        if (isValid) nextStepWizard.removeAttr('disabled').trigger('click');
    });

    $('div.setup-panel div a.btn-danger').trigger('click');
});
