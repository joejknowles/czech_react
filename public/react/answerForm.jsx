var stateUpdater = require('./reactExtensions/stateUpdater');
var dangerousRotate = require('./extensions/arrayExtensions').dangerousRotate;
module.exports = React.createClass({
  getInitialState: function() {
    return { answer: '', placeHolder: "You know this!", isDisabled: false};
  },
  handleAnswerChange: function(e) {
    this.setState({answer: e.target.value});
  },
  handleSubmit: function(e) {
    e.preventDefault();
    var checkingAnswer = this.checkAnswer();
    this.deactivateInput();
    var waiting = this.waiting();
    checkingAnswer.then(function() {
      this.resetInput(waiting);
    }.bind(this));
  },
  checkAnswer: function() {
    var answer = this.state.answer.trim();
    if (!answer) return;
    return $.when(this.props.submitAnswer({answer: answer}));
  },
  deactivateInput: function() {
    this.setState({answer: '', isDisabled: true});
  },
  resetInput: function(waiting) {
    clearInterval(waiting);
    this.setState(this.getInitialState());
    $('#answer').focus();
  },
  waiting: function() {
    return setInterval(this.iterateWaitAnimation, 100);
  },
  iterateWaitAnimation: function() {
    dangerousRotate(this.waitingPlaceHolders)
    this.setState({placeHolder: this.waitingPlaceHolders[0]})
  },
  waitingPlaceHolders: ['waiting ....-', 'waiting ...-.', 'waiting ..-..', 'waiting .-...', 'waiting -....', 'waiting .-...', 'waiting ..-..', 'waiting ...-.'],
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