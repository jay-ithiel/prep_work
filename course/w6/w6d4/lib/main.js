const DOMNodeCollection = require("./dom_node_collection");

window.$l = function (arg) {
  let nodeList;
  if (typeof(arg) === 'string') {
    nodeList = document.querySelectorAll(arg);
  } else if (arg instanceof HTMLElement) {
    return new DOMNodeCollection([arg]);
  }
  let array = Array.from(nodeList);

  const collection = new DOMNodeCollection(array);
  return collection;
};
