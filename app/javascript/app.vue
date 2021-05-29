<template>
  <div id="app">
    <el-form 
      :model="quiz" 
      :action="quiz.action"
      method="post">
      <el-form-item>
        <el-input
          type="hidden"
          :value="quiz.csrfToken"
          name="authenticity_token"></el-input>
      </el-form-item>
      <!-- <el-form-item label="Category">
        <el-select 
          v-model="quiz.category_id" 
          placeholder="please select category"
          name="quiz[category_id]">
          <el-option label="--" value="1"></el-option>
          <el-option label="HTML" value="2"></el-option>
          <el-option label="CSS" value="3"></el-option>
          <el-option label="Java Script" value="4"></el-option>
          <el-option label="Ruby" value="5"></el-option>
          <el-option label="Vue.js" value="6"></el-option>
        </el-select>
      </el-form-item> -->
      <el-form-item label="Question">
        <el-input
          v-model="quiz.question"
          name="quiz[question]"></el-input>
      </el-form-item>
      <el-form-item label="Correct">
        <el-input
          v-model="quiz.correct"
          name="quiz[correct]"></el-input>
      </el-form-item>
      <el-form-item label="Incorrect1">
        <el-input
          v-model="quiz.incorrect1"
          name="quiz[incorrect1]"></el-input>
      </el-form-item>
      <el-form-item label="Incorrect2">
        <el-input
          v-model="quiz.incorrect2"
          name="quiz[incorrect2]"></el-input>
      </el-form-item>
      <el-form-item label="Answer Dscription">
        <el-input 
          type="textarea" 
          v-model="quiz.answer_description"
          name="quiz[answer_description]"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button 
        type="primary" 
        native-type="submit">作成</el-button>
        <el-button>Cancel</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
  export default {
    data() {
      return {
        quiz: {
          csrfToken: document.getElementsByName('csrf-token')[0].content,
          category: 1,
          question: '',
          correct: '',
          incorrect1: '',
          incorrect2: '',
          answerDescription: '',
          action: '/quizzes'
        }
      }
    }
  }
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
