# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#dup_btn').click (e)->
    e.preventDefault()
    $.ajax(
      url: '/mypage/check'
      dataType: 'json'
      data: 
        nickname: $('#user_nickname').val()
      success: (data)->
        if data
          alert '중복'
        else
          alert '안중복'
        return
      error: ()->
        alert 'sorry.. error!'
        return
    )
    return
  return