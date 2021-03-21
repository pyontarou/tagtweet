import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<p>&emsp;&ensp;${data.name}:&ensp;&ensp;${data.content.text}<br><font size="2">&emsp;&ensp;投稿日時:${data.update}</font></p>`;
    const comments = document.getElementById('comments');
    const newComment = document.getElementById('comment_text');
    comments.insertAdjacentHTML('afterbegin', html);
    newComment.value='';
    const button = document.getElementById("submit-btn");
    button.disabled = false;
  }
});
