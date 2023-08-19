// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "mapkick/bundle"
import "@hotwired/turbo-rails"
import "controllers"

let lat
let lon
let geolocateButton
let address
let timeout

addEventListener("turbo:frame-load", (e) => {
  let catLat = document.getElementById("cat_latitude")
  let catLon = document.getElementById("cat_longitude")
  let cat_address = document.getElementById('cat_address')
  let geolocateButton = document.getElementById("geolocate-button")
  let city
  navigator.geolocation.getCurrentPosition((position) => {
    lat = parseFloat(position.coords.latitude)
    lon = parseFloat(position.coords.longitude)
  })

  geolocateButton.addEventListener('click', (event) => {
    fetch(`https://nominatim.openstreetmap.org/reverse?format=json&lat=${lat}&lon=${lon}`)
      .then((response) => response.json())
      .then((data) => {
        address = blankIfNull(data['address']['house_number']) + " " + data['address']['road'];
        cat_address.value = blankIfNull(data['address']['house_number']) + " " + data['address']['road'];


      })
      catLat.value = lat
      catLon.value = lon
  });

  cat_address.addEventListener("keyup", (event) => {
    clearTimeout(timeout)

    timeout = setTimeout(function () {
      fetch(`https://nominatim.openstreetmap.org/reverse?format=json&lat=${lat}&lon=${lon}`)
        .then((response) => response.json())
        .then((data) => {
          city = data['address']['city']
          fetch(`https://nominatim.openstreetmap.org/search?q=${cat_address.value.split(" ").join("+")}+${city}&format=json`)
            .then((response) => response.json())
            .then((data) => {
              catLat.value = data[0]["lat"]
              catLon.value = data[0]["lon"]
            })
        })


    }, 1000);


  })

})

removeEventListener("turbo:frame-load", e)


function wait(sec) {
  const date = Date.now();
  let currentDate = null;
  do {
    currentDate = Date.now();
  } while (currentDate - date < sec * 1000);
}

function blankIfNull(data) {
  if (typeof data === 'undefined') {
    return ''
  } else {
    return data
  }
}
