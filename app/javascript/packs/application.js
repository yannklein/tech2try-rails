import "bootstrap";

import { initMapbox } from 'plugins/init_mapbox';
import "plugins/init_flatpickr";

const mapboxElement = document.querySelector('#map');
if(mapboxElement) {
  initMapbox(mapboxElement);
}

if(document.querySelector(".close-welcome")) {
  document.querySelector(".close-welcome").addEventListener("click", (event) => {
    document.querySelector(".card-welcome").style.display = 'none';
  });
}
