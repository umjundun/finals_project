import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
initMapbox();

import { hamburgerEvent } from '../menus/dropdown_menu.js';
hamburgerEvent();

import { tabEvent } from '../menus/tabs_menu.js';
tabEvent();
