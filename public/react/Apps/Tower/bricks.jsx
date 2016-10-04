module.exports.Question = React.createClass({
  render: function() {
    return (
      <div className='question brick'>{this.props.children.toString()}</div>
    );
  }
});

module.exports.CorrectAnswer = React.createClass({
  render: function() {
    return (
      <div className='answer brick'>
        {this.props.children.toString()}
      </div>
    );
  }
});