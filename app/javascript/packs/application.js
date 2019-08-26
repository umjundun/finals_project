import "bootstrap";
require("chartkick")
require("chart.js")

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
initMapbox();

import { hamburgerEvent } from '../dropdown_menu.js';
// hamburgerEvent();
