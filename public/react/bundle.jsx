(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
'use strict';

module.exports.getLesson = function (lessonData) {
  return $.ajax({
    url: '/api/lesson',
    dataType: 'json',
    type: 'GET',
    data: lessonData
  });
};
module.exports.checkAnswer = function (answer) {
  return $.ajax({
    url: '/api/check_answer',
    dataType: 'json',
    type: 'POST',
    data: answer
  });
};

},{}],2:[function(require,module,exports){
'use strict';

var stateUpdater = require('./reactExtensions/stateUpdater');
var dangerousRotate = require('./extensions/arrayExtensions').dangerousRotate;
module.exports = React.createClass({
  displayName: 'exports',

  getInitialState: function getInitialState() {
    return { answer: '', placeHolder: "You know this!", isDisabled: false };
  },
  handleAnswerChange: function handleAnswerChange(e) {
    this.setState({ answer: e.target.value });
  },
  handleSubmit: function handleSubmit(e) {
    e.preventDefault();
    var checkingAnswer = this.checkAnswer();
    this.deactivateInput();
    var waiting = this.waiting();
    checkingAnswer.then(function () {
      this.resetInput(waiting);
    }.bind(this));
  },
  checkAnswer: function checkAnswer() {
    var answer = this.state.answer.trim();
    if (!answer) return;
    return $.when(this.props.submitAnswer({ answer: answer }));
  },
  deactivateInput: function deactivateInput() {
    this.setState({ answer: '', isDisabled: true });
  },
  resetInput: function resetInput(waiting) {
    clearInterval(waiting);
    this.setState(this.getInitialState());
    $('#answer').focus();
  },
  waiting: function waiting() {
    return setInterval(this.iterateWaitAnimation, 100);
  },
  iterateWaitAnimation: function iterateWaitAnimation() {
    dangerousRotate(this.waitingPlaceHolders);
    this.setState({ placeHolder: this.waitingPlaceHolders[0] });
  },
  waitingPlaceHolders: ['waiting ....-', 'waiting ...-.', 'waiting ..-..', 'waiting .-...', 'waiting -....', 'waiting .-...', 'waiting ..-..', 'waiting ...-.'],
  render: function render() {
    return React.createElement(
      'form',
      { id: 'answer-form', className: 'answerForm', onSubmit: this.handleSubmit },
      React.createElement(
        'label',
        { 'for': 'answer', hidden: 'hidden' },
        'Enter answer:'
      ),
      React.createElement('input', {
        type: 'text',
        name: 'answer',
        id: 'answer',
        disabled: this.state.isDisabled,
        placeholder: this.state.placeHolder,
        value: this.state.answer,
        autoFocus: 'true',
        autoComplete: 'off',
        onChange: this.handleAnswerChange }),
      React.createElement(
        'button',
        { type: 'submit' },
        'Check'
      )
    );
  }
});

},{"./extensions/arrayExtensions":4,"./reactExtensions/stateUpdater":5}],3:[function(require,module,exports){
'use strict';

module.exports.Question = React.createClass({
  displayName: 'Question',

  render: function render() {
    return React.createElement(
      'div',
      { className: 'question brick' },
      this.props.children.toString()
    );
  }
});

module.exports.CorrectAnswer = React.createClass({
  displayName: 'CorrectAnswer',

  render: function render() {
    return React.createElement(
      'div',
      { className: 'answer brick' },
      this.props.children.toString()
    );
  }
});

},{}],4:[function(require,module,exports){
"use strict";

module.exports.safeShuffle = function (a) {
  a = a.slice();
  return shuffle(a);
};

module.exports.dangerousShuffle = function (a) {
  return shuffle(a);
};

function shuffle(a) {
  var j, x, i;
  for (i = a.length; i; i -= 1) {
    j = Math.floor(Math.random() * i);
    x = a[i - 1];
    a[i - 1] = a[j];
    a[j] = x;
  }
  return a;
}

module.exports.safeRotate = function (a) {
  a = a.slice();
  return module.exports.rotate(a);
};

module.exports.dangerousRotate = function (a) {
  var firstElement = a.shift();
  return a.push(firstElement);
};

},{}],5:[function(require,module,exports){
'use strict';

function _defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }

module.exports.add = function (propertyName, element) {
  var updatedArray = this.state[propertyName].concat([element]);
  this.setState(newObjectWithProperty(propertyName, updatedArray));
};

module.exports.concat = function (propertyName, element) {
  var updatedArray = this.state[propertyName].concat(element);
  this.setState(newObjectWithProperty(propertyName, updatedArray));
};

module.exports.shuffle = function (propertyName) {
  var shuffle = require('../extensions/arrayExtensions.js').safeShuffle;
  var shuffledArray = shuffle(this.state[propertyName]);
  this.setState(newObjectWithProperty(propertyName, shuffledArray));
};

module.exports.rotate = function (propertyName) {
  var rotate = require('../extensions/arrayExtensions.js').safeRotate;
  var rotatedArray = rotate(this.state[propertyName]);
  this.setState(newObjectWithProperty(propertyName, rotatedArray));
};

function newObjectWithProperty(propertyName, value) {
  return _defineProperty({}, propertyName, value);
}

},{"../extensions/arrayExtensions.js":4}],6:[function(require,module,exports){
"use strict";

module.exports = React.createClass({
  displayName: "exports",

  handleShuffleClick: function handleShuffleClick(e) {
    e.preventDefault();
    this.props.shuffleQuestions();
    $('#answer').focus();
  },
  render: function render() {
    return React.createElement(
      "button",
      { type: "submit", onClick: this.handleShuffleClick },
      "Shuffle"
    );
  }
});

},{}],7:[function(require,module,exports){
'use strict';

var _require = require('./wordLists.jsx');

var AnsweredQuestionsList = _require.AnsweredQuestionsList;
var CorrectAnswersList = _require.CorrectAnswersList;
var UnansweredQuestionsList = _require.UnansweredQuestionsList;

var ShuffleButton = require('./shuffleButton.jsx');
var AnswerForm = require('./answerForm.jsx');
var callAjax = require('./ajax/callAjax');
var stateUpdater = require('./reactExtensions/stateUpdater');

var Main = React.createClass({
  displayName: 'Main',

  getInitialState: function getInitialState() {
    return { unansweredQuestions: [],
      answeredQuestions: [],
      correctAnswers: [],
      currentLessonName: this.getFirstLessonName() };
  },
  componentDidMount: function componentDidMount() {
    this.requestLesson();
  },
  getFirstLessonName: function getFirstLessonName() {
    return window.location.pathname.split('/').pop();
  },
  requestLesson: function requestLesson(next) {
    callAjax.getLesson({ lessonName: this.state.currentLessonName, requestingNextLesson: next }).success(this.setLesson).error(console.log);
  },
  setLesson: function setLesson(data) {
    stateUpdater.concat.bind(this)('unansweredQuestions', data.sentences);
    this.setState({ currentLessonName: data.lessonName });
  },
  currentQuestionId: function currentQuestionId() {
    return this.state.unansweredQuestions[0].id;
  },
  handleAnswerSubmit: function handleAnswerSubmit(answer) {
    answer.sentence_id = this.currentQuestionId();
    return callAjax.checkAnswer(answer).success(this.handleAnswerCheckResponse).error(console.log);
  },
  handleAnswerCheckResponse: function handleAnswerCheckResponse(data) {
    if (data.correct && this.responseIsForCurrentQuestion(data)) {
      this.handleCorrectAnswer(data);
    } else {
      this.handleIncorrectAnswer(data);
    }
  },
  handleCorrectAnswer: function handleCorrectAnswer(data) {
    stateUpdater.add.bind(this)('correctAnswers', data.suggestion);
    stateUpdater.add.bind(this)('answeredQuestions', this.questionJustAnswered());
    if (this.oneUnansweredQuestionLeft()) {
      this.requestLesson(true);
    }
  },
  questionJustAnswered: function questionJustAnswered() {
    return this.state.unansweredQuestions.shift();
  },
  oneUnansweredQuestionLeft: function oneUnansweredQuestionLeft() {
    return !this.state.unansweredQuestions[1];
  },
  responseIsForCurrentQuestion: function responseIsForCurrentQuestion(data) {
    return data.english_sentence_id == this.currentQuestionId();
  },
  handleIncorrectAnswer: function handleIncorrectAnswer(data) {},
  shuffleQuestions: function shuffleQuestions() {
    stateUpdater.shuffle.bind(this)('unansweredQuestions');
  },
  render: function render() {
    if (this.state.unansweredQuestions[0]) {
      return React.createElement(
        'div',
        null,
        React.createElement(AnsweredQuestionsList, { data: this.state.answeredQuestions }),
        React.createElement(CorrectAnswersList, { data: this.state.correctAnswers }),
        React.createElement(UnansweredQuestionsList, { data: this.state.unansweredQuestions }),
        React.createElement(
          'div',
          { className: 'col-md-8' },
          React.createElement(AnswerForm, { submitAnswer: this.handleAnswerSubmit }),
          React.createElement(ShuffleButton, { shuffleQuestions: this.shuffleQuestions })
        )
      );
    } else {
      return React.createElement(
        'p',
        null,
        'There are no words.'
      );
    }
  }
});

ReactDOM.render(React.createElement(Main, null), document.getElementById('container'));

},{"./ajax/callAjax":1,"./answerForm.jsx":2,"./reactExtensions/stateUpdater":5,"./shuffleButton.jsx":6,"./wordLists.jsx":8}],8:[function(require,module,exports){
'use strict';

var _require = require('./bricks.jsx');

var Question = _require.Question;
var CorrectAnswer = _require.CorrectAnswer;


module.exports.AnsweredQuestionsList = React.createClass({
  displayName: 'AnsweredQuestionsList',

  render: function render() {
    var answeredQuestionNodes = this.props.data.slice(-10).reverse().map(function (question) {
      return React.createElement(
        Question,
        { key: question.id, className: 'source-sentence finished' },
        question.display
      );
    });
    return React.createElement(
      'div',
      { id: 'high-tower', className: 'col-md-4 top-half' },
      answeredQuestionNodes
    );
  }
});

module.exports.CorrectAnswersList = React.createClass({
  displayName: 'CorrectAnswersList',

  render: function render() {
    var answerNodes = this.props.data.slice(-10).reverse().map(function (correctAnswer) {
      return React.createElement(
        CorrectAnswer,
        { key: correctAnswer.id },
        correctAnswer.display
      );
    });
    return React.createElement(
      'div',
      { id: 'answer-tower', className: 'col-md-8 top-half' },
      answerNodes
    );
  }
});

module.exports.UnansweredQuestionsList = React.createClass({
  displayName: 'UnansweredQuestionsList',

  render: function render() {
    var unansweredQuestionNodes = this.props.data.map(function (question) {
      return React.createElement(
        Question,
        { key: question.id },
        question.display
      );
    });
    return React.createElement(
      'div',
      { id: 'low-tower', className: 'col-md-4' },
      unansweredQuestionNodes
    );
  }
});

},{"./bricks.jsx":3}]},{},[7]);
