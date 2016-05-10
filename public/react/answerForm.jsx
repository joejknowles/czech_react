var stateUpdater = require('./reactExtensions/stateUpdater')
module.exports = React.createClass({
  getInitialState: function() {
    return { answer: '', placeHolder: "You know this!", waitingPlaceHolders: this.waitingPlaceHolders()};
  },
  handleAnswerChange: function(e) {
    this.setState({answer: e.target.value});
  },
  handleSubmit: function(e) {
    e.preventDefault();
    var answer = this.state.answer.trim();
    if (!answer) return;
    var checkAnswer = $.when(this.props.submitAnswer({answer: answer}));
    this.setState({answer: ''});
    var waiting = this.waiting();
    this.setState({isDisabled: true});
    var self = this;
    checkAnswer.then(function() {
      clearInterval(waiting);
      self.setState(self.getInitialState());
      self.setState({isDisabled: false});
      $('#answer').focus();
    });
  },
  waiting: function() {
    return setInterval(this.iterateWaitAnimation, 100);
  },
  iterateWaitAnimation: function() {
    stateUpdater.rotate.bind(this)('waitingPlaceHolders');
    this.setState({placeHolder: this.state.waitingPlaceHolders[0]})
  },
  waitingPlaceHolders: function() {
    return ['waiting ....-', 'waiting ...-.', 'waiting ..-..', 'waiting .-...', 'waiting -....', 'waiting .-...', 'waiting ..-..', 'waiting ...-.'];
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