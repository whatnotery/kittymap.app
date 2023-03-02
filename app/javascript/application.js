// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "mapkick/bundle"
import {Turbo} from "@hotwired/turbo-rails"

let lat
let lon
let address

navigator.geolocation.getCurrentPosition((position) => {
    lat = parseFloat(position.coords.latitude)
    lon = parseFloat(position.coords.longitude)

    fetch(`https://nominatim.openstreetmap.org/reverse?format=geojson&lat=${lat}&lon=${lon}`)
    .then((response) => response.json())
    .then((data) => {
        address = data['features'][0]['properties']['address']['house_number'] + " " + data['features'][0]['properties']['address']['road'];
    })

  });




  addEventListener("turbo:frame-load", (e) => {
    
    let catLat = document.getElementById("cat_latitude")   
    let catLon = document.getElementById("cat_longitude")
    let cat_address = document.getElementById('cat_address')
     
    catLat.value = lat
    catLon.value = lon
    cat_address.value = address
    })
    removeEventListener("turbo:frame-load", e)


    function wait(sec) {
        const date = Date.now();
        let currentDate = null;
        do {
          currentDate = Date.now();
        } while (currentDate - date < sec*1000);
      }
