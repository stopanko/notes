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
//= require_tree .

$(document).ready(function(){
    $('#notes_panel .note_item').each(function(){
        var well = $(this).find('.well');
        var note_body = $(this).find('.note_body');

        if(well.height() < note_body.height()){
            well.css({'box-shadow' : 'inset 0 -5px 0px #8A6D3B'})
            //$('.well:first').css({'max-height':'100%'})
        }
    });
});
