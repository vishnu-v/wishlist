$(function(){
  $(document)
  .on('click', '.product-wrapper > .action > .contribute', function(){
    confirm('Sure to contribute $1000?');
  })
  .on('click', '.action > .buy', function(){
    alert('Item bought');
  });
});
