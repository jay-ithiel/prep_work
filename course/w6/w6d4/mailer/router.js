class Router {
  constructor(node, routes) {
    this.node = node;
    this.routes = routes;
  }

  start() {
    this.render();
    window.addEventListener("hashchange", (e) => {
      this.render();
    });
  }

  activeRoute() {
    let hashFrag = window.location.hash;
    hashFrag = hashFrag.replace('#', '');
    return this.routes[hashFrag];
  }

  render() {
    let component = this.activeRoute();
    if (component === undefined) {
      this.node.innerHTML = "";
    } else {
      this.node.innerHTML = "";
      this.node.appendChild(component.render());
    }
  }
}

module.exports = Router;
