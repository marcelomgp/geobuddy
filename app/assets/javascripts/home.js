$(document).ready(function() {
  
  // Map declare
  //var map = new google.maps.Map($('#map')[0], mapOptions);

  // Map declare
  var map = L.map('map').setView([-22.907675,-43.291499], 14);

  // add an OpenStreetMap tile layer
  L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png').addTo(map);
  //L.tileLayer('http://{s}.tile.cloudmade.com/4d8c9d1958ce4c1582ae158ce26bc516/997/256/{z}/{x}/{y}.png?{foo}',{foo: 'bar'}).addTo(map);

  // Icons declare
  var buddyIcon = L.icon({
    iconUrl: 'http://cdn.leafletjs.com/leaflet-0.6.4/images/marker-icon.png',
    //iconSize: [20, 30],
    iconAnchor: [0, 0],
    popupAnchor: [13, -5]
  });

  // add marker to map
  //marker = L.marker([-22.907675,-43.291499], {icon: buddyIcon})
  //marker.bindPopup('Wee.')
  //marker.addTo(map);

  map.on('click', function(e) { 
                                L.marker(e.latlng, {icon: buddyIcon})
                                .bindPopup('<a href="http://localhost:3000/ocurrency/new" title="New Ocurrency">New Ocurrency</a>')
                                .addTo(map)
                              });
 
});

