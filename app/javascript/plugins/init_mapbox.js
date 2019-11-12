import mapboxgl from 'mapbox-gl/dist/mapbox-gl';

const initMapbox = () => {
  mapboxgl.accessToken = 'pk.eyJ1IjoieWFubmx1Y2tsZWluIiwiYSI6ImNqcnZmeHQwaDAxb2o0NGx2bG1tOWgwNGIifQ.q4zhKOCoH7nDIJNm88leXg';
  const map = new mapboxgl.Map({
  container: 'map',
  style: 'mapbox://styles/mapbox/streets-v11'
  });
};

export { initMapbox };
