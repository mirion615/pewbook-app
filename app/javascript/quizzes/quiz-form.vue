<template>
  <el-form :model="quiz">
    <el-form-item label="Category">
      <el-select v-model="quiz.categoryId" placeholder="Select">
        <el-option
          v-for="item in options"
          :key="item.value"
          :label="item.label"
          :value="item.value">
        </el-option>
      </el-select>
    </el-form-item>
    <el-form-item label="Question">
      <el-input
        v-model="quiz.question"
        placeholder="英単語を入力"
        name="quiz[question]"></el-input>
    </el-form-item>
    <el-form-item label="Correct">
      <el-input
        v-model="quiz.correct"
        placeholder="日本語を入力"
        name="quiz[correct]"></el-input>
    </el-form-item>
    <el-form-item label="Incorrect1">
      <el-input
        v-model="quiz.incorrect1"
        placeholder="間違い１つ目を入力"
        name="quiz[incorrect1]"></el-input>
    </el-form-item>
    <el-form-item label="Incorrect2">
      <el-input
        v-model="quiz.incorrect2"
        placeholder="間違い２つ目を入力"
        name="quiz[incorrect2]"></el-input>
    </el-form-item>
    <el-form-item label="Answer Description">
      <el-input
        v-model="quiz.answerDescription"
        placeholder="答えの解説を入力"
        name="quiz[answer_description]"></el-input>
    </el-form-item>
    <el-form-item>
      <el-button type="primary" @click="createQuiz">登録</el-button>
      <el-button @click="$emit('close')">キャンセル</el-button>
    </el-form-item>
  </el-form>
</template>

<script>
import axios from 'axios'
export default {
  data() {
    return {
      quiz: {
        category_id: '',
        question: '',
        correct: '',
        incorrect1: '',
        incorrect2: '',
        answerDescription: '',
      },
      options: [{
          value: 2,
          label: 'HTML'
        }, {
          value: 3,
          label: 'CSS'
        }, {
          value: 4,
          label: 'Java Script'
        }, {
          value: 5,
          label: 'Ruby'
        }, {
          value: 6,
          label: 'Vue.js'
      }],
    };
  },
  methods: {
    createQuiz() {
      axios.post('/api/v1/quizzes', {
        quiz: {
          category_id: this.quiz.categoryId,
          question: this.quiz.question, 
          correct: this.quiz.correct, 
          incorrect1: this.quiz.incorrect1,
          incorrect2: this.quiz.incorrect2,
          answer_description: this.quiz.answerDescription          
          }})
          .then(res => {
            switch (res.status) {
              case 201:
                this.$emit('add', res.data)
                this.quiz = {
                  categoryId: '',
                  question: '', 
                  correct: '', 
                  incorrect1: '', 
                  incorrect2: '', 
                  answerDescription: ''}
                this.$emit('close')
                break;
              case 400:
                console.log(res.data.message)
                break;
            }
          })
    }
  }
};
</script>