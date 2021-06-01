<template>
  <div id='quiz'>
    <div class="quiz__question">
      <h1>Question {{quizNum}}. {{quizzes[quizNum - 1].question}}</h1>
    </div>

    <div class="quiz__choices">
      <ul v-for="choice in aChoice">
        <li class="q-bar" @click="showAnswer(choice)">{{choice}}</li>
      </ul>
    </div>

    <div class="quiz__answer_description" v-if="showExplain">
      <h2 class="q-correct" v-if="judgement">
        <i class=""></i>正解！
      </h2>
      <h2 class="q-incorrect">
        <i class=""></i>不正解...
      </h2>
      <p>
        <strong>解説:</strong>
        {{quizzes[quizNum - 1].answer_description}}
      </p>
      <button @click="next()" type="button" class="btn btn-default">Next</button>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  name: "Quiz",
  components: {

  },
  data: function() {
    return {
      quizzes: [{
        question: '',
        correct:'',
        uncorrect1:'',
        uncorrect2:'',
        answer_description:''
      }],
      aChoice:[],
      showQuiz: true,
      showExplain: false,
      judgement: '',
      quizUrl: '',
    }
  },
  created() {
    this.getQuizzes();
  },
  methods: {
    getQuizzes: function() {
      let quizUrl = location.pathname;
      let catId = quizUrl.match(/d/g);
      let catNum;
      if (catId) {
      catNum = catId.join("")
      }
    }
  }
}

</script>