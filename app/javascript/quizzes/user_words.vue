<template>
  <div class="quiz__table">
    <div class="quiz__search">
      <el-input 
        v-model="search" 
        class="input" 
        placeholder="登録した英単語を検索"
        clearable/>
    </div>
    <el-table
      :data="quizzes.filter(data => !search || data.question.includes(search))"
      width="80%"
      height="100%"
      @cell-dblclick="showInput">
          <el-table-column
            prop="question"
            label="Endlish">
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
            prop="answer_description"
            label="Answer Description">
            <template v-slot="scope">
              <div>{{ scope.row.answer_description }}</div>
              <el-input
                class="hidden"
                v-model="scope.row.answer_description"
                @blur="updateQuiz(scope.row); hideInput($event)"></el-input>
            </template>
          </el-table-column>
          <el-table-column align="right">
            <template v-slot="scope">
              <el-button
                @click="destroyQuiz(scope.row.id)"
                type="danger" 
                icon="el-icon-delete" 
                circle></el-button>
            </template>
          </el-table-column>
    </el-table>
  </div>
</template>

<script>
import axios from 'axios';
import {reject} from 'lodash'
export default {
  data() {
    return {
      quizzes: [],
      search:'',
    }
  },
  mounted() {
    axios.get('/api/v1/quizzes/user_words').then((res) => {
      this.quizzes = res.data;
      }).catch(error => {console.log(error)
      });
  },
  methods: {
    destroyQuiz(id) {
      axios.delete('/api/v1/quizzes/' + id)
        .then(res => {
          if (res.status === 200)
            this.quizzes = reject(this.quizzes, ['id', id])
        })
    },
    updateQuiz(quiz) {
      axios.patch('/api/v1/quizzes/' + quiz.id, {quiz: quiz})
        .then(res => {
          if (res.status === 200) {
            console.log(res)
          }
        })
    },
    showInput(row, column, cell, event) {
      if (column.property === 'question' || column.property === 'correct' || column.property === 'answer_description' ) {
        let children = cell.firstElementChild.children
        children[0].classList.add('hidden')
        children[1].classList.remove('hidden')

        let input = children[1].firstElementChild
        input.focus()
      }
    },
    
    hideInput(event) {
      let inputParent = event.target.parentNode
      inputParent.classList.add('hidden')
      inputParent.previousElementSibling.classList.remove('hidden')
    },
  }
}
</script>

<style scoped>
.quiz__table{
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  height: 575px;
  padding: 0 90px 30px 90px;
  margin: 0 auto;
}

.quiz__search {
  width: 50%;
}

.quiz__search >>> .el-input__inner {
  padding: 20px;
  margin-bottom: 20px;
  font-size: 15px;
  width: 100%;
}

.hidden {
  display: none;
}
</style>
