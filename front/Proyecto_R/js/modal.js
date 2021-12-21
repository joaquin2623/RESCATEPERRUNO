$('.btn').click(function(e){
    var img = e.target.src;
    var modal = '<div class="modal" id="modal"><img src="'+ img + '" class="modal__img"><div class="modal__boton" id="modal__boton">x</div></div>';
    $('section').append(modal);
    $('#modal__boton').click(function(){
        $('#modal').remove();
    })
})