$('.in').click(function(){
    let t = $(this).clone(); // Copia el div en el que se hace clic actualmente
    $('.no_see').before(t); // Inserta el div copiado delante del div en blanco
    $(this).before($('.no_see')); // Inserta el div en blanco delante del div seleccionado
    t.before($(this)) // Inserte el div en el que se hizo clic delante del div copiado
    t.remove();  // Elimina el div copiado y sus eventos
})

//Contador de caracteres
$('textarea').keyup(updateCount);//no se esta pulsando
$('textarea').keydown(updateCount);//se pulsa la tecla
function updateCount() {
    var cs = $(this).val().length;
    $('#characters').text(cs);//devuelve el numero de caracteres
}
