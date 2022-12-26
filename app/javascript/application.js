// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import L from 'leaflet'


var map = L.map('map').setView([38.0346, -84.5230], 13);



L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
}).addTo(map); 


for (let i = 0; i < Object.keys(catData).length; i++) {
var marker = L.marker([catData[i+1]["latitude"], catData[i+1]["longitude"]]).addTo(map);
marker.bindPopup(`<strong>Cat:</strong> <a href="/cats/${i+1}">${catData[i+1]["alias"]}</a> <br> <strong>Notes:</strong> ${catData[i+1]["description"]}`)
}


L.DomEvent.on(map, 'click', function (ev) {
    L.marker(mouseEventToLatLng('click')).addTo(map);

});