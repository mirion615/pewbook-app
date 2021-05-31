<template>
  <div id="quizTable">
    <el-row>
      <el-button
        icon="el-icon-plus"
        @click="createQuizDialog = true"
        ciecle></el-button>
      <el-col :span="12" :offset="6">
        <el-table
          :data="quizzes"
          style="width: 100%"
          @cell-dblclick="showInput">
          <el-table-column
            prop="question"
            label="Endlish"
            width="180">
            <template v-slot="scope">
              <div>{{ scope.row.question }}</div>
              <el-input
                class="hidden"
                v-model="scope.row.question"
                @blur="updateQuiz(scope.row); hideInput($event)"></el-input>
            </template>
          </el-table-column>
          <el-table-column
            prop="correct"
            label="Japanese">
            <template v-slot="scope">
              <div>{{ scope.row.correct }}</div>
              <el-input
                class="hidden"
                v-model="scope.row.correct"
                @blur="updateQuiz(scope.row); hideInput($event)"></el-input>
            </template>
          </el-table-column>
          <el-table-column
            width="120">
            <template v-slot="scope">
              <el-button 
              v-on:click="destroyQuiz(scope.row.id)"
              type="danger" 
              icon="el-icon-delete" 
              circle></el-button>
            </template>
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
import { reject } from 'lodash';
import QuizForm from '../quizzes/quiz-form';
export default {
  data() {
    return {
      quizzes: [],
      createQuizDialog: false,
    };
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
    destroyQuiz(id) {
      axios.delete('/api/v1/quizzes/' + id).then((res) => {
        if (res.status === 200) {
          this.quizzes = reject(this.quizzes, ['id', id]);
        }
      });
    },
    closeDialog() {
      this.createQuizDialog = false;
    },
    addQuiz(quiz) {
      this.quizzes.push(quiz);
    },
    updateQuiz(quiz) {
      axios.patch('/api/v1/quizzes/' + quiz.id, { quiz: quiz })
        .then(res => {
          if (res.status === 200) {
          console.log(res);
        }
      })
    },
    showInput(row, column, cell, event) {
      if (column.property === 'question' || column.property === 'correct') {
        let children = cell.firstElementChild.children;
        children[0].classList.add('hidden');
        children[1].classList.remove('hidden');

        let input = children[1].firstElementChild;
        input.focus();
      }
    },
    hideInput(event) {
      let inputParent = event.target.parentNode;
      inputParent.classList.add('hidden');
      inputParent.previousElementSibling.classList.remove('hidden');
    },
  },
};
</script>

<style scoped>
.hidden {
  display: none;
}
</style>