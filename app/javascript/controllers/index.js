// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)
// import { Chart } from "chart.js";
// import * as Chartjs from "chart.js";

// const controllers = Object.values(Chartjs).filter(
  //(chart) => chart.id !== undefined
//);
//Chart.register(...controllers);
