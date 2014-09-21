$(document).ready(function(){
	var ctx = document.getElementById("myChart").getContext("2d");
	ctx.canvas.width  = window.innerWidth - 240;
  ctx.canvas.height = window.innerHeight - 130;

	var options = {
	};

	var data1 = [];
	var data2 = [];
	var data3 = [];
	var intLabels = [];

	$.getJSON("http://storetracker.herokuapp.com/api/location_points/1", function(data){
		data1 = data;
	});

	$.getJSON("http://storetracker.herokuapp.com/api/location_points/2", function(data){
		data2 = data;
	});

	$.getJSON("http://storetracker.herokuapp.com/api/location_points/3", function(data){
		data3 = data;
	});

	for(var i = 0; i < data1.length; i++){
		intLabels[i] = i + 1;
	}

	var data = {
    labels: intLabels,
    datasets: [
        {
            label: "First Beacon",
            fillColor: "rgba(220,220,220,0.2)",
            strokeColor: "rgba(220,220,220,1)",
            pointColor: "rgba(220,220,220,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(220,220,220,1)",
            data: data1
        },
        {
            label: "Second Beacon",
            fillColor: "rgba(151,187,205,0.2)",
            strokeColor: "rgba(151,187,205,1)",
            pointColor: "rgba(151,187,205,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(151,187,205,1)",
            data: data2
        },
        {
            label: "Thord Beacon",
            fillColor: "rgba(151,187,205,0.2)",
            strokeColor: "rgba(151,187,205,1)",
            pointColor: "rgba(151,187,205,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(151,187,205,1)",
            data: data3
        }    
      ]
	};
	var myLineChart = new Chart(ctx).Line(data, options);
});