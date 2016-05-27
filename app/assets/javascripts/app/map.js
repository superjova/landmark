var Map;

App.Map = Map = (function() {
  function Map(overlord) {
    this.map = new google.maps.Map(document.getElementById('map'), {
      zoom: 4,
      disableDefaultUI: true
    });
    this.overlord = overlord;
    this.markers = [];
    this.directionsService = new google.maps.DirectionsService;
    this.directionsDisplay = new google.maps.DirectionsRenderer({suppressMarkers: true});
  }

  Map.prototype.center = function() {
    var bounds, index, infowindow, j, len, location, marker, ref;
    bounds = new google.maps.LatLngBounds();
    infowindow = new google.maps.InfoWindow();
    overlord = this.overlord;
    ref = overlord.locations;
    for (index = j = 0, len = ref.length; j < len; index = ++j) {
      location = ref[index];
      marker = new google.maps.Marker({
        position: new google.maps.LatLng(location.latitude, location.longitude),
        map: this.map,
        icon: '/assets/icons/' + location.color() + '.png'
      });
      bounds.extend(marker.position);
      google.maps.event.addListener(marker, 'click', (function(map, marker, location) {
        return function() {
          location.open();
        };
      })(this.map, marker, location));

      this.markers.push(marker);
    }
    return this.map.fitBounds(bounds);
  };

  Map.prototype.clearMarkers = function() {
    var index, j, len, ref;
    ref = this.markers;
    for (index = j = 0, len = ref.length; j < len; index = ++j) {
      ref[j].setMap(null);
    }
    this.markers = [];
  };

  Map.prototype.clearRoute = function() {
    this.directionsDisplay.setMap(null);
  };

  Map.prototype.directions = function(origin, destination) {
    var $this = this;
    this.clearMarkers();
    this.directionsDisplay.setMap(this.map);
    this.directionsService.route({
      origin: origin,
      destination: destination,
      travelMode: google.maps.TravelMode.WALKING
    }, function(response, status) {
      if (status === google.maps.DirectionsStatus.OK) {
        var m;
        $this.directionsDisplay.setDirections(response);
        var leg = response.routes[ 0 ].legs[ 0 ];
        m = new google.maps.Marker({
          position: leg.start_location,
          icon: '/assets/icons/landmark.png',
          title: "The LandMark",
          map: $this.map
        });
        $this.markers.push(m);

        m = new google.maps.Marker({
          position: leg.end_location,
          icon: '/assets/icons/blue.png',
          title: "destination",
          map: $this.map
        });
        $this.markers.push(m);
        $this.overlord.gotDirections();
      } else {
        window.alert('Directions request failed due to ' + status);
      }
    });
  };

  return Map;

})();
