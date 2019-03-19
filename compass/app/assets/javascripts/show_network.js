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
    name: 'random',
    strictHierarchy: true
  },
});

//get start & goal node 
var careerpaths = document.getElementById('career_paths');
var careerpathHash = JSON.parse(careerpaths.getAttribute('data-career_paths'));
var startnode = document.getElementById('start_node');
var startnodevalue = startnode.getAttribute('start_node_value');
var goalnode = document.getElementById('goal_node');
var goalnodevalue = goalnode.getAttribute('goal_node_value');
console.log(startnodevalue);
console.log(goalnodevalue);
console.log(careerpathHash);
console.log(careerpathHash.length);

// create node&edge クリック時にパラメータを受け渡したい。
network.startBatch();
// first, remove all existing elements
network.remove(network.elements());
var N = careerpathHash.length;
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

// start_companyを中心としたネットワークを形成
var cynode = network.getElementById(`${startnodevalue}`);
console.log(cynode)
console.log(cynode.neighborhood()); // Or n.openNeighborhood();
var dijkstra = network.elements().dijkstra(cynode);
var layout = network.layout({
  name: 'concentric',
  concentric: function(n) {
    var d = dijkstra.distanceTo(n);
    return network.nodes().length - d;
  },
  levelWidth: function(nodes) {return 1;}
});
layout.run();


// クリックイベント
var click_count = 0;
network.on('tap', 'node', function(evt){
  var touch_node = evt.target;

  var dijkstra = network.elements().dijkstra(touch_node);
  var layout = network.layout({
    name: 'concentric',
    concentric: function(n) {
      var d = dijkstra.distanceTo(n);
      return network.nodes().length - d;
    },
    levelWidth: function(nodes) {return 1;}
  });
  layout.run();

  if(touch_node.id() != startnodevalue && touch_node.id() != goalnodevalue){

  var click_elem_create = document.getElementById(`test_create-${click_count}`);
  click_elem_create.innerHTML = `<p class="circle"><span id="test-${click_count}"></span></p><span id="test_create-${click_count+1}"></span>`

  var click_elem = document.getElementById(`test-${click_count}`);
  click_elem.innerHTML = touch_node.id();

  click_count++;
  };
});


