/**
 * Created by aodegaar on 19.05.2017.
 */
$(function() {
    $('.glyphicon-star-empty').click(function () {
        var book_id = $(this).attr('data-book-id');
        var star = $(this);
        var stars = $(this).attr('data-stars');

        for (var i=1; i <= 5; i++){
            if(i <= stars ) {
                $('#' + book_id + '_' + i).addClass('glyphicon-star').removeClass('glyphicon-star-empty');
            } else {
                $('#' + book_id + '_' + i).removeClass('glyphicon-star').addClass('glyphicon-star-empty');
            }
        }
    });
});