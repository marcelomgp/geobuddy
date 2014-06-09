$(document).ready(function() {
  

  if($("#map").length > 0){
    
    // Map declare
    var map = L.map('map').setView([-22.907675,-43.291499], 14);

    // Add an OpenStreetMap tile layer
    L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png').addTo(map);

    // Icon declare
    var buddyIcon = L.icon({
      iconUrl: 'http://cdn.leafletjs.com/leaflet-0.6.4/images/marker-icon.png',
      iconAnchor: [7, 40],
      popupAnchor: [5, -32]
    });

    // Add a marker by clicking on map
    map.on('click', function(e) 
      { 
        L.marker(e.latlng, {icon: buddyIcon})
        .bindPopup("<a href=/occurrences/new?lat="+e.latlng.lat+"&lng="+e.latlng.lng+">New Occurrence</a>")
        .addTo(map)
      } );

    // 
    $.get("/occurrences", function(data) {
        data.map(function(item) { 
          L.marker(item.coordinate, {icon: buddyIcon})
          .addTo(map);
          });
    });

  }

});

