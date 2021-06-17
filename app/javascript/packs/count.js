if (document.getElementById('quiz_text')) {
  function count() {
    const quizText = document.getElementById("quiz_text");
    quizText.addEventListener("keyup", () => {
      const countVal = quizText.value.length;
      const charNum = document.getElementById("char_num");
      charNum.innerHTML = `${countVal}文字`;
    })
  }
  window.addEventListener('load', count)
}