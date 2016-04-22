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
      userMessage = $('#user-message')
      userMessage.html(data.user_message);
      userMessage.removeClass('demo');
      userMessage.addClass('demo');
      setTimeout(function(){
        userMessage.removeClass('demo');
      }, 1000);
      var current = $('#question');
      var correctAnswer = $('<div class="correct-answer">'+ data.suggestion + '</div>');
      correctAnswer.prependTo('#answer-tower');
      current.attr('id', '');
      current.addClass('finished');
      var next_sentence = current.next();
      current.prependTo('#high-tower');
      if (next_sentence) {
        $('#sentence_id').val(next_sentence.data().sentenceId);
        next_sentence.attr('id', 'question');
      }
      $('#answer').val('');
      $('#attempt').val(1);
    }

    function incorrectAnswerReaction(data) {
      attempt = $('#attempt');
      attemptInt = parseInt(attempt.val());
      userMessage = $('#user-message');
      userMessage.html(data.user_message);
      if (attemptInt > 1) {
        userMessage.text(userMessage.text() + ' Start again!');
        setTimeout(function(){ location.reload() }, 500);
      } else {
      attempt.val(attemptInt+ 1);
      }
    }  });
}

