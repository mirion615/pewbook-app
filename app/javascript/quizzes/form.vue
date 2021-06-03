<template>
  <div class='content'>
    <div class="category">
      <el-row class="category__row">
        <el-button @click="getQuizzes(2)" type="primary" class="category__btn">HTML</el-button>
        <el-button @click="getQuizzes(3)" type="success" class="category__btn">CSS</el-button>
        <el-button @click="getQuizzes(4)"type="info"  class="category__btn">JavaScript</el-button>
        <el-button @click="getQuizzes(5)"type="warning" class="category__btn">Ruby</el-button>
        <el-button @click="getQuizzes(6)"type="danger" class="category__btn">Vue.js</el-button>
      </el-row>
    </div>

    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span class="box__number">Question {{quizNum}}.</span>
        <div class="box__question">
          <span><strong>{{ quizzes[quizNum - 1].question }}</strong></span>
        </div>
      </div>
      <div v-if="showQuiz">
        <div class="quiz__choices">
          <ul v-for="choice in aChoice" class="text item">
            <li class="q-bar" @click="showAnswer(choice); show2 = !show2">
              <el-button round class="quiz__btn">{{choice}}</el-button>
            </li>
          </ul>
        </div>
      </div>
    </el-card>

    <transition>
        <el-card class="box-card2" v-if="showExplain">
          <h2 class="is-correct" v-if="judgement">正解！</h2>
          <h2 class="is-incorrect" v-else>不正解...</h2>
          <div class="correct">「{{ quizzes[quizNum - 1].correct }}」</div>
          <div class="answer_description">
            <strong>解説:</strong>
            {{quizzes[quizNum - 1].answer_description}}
          </div>
          <div class="btn__wrapper">
            <el-button @click="nextQuiz()" type="primary" round class="btn">Next</el-button>
          </div>
        </el-card>
    </transition>
    <quiz-result ref="result" :totalCorrectNum="totalCorrectNum"></quiz-result>
  </div>
</template>

<script>
import axios from 'axios';
import QuizResult from './result';
export default {
  name: 'Form',
  components: {
    QuizResult,
  },
  data: function () {
    return {
      quizNum: 1,
      totalQuizNum: 0,
      totalCorrectNum: 0,
      show2: true,
      quizzes: [
        {
          question: '',
          correct: '',
          incorrect1: '',
          incorrect2: '',
          answer_description: '',
        },
      ],
      aChoice: [],
      showQuiz: true,
      showExplain: false,
      judgement: '',
      quizUrl: '',
    };
  },
  created() {
    // this.getQuizzes();
  },
  methods: {
    getQuizzes: function (id) {
      axios.get('/api/v1/quizzes/form',
      {
        params: {
          category_id: id
        }
      })
      .then((response) => {
        this.quizzes = response.data
        this.totalQuizNum = this.quizzes.length;
        this.getChoices(this.quizNum - 1);
      });
    },
    shuffleArr: function (array) {
      const arr = array.slice();
      for (let i = arr.length - 1; 0 < i; i--) {
        let r = Math.floor(Math.random() * (i + 1));
        [arr[i], arr[r]] = [arr[r], arr[i]];
      }
      return arr;
    },
    getChoices: function (index) {
      this.aChoice = [];
      this.aChoice.push(
        this.quizzes[index].correct,
        this.quizzes[index].incorrect1,
        this.quizzes[index].incorrect2
      );
      console.log(this.aChoice), (this.aChoice = this.shuffleArr(this.aChoice));
    },
    showAnswer: function (choice) {
      this.showQuiz = !this.showQuiz;
      this.showExplain = !this.showExplain;

      let answer = this.quizzes[this.quizNum - 1].correct;
      if (choice === answer) {
        this.judgement = true;
        this.totalCorrectNum++;
        this.$refs.totalCorrectNum;
      } else {
        this.judgement = false;
      }
    },
    nextQuiz: function () {
      if (this.quizNum < this.totalQuizNum) {
        this.showQuiz = true;
        this.showExplain = false;
        this.quizNum++;
        this.nextCounter++;
        this.getChoices(this.quizNum - 1);
      } else {
        this.$refs.result.showResult();
      }
    },
  },
};
</script>


<style scoped>
.content {
  width: 100%;
  height: 100%;
}

.category {
  height: 60px;
  width: 652px;
  margin: 30px auto;
  display: flex;
}

.category__row {
  display: flex;
  justify-content: space-around;
  align-items: center;
  width: 100%;
}

.category__btn {
  width: 18%;
  height: 40px;
  letter-spacing: 1px;
}

span {
  font-size: 20px;
}

.box-card,
.box-card2 {
  height: 280px;
  width: 650px;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  margin: auto;
}

.box-card2 {
  margin: -154px auto;
}

.is-incorrect {
  font-size: 24px;
  color: #2196f3;
}

.is-correct {
  font-size: 24px;
  color: #ff0000;
}

.clearfix {
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
}

.box__question {
  text-align: center;
}

.box__question span {
  font-size: 38px;
}

.quiz__choices {
  display: flex;
  justify-content: space-around;
  margin-top: 30px;
}

.correct {
  text-align: center;
  font-size: 30px;
  font-weight: bold;
  margin: 20px 0;
}

.answer_description {
  text-align: center;
  margin: 20px 0;
}

.clearfix:before,
.clearfix:after {
  display: table;
  content: '';
}
.clearfix:after {
  clear: both;
}

.quiz__question {
  display: inline-block;
  margin: 0 auto;
  text-align: center;
}

.btn__wrapper {
  text-align: center;
  margin-top: 30px;
}

.v-enter {
  opacity: 0;
  transform: translateY(-20px);
}

.v-leave-to {
  opacity: 0;
  transform: translateY(-20px);
}
</style>