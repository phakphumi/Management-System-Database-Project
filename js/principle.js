
var charts = {};

function setup_numOfStudents() {
    var $e = $('#numOfStudents');
    var implement_chart = function() {
        var data = {
            labels: ["Major1", "Major2", "Major3", "Major4", "Major5", "Major6", "Major7", "Major8", "Major9", "Major10"],
            datasets: [{
              label: "Freshman",
              backgroundColor: "#F29220",
              borderColor: "#F29220",
              data: [0,0,0,0,0,0,0,0,0,0]
            }, {
              label: "Sophomore ",
              backgroundColor: "#4365B0",
              borderColor: "#4365B0",
              data: [0,0,0,0,0,0,0,0,0,0]
            }, {
              label: "Junior ",
              backgroundColor: "#F365B0",
              borderColor: "#F365B0",
              data: [0,0,0,0,0,0,0,0,0,0]
            }, {
              label: "Senior ",
              backgroundColor: "#03a9f4",
              borderColor: "#03a9f4",
              data: [0,0,0,0,0,0,0,0,0,0]
            }, {
              label: "Super senior ",
              backgroundColor: "#D00",
              borderColor: "#D00",
              data: [0,0,0,0,0,0,0,0,0,0]
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
        charts['numOfStudents'] = myBarChart;
    }
    var implement_link = function() {
        $e.parents('.shadowBox').find('.link').on('click',function() {
            BootstrapDialog.show({
                cssClass: 'tempinfo',
                message: function(){
                    return $('<div class="row" style="margin:10px 0px;"></div>').append('<div class="col-sm-12"><img style="" class="img-responsive" src="img/info.png"></div>');
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
                    data: [0,0,0,0,0,0,0,0],
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
        charts['studentGrade'] = myLineChart;
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
            "5th Year",
            "6th Year",
            "7th Year",
            "8th Year"
        ],
        datasets: [
            {
                data: [0,0,0,0],
                backgroundColor: [
                    "#36A2EB",
                    "#FFCE56",
                    "#FF6384",
                    "#DF6384",
                ],
                hoverBackgroundColor: [
                    "#35aeff",
                    "#ffc537",
                    "#ff496f",
                    "#DF4384",
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
        charts['over4years'] = myDoughnutChart;
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
            "1th Year",
            "2th Year",
            "3th Year",
            "4th Year"
        ],
        datasets: [
            {
                data: [0,0,0,0],
                backgroundColor: [
                    "#36A2EB",
                    "#FFCE56",
                    "#FF6384",
                    "#DF6384",
                ],
                hoverBackgroundColor: [
                    "#35aeff",
                    "#ffc537",
                    "#ff496f",
                    "#DF4384",
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
                        return value+' รายการ';
                    }
                }
            }
        });
        charts['achievements'] = myDoughnutChart;
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
            count:0,subscript:'Students',key:'count',link:'#'},{
            count:0,subscript:'Prohibition',key:'prohibition',link:'#'},{
            count:0,subscript:'On Sick Leave',key:'intms_sick_and_oreason',link:'#'},{
            count:0,subscript:'Exchange',key:'exchange',link:'#'},{
            count:0,subscript:'Super Senior',key:'superSenior',link:'#'},{
        }];
        $e.find('.conclusion').html(res[i].count)
            .attr('key',res[i].key);
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
function setup_login(id) {
    return $.post('backends/login.php',{id:id,user_type:'principle'})
        .then(function(res) {
            console.log('logged in ',res);
        });
}
function get_conclusion() {
    return $.getJSON('backends/output.php',{view:'graph',type:'conclusion'})
        .then(function(res) {
            console.log(res);
            return res;
        });
}
function put_conclusion_bar(res) {
    var $els = $('.conclusion');
    for (var i in $els) {
        var $e = $els.eq(i);
        var key = $e.attr('key');
        $e.html(res[key]);
    }
}
var cal_suitable_data = {
    achievements : function(data) {
        var out = [];
        for (var i = 1; i <= 4; i++) {
            out.push(data[i]);
        }
        return [{data:out}];
    },
    over4years : function(data) {
        var out = [];
        for (var i = 5; i <= 8; i++) {
            out.push(data[i]);
        }
        return [{data:out}];
    },
    studentGrade : function(data) {
        var out = Object.assign(new Uint8Array(8),data);
        return [{data:out}];
    },
    numOfStudents : function(data) {
        var out = [];
        for (var i = 0; i < 5; i++) {
            out[i] = data[i];
        }
        for(var year = 6-1; year<data.length;year++){
            for(var major = 0;major<data[year].length;major++){
                out[5-1]['data'][major] += out[year]['data'][major];
            }
        }
        return out;
    }
};
function put_graph(res) {
    for (var key in charts) {
        if (charts.hasOwnProperty(key)) {
            var chart = charts[key];
            var chart_datasets = chart.config.data.datasets;
            var newData = cal_suitable_data[key](res[key]);
            console.log('----------------');
            console.log(key);
            console.log(chart_datasets);
            console.log(newData);
            console.log('----------------');
            $.extend(true,chart_datasets , newData);
            chart.update();
        }
    }
}
function setup_tables() {
    $('.table').bootstrapTable({
        columns: [{
            field: 'id',
            title: 'Item ID'
        }, {
            field: 'name',
            title: 'Item Name'
        }, {
            field: 'price',
            title: 'Item Price'
        }],
        data: [{
            id: 1,
            name: 'Item 1',
            price: '$1'
        }, {
            id: 2,
            name: 'Item 2',
            price: '$2'
        }]
    });
}
$(function(){
    setup_login(1234)
        .then(get_conclusion)
        .done(put_conclusion_bar)
        .done(put_graph);

    setup_Conclusion_bar();
    setup_acheivement();
    setup_over4years();
    setup_studentGrade();
    setup_numOfStudents();

    setup_tables();

});
