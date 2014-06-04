$(document).ready(function() {
  
  // Map declare
  var map = L.map('map').setView([-22.907675,-43.291499], 14);

  // add an OpenStreetMap tile layer
  //L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
  L.tileLayer('http://{s}.tile.cloudmade.com/4d8c9d1958ce4c1582ae158ce26bc516/997/256/{z}/{x}/{y}.png?{foo}',{foo: 'bar'}).addTo(map);

  // Icons declare
  var buddyIcon = L.icon({
    iconUrl: 'http://cdn.leafletjs.com/leaflet-0.6.4/images/marker-icon.png',
    //iconSize: [20, 30],
    iconAnchor: [0, 0],
    popupAnchor: [100, 100]
  });

  var iconOffsetted = L.icon({
    iconUrl: 'http://cdn.leafletjs.com/leaflet-0.6.4/images/marker-icon.png',
    //iconSize: [20, 30],
    iconAnchor: [100, 100],
    popupAnchor: [100, 100]
  });

  /*var popup = L.popup([-22.907675,-43.291499])
              .setContent('<p> Hello! </p>')
              .openOn(map);*/

  // add marker to map
  L.marker([-22.907675,-43.291499], {icon: buddyIcon}).addTo(map);
  L.marker([-22.907675,-43.291499], {icon: iconOffsetted}).addTo(map);

  
});

