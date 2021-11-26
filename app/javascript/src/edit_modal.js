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
            $('dd > input').focus().blur(function(){
                let inputVal = $(`#edit_content${edit_id}`).val();
                //もし空欄だったら空欄にする前の内容に戻す
                if(inputVal===''){
                    inputVal = $(`#edit_content${edit_id}`).defaultValue;
                };
                //編集が終わったらtextで置き換える
                $(`#edit_content${edit_id}`).parent().removeClass('on').text(inputVal);
            });
        };
    });
});
