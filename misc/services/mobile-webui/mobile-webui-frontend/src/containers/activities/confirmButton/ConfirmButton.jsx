import React, { Component } from 'react';
import PropTypes from 'prop-types';
import counterpart from 'counterpart';
import cx from 'classnames';

class ConfirmButton extends Component {
  constructor(props) {
    super(props);
    this.state = {
      isPromptDialogOpen: false,
    };
  }

  showConfirmDialog = () => this.setState({ isPromptDialogOpen: true });

  hideConfirmDialog = () => this.setState({ isPromptDialogOpen: false });

  /**
   * Execute any function passed as onConfirm prop
   */
  onDialogYes = () => {
    const { onUserConfirmed } = this.props;
    this.hideConfirmDialog();
    onUserConfirmed();
  };

  onDialogNo = () => {
    this.hideConfirmDialog();
  };

  render() {
    const { caption, promptQuestion, isUserEditable, isCancelMode } = this.props;
    const { isPromptDialogOpen } = this.state;

    const captionEffective = caption ? caption : counterpart.translate('activities.confirmButton.default.caption');

    const promptQuestionEffective = promptQuestion
      ? promptQuestion
      : counterpart.translate('activities.confirmButton.default.promptQuestion');

    return (
      <div>
        {/*  Full screen confirm dialog  */}
        {isPromptDialogOpen && (
          <div className="prompt-dialog-screen">
            <article className="message confirm-box is-dark">
              <div className="message-header">
                <p>{captionEffective}</p>
              </div>
              <div className="message-body">
                <strong>{promptQuestionEffective}</strong>
                <div>&nbsp;</div>
                <div className="buttons is-centered">
                  <button className="button is-success confirm-button" onClick={this.onDialogYes}>
                    {counterpart.translate('activities.confirmButton.default.yes')}
                  </button>
                  <button className="button is-danger confirm-button" onClick={this.onDialogNo}>
                    {counterpart.translate('activities.confirmButton.default.no')}
                  </button>
                </div>
              </div>
            </article>
          </div>
        )}
        <div>
          <button
            className={cx('button is-outlined complete-btn', { 'is-danger': isCancelMode })}
            onClick={this.showConfirmDialog}
            disabled={!isUserEditable}
          >
            {captionEffective}
          </button>
        </div>
      </div>
    );
  }
}

/**
 * @typedef {object} Props Component props
 * @prop {string} caption
 * @prop {string} promptQuestion
 * @prop {bool} isUserEditable
 * @prop {bool} isCancelMode - controls if button is of rejection type (red instead of green)
 * @prop {func} onUserConfirmed
 */
ConfirmButton.propTypes = {
  caption: PropTypes.string,
  promptQuestion: PropTypes.string,
  isUserEditable: PropTypes.bool,
  isCancelMode: PropTypes.bool,
  //
  onUserConfirmed: PropTypes.func.isRequired,
};

export default ConfirmButton;
