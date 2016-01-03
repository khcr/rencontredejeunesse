document.body.onclick = function(e) {
  var target = e.target;
  if(target.classList.contains("lightbox-open")) {
    var $content = document.getElementById(target.getAttribute("content"));
    fadeIn($content, function() {
      $content.style.display = "flex";
    });
  }
  if(target.classList.contains("lightbox-close")) {
    target.parentElement.parentElement.parentElement.style.display = "none";
  }
  if(target.classList.contains("lightbox-wrap")) {
    target.style.display = "none";
  }
};
