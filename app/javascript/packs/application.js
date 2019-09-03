import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
initMapbox();


import { hamburgerEvent } from '../menus/hamburger_menu.js';
hamburgerEvent();

import { avatarEvent } from '../menus/avatar_menu.js';
avatarEvent();


import { signUpEvent } from '../modals/modalSignUp.js';
signUpEvent();

import { loginEvent } from '../modals/modalLogin.js';
loginEvent();

import { projectAccordionEvent } from '../menus/projectAccordion.js';
projectAccordionEvent();

import { applyAccordionEvent } from '../menus/applyAccordion.js';
applyAccordionEvent();
