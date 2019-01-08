var ctx = document.getElementById("job_chart").getContext('2d');
         var myChart = new Chart(ctx, {
           type: 'doughnut',
           data: {
		   labels: ["営業", "会計", "コンサルタント", "デザイナー","管理", "webエンジニア", "研究開発"],
              datasets: [{
               backgroundColor: [
                  "#2ecc71",
                 "#3498db",
                 "#95a5a6",
                 "#9b59b6",
                  "#f1c40f",
                  "#e74c3c",
                  "#34495e"
                ],
                data: [12, 19, 3, 17, 28, 24, 7]
              }]
            }
          });

