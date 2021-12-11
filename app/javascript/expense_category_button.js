$(function(){
  $(".category").click(function(){
    $(".category-id").val($(this).attr("id").replace("expense-category-",""));
    $(".category").removeClass("bg-green-400");
    $(this).addClass("bg-green-400");
  });

  $('.category').on("mousedown touchstart",function(){
    let id = $(this).attr('id').replace('expense-category-','');
    let value = $(this).attr('value');
    let LONGPRESS = 1500;
    let timerId = setTimeout(function(){
    	if (window.confirm(`カテゴリ「${value}」を削除しますか？`)){
        $.ajax({
          type: 'PATCH',
          url: `/expense_categories/${id}`,
          data: {expense_category: {delete_flag: true}},
          async: true
        });
        $(`#expense-category-${id}`).remove();
      }
    }, LONGPRESS);
  }).on("mouseup mouseleave touchend",function(){
    clearTimeout(timerId);
  });

  $(".add-category").click(function(){                                             
    $(this).hide();
    $(".add-category-area").show();
  });                                                                                   

  $(".add-category-cancel").click(function(){                                             
    $(".add-category-area").hide();
    $(".add-category").show();
  });

  $(".add-category-button").click(function(){                                             
    let title = $('.add-category-form').val(); 
    $.ajax({
      type: 'POST',
      url: '/expense_categories',
      data: {expense_category: {title: title}},
      async: true
    });
  });
});                                                                                   
