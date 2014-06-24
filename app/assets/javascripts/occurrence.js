$(document).ready(function() {  

  if($("#map").length > 0){
    
    // Map declare
    map = L.map('map').setView([-22.907675,-43.291499], 14);

    // Add an OpenStreetMap tile layer
    L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png').addTo(map);

    // Icon declare
    var buddyIcon = L.icon({
      iconUrl: 'http://cdn.leafletjs.com/leaflet-0.6.4/images/marker-icon.png',
      iconAnchor: [7, 40],
      popupAnchor: [5, -32]
    });

    // Click event function
    function onClick(e) 
    { 
        L.marker(e.latlng, {icon: buddyIcon})
        .bindPopup("<a href=/occurrences/new?lat="+e.latlng.lat+"&lng="+e.latlng.lng+">New Occurrence</a>")
        .addTo(map)   
    }

    // Bbox function
    function loadOccurrences()
    {
      $.post('/occurrences/bbox.json', 
      {
        n: map.getBounds().getNorth(), 
        s: map.getBounds().getSouth(),
        e: map.getBounds().getEast(),
        w: map.getBounds().getWest()
      }, 
      function(data)
      {
        var content = "";
        data.occurrences.forEach(function(occurrence) 
        {
          L.marker(occurrence.geometry.coordinates, {icon: buddyIcon})
          .bindPopup(
                      "<p><b>Occurrence Type:</b> "+occurrence.properties.occurrenceType+
                      "<p><b>Description:</b> "+occurrence.properties.description
                    )
          .addTo(map);
          content = content + "<p><b>"+occurrence.properties.occurrenceType+"</b></p><p>"+occurrence.properties.description+"</p><br>";
        });
        $("#sidebar").html(content);
      });
    }
    
    map.on('click', onClick);
    map.on('moveend', function()
    {
      loadOccurrences();
    });
    loadOccurrences();
  }
});
