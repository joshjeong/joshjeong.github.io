$(document).ready(function(){
  var gController = new Grid.Controller;
  gController.bindListeners();
});

Grid.Controller = function(){
  this.view = new Grid.View;
  self      = this;
}

Grid.Controller.prototype = {
  bindListeners: function(){
    this.hoverThumbnailListener();
    this.clickThumbnailListener();
    this.closeModalListener();
  },
  
  hoverThumbnailListener: function(){

    $('.thumbnail').on('mouseenter', function(){
      self.generateOverlay($(this));
    });
    $('.thumbnail').on('mouseleave', function(){
      self.removeOverlay($(this));
    })
  },
  
  clickThumbnailListener: function(){
    $('.thumbnail').on('click', function(){
      self.showInfoContainer($(this));
    })
  },

  closeModalListener: function(){
    $('.close-button').on('click', function(){
      self.closeModal($(this));
    })
  },

  showInfoContainer: function(image){
    var modal         = $('.modal'),
        description   = image.find('.description').html().toLowerCase(),
        modalPic      = $('.modal').find('.'+description),
        h             = modal.height(),
        w             = modal.width(),
        overlay       = modal.find('.overlay')
    modal.removeClass('is-hidden');
    this.createOverlay(w,h,modal);
    this.animateModal(h,overlay, modalPic);
  },

  generateOverlay: function(image){
    var h = image.height(),
        w = image.width();

    this.createOverlay(w,h,image);
    this.animateOverlay(h,image)
  },
  
  createOverlay: function(w,h,image){
    var arrowLeft   = image.find('.arrow-left'),
        rectangle   = image.find('.rectangle'),
        description = image.find('.description')

    this.view.createTriangle(h,arrowLeft)
    this.view.createRectangle(w,rectangle)
    this.view.changeLineHeight(h,description)
    this.view.positionRectangle(h,rectangle)
  },

  animateOverlay: function(h,image){
    this.view.showOverlay(h,image.find('.overlay'))
  },
  
  animateModal: function(h,overlay, image){
    this.view.showModal(h,overlay, image)
  },

  removeOverlay: function(image){
    var h           = image.height(),
        w           = image.width(),
        rectangle   = image.find('.rectangle'),
        description = image.find('.description'),
        overlay     = image.find('.overlay')

    this.view.hideDescription(description)
    this.view.hideOverlay(w,overlay)
  },

  closeModal: function(button){
    var modal = button.parents('.modal'),
     modalPic = modal.find('.modal-pic'),
      overlay = modal.find('.overlay')

    
    this.view.addHiddenClass(modal)
    this.view.resetModal(modalPic,overlay)
  }
}