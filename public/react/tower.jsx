
var { AnsweredQuestionsList, CorrectAnswersList, UnansweredQuestionsList } = require('./wordLists.jsx');
var ShuffleButton = require('./shuffleButton.jsx');
var AnswerForm = require('./answerForm.jsx');
var callAjax = require('./ajax/callAjax');
var stateUpdater = require('./reactExtensions/stateUpdater')

var Main = React.createClass({
  getInitialState: function() {
    return { unansweredQuestions: [],
             answeredQuestions: [],
             correctAnswers:[],
             currentLessonName: this.getFirstLessonName() };
  },
  componentDidMount: function() {
    this.requestLesson();
  },
  getFirstLessonName: function() {
    return window.location.pathname.split('/').pop();
  },
  requestLesson: function(next) {
    callAjax.getLesson({lessonName: this.state.currentLessonName, requestingNextLesson: next}).
      success(this.setLesson).error(console.log);
  },
  setLesson: function(data) {
    stateUpdater.concat.bind(this)('unansweredQuestions', data.sentences)
    this.setState({ currentLessonName: data.lessonName });
  },
  currentQuestionId: function() {
    return this.state.unansweredQuestions[0].id;
  },
  handleAnswerSubmit: function(answer) {
    answer.sentence_id = this.currentQuestionId();
    return callAjax.checkAnswer(answer).
      success(this.handleAnswerCheckResponse).error(console.log);
  },
  handleAnswerCheckResponse: function(data) {
    if (data.correct && this.responseIsForCurrentQuestion(data)) {
      this.handleCorrectAnswer(data)
    } else {
      this.handleIncorrectAnswer(data);
    }
  },
  handleCorrectAnswer: function(data) {
    stateUpdater.add.bind(this)('correctAnswers', data.suggestion);
    stateUpdater.add.bind(this)('answeredQuestions', this.state.unansweredQuestions.shift());
    if (this.oneUnansweredQuestionLeft()) {
      this.requestLesson(true);
    }
  },
  oneUnansweredQuestionLeft: function() {
    return !this.state.unansweredQuestions[1]
  },
  responseIsForCurrentQuestion: function(data) {
    return data.english_sentence_id == this.currentQuestionId();
  },
  handleIncorrectAnswer: function(data) {},
  shuffleQuestions: function() {
    stateUpdater.shuffle.bind(this)('unansweredQuestions');
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
            <ShuffleButton shuffleQuestions={ this.shuffleQuestions } />
          </div>
        </div>
      )
    } else {
      return (<p>There are no words.</p>);
    }
  }
});

ReactDOM.render(
  <Main />,
  document.getElementById('container')
);
