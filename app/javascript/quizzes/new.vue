<template>
  <div id="quizTable">
    <el-row>
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
  </div>
</template>

<script>
import axios from 'axios';
export default {
  data() {
    return {
      quizzes: [],
    };
  },
  created() {
    axios.get('/api/v1/quizzes/new').then((res) => {
      this.quizzes = res.data;
    });
  },
};
</script>