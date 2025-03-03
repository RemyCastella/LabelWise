import { Controller } from "@hotwired/stimulus";


export default class extends Controller {
  // static values = { data: Object };
  static targets = ["chart"]


  connect() {
    document.addEventListener("chartkick:load", this.drawText.bind(this))
  }

  drawText() {
    setTimeout(() => {
      const canvas = document.querySelector("#nutrition-chart");
      if (!canvas) {
        console.error("Canvas not found!");
        return;
      }

      const chart = Chartkick.charts["nutrition-chart"];
      if (!chart) {
        console.error("Chartkick chart not found!");
        return;
      }

      const ctx = canvas.getContext("2d");
      const { width, height } = canvas;
      const calories = this.element.dataset.chartCaloriesValue;
      const text = `${calories} kcal`;

      console.log("Canvas:", canvas);
      console.log("Chart:", chart);
      console.log("Calories:", calories);

      ctx.restore();
      const fontSize = height / 10;
      ctx.font = `${fontSize}px Arial`;
      ctx.textBaseline = "middle";
      ctx.textAlign = "center";
      ctx.fillStyle = "#000";
      ctx.fillText(text, width / 2, height / 2);
      ctx.save();
    }, 500); // slight delay to ensure rendering
  }

  disconnect() {
    document.removeEventListener("chartkick:load", this.drawText.bind(this));
  }
}



//     if (!this.hasChartTarget) return;

//     const ctx = this.chartTarget.getContext("2d");
//     const { width, height } = this.chartTarget;
//     const calories = this.element.dataset.chartCaloriesValue;
//     const text = `${calories} kcal`;

//     ctx.restore();
//     const fontSize = height / 10;
//     ctx.font = `${fontSize}px Arial`;
//     ctx.textBaseline = "middle";
//     ctx.textAlign = "center";
//     ctx.fillStyle = "#000";
//     ctx.fillText(text, width / 2, height / 2);
//     ctx.save();
//   }

//   disconnect() {
//     document.removeEventListener("chartkick:load", this.drawText.bind(this))
//   }
// }

  // connect() {
  //   console.log("hi")
  //   this.dataValue
  //   const labels = Object.keys(this.dataValue);
  //   const data = Object.values(this.dataValue);


  //     new Chart(
  //       this.element,
  //       {
  //       type: 'doughnut',

  //       data: {
  //         labels,

  //         datasets: [
  //           {
  //             labels: ["Protein", "Carbohydra", "Fat"],
  //             data: data,
  //             backgroundColor: [
  //               'rgb(255, 99, 132)',
  //               'rgb(54, 162, 235)',
  //               'rgb(255, 205, 86)'
  //             ],
  //             hoverOffset: 4,

  //           }
  //         ],
  //         options: {
  //           responsive: true,
  //           cutout: '10%'
  //         }
  //       },

  //     });
  //   }
  // }
