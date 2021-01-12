var map = L.map('mapid').on('load', onMapLoad).setView([41.400, 2.206], 9);
//map.locate({setView: true, maxZoom: 17});

var tiles = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {}).addTo(map);

//en el clusters almaceno todos los markers
var markers = L.markerClusterGroup();
var data_markers = [];

function onMapLoad() {
	/*
	FASE 3.1
	1) Relleno el data_markers con una petición a la api
	2) Añado de forma dinámica en el select los posibles tipos de restaurantes
	3) Llamo a la función para --> render_to_map(data_markers, 'all'); <-- para mostrar restaurantes en el mapa
	*/
	let category = []
	let categoryTemp = []
	let categorySelect = document.querySelector("#kind_food_selector")
	fetch("http://localhost/mapa/api/apiRestaurants.php")
	.then((response) => response.json())
	.then((data) => {
		data_markers = data
		for (const xCategory of data_markers) {
			categoryTemp = xCategory.king_food.split(",");
			categoryTemp.forEach(categoryX => {
				if(!category.includes(categoryX)){
					category.push(categoryX);
				}
			});
		}
		category.forEach(box => {
			let option = document.createElement("option");
			option.appendChild(document.createTextNode(box));
			categorySelect.appendChild(option);
		})
		render_to_map(data_markers, 'all');
	})
	.catch((err) => console.log(err));	
	
	console.log("Mapa cargado");
}

$('#kind_food_selector').on('change', function() {
	//   console.log(this.value);
	render_to_map(data_markers, this.value);
});
/*
FASE 3.2
	1) Limpio todos los marcadores
	2) Realizo un bucle para decidir que marcadores cumplen el filtro, y los agregamos al mapa
*/	
function markerCreator(restaurant){
	markerx = L.marker([restaurant.lat, restaurant.lng])
	.bindPopup(
	`<div class='row'>
	<img class='col=12' src=${restaurant.photo}>
	<p class='col-12 m-0 p-0'>${restaurant.name}</p>
	<p class='col-12 m-0 p-0'>${restaurant.address}</p>.
	</div>`
	);
	return markerx;
}

function render_to_map(data_markers,filter){
	let markerx;
	if(filter == 'all'){
		data_markers.forEach(restaurant => {
			markerx = markerCreator(restaurant);
			markers.addLayer(markerx);
		})
		map.addLayer(markers);
	}else{
		markers.clearLayers();
		data_markers.forEach(restaurant => {
			let box = restaurant.king_food.split(",");
			box.forEach(filterx =>{
				if(filterx == filter){
					markerx = markerCreator(restaurant);
					markers.addLayer(markerx);
				}
			});
		});
		map.addLayer(markers);
	}
}

map.locate({setView: true, maxZoom: 16});

function onLocationFound(e) {
 var radius = e.accuracy / 3;

L.marker(e.latlng).addTo(map)
 .bindPopup("Tu estas aqui, con " + radius + " metros de aproximacion").openPopup();

L.circle(e.latlng, radius).addTo(map);
 }
 function onLocationError(e) {
 alert(e.message);
}
 map.on('locationfound', onLocationFound);
 map.on('locationerror', onLocationError);