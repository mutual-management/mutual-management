"use strict";

jQuery(function($){
    $('.remodal-edit').click(function(){
        //classでonを持っているかチェック
        if(!$('#edit_content').hasClass('on')){
            //編集可能時はclassでonをつける
            $('.edit_content').addClass('on');
            let txt = $('.edit_content').text();
            //テキストをinputのvalueに入れてで置き換え
            $('.edit_content').html('<input class="bg-gray-700" type="text" value="'+txt+'" />');
            //同時にinputにフォーカスをする
            $('dd > input').focus().blur(function(){
                let inputVal = $('.edit_content').val();
                //もし空欄だったら空欄にする前の内容に戻す
                if(inputVal===''){
                    inputVal = $('.edit_content').defaultValue;
                };
                //編集が終わったらtextで置き換える
                $('.edit_content').parent().removeClass('on').text(inputVal);
            });
        };
    });
});
