import Vue from "vue/dist/vue.esm";
import axios from "axios";
import VueAxiosPlugin from "./plugins/vue-axios";
import App from "./components/App.vue";

Vue.use(VueAxiosPlugin, { axios: axios })

new Vue({
  el: "#app",
  render: h => h(App),
})