import mapboxgl from 'mapbox-gl/dist/mapbox-gl';

const userLocation = document.querySelector('#map').dataset.center;
const markerIcon = document.querySelector('#map').dataset.icon;
const locArray = [Number.parseFloat(userLocation.split(',')[1], 10), Number.parseFloat(userLocation.split(',')[0], 10)];

const createMarker = (data, map) => {
  // console.log(data);
  // add markers to map
  data.forEach((marker) => {

    // create a HTML element for each feature
    var el = document.createElement('div');
    el.className = 'marker';

    // make a marker for each feature and add to the map
    console.log(marker.properties.description);
    const popupContent = marker.properties.description.map((content) => {
      return `<div class="marker-gadget-info" style="background-image: url('${content.photo}')">
        <p>${content.name}</p>
      </div>`
    });

    const popup = `
      <h3>
        ${marker.properties.title }
      </h3>
      <div class="marker-gadget">
        ${popupContent.join("")}
      </div>`;

    new mapboxgl.Marker(el)
      .setLngLat(marker.geometry.coordinates)
      .setPopup(
        new mapboxgl.Popup({ offset: 25, maxWidth: 'none' }).setHTML(popup)
        )
      .addTo(map);
  });

  document.querySelectorAll('.marker').forEach((marker) => {
    marker.style.backgroundImage = `url('.${markerIcon}')`;
  });
}

const fetchMarkers = (map) => {
  fetch('./techgets.json')
  .then(response => response.json())
  .then((data) => {
    createMarker(data, map);
  })
}

const initMapbox = () => {
  mapboxgl.accessToken = 'pk.eyJ1IjoieWFubmx1Y2tsZWluIiwiYSI6ImNqcnZmeHQwaDAxb2o0NGx2bG1tOWgwNGIifQ.q4zhKOCoH7nDIJNm88leXg';
  const map = new mapboxgl.Map({
  container: 'map',
  style: 'mapbox://styles/mapbox/streets-v11',
  center: locArray,
  zoom: 10,
  });

  fetchMarkers(map);
};

export { initMapbox };
