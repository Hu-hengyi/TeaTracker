$(window).load(function() {
  var map = L.map('map').setView(new L.LatLng(-16.026181, 35.645142), 13);

  /* Set up map */
  L.tileLayer('http://b.tile.cloudmade.com/8ee2a50541944fb9bcedded5165f09d9/114586/256/{z}/{x}/{y}.png', {
    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>',
    maxZoom: 18
  }).addTo(map);

   Drop markers for farms 
  $('.latitude a').each(function(index){
    var lat = parseFloat($(this).html());
    $('.longitude a').each(function(){
      var lon = parseFloat($(this).html());
      L.marker(new L.LatLng(lat, lon)).addTo(map)
      .bindPopup(index.toString())      
    });
  });

  /* Set leaflet-marker-icon source */
  $('.leaflet-marker-icon').attr('src', 'http://leafletjs.com/dist/images/marker-icon.png');
  $('.leaflet-marker-shadow').attr('src', 'http://leafletjs.com/dist/images/marker-shadow.png');
});