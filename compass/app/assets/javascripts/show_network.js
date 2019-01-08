var network = cytoscape({
  container: $('#network'),
  elements: [
    {
      group: "nodes",
      data: { id: 'DeNA' }
    },
    {
      group: "nodes",
      data: { id: '広告' }
    },
    {
      group: "nodes",
      data: { id: 'メーカー（電機・機械)' }
    },
    {
      group: "nodes",
      data: { id: 'コンサルティング' }
    },
    {
      group: "nodes",
      data: { id: 'IT・通信業' }
    },
    {
      group: "nodes",
      data: { id: '商社' }
    },
    {
      group: "nodes",
      data: { id: 'Takram Engineering' }
    },
    {
      group: "edges",
      data: { id: 'ba', source: '広告', target: 'DeNA' }
    },
    {
      group: "edges",
      data: { id: 'ca', source: 'メーカー（電機・機械)', target: 'DeNA' }
    },
    {
      group: "edges",
      data: { id: 'da', source: 'コンサルティング', target: 'DeNA' }
    },
    {
      group: "edges",
      data: { id: 'ea', source: 'IT・通信業', target: 'DeNA' }
    },
    {
      group: "edges",
      data: { id: 'fa', source: '商社', target: 'DeNA' }
    },
    {
      group: "edges",
      data: { id: 'ga', source: '広告', target: 'Takram Engineering' }
    },
    {
      group: "edges",
      data: { id: 'ha', source: 'DeNA', target: 'Takram Engineering' }
    },
  ],
  style: [
    {
      selector: 'node',
      style: {
        'background-color': '#666',
        'label': 'data(id)'
      }
    },
    {
      selector: 'edge',
      style: {
        'width': 10,
        'line-color': '#ccc',
        'target-arrow-color': '#ccc',
        'target-arrow-shape': 'triangle'
      }
    }
  ],
  layout: {
    name: 'concentric',
    rows: 1
  }
});
