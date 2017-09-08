/* global Vue, $, Rails */
document.addEventListener("DOMContentLoaded", function(event) { 


  Vue.component('star-rating', VueStarRating.default);
  console.log("hello");
  var app = new Vue({
    el: '#app',
    data: {
      comments: [], 
      newComment: " ",
      imageId: document.querySelector("#app").dataset.imageid,
      rating: 1
    },
    mounted: function() {
      $.ajax({
        url: "/api/v1/images/" + this.imageId,
        type: "get", 
        success: function(response) {
          console.log(response);
          this.comments = response.comments;
        }.bind(this)
      });
    },
    methods: {
      CreateComment: function() {
        if (this.newComment) {
          Rails.ajax({
            url: "/api/v1/comments",
            type: "POST",
            data: "form_text=" + this.newComment + "&form_image_id=" + this.imageId,
            success: function(response) {
              console.log('success!!!', response);
              this.comments.push(response);
              this.newComment = "";
            }.bind(this)
          });
        }
      }, 
      isPositive: function(inputComment) {
        return inputComment.name.indexOf("bad") === -1;
      }
    },
    computed: {

    }
  });
});