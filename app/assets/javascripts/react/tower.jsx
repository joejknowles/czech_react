
var Main = React.createClass({
  getInitialState: function() {
    return { unansweredQuestions: [], questionId: null, answeredQuestions: [], correctAnswers:[] };
  },
  componentDidMount: function() {
    this.requestLesson();
  },
  requestLesson: function() {
    var lesson = {name: window.location.pathname.split('/').pop()};
    $.ajax({
      url: '/api/lesson',
      dataType: 'json',
      type: 'GET',
      data: lesson,
      success: function(data) {
        this.setLesson(data);
      }.bind(this),
      error: function(xhr, status, err) {
        alert(err.toString());
      }.bind(this)
    });
  },
  setLesson: function(data) {
    if (data[0]) {

      this.setState({unansweredQuestions: data, questionId: data[0].id})
    }
  },
  handleAnswerSubmit: function(answer) {
    answer.sentence_id = this.state.questionId
    $.ajax({
      url: '/api/check_answer',
      dataType: 'json',
      type: 'POST',
      data: answer,
      success: function(data) {
        this.handleAnswerCheckResponse(data);
      }.bind(this),
      error: function(xhr, status, err) {
        alert(err.toString());
      }.bind(this)
    });
  },
  handleAnswerCheckResponse: function(data) {
    if (data.correct) {
      this.handleCorrectAnswer(data)
    } else {
      this.handleIncorrectAnswer(data);
    }
  },
  handleCorrectAnswer: function(data) {
    this.setState({correctAnswers: [{ display: data.suggestion, id: this.state.questionId }].concat(this.state.correctAnswers)});
    this.setState({answeredQuestions: [this.state.unansweredQuestions.shift()].concat(this.state.answeredQuestions)});
    this.setState({questionId: this.state.unansweredQuestions[0].id});
  },
  handleIncorrectAnswer: function(data) {

  },
  render: function() {
    if (this.state.unansweredQuestions[0]) {
      return (
        <div>
          < AnsweredQuestionsList data={ this.state.answeredQuestions } />
          < CorrectAnswersList data={ this.state.correctAnswers } />
          < UnansweredQuestionsList data={ this.state.unansweredQuestions } />
          <div className='col-md-8'>
            <AnswerForm submitAnswer={ this.handleAnswerSubmit } />
          </div>
        </div>
      )
    } else {
      return (<p>There are no words.</p>);
    }
  }
});

var AnsweredQuestionsList = React.createClass({
  render: function() {
    var answeredQuestionNodes = this.props.data.map(function(question){
      return <question key={question.id} className='source-sentence finished' >{question.display}</question>;
    });
    return (
      <div id='high-tower' className='col-md-4 top-half'>
        { answeredQuestionNodes }
      </div>
    );
  }
});

  var CorrectAnswersList = React.createClass({
  render: function() {
    var answerNodes = this.props.data.map(function(correctAnswer){
      return <correctAnswer key={correctAnswer.id} className='finished' >{correctAnswer.display}</correctAnswer>;
    });
    return (
      <div id='answer-tower' className='col-md-8 top-half' >
        { answerNodes }
      </div>
    );
  }
});

var correctAnswer = React.createClass({
  render: function() {
    return (
      <div>{this.props.children.toString()}</div>
    );
  }
});


var UnansweredQuestionsList = React.createClass({
  render: function() {
    var unansweredQuestionNodes = this.props.data.map(function(question){
      return <question key={question.id} className='source-sentence' >{question.display}</question>;
    });
    return (
      <div id='low-tower' className='col-md-4' >
        { unansweredQuestionNodes }
      </div>
    );
  }
});

var question = React.createClass({
  render: function() {
    return (
      <div>{this.props.children.toString()}</div>
    );
  }
});



var AnswerForm = React.createClass({
  getInitialState: function() {
    return { answer: ''};
  },
  handleAnswerChange: function(e) {
    this.setState({answer: e.target.value});
  },
  handleSubmit: function(e) {
    e.preventDefault();
    var answer = this.state.answer.trim();
    if (!answer) return;
    this.props.submitAnswer({answer: answer})
    this.setState({answer: ''})
  },
  render: function() {
    return (
      <form id='answer-form' className='answerForm' onSubmit={this.handleSubmit}>
        < label for='answer' hidden='hidden'>Enter answer:</label>
        <input
          type="text"
          name="answer"
          id="answer"
          placeholder="You know this!"
          value={this.state.answer}
          autoFocus='true'
          autoComplete='off'
          onChange={this.handleAnswerChange} />
        <button type="submit">Check</button>
      </form>
    );
  }
});

ReactDOM.render(
  <Main />,
  document.getElementById('container')
);
