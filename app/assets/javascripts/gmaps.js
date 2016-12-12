    // $(document).ready(function() {
    //   var handler = Gmaps.build('Google');
    //   handler.buildMap({ internal: { id: 'map' } }, function() {

    //   markers = handler.addMarkers(<%= raw @hash.to_json %>);

    //     handler.bounds.extendWith(markers);

    //     handler.fitMapToBounds();

    //     if (markers.length == 0) {
    //       handler.getMap().setZoom(2);
    //     } else if (markers.length == 1) {
    //     handler.getMap().setZoom(14);
    //     }
    //   });
    // });

      // function initMap() {
      //   var map = new google.maps.Map(document.getElementById('map'), {
      //     center: {lat: -34.397, lng: 150.644},
      //     zoom: 6
      //   });
      //   var infoWindow = new google.maps.InfoWindow({map: map});

      //   markers = map.addMarkers(<%= raw @hash.to_json %>);

      //     map.bounds.extendWith(markers);

      //     map.fitMapToBounds();

      //     if (markers.length == 0) {
      //       map.getMap().setZoom(2);
      //     } else if (markers.length == 1) {
      //     map.getMap().setZoom(14);
      //     }
      //   });

      //   // Try HTML5 geolocation.
      //   if (navigator.geolocation) {
      //     navigator.geolocation.getCurrentPosition(function(position) {
      //       var pos = {
      //         lat: position.coords.latitude,
      //         lng: position.coords.longitude
      //       };

      //       infoWindow.setPosition(pos);
      //       infoWindow.setContent('Location found.');
      //       map.setCenter(pos);
      //     }, function() {
      //       handleLocationError(true, infoWindow, map.getCenter());
      //     });
      //   } else {
      //     // Browser doesn't support Geolocation
      //     handleLocationError(false, infoWindow, map.getCenter());
      //   }
      // }

      // function handleLocationError(browserHasGeolocation, infoWindow, pos) {
      //   infoWindow.setPosition(pos);
      //   infoWindow.setContent(browserHasGeolocation ?
      //                         'Error: The Geolocation service failed.' :
      //                         'Error: Your browser doesn\'t support geolocation.');
      // }

