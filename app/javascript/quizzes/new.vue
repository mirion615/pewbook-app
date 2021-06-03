<template>
<<<<<<< Updated upstream:app/javascript/quizzes/new.vue
  <div id="quizTable">
    <el-row>
      <el-button
        icon="el-icon-plus"
        @click="createQuizDialog = true"
        circle></el-button>
      <el-col :span="12" :offset="6">
=======
  <div class="quiz__table">
    <el-input v-model="search" size="mini" class="input" placeholder="英単語を検索"/>
>>>>>>> Stashed changes:app/javascript/quizzes/word.vue
        <el-table
          :data="quizzes.filter(
            data => !search || data.question.includes(search))"
          style="width:100%"
          height="100%">
          <el-table-column
            prop="question"
            label="Endlish"
            width="180">
          </el-table-column>
          <el-table-column
            prop="correct"
            label="Japanese"
            width="180">
          </el-table-column>
          <el-table-column
            prop="answer_description"
            label="Answer Description">
          </el-table-column>
        </el-table>
<<<<<<< Updated upstream:app/javascript/quizzes/new.vue
      </el-col>
    </el-row>
    <el-dialog 
      :visible.sync="createQuizDialog"
      width="30%"
      center>
      <quiz-form 
      @close="closeDialog"
      @add="addQuiz"></quiz-form>
    </el-dialog>
=======
>>>>>>> Stashed changes:app/javascript/quizzes/word.vue
  </div>
</template>

<script>
import axios from 'axios';
import QuizForm from '../quizzes/quiz-form';
export default {
  data() {
    return {
      quizzes: [],
<<<<<<< Updated upstream:app/javascript/quizzes/new.vue
      createQuizDialog: false,
      }
  },
  components: {
    QuizForm,
=======
      search:''
    }
>>>>>>> Stashed changes:app/javascript/quizzes/word.vue
  },
  created() {
    axios.get('/api/v1/quizzes/new').then((res) => {
      this.quizzes = res.data;
    });
  },
<<<<<<< Updated upstream:app/javascript/quizzes/new.vue
  methods: {
    closeDialog() {
      this.createQuizDialog = false;
    },
    addQuiz(quiz) {
      this.quizzes.push(quiz);
    },
  },
};
</script>
=======
}
</script>

<style scoped>
.quiz__table{
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 100%;
  height: 100%;
  padding: 30px 90px;
}

.quiz__table >>> .el-input__inner {
  padding: 20px;
  margin-bottom: 20px;
  font-size: 15px;
  width: 30%;
}
</style>
>>>>>>> Stashed changes:app/javascript/quizzes/word.vue
