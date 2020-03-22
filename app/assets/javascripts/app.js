$(document).on('turbolinks:load', function() {

	// Datetime picker init
  $('.datetimepicker').datetimepicker({
  	format: "DD/MM/YYYY HH:mm",
  	disabledTimeIntervals: false
  });

  // Date picker init
  $('.datepicker').datetimepicker({
    format: "DD/MM/YYYY"
  });

  // Toast message
  Array.from(document.getElementById('toast-msg').getElementsByClassName('toast-box')).forEach((element) => {
    element.getElementsByClassName('toast-action')[0].addEventListener('click', function(){
      element.classList.remove('show')
    })

    element.classList.add('show');
    setTimeout(function(){
      element.classList.remove('show');
    }, 4000);
    setTimeout(function(){
      element.remove()
    }, 6000);
  });

});

var csv_upload_select = function(input) {
  let name = $('#file-name');
  let file = input.files[0];

  if (file){
    name.html(file.name);
    $('#csv-submit-button').removeClass('hide');
  } else {
    name.html('');
    $('#csv-submit-button').addClass('hide');
  }
};