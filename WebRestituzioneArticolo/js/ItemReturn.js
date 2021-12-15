// Example starter JavaScript for disabling form submissions if there are invalid fields
(function () {
    'use strict'
  
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.querySelectorAll('.needs-validation')
    // Loop over them and prevent submission
    Array.prototype.slice.call(forms)
      .forEach(function (form) {
        form.addEventListener('submit', function (event) {
            var sel = document.getElementById('validationReason')
            var opt = sel.options[sel.selectedIndex]
            if(opt.text === 'Other, specify in the description'){
                document.getElementById('textArea').setAttribute('required','required')
                document.getElementById('description').innerHTML = "Description required"
            }
            else{
                document.getElementById('textArea').removeAttribute('required')
            }
          if (!form.checkValidity()) {
            event.preventDefault()
            event.stopPropagation()
          }
  
          form.classList.add('was-validated')
        }, false)
      })
  })()