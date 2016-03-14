// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require ckeditor/init
//= require jquery.waypoints
//= require_tree .

$(document).ready(function(){
    $.add_note_border_and_open_button = function(element){
        var well = element.find('.well');
        var note_body = element.find('.note_body');

        if(well.height() < note_body.height()){
            well.css({'box-shadow' : 'inset 0 -5px 0px #8A6D3B'});
            element.find('.show_note').removeClass('hidden');
        }

        //    кнопка розгортання нотатку
        element.find('.show_note').click(function(){
            $(this).toggleClass('glyphicon-chevron-down');
            $(this).toggleClass('glyphicon-chevron-up');
            var note_id = $(this).attr('data-note-id');
            if($(this).hasClass('closed')){
                $(".note_item[data-note-id = "+note_id+"] .well").css({'max-height':'100%'});
            }else{
                $(".note_item[data-note-id = "+note_id+"] .well").css({'max-height':'100px'});
            }
            $(this).toggleClass('closed');
        });
    };

    //якщо замітка вилазить за розміри то вводимо бордер знизу
    $('#notes_panel .note_item').each(function(){
        $.add_note_border_and_open_button($(this));
    });

});
