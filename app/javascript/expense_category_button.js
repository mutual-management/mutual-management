$(function(){
  // カテゴリボタンを押すと支出カテゴリの隠しフォームに値が入る
  // つまり支出と支出カテゴリの紐付け
  $(".category").click(function(){
    $(".category-id").val($(this).attr("id").replace("expense-category-",""));
    $(".category").removeClass("bg-green-400");
    $(this).addClass("bg-green-400");
  });

  // カテゴリボタンを長押しすると論理削除　画面から消える
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

  // +ボタンでカテゴリ追加エリアを表示
  $(".plus-button").click(function(){                                             
    $(this).hide();
    $(".category-addition-area").show();
  });                                                                                   

  // カテゴリ追加をキャンセル
  $(".add-category-cancel").click(function(){                                             
    $(".category-addition-area").hide();
    $(".plus-button").show();
  });

  // カテゴリ追加（リクエスト送信）
  // 追加できたカテゴリをカテゴリボタンとして表示
  $(".add-category-button").click(function(){                                             
    let title = $('.add-category-form').val(); 
    $.post({
      url: '/expense_categories',
      data: {expense_category: {title: title}},
    }).done(function(res){
      $(".category-addition-area").hide();
      $(".added-category")
      .attr('id', `expense-category-${res.id}`)
      .attr('value', res.title)
      .text(res.title)
      .show();
    });
  });
});                                                                                   
