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
    $(this).closest('.product').addClass('selected');
  })
  .on('click', '.product .wishlist .remove', function () {
    $(this).closest('.product').removeClass('selected');
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
  $('#get-started').unbind().submit(function(){
    //var me = $(this);
    var ids = $('.product.selected').map(function(){
      var me = $(this);
      return me.data('pid');
    }).get() || [];
    $('#cat_ids').val(ids.join(','));
    $('#site_id').val($.cookies.get('site'));
    //$('#cat_ids').attr('value', ids.join(','));
  return true;
  });
});
