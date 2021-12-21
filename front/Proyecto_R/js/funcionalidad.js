
onload=function()
{
// Cargamos una imagen aleatoria
rotarImagenes();
// Indicamos que cada 5 segundos cambie la imagen
setInterval(rotarImagenes,5000);
}
/**
     * Array con las imagenes y enlaces que se iran mostrando en la web
     */
 var imagenes=new Array(
    ['/img/accesorio-gatos-banner.jpg'],
    ['/img/accesorio-perros-banner.jpg']
);
var contador=0;

/**
 * Funcion para cambiar la imagen y link
 */
function rotarImagenes()
{
    // cambiamos la imagen y la url
    contador++
    document.getElementById("imagen-banner").src=imagenes[contador%imagenes.length][0];
   
}
// =========================================Grupo 6=========
$(document).ready(function () {
//AJAX
$("#btnResultado").click(function () {
    $.ajax({
        type: "get",
        url: "ejemplo.html",
        success: function (response) {
            $("#resultado").html(response);
        }
    });
});
$(".menu-toggle-btn").click(function(){
    $(this).toggleClass("fa-times");
    $(".navigation-menu").toggleClass("active");
  });
});

      
    