$('table').on('click', '[type="button"]', function(e){
        $(this).closest('tr').remove()
     })