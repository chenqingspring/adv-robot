$(document).ready(function(){
    var advs = $('.adv');    
    var adv_index = Math.ceil(Math.random()*(advs.length - 1));    
    adv = advs[adv_index];    
    $(adv).bind('click',function(){
        window.location.href = $(this).attr('href');
    });
    $(adv).trigger('click');
});