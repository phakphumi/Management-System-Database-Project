function implement_Conclusion_tab(i,$e){
    var res = [{
        count:35,subscript:'Supervisee',link:'#'},{
        count:2,subscript:'Probation',link:'#'},{
        count:5,subscript:'On Sick Leave',link:'#'},{
        count:1,subscript:'Exchange',link:'#'},{
        count:0,subscript:'Super Senior',link:'#'},{
    }];
    $e.find('.count').html(res[i].count);
    $e.find('.subscript').html(res[i].subscript);
    $e.find('.link').attr('href',res[i].link)
        .on('click',function(){
            BootstrapDialog.show({
                message: function(){
                    return $('<div class="row" style="margin:120px 0px;"></div>').append($e.clone().attr('class','col-sm-offset-3 col-sm-6'));
                }
            });
        });
}

function setup_Conclusion_bar(){
    var $row =  $(".conclusion-bar");
    var $temp = $row.find(".shadowBox").parent();
    var $template = $temp.clone();
    $temp.remove();
    for(var i=0;i<5;i++){
        var $thisCol = $template.clone();
        $row.append($thisCol);
        implement_Conclusion_tab(i,$thisCol);
    }
}

$(function(){
    setup_Conclusion_bar();
});
