
var Main = React.createClass({
  getInitialState: function() {
    return { unansweredQuestions: [],
             answeredQuestions: [],
             correctAnswers:[],
             currentLesson: this.getFirstLesson() };
  },
  componentDidMount: function() {
    this.requestLesson({name: this.state.currentLesson});
  },
  getFirstLesson: function() {
    return window.location.pathname.split('/').pop();
  },
  requestLesson: function(lesson, action = '') {
    $.ajax({
      url: '/api/lesson' + action,
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
    if (data.sentences[0]) {
      this.setState({
        unansweredQuestions: this.state.unansweredQuestions.concat(data.sentences),
        currentLesson: data.lessonName
      })
    }
  },
  currentQuestionId: function() {
    return this.state.unansweredQuestions[0].id;
  },
  handleAnswerSubmit: function(answer) {
    answer.sentence_id = this.currentQuestionId();
    return $.ajax({
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
    this.setState({correctAnswers: this.state.correctAnswers.concat([{ display: data.suggestion, id: this.currentQuestionId() }])});
    this.setState({answeredQuestions: this.state.answeredQuestions.concat([this.state.unansweredQuestions.shift()])});
    if (!this.state.unansweredQuestions[1]) {
      this.requestLesson({name: this.state.currentLesson}, '/next');
    }
  },
  handleIncorrectAnswer: function(data) {

  },
  shuffleQuestions: function() {
    this.setState({unansweredQuestions: this.shuffleArray(this.state.unansweredQuestions)});
  },
  shuffleArray:  function(a) {
      var j, x, i;
      for (i = a.length; i; i -= 1) {
          j = Math.floor(Math.random() * i);
          x = a[i - 1];
          a[i - 1] = a[j];
          a[j] = x;
      }
      return a;
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
            <ArrangementButtons shuffleQuestions={ this.shuffleQuestions } />
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
    var answeredQuestionNodes = this.props.data.slice(-10).reverse().map(function(question){
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
    var answerNodes = this.props.data.slice(-10).reverse().map(function(correctAnswer){
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
    return { answer: '', placeHolder: "You know this!"};
  },
  handleAnswerChange: function(e) {
    this.setState({answer: e.target.value});
  },
  handleSubmit: function(e) {
    e.preventDefault();
    var answer = this.state.answer.trim();
    if (!answer) return;
    var checkAnswer = $.when(this.props.submitAnswer({answer: answer}))
    var self = this;
    var waitingPlaceHolders = ['waiting ....-', 'waiting ...-.', 'waiting ..-..', 'waiting .-...', 'waiting -....', 'waiting .-...', 'waiting ..-..', 'waiting ...-.'];
    var waiting = setInterval(function() {
      var placeHolder = waitingPlaceHolders.shift();
      waitingPlaceHolders = waitingPlaceHolders.concat([placeHolder]);
      self.setState({placeHolder: placeHolder});
    }, 100);
    this.setState(this.getInitialState());
    this.setState({isDisabled: true});
    checkAnswer.then(function() {
      clearInterval(waiting);
      self.setState(self.getInitialState());
      self.setState({isDisabled: false});
      $('#answer').focus();
    });
  },
  render: function() {
    return (
      <form id='answer-form' className='answerForm' onSubmit={this.handleSubmit}>
        < label for='answer' hidden='hidden'>Enter answer:</label>
        <input
          type="text"
          name="answer"
          id="answer"
          disabled= { this.state.isDisabled }
          placeholder= { this.state.placeHolder }
          value={this.state.answer}
          autoFocus='true'
          autoComplete='off'
          onChange={this.handleAnswerChange} />
        <button type="submit">Check</button>
      </form>
    );
  }
});

var ArrangementButtons = React.createClass({
  handleShuffleClick: function(e) {
    e.preventDefault();
    this.props.shuffleQuestions();
    $('#answer').focus();
  },
  render: function() {
    return <button type="submit" onClick={ this.handleShuffleClick } >Shuffle</button>
  }
});

ReactDOM.render(
  <Main />,
  document.getElementById('container')
);
