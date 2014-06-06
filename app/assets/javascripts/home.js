$(document).ready(function() {
  

  if($("#map").length > 0){
  // Map declare
  var map = L.map('map').setView([-22.907675,-43.291499], 14);

  // add an OpenStreetMap tile layer
  L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png').addTo(map);

  // Icons declare
  var buddyIcon = L.icon({
    iconUrl: 'http://cdn.leafletjs.com/leaflet-0.6.4/images/marker-icon.png',
    iconAnchor: [7, 40],
    popupAnchor: [5, -32]
  });

  map.on('click', function(e) 
  { 
    L.marker(e.latlng, {icon: buddyIcon})
    .bindPopup("<a href=/occurrences/new?lat="+e.latlng.lat+"&lng="+e.latlng.lng+">New Occurrence</a>")
    .addTo(map)
  } );

}

});

