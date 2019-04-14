function toggleValidity(element) {
  let $element = $(element);
  $element.on('keyup', function () {
    let el = document.querySelector('.ip-field');
    let validity = el.checkValidity();
    if(validity) {
      $(this).removeClass('is-invalid').addClass('is-valid')
    } else {
      $(this).removeClass('invalid').addClass('is-invalid')
    }
  })
}