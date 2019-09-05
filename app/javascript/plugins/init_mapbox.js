import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10',
      // center: [ 19.3910036,-99.2840422 ] //47.3801836,-104.7894635
      // , zoom: 8
          });
    const markers = JSON.parse(mapElement.dataset.markers);
    // const addMarkersToMap = (map, markers) => {
      markers.forEach((marker) => {
        const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

        // Create a HTML element for your custom marker
        const element = document.createElement('div');
        element.className = 'marker';
        element.style.backgroundImage = `url('${marker.image_url}')`;
        element.style.backgroundColor = `rgba(250,250,250,0.8)`;
        element.style.backgroundSize = `cover`;
        element.style.backgroundPosition = 'center';
        element.style.backgroundRepeat = "repeat-x"
        element.style.borderRadius = `500%`;
        element.style.width = '50px';
        element.style.height = '50px';

        // Pass the element as an argument to the new marker
        new mapboxgl.Marker(element)
          .setLngLat([marker.lng, marker.lat])
          .setPopup(popup)
          .addTo(map);
      });
      fitMapToMarkers(map, markers);
      map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken }));
    };
  // }
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 0, maxZoom: 18, duration: 0 });
};


export { initMapbox };
