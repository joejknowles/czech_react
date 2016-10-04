var {Question,CorrectAnswer} = require('./bricks.jsx');

module.exports.AnsweredQuestionsList = React.createClass({
  render: function() {
    var answeredQuestionNodes = this.props.data.slice(-10).reverse().map(function(question){
      return <Question key={question.id} className='source-sentence finished' >{question.display}</Question>;
    });
    return (
      <div id='high-tower' className='col-md-4 top-half'>
        { answeredQuestionNodes }
      </div>
    );
  }
});

module.exports.CorrectAnswersList = React.createClass({
  render: function() {
    var answerNodes = this.props.data.slice(-10).reverse().map(function(correctAnswer){
      return <CorrectAnswer key={correctAnswer.id} >{correctAnswer.display}</CorrectAnswer>;
    });
    return (
      <div id='answer-tower' className='col-md-8 top-half' >
        { answerNodes }
      </div>
    );
  }
});

module.exports.UnansweredQuestionsList = React.createClass({
  render: function() {
    var unansweredQuestionNodes = this.props.data.map(function(question){
      return <Question key={question.id}>{question.display}</Question>;
    });
    return (
      <div id='low-tower' className='col-md-4' >
        { unansweredQuestionNodes }
      </div>
    );
  }
});