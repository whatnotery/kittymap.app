// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import L from 'leaflet'
import {Turbo} from "@hotwired/turbo-rails"

var map = L.map('map').setView([38.0346, -84.5230], 13);

var catIcon = L.icon({
    iconUrl: '/assets/cat_icon.png',
    shadowUrl: '/assets/cat_icon.png',

    iconSize:     [30, 30], // size of the icon
    shadowSize:   [30, 30], // size of the shadow
    iconAnchor:   [15, 15], // point of the icon which will correspond to marker's location
    shadowAnchor: [15, 15],  // the same for the shadow
    popupAnchor:  [0, -15] // point from which the popup should open relative to the iconAnchor
});

var clickIcon;
var clickCount = 0;

L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
}).addTo(map); 


for (let i = 0; i < Object.keys(    catData).length; i++) {
var marker = L.marker([catData[i+1]["latitude"], catData[i+1]["longitude"]], {icon: catIcon}).addTo(map);
marker.bindPopup(`<strong>Cat:</strong> <a href="/cats/${i+1}">${catData[i+1]["alias"]}</a> <br> <strong>Notes:</strong> ${catData[i+1]["description"]}`)
}


map.on('click', function(e) {
    var lat = e.latlng.lat;
    var lng = e.latlng.lng;
    var newCatButton = document.getElementById('new-cat-button');

    /*
    if (clickCount < 1) {
        clickIcon = L.marker([lat, lng],{icon: catIcon}).addTo(map);
        map.addLayer(marker);
        clickCount += 1
    } else {
        map.removeLayer(marker)
        clickCount = 0
    }
*/
    newCatButton.click();

    addEventListener("turbo:frame-load", (e) => {
    
        let catLat = document.getElementById("cat_latitude")   
        let catLng = document.getElementById("cat_longitude")
        
        console.log(lat)
          
        catLat.value = lat
        catLng.value = lng
        console.log(catLat.value)

        })
        removeEventListener("turbo:frame-load", e)
        

  });




