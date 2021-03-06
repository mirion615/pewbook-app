import Vue from 'vue';
import QuizWord from '../../quizzes/word.vue';
import ElementUI from 'element-ui';
import locale from 'element-ui/lib/locale/lang/ja';
Vue.use(ElementUI, { locale })
document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(QuizWord)
  }).$mount()
  document.body.appendChild(app.$el)
})