import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
initMapbox();

// MENUS
import { dashButtons } from '../menus/dashButtons.js';
dashButtons();

import { projectAccordionEvent } from '../menus/projectAccordion.js';
projectAccordionEvent();

import { engageAccordionEvent } from '../menus/engageAccordion.js';
engageAccordionEvent();

import { applyAccordionEvent } from '../menus/applyAccordion.js';
applyAccordionEvent();

// MODALS
import { signUpEvent } from '../modals/modalSignUp.js';
signUpEvent();

import { loginEvent } from '../modals/modalLogin.js';
loginEvent();

import { navEvent } from '../modals/modalNav.js';
navEvent();

import { messagesEvent } from '../modals/modalMessage.js';
messagesEvent();

import { projectApplyEvent } from '../modals/modalProjectApply.js';
projectApplyEvent();

import { projectEditEvent } from '../modals/modalProjectEdit.js';
projectEditEvent();

import { engagementEditEvent } from '../modals/modalEngagementEdit.js';
engagementEditEvent();

import { projectNewEvent } from '../modals/modalProjectNew.js';
projectNewEvent();
