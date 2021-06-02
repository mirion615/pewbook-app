<template>
  <div class='quiz'>
    <div class="quiz__question">
      <h1>Question {{quizNum}}. <strong>{{ quizzes.question }}</strong> </h1>
      <div v-if="showQuiz">
        <div class="quiz__choices">
          <ul v-for="choice in aChoice">
            <li class="q-bar" @click="showAnswer(choice)">{{choices}}</li>
          </ul>
        </div>
      </div>
    </div>


    <div class="quiz__answer_description" v-if="showExplain">
      <h2 class="q-correct" v-if="judgement">
        <i class=""></i>正解！
      </h2>
      <h2 class="q-incorrect" v-else>
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
  name: "Form",
  components: {

  },
  data: function() {
    return {
      quizNum: 1,
      totalQuizNum: 0,
      totalCorrectNum: 0,
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
      let catId = quizUrl.match(/\d/g);
      let catNum;
      if (catId) {
        catNum = catId.join("");
      }

      if (quizUrl == "/quizzes/" + catNum) {
        this.axiosUrl = "/api/v1/quizzes" + catNum;
      } else {
        this.axiosUrl = "/quizzes";
      }

    axios
      .get(this.axiosUrl)
      .then(res => {
        this.showQuestion = res.data
        this.totalQuizNum = this.quizzes.length;
      })
    },
    shuffleArray: function(array) {
      const arr = array.slice();
      for (let i = ary.length -1; 0 < i; i--) {
        let r = Math.floor(Math.random() * (i + 1));
        [ary[i], ary[r]] = [ary[r], ary[i]];
      }
      return arr;
    },
    getChoices: function(index) {
      this.aChoice = [];
      this.aChoice.push(
        this.quizzes[index].correct,
        this.quizzes[index].uncorrexct1,
        this.quizzes[index].uncorrect2
      )
      this.aChoice = this,shuffleArray(this.aChoice)
    },
    showAnswer: function(choice) {
      this.showQuiz = !this.showQuiz;
      this.showExplain = !this.showExplain;

      let answer = this.quizzes[this.quizNum -1].correct;
      if(choice === answer) {
        this.judgement = true;
        this.totalCorrectNum++;
        this.$refs.totalCorrectNum;
      } else {
        this.judgement = false;
      }
    },
    nextQuiz: function() {
      if (this.quizNum < this.totalQuizNum) {
        this.showQuiz = true;
        this.showExplain = false;
        this.quizNum++;
        this.nextCounter++;
        this.getChoices(this.quizNum -1);
      } else {
        this.$refs.result.showResult();
      }
    }
  }
}

</script>