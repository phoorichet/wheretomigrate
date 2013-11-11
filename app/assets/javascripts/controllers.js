var mhControllers;

mhControllers = angular.module('mhControllers', []);

mhControllers.controller('CitySearchCtrl', function($scope, $http) {
    $scope.city = "";
    $scope.userType = "";
    $scope.city_list = [];
    $scope.current_city = null;
    $scope.submit = function() {
      // console.log('submit');
      this.city = this.userType;
      self = this;
      $http.get('/cities/search?city=' + this.city).success(function(data){
        self.current_city = data;
        if (self.current_city.city !== null) {
          self.city_list.push(self.current_city);
          if (data.latitude != null && data.longitude != null){
            var latlng = new google.maps.LatLng(data.latitude, data.longitude);
            window.MigrantHeaven.map.panTo(latlng);
          }
        }
        // Refresh radar
        self.drawRadar();
      });
    };

    $scope.drawRadar = function() {


console.log("Rendering D3...")
var w = 200,  h = 150;

var colorscale = d3.scale.category10();

//Legend titles
var LegendOptions = [];
var d = [];
for(var i=0; i < this.city_list.length; i++){
  var tmp_city = this.city_list[i];
  LegendOptions.push(tmp_city.city);
  var factors = [
      {axis:"Job Opening", value: (tmp_city.data.jobs || 0)*100 },
      {axis:"Crime Rate", value: tmp_city.data.crime || 0 },
      {axis:"Cost of Living", value: tmp_city.data.costliving || 0 },
      {axis:"Transits", value: tmp_city.data.transit || 0 },
  ];
  d.push(factors);
}
// console.log(LegendOptions);
// console.log(d);

//Data
// var d = [
//   [
//         {axis:"Job Opening",value:0.59},
//         {axis:"Crime Rate",value:0.56},
//         {axis:"Cost of Living",value:0.42},
//         {axis:"Transits",value:0.34},
//   ],[
//         {axis:"Job Opening",value:0.48},
//         {axis:"Crime Rate",value:0.41},
//         {axis:"Cost of Living",value:0.27},
//         {axis:"Transits",value:0.28},
// 
//   ]
// ];

//Options for the Radar chart, other than default
var mycfg = {
  w: w,
  h: h,
  maxValue: 0.2,
  mixVallue: 0.0,
  levels: 5,
  ExtraWidthX: 300
}

//Call function to draw the Radar chart
//Will expect that data is in %'s
RadarChart.draw("#radar-chart", d, mycfg);

////////////////////////////////////////////
/////////// Initiate legend ////////////////
////////////////////////////////////////////

var svg = d3.select('#radar-body')
	.selectAll('svg')
	.append('svg')
	.attr("width", w+300)
	.attr("height", h)

//Create the title for the legend
var text = svg.append("text")
	.attr("class", "title")
	.attr('transform', 'translate(90,0)') 
	.attr("x", w - 70)
	.attr("y", 10)
	.attr("font-size", "12px")
	.attr("fill", "#404040")
	.text("What % of owners use a specific service in a week");
		
//Initiate Legend	
var legend = svg.append("g")
	.attr("class", "legend")
	.attr("height", 100)
	.attr("width", 200)
	.attr('transform', 'translate(90,20)') 
	;
	//Create colour squares
	legend.selectAll('rect')
	  .data(LegendOptions)
	  .enter()
	  .append("rect")
	  .attr("x", w - 65)
	  .attr("y", function(d, i){ return i * 20;})
	  .attr("width", 10)
	  .attr("height", 10)
	  .style("fill", function(d, i){ return colorscale(i);})
	  ;
	//Create text next to squares
	legend.selectAll('text')
	  .data(LegendOptions)
	  .enter()
	  .append("text")
	  .attr("x", w - 52)
	  .attr("y", function(d, i){ return i * 20 + 9;})
	  .attr("font-size", "11px")
	  .attr("fill", "#737373")
	  .text(function(d) { return d; })
	  ;






    };// end drawRadar
  }
);
