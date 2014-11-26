Grid.View = function(){
}

Grid.View.prototype = {
  createTriangle: function(h,arrowLeft){
    arrowLeft.css('border-bottom-width', h +'px')
    arrowLeft.css('border-right-width', h+'px')
  },
  
  createRectangle: function(w,rectangle){
    rectangle.css('width', w+1+'px')
  },
  
  changeLineHeight: function(h,description){
    description.css('line-height', h+'px')
  },
  
  positionRectangle: function(h,rectangle){
    rectangle.css('left', h+'px')
  },

  showOverlay: function(h,overlay){
    var self = this;
    overlay.animate({
      right: h+'px'
    }, 500, function(){
      self.increaseFont($(this));
    })
  },

  showModal: function(h,overlay, image){
    var self = this;
    overlay.animate({
      right: h+'px'
    }, 500, function(){
      image.fadeIn(2000);
    })
  },

  increaseFont: function(overlay){
    overlay.siblings('.description').animate({
        fontSize: '20px',
        opacity: 1
      }, 200)
  },

  hideDescription: function(text){
    text.css('font-size', '0px');
    text.css('opacity', '0');
  },

  hideOverlay: function(w,overlay){
    overlay.animate({
      right: -w+'px'
    }, 500);
  },
  addHiddenClass: function(container){
    container.addClass('is-hidden');
  },
  resetModal: function(modalPic,overlay){
    modalPic.css('display','none');
    overlay.css('right', '-100%');
  }


}