`$(document).ready(function(){

    $("#hiddenquestion").hide();

    $("input:radio[name='survey_result[result_id]']").change(function(){  

            if(this.value == '1' && this.checked){
              $("#hiddenquestion").show();
            }else{
              $("#hiddenquestion").hide();
            }

    });

});`