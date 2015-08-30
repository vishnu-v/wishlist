$(function(){
  $(document)
  /*
  .on('mouseenter', '.product ', function(){
    $(this).find('.card-image .activator').trigger('click');
  })
  .on('mouseleave', '.product ', function(){
    $(this).find('.card-title').trigger('click');
  })
  */
  .on('click', '.product .wishlist .add, .product .wishlist .added', function () {
    $(this).addClass('hide').siblings().removeClass('hide');
  })
  .on('click', '.product .actions > .contribute', function(){
    confirm('Sure to contribute $1000?');
  })
  .on('click', '.product .actions > .buy', function(){
    alert('Item bought');
  });
  $('.button-collapse').sideNav({menuWidth: 200});
  $('.modal-trigger').leanModal();
  $('.parallax').parallax();

});
