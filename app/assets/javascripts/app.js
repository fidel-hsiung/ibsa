$(document).on('turbolinks:load', function() {

	// Datetime picker init
  $('.datetimepicker').datetimepicker({
  	format: "DD/MM/YYYY HH:mm",
  	disabledTimeIntervals: false
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

})