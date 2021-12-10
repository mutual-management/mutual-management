"use strict";

jQuery(function($){
    $('.remodal-edit').click(function(){
       let edit_id = $(this).attr('id');
        //classでonを持っているかチェック
        if(!$(`#edit_content${edit_id}`).hasClass('on')){
            $('.update-btn').show();
            //編集可能時はclassでonをつける
            $(`#edit_content${edit_id}`).addClass('on');
            let txt = $(`#edit_content${edit_id}`).text();
            //テキストをinputのvalueに入れてで置換え
          $(`#edit_content${edit_id}`).html(`<textarea class="bg-gray-700 w-96 h-48 resize-none" type="text">${txt}</textarea>`);
            //同時にinputにフォーカスをする
            $('p > textarea').focus();
            $('.update-btn').mousedown(function(){
               let inputVal = $('p > textarea').val();
              console.log(inputVal);
                //もし空欄だったら空欄にする前の内容に戻す
               if(inputVal===''){
                 inputVal = $('p > textarea').defaultValue;
               };
                //編集が終わったらtextで置き換える
                $('p > textarea').parent().removeClass('on').text(inputVal);
                $('.update-btn').hide();
                $.ajax({
                  url: `/topics/${edit_id}`,  
                  type: 'PATCH',
                  dataType: 'html',
                  async: true,
                  data: {
                    content: inputVal,
                  },
                });
                window.location.href = '/topics';
            });
              $('p > textarea').blur(function(){
              let inputVal = $(this).val();
              $('p > textarea').parent().removeClass('on').text(inputVal);
              $('.update-btn').hide();
              //もし空欄だったら空欄にする前の内容に戻す
              if(inputVal===''){
                inputVal = $(this).defaultValue;
              };
              });
        };
    });
});
