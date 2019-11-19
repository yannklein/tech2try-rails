import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"


const initFlatpickr = () => {
  flatpickr("#product-form-start", {
    altInput: true,
    plugins: [new rangePlugin({ input: "#product-form-end"})]
  })

  document.querySelector("#product-form-start").addEventListener("change", (event) => {
    window.location.href = '#product-form-end';
  });

  document.querySelector("#product-form-end").addEventListener("change", (event) => {
    window.location.href = '#product-form-description';
  });
}

export { initFlatpickr };
