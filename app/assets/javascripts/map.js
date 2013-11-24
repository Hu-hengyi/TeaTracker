$(window).load(function() {
  var map = L.map('map').setView(new L.LatLng(-16.026181, 35.645142), 13);

  L.tileLayer('http://b.tile.cloudmade.com/8ee2a50541944fb9bcedded5165f09d9/114586/256/{z}/{x}/{y}.png', {
    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>',
    maxZoom: 18
  }).addTo(map);
});