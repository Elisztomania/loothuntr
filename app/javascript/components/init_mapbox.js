import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  };

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/satellite-streets-v11'

    });


    const markers = JSON.parse(mapElement.dataset.markers);
    if (markers) {
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

  // Create a HTML element for your custom marker
      const element = document.createElement('div');
      element.className = 'marker';

      element.style.backgroundImage = `url('${marker.image_url}')`;

      element.style.backgroundSize = 'cover';
      element.style.width = '45px';
      element.style.height = '45px';

      new mapboxgl.Marker(element)
        .setLngLat([ marker.lng, marker.lat ])

        .setPopup(popup)
        .addTo(map);
    });
    fitMapToMarkers(map, markers);
    console.log(markers);
   }}
};

export { initMapbox };
