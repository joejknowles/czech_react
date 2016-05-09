module.exports.getLesson = function(lessonData) {
  return $.ajax({
    url: '/api/lesson',
    dataType: 'json',
    type: 'GET',
    data: lessonData
  });
};
module.exports.checkAnswer = function(answer) {
  return $.ajax({
    url: '/api/check_answer',
    dataType: 'json',
    type: 'POST',
    data: answer
  });
}