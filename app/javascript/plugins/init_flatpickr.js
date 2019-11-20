import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"


const initFlatpickr = () => {
  flatpickr("#rental_start", {
    altInput: true,
    plugins: [new rangePlugin({ input: "#rental_end"})]
  })

  // Create id for the start input as the range plugin is messing with it!
  document.querySelector(".rental_start .input").id = "product-form-start";

  document.querySelector("#rental_start").addEventListener("change", (event) => {
    window.location.href = '#rental_end';
  });

  document.querySelector("#rental_end").addEventListener("change", (event) => {
    window.location.href = '#product-form-description';
  });
}

export { initFlatpickr };
