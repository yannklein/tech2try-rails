import "bootstrap";

import { initMapbox } from 'plugins/init_mapbox';

initMapbox();

if(document.querySelector(".close-welcome")) {
  document.querySelector(".close-welcome").addEventListener("click", (event) => {
    document.querySelector(".card-welcome").style.display = 'none';
  });
}
