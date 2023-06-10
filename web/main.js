import App from './App'

// #ifndef VUE3
import Vue from 'vue'
//ui
import uView from '@/uni_modules/uview-ui'
Vue.use(uView)

import store from '@/utils/store.js'; // 引入 Vuex Store
Vue.prototype.$store = store
console.log(process.env.VUE_APP_BASE_URL) 
Vue.config.productionTip = false
App.mpType = 'app'
const app = new Vue({
	store,
    ...App
})
app.$mount()
// #endif
// #ifdef VUE3
import { createSSRApp } from 'vue'
export function createApp() {
  const app = createSSRApp(App)
  return {
	store,  
    app
  }
}
// #endif