<template>
  <div class="quiz__table">
    <el-input v-model="search" size="mini" class="input" placeholder="英単語を検索"/>
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
  </div>
</template>

<script>
import axios from 'axios';
export default {
  data() {
    return {
      quizzes: [],
      search:''
    }
  },
  // axiosを使って、apiを叩く。
  created() {
    axios.get('/api/v1/quizzes/word').then((res) => {
      this.quizzes = res.data;
    })
    .catch(error => {
        console.log(error);
      });
  },
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
