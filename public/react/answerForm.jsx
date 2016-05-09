module.exports = React.createClass({
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
      self.setState({placeHolder: placeHolder, answer: ''});
    }, 100);
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