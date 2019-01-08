var ctx = document.getElementById("company_chart").getContext('2d');
         var myChart = new Chart(ctx, {
           type: 'doughnut',
           data: {
             labels: ["商社", "コンサル", "メーカー（電機、電子)", "IT", "サービス", "金融", "クリエイティブ"],
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

