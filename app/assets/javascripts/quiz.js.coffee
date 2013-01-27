$ ->
  $('.answer p').click( ->
    $(this).parent().parent().find('.answer p').removeClass('active')
    if $(this).hasClass('yes')
      $(this).parent().parent().find('input').val("Y")
    else
      $(this).parent().parent().find('input').val("N")

    $(this).toggleClass('active')
  )