$(function(){
  $(".category").click(function(){
    $(".category-id").val($(this).attr("id").replace("expense-category-",""));
    $(".category").removeClass("bg-green-400");
    $(this).addClass("bg-green-400");
  });
});
