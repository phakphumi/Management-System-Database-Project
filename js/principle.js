function setup_numOfStudents() {
    var $e = $('#numOfStudents');
    var implement_chart = function() {
        var data = {
            labels: ["Major1", "Major2", "Major3", "Major4", "Major5", "Major6", "Major7", "Major8", "Major9", "Major10"],
            datasets: [{
              label: "Freshman",
              backgroundColor: "#F29220",
              borderColor: "#F29220",
              data: [40,20,30,10,10,10,5,10,10,30]
            }, {
              label: "Sophomore ",
              backgroundColor: "#4365B0",
              borderColor: "#4365B0",
              data: [60,80,70,20,30,10,20,10,10,20]
            }, {
              label: "Junior ",
              backgroundColor: "#F365B0",
              borderColor: "#F365B0",
              data: [60,80,70,20,30,10,20,10,10,20]
            }, {
              label: "Senior ",
              backgroundColor: "#03a9f4",
              borderColor: "#03a9f4",
              data: [10,5,10,30,10,10,25,10,10,10]
            }, {
              label: "Super senior ",
              backgroundColor: "#D00",
              borderColor: "#D00",
              data: [10,5,10,30,10,10,25,10,10,10]
            }]
        };
        var opt = {
            scales: {
                xAxes: [{stacked: true}],
                yAxes: [{
                    stacked: true,
                    ticks: {
                        beginAtZero: true
                    }
                }]
            },
            // responsiveAnimationDuration: 1000,
        };
        var myBarChart = new Chart($e, {
            responsive: true,
            type: 'bar',
            data: data,
            options: opt,
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
                    data: [10,10,10,10,50,80,100,70],
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
function setup_over4years() {
    var $e = $("#over4years");
    var implement_chart = function(){
        var data = {
        labels: [
            "Good",
            "Fair",
            "Poor"
        ],
        datasets: [
            {
                data: [20, 30, 15],
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
function setup_acheivement() {
    var $e = $("#acheivement");
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
            count:10100,subscript:'Supervisee',link:'#'},{
            count:1111,subscript:'Probation',link:'#'},{
            count:2222,subscript:'On Sick Leave',link:'#'},{
            count:3333,subscript:'Exchange',link:'#'},{
            count:4444,subscript:'Super Senior',link:'#'},{
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
    setup_acheivement();
    setup_over4years();
    setup_studentGrade();
    setTimeout(function() {
        setup_numOfStudents();
    },1000);
});
