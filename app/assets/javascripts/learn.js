
$(document).ready(function(){
  window.sentences = $('#sentences').data('sentences');
  $('#answer-form').on('ajax:success', function(e, check_answer_response, status, xhr){
    if (check_answer_response.correct) {
      $('#check-answer-response').html(check_answer_response.user_message)
      var next_sentence = sentences.pop();
      if (next_sentence) {
        $('#question').html(next_sentence.display)
        $('#sentence_id').val(next_sentence.id)
      }
        $('#answer').val('')
        $('#attempt').val(1);
    } else {
      attempt = $('#attempt')
      attempt.val(parseInt(attempt.val()) + 1)
      $('#check-answer-response').html(check_answer_response.user_message);
    }
  });
});