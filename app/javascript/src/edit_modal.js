"use strict";

jQuery(function($){
    $('.remodal-edit').click(function(){
       let edit_id = $(this).attr('id');
        //classでonを持っているかチェック
        if(!$(`#edit_content${edit_id}`).hasClass('on')){
            //編集可能時はclassでonをつける
            $(`#edit_content${edit_id}`).addClass('on');
            let txt = $(`#edit_content${edit_id}`).text();
            //テキストをinputのvalueに入れてで置換え
          $(`#edit_content${edit_id}`).html(`<textarea cols='40' rows='5' class="bg-gray-700" type="text">${txt}</textarea>`);
            //同時にinputにフォーカスをする
            $('p > textarea').focus().blur(function(){
                let inputVal = $(this).val();
                console.log(inputVal);
                //もし空欄だったら空欄にする前の内容に戻す
                if(inputVal===''){
                    inputVal = $(this).defaultValue;
                };
                //編集が終わったらtextで置き換える
                $(this).parent().removeClass('on').text(inputVal);
                $.ajax({
                  url: `/topics/${edit_id}`,  
                  type: 'PATCH',
                  dataType: 'html',
                  async: true,
                  data: {
                    content: inputVal,
                  },
                });
            });
        };
    });
});