var network = cytoscape({

  //checked
  container: $('#network'),

  style: [
    {
      selector: 'node',
      style: {
        'background-color': '#106c58',
        'label': 'data(id)'
      }
    },
    {
      selector: 'edge',
      style: {
        'curve-style': 'bezier',
        'line-color': '#ccc',
        'width': 10,
        'target-arrow-color': '#fff200',
        'target-arrow-shape': 'triangle'
      }
    }
  ],
  layout: {
    name: 'circle',
    rows: 1
  }
});
// var test = $('#career_paths').data('careerpaths-id');
// JavaScriptの場合
var careerpaths = document.getElementById('career_paths');
var careerpathHash = JSON.parse(careerpaths.getAttribute('data-career_paths'));
console.log(careerpathHash);
console.log(careerpathHash[0]['user_id']);
console.log(careerpathHash.length);
var N = careerpathHash.length;

// create node&edge クリック時にパラメータを受け渡したい。
network.startBatch();
// first, remove all existing elements
network.remove(network.elements());
for (var i = 0; i < N; i++) {
  console.log(`${careerpathHash[i]['user_id']}_${i}`);
  // can use reference to eles later
  var elems = network.add([
  { group: 'nodes', data: { id: `${careerpathHash[i]['from_career']}` }},
  { group: 'nodes', data: { id: `${careerpathHash[i]['to_career']}` }},
  { group: 'edges', data: { id: `${careerpathHash[i]['user_id']}_${i}`, source: `${careerpathHash[i]['from_career']}`, target: `${careerpathHash[i]['to_career']}` } }
  ]);
};
// layout - 17:20 追記: makeLayout は endBatch() のあとの方がいいみたい。
network.elements().makeLayout({
  name: "grid",
  }).run();
//
network.endBatch();
  console.log(elems);





