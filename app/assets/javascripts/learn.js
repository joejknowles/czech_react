if (window.location.href.split('/').pop() === 'learn'){
  $(document).ready(function(){
    window.sentences = $('#sentences').data('sentences');
    $('#answer-form').on('ajax:success', function(e, data, status, xhr){
      if (data.correct) {
        setUserMessage(data);
        if (sentences) {
          var next_sentence = sentences.pop();
          if (next_sentence) {
            $('#question').html(next_sentence.display);
            $('#sentence_id').val(next_sentence.id);
          }
          $('#answer').val('');
          $('#attempt').val(1);
        }
      } else {
        attempt = $('#attempt')
        attempt.val(parseInt(attempt.val()) + 1)
        $('#user-message').html(data.user_message);
      }
    });
  });
}