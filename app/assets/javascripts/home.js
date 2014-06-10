$(document).ready(function() {
  

  if($("#map").length > 0){
    
    // Map declare
    var map = L.map('map').setView([-22.907675,-43.291499], 14);

    var southWest = L.latLng(-22.907675,-43.291499),
    northEast = L.latLng(-22.407675,-43.091499),
    bounds = L.latLngBounds(southWest, northEast);

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

      /*var bounds = ([L.marker([-22.907675,-43.291499], {icon: buddyIcon}).bindPopup("<a href=/occurrences/new?lat="+e.latlng.lat+"&lng="+e.latlng.lng+">New Occurrence</a>").addTo(map),
                   L.marker([-22.9019527791648, -43.29780578613281], {icon: buddyIcon}).bindPopup("<a href=/occurrences/new?lat="+e.latlng.lat+"&lng="+e.latlng.lng+">New Occurrence</a>").addTo(map),
                   L.marker([-22.89760414329702, -43.30389976501465], {icon: buddyIcon}).bindPopup("<a href=/occurrences/new?lat="+e.latlng.lat+"&lng="+e.latlng.lng+">New Occurrence</a>").addTo(map)]);

      map.fitBounds(bounds);

      });*/
    
    });

    $.get('/occurrences', function(data) {
        data.map(function(item) { 
                                  L.marker(item.coordinate, {icon: buddyIcon})
                                  .addTo(map) 
        })
    });

  }

});

