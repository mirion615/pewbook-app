<template>
  <div id="quizTable">
    <el-row>
      <el-button
        icon="el-icon-plus"
        @click="createQuizDialog = true"
        circle></el-button>
      <el-col :span="12" :offset="6">
        <el-table
          :data="quizzes"
          style="width: 100%">
          <el-table-column
            prop="question"
            label="Endlish"
            width="180">
          </el-table-column>
          <el-table-column
            prop="correct"
            label="Japanese">
          </el-table-column>
          <el-table-column
            prop="answer_description"
            label="Answer Description">
          </el-table-column>
        </el-table>
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
  </div>
</template>

<script>
import axios from 'axios';
import QuizForm from '../quizzes/quiz-form';
export default {
  data() {
    return {
      quizzes: [],
      createQuizDialog: false,
      }
  },
  components: {
    QuizForm,
  },
  created() {
    axios.get('/api/v1/quizzes/new').then((res) => {
      this.quizzes = res.data;
    });
  },
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
