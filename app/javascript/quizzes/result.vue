<template>
  <div class="quiz__rezult" v-if="show">
    <el-dialog
      title="クイズ結果"
      :visible.sync="centerDialogVisible"
      :close-on-click-modal="false"
      width="50%"
      center
      >
      <span v-if="totalCorrectNum > 0 " class="answer__number">{{totalCorrectNum}}問正解！</span>
      <span v-else class="answer__number">残念。。。もう一度挑戦してみましょう！</span>
      <div>正解率 {{ totalCorrectNum / 5 * 100 }} %</div>
      <span slot="footer" class="dialog-footer"
        <el-button @click="start" round class="btn">リトライ</el-button>
        <el-button @click="quizFinish" type="danger" round class="btn">終了する</el-button>
        <el-button @click="tweet" type="primary" round class="btn">ツイート</el-button>
      </span>
    </el-dialog>
  </div>
</template>


<script>
export default {
  name: "QuizResult",
  props: {
    correctPercentageObject: {
      type: Object
    },
    totalCorrectNum: {
      type: Number
    },
    totalQuizNum: {
      type: Number
    }
  },
  data: function() {
    return {
      show: false,
      centerDialogVisible: false
    }
  },
  methods: {
    showResult: function() {
      this.show = !this.show;
      this.centerDialogVisible = true
    },
    start: function() {
      location.href = "/quizzes/form";
    },
    tweet: function() {
      if (this.totalCorrectNum > 0) {
        open(
          "#"
        );
      } else {
        "#"
      }
    },
    quizFinish: function() {
      location.href = "/"
    },
  }


}
</script>

<style scoped>

.answer__number{
  font-size: 25px;
  display: block;
  text-align: center;
}
</style>