import Vue from 'vue'
import QuizNew from '../../quizzes/new.vue'
import ElementUI from 'element-ui'
import locale from 'element-ui/lib/locale/lang/ja'
import 'element-ui/lib/theme-chalk/index.css'
Vue.use(ElementUI, { locale })
document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(QuizNew)
  }).$mount()
  document.body.appendChild(app.$el)
})