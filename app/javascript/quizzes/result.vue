<template>
  <form 
  :model="ranking"
  :action="ranking.action"
  method="POST"
  id="finish-form">
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
        <div class="answer_percentage">正解率 {{ totalCorrectNum / 5 * 100 }} %</div>
        <input type="hidden" :value="totalCorrectNum / 5 * 100" name="percentage_correct_answer"/>
        <input type="hidden" :value="ranking.csrfToken" name="authenticity_token"/>
        <span slot="footer" class="dialog-footer">
          <el-button @click="start" type="danger" round class="btn">閉じる</el-button>
          <el-button @click="tweet" type="primary" round class="btn">ツイート</el-button>
        </span>
      </el-dialog>
    </div>
  </form>
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
  },
  data: function() {
    return {
      show: false,
      centerDialogVisible: false,
      ranking: {
        csrfToken: document.getElementsByName('csrf-token')[0].content,
        action: "/rankings"
      }
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
      document.querySelector("#finish-form").submit();
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

.answer_percentage{
  text-align: center;
  font-weight: bold;
  font-size: 20px;
  margin-top: 10px;

}
</style>