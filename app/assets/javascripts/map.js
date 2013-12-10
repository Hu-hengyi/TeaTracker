
$(window).load(function() {

  var map = L.map('map', {
      layers: MQ.hybridLayer(),
      center: [-15.97857, 35.65389],
      zoom: 12
  });//.setView(new L.LatLng(-16.026181, 35.645142), 13);

  var LeafIcon = L.Icon.extend({
      options: {
          shadowUrl: 'leaf-shadow.png',
          iconSize:     [38, 56],
          shadowSize:   [0, 0],
          iconAnchor:   [22, 94],
          shadowAnchor: [4, 62],
          popupAnchor:  [-3, -76]
      }
  });

  var markerIcon = new LeafIcon({
      iconUrl: '../../assets/marker-icon.png',
      iconSize: [25, 41],
      iconAnchor: [12.5, 41]
  });
  var oneLeafIcon = new LeafIcon({
      iconUrl: '../../assets/one-leaf.png',
      iconSize: [45, 45],
      iconAnchor: [22, 40]
  });
  var twoLeafIcon = new LeafIcon({
      iconUrl: '../../assets/two-leaves.png',
      iconSize: [45, 45],
      iconAnchor: [24, 40]
  });
  var threeLeafIcon = new LeafIcon({
      iconUrl: '../../assets/three-leaves.png',
      iconSize: [45, 45],
      iconAnchor: [25, 40]
  });

  L.icon = function (options) {
    return new L.Icon(options);
  };

  /* Set up map */
//  L.tileLayer('http://b.tile.cloudmade.com/8ee2a50541944fb9bcedded5165f09d9/114586/256/{z}/{x}/{y}.png', {
//    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>',
//    maxZoom: 18
//  }).addTo(map);

  /* Drop markers for farms */
  $('table.mapdata tr').each(function(index, row) {
      if (index > 0) {
          var longitude = $(row).find('td.longitude').text();
          var latitude  = $(row).find('td.latitude').text();
          var leaves    = $(row).find('td.numLeaves').text();
          var name      = $(row).find('td.name').text();

          var icon;
          if (isNaN(leaves)) {
              icon = markerIcon;
          } else if (leaves == 1) {
              icon = oneLeafIcon;
          } else if (leaves == 2) {
              icon = twoLeafIcon;
          } else if (leaves == 3) {
              icon = threeLeafIcon;
          } else {
              icon = markerIcon;
          }

          marker = L.marker(new L.LatLng(latitude, longitude));

          if (icon != null) {
              marker.setIcon(icon);
          }

          if (name != "") {
            marker.bindPopup(name);
          }

          marker.addTo(map);
      }
  });



  /* Set leaflet-marker-icon source 
  $('.leaflet-marker-icon').attr('src', 'http://leafletjs.com/dist/images/marker-icon.png');
  $('.leaflet-marker-shadow').attr('src', '');
  */
});
