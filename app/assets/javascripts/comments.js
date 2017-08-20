/* global Vue */
document.addEventListener("DOMContentLoaded", function(event) { 
  var app = new Vue({
    el: '#app',
    data: {
      comments: [ 
        {}

      ],
      newComment: " "
    },
    methods: { 
      CreateComment: function() {
        if (this.newComment) {
          var newComment = {
            name: this.newComment,
          };
          this.comment.push(newComment);
          this.newComment = "";
        }
      }, 
      isPositive: function(inputComment) {
        return inputComment.name.indexOf("bad") === -1;
      },
    }
  });
});
