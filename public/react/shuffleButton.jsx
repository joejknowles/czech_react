module.exports = React.createClass({
  handleShuffleClick: function(e) {
    e.preventDefault();
    this.props.shuffleQuestions();
    $('#answer').focus();
  },
  render: function() {
    return <button type="submit" onClick={ this.handleShuffleClick } >Shuffle</button>
  }
});
