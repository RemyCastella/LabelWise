import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = { data: Object };

  connect() {
    console.log("hi")
    this.dataValue
    const labels = Object.keys(this.dataValue);
    const data = Object.values(this.dataValue);


      new Chart(
        this.element,
        {
        type: 'doughnut',

        data: {
          labels,

          datasets: [
            {
              labels: ["Protein", "Carbohydra", "Fat"],
              data: data,
              backgroundColor: [
                'rgb(255, 99, 132)',
                'rgb(54, 162, 235)',
                'rgb(255, 205, 86)'
              ],
              hoverOffset: 4,

            }
          ],
          options: {
            responsive: true,
            cutout: '10%'
          }
        },

      });
    }
  }
