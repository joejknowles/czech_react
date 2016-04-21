var urlParts = window.location.href.split('/')
if (urlParts.pop() === 'learning_tower' || urlParts.pop() === 'learning_tower'){
  $(document).ready(function(){

    $('#answer-form').on('ajax:success', function(e, data, status, xhr){
      if (data.correct) {
        correctAnswerReaction(data);
      } else {
        incorrectAnswerReaction(data);
      }
    });

    function correctAnswerReaction(data) {
      setUserMessage(data);
      var current = $('#question');
      current.text(current.text() + ' ' + data.suggestion)
      current.attr('id', '');
      var next_sentence = current.next();
      if (next_sentence) {
        $('#sentence_id').val(next_sentence.attr('id'));
        next_sentence.attr('id', 'question');
      }
      $('#answer').val('')
      $('#attempt').val(1);
    }

    function incorrectAnswerReaction(data) {
      attempt = $('#attempt');
      attemptInt = parseInt(attempt.val());
      userMessage = $('#user-message')
      userMessage.html(data.user_message);
      if (attemptInt > 1) {
        userMessage.text(userMessage.text() + ' Start again!')
        setTimeout(function(){ location.reload() }, 500)
      } else {
      attempt.val(attemptInt+ 1);
      }
    }  });
}

