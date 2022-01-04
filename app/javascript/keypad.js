$(function(){
  let push_num = [];

  $('.switch').on('click',function(){
    if (push_num.length || $(this).text()!=="0") {
      push_num.push($(this).text());
      num = Number(push_num.join(''));
      $('.display').val(num);
    }
  });

  $('.clear').on('click',function(){
    if (push_num.length) {
      push_num.pop();
      num = Number(push_num.join(''));
      $('.display').val(num);
    }
  });

  $('.reset').on('click',function(){
    num = '';
    push_num = [];
    $('.display').val(num);
  })

});
