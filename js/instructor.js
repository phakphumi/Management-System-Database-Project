function setup_studentGrade() {
    var $e = $('#studentGrade');
    var implement_chart = function() {
        var data = {
            labels: ["0.0 - 0.5", "0.5 - 1.0", "1.0 - 1.5", "1.5 - 2.0", "2.0 - 2.5","2.5 - 3.0", "3.0 - 3.5","3.5 - 4.0"],
            datasets: [
                {
                    label: "จำนวนนิสิต ",
                    backgroundColor: 'rgba(75,192,192,1.0)',
                    borderColor: 'rgba(75,192,192,1)',
                    borderWidth: 1,
                    data: [0,0,0,0,5,8,10,7],
                }
            ]
        };
        var opt = {
            scales: {
                xAxes: [{
                    gridLines: {
                        display:false
                    }
                }],
                yAxes: [{
                    gridLines: {
                        display:false
                    }
                }]
            },
            tooltips: {
                enabled: false
            },
            hover: {
                animationDuration: 0
            },
            animation: {
                onComplete: function () {
                    var chartInstance = this.chart,
                        ctx = chartInstance.ctx;
                    ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, 'bold', Chart.defaults.global.defaultFontFamily);
                    ctx.textAlign = 'center';
                    ctx.textBaseline = 'bottom';

                    this.data.datasets.forEach(function (dataset, i) {
                        var meta = chartInstance.controller.getDatasetMeta(i);
                        meta.data.forEach(function (bar, index) {
                            var data = dataset.data[index];
                            ctx.fillText(data+' คน', bar._model.x, bar._model.y - 5);
                        });
                    });
                }
            }
        };
        var myLineChart = new Chart($e, {
            type: 'bar',
            data: data,
            responsive:false,
            options: opt,
        });
    }
    var implement_chart2 = function() {
        var data = {
            labels: ["0.0-0.5", "0.5-1.0", "1.0-1.5", "1.5-2.0", "2.0-2.5","2.5-3.0", "3.0-3.5","3.5-4.0"],
            datasets: [
                {
                    label: " จำนวนนิสิต ",
                    fill: true,
                    lineTension: 0.1,
                    backgroundColor: "rgba(75,192,192,0.4)",
                    borderColor: "rgba(75,192,192,1)",
                    borderCapStyle: 'butt',
                    borderDash: [],
                    borderDashOffset: 0.0,
                    borderJoinStyle: 'miter',
                    pointBorderColor: "rgba(75,192,192,1)",
                    pointBackgroundColor: "#fff",
                    pointBorderWidth: 1,
                    pointHoverRadius: 5,
                    pointHoverBackgroundColor: "rgba(75,192,192,1)",
                    pointHoverBorderColor: "rgba(220,220,220,1)",
                    pointHoverBorderWidth: 2,
                    pointRadius: 1,
                    pointHitRadius: 10,
                    data: [0,0,0,0,5,8,10,7],
                    spanGaps: false,
                    // steppedLine:true
                }
            ]
        };
        var myLineChart = new Chart($e, {
            type: 'line',
            data: data,
            options: {
            }
        });
    }
    var implement_link = function() {
        $e.parents('.shadowBox').find('.link').on('click',function() {
            BootstrapDialog.show({
                message: function(){
                    return $('<div class="row" style="margin:120px 0px;"></div>').append($e.parents('.shadowBox').clone().attr('class','col-sm-offset-4 col-sm-6'));
                }
            });
        });
    }

    implement_chart();
    implement_link();
}

function setup_disciplineScore() {
    var $e = $("#disciplineScore");
    var implement_chart = function(){
        var data = {
        labels: [
            "Good",
            "Fair",
            "Poor"
        ],
        datasets: [
            {
                data: [18, 10, 2],
                backgroundColor: [
                    "#36A2EB",
                    "#FFCE56",
                    "#FF6384",
                ],
                hoverBackgroundColor: [
                    "#35aeff",
                    "#ffc537",
                    "#ff496f",
                ]
            }]
        };
        var myDoughnutChart = new Chart($e, {
            type: 'doughnut',
            data: data,
            responsive:false,
            options:  {
                animation:{
                    animateScale:true
                },
                pieceLabel: {
                    mode: 'value',
                    fontSize: 14,
                    fontStyle: 'bold',
                    fontColor: '#000',
                    // arcText: true,
                    // fontFamily: '"Lucida Console", Monaco, monospace'
                    format: function (value) {
                        return value+' คน';
                    }
                }
            }
        });
    }
    var implement_link = function() {
        $e.parents('.shadowBox').find('.link').on('click',function() {
            BootstrapDialog.show({
                message: function(){
                    return $('<div class="row" style="margin:120px 0px;"></div>').append($e.parents('.shadowBox').clone().attr('class','col-sm-offset-4 col-sm-6'));
                }
            });
        });
    }

    implement_chart();
    implement_link();
}

function setup_Conclusion_bar(){
    var implement_Conclusion_tab = function(i,$e){
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

    var $row =  $(".conclusion-upperside");
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
    setup_disciplineScore();
    setup_studentGrade();
});
