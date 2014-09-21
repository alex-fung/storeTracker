$(document).ready(function(){
	
	$.getJSON("http://storetracker.herokuapp.com/api/location_points/1", function(data1){
		$.getJSON("http://storetracker.herokuapp.com/api/location_points/2", function(data2){
				$.getJSON("http://storetracker.herokuapp.com/api/location_points/3", function(data3){
						var ctx = document.getElementById("myChart").getContext("2d");
						ctx.canvas.width  = window.innerWidth - 240;
					  ctx.canvas.height = window.innerHeight - 130;

					var options = {
					};

					var intLabels = [];
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
		});
	});
});